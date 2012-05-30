--楼兰NPC 金久灵
--Created by 左春伟

--脚本号
x001168_g_ScriptId = 001168
x001168_g_eventList={808039} -- seek_treasure寻宝
x001168_g_moster_album_id = 30505192;
x001168_g_exchange_num = 100;
x001168_g_clothing_id = 
{
		10124113,           --少林新时装 0
		10124114,           --明教新时装 1
		10124115,           --丐帮新时装 2
		10124117,           --武当新时装 3
		10124116,           --峨嵋新时装 4
		10124118,           --星宿新时装 5
		10124121,           --天龙新时装 6
		10124119,           --天山新时装 7
		10124120,           --逍遥新时装 8
}
--**********************************
--事件列表
--**********************************
function x001168_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLXB_8815_06}")
		for i, eventId in x001168_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_01}", 6, 100);  --兑换
		AddNumText(sceneId, x001168_g_ScriptId, "#{LLXB_8820_02}", 11, 101); --兑换帮助
		--[tx45411]AddNumText(sceneId, x001168_g_ScriptId, "#{NSRQ_081110_2}", 11, 999); --zchw
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001168_OnDefaultEvent( sceneId, selfId,targetId )
	x001168_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001168_OnEventRequest( sceneId, selfId, targetId, eventId )
	--[tx45411]if GetNumText() == 999 then
	--	x001168_ShowMsg(sceneId, selfId, targetId, "#{NSRQ_081110_3}")
	--[/tx45411]end
	for i, findId in x001168_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001168_g_ScriptId )
			return
		end
	end
	if GetNumText() == 100 then
		local num = LuaFnGetAvailableItemCount(sceneId, selfId, x001168_g_moster_album_id);
		if num == 0 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_03}")
			return
		elseif num < 100 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_04}")
			return
		end
		if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{SJQM_8815_06}")
			return 		
		end
		--加入门派了吗？
		local menpaiId = GetMenPai(sceneId, selfId);
		if menpaiId < 0 or menpaiId > 8 then
			x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_06}")
			return
		end
		local nItemBagIndexalbum = GetBagPosByItemSn(sceneId, selfId, x001168_g_moster_album_id)
		local szTransferalbum = GetBagItemTransfer(sceneId,selfId, nItemBagIndexalbum)
		-- ok 得到与玩家门派相对应的高级时装
		if LuaFnDelAvailableItem(sceneId, selfId, x001168_g_moster_album_id, x001168_g_exchange_num) == 1 then
			local clothingId = x001168_g_clothing_id[menpaiId+1];
			local ret = TryRecieveItem( sceneId, selfId, clothingId, QUALITY_MUST_BE_CHANGE);
			if ret > -1 then
				-- 绑定
				if LuaFnItemBind(sceneId, selfId, ret) ~= 1 then
					x001168_ShowMsg(sceneId, selfId, targetId, "绑定失败！")
					return
				end
				-- 提示
				BeginEvent(sceneId)
					AddText(sceneId, "兑换高级门派时装成功！")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				Msg2Player(sceneId, selfId, "兑换高级门派时装成功！", 8)
				--兑换成功，播放特效
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
				
				--播放公告
				local PlayerName = GetName(sceneId,selfId)
				local szTransferEquip = GetBagItemTransfer(sceneId,selfId, ret)
				local str = format("#{_INFOUSR%s}#{GWXCSZGG_1}#{_INFOMSG%s}#{GWXCSZGG_2}#{_INFOMSG%s}#{GWXCSZGG_3}",PlayerName,szTransferalbum,szTransferEquip)
				BroadMsgByChatPipe( sceneId, selfId, str, 4 )
				-- 日志
				AuditExchangeMenpaiSuit(sceneId, selfId, menpaiId, clothingId);
			end
		end
	elseif GetNumText() == 101 then
		x001168_ShowMsg(sceneId, selfId, targetId, "#{LLXB_8820_05}")
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001168_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001168_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			x001168_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001168_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001168_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001168_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
--**********************************
--显示消息
--**********************************
function x001168_ShowMsg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)	
end

--NPC
--
--脚本号
x000150_g_scriptId = 000150

--所拥有的事件ID列表
x000150_g_eventList={500604, 500607, 500620}

--[tx43453]
x000150_g_NumText_ExchangeXhuanHuangYu = 2	-- 玄昊玉兑换暗器
x000150_g_NumText_ExchangeXhuanHuangYuHelp = 3	-- 玄昊玉兑换暗器帮助
x000150_g_NumText_DoExchange = 4	-- [tx45022]确定兑换
x000150_g_NumText_CancelExchange = 5	-- [tx45022]取消兑换
x000150_g_Stone = 20310020      --玄昊玉
x000150_g_BindStone = 20310021  --绑定玄昊玉
x000150_g_MeiHuaBiao = 10155003  --梅花镖
x000150_g_CountLimit = 50 --交换个数[tx44913]
x000150_g_MeiHuaBiaoBound = 10155005  --绑定梅花镖[tx45022]
--[/tx43453]
--普通

--**********************************
--事件交互入口
--**********************************
function x000150_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  江湖本就是个是非之地，多有逞凶为恶的武林败类，要想让天下祥和，就得看各位侠士的了。")
		for i, eventId in x000150_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end		
		AddNumText( sceneId, x000150_g_scriptId, "#{AQFC_090115_14}", 6, x000150_g_NumText_ExchangeXhuanHuangYu )--[tx43453]		
		AddNumText(sceneId, x000150_g_scriptId,"#{AQFC_090115_13}",11, x000150_g_NumText_ExchangeXhuanHuangYuHelp);--[tx43452]		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000150_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000150_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	if GetNumText() == x000150_g_NumText_ExchangeXhuanHuangYu then --[tx43453]
		BeginEvent(sceneId)
			AddText(sceneId, "#{AQFC_090115_06}")
			AddText(sceneId, "#{AQFC_090115_19}")		
			AddNumText(sceneId, x000150_g_scriptId,"#{INTERFACE_XML_557}", 6, x000150_g_NumText_DoExchange);--[tx45022]
			AddNumText(sceneId, x000150_g_scriptId,"#{Agreement_Info_No}", 8, x000150_g_NumText_CancelExchange);--[tx45022]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )	
		--DispatchMissionContinueInfo(sceneId, selfId, targetId, x000150_g_scriptId, 0)
	elseif GetNumText() == x000150_g_NumText_ExchangeXhuanHuangYuHelp then	
			BeginEvent( sceneId )
				AddText( sceneId, "#{AQFC_090115_13}" )
				AddText( sceneId, "#{AQFC_090115_16}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x000150_g_NumText_DoExchange then
			x000150_DoExchange( sceneId, selfId, targetId )
			x000150_CloseWindow(sceneId, selfId,targetId)
	elseif GetNumText() == x000150_g_NumText_CancelExchange then
			x000150_CloseWindow(sceneId, selfId,targetId)			
	end--[/tx43453]	
end

--**********************************
--接受此NPC的任务
--**********************************
function x000150_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000150_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000150_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000150_g_eventList do
		if missionScriptId == findId then
			x000150_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000150_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000150_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000150_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000150_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--兑换
--**********************************
function x000150_DoExchange( sceneId, selfId, targetId )--[tx45022]
	--[tx43453]
	--检查玄昊玉个数
	local count = LuaFnGetAvailableItemCount(sceneId, selfId, x000150_g_Stone)
	local bindCount = LuaFnGetAvailableItemCount(sceneId, selfId, x000150_g_BindStone)
		
	if count + bindCount < x000150_g_CountLimit then
		x000150_NotifyFailTips(sceneId, selfId, "#{LLFB_80821_5}")
		x000150_CloseWindow(sceneId, selfId,targetId)		
		return
	end
	-- 检查背包空间
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x000150_NotifyFailTips(sceneId, selfId,"#{AQFC_090115_07}")
			return
	end
	
	local nItemBagIndexStone = 0
	local szTransferStone = 0
	
	--优先扣除绑定的玄昊玉
	local bDelOk = 0
	if bindCount >= x000150_g_CountLimit then
		nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x000150_g_BindStone)
		szTransferStone = GetBagItemTransfer(sceneId, selfId, nItemBagIndexStone)
		bDelOk = LuaFnDelAvailableItem(sceneId, selfId, x000150_g_BindStone, x000150_g_CountLimit)
		if bDelOk < 1  then
		  x000150_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_12}")
		  return
	  end
	else
		nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x000150_g_Stone)
		szTransferStone = GetBagItemTransfer(sceneId, selfId, nItemBagIndexStone)
		if bindCount > 0 then
			bDelOk = LuaFnDelAvailableItem(sceneId, selfId, x000150_g_BindStone, bindCount)
			if bDelOk < 1  then
		    x000150_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_12}")
		    return
	    end
		end
		bDelOk = LuaFnDelAvailableItem(sceneId, selfId, x000150_g_Stone, x000150_g_CountLimit-bindCount)
		if bDelOk < 1  then
	    x000150_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_12}")
	    return
    end
	end
	--获取暗器[tx44913]	
	local nBagIndex = -1
	if bindCount > 0 then
		nBagIndex = TryRecieveItem( sceneId, selfId, x000150_g_MeiHuaBiaoBound, 1 );
	else
		nBagIndex = TryRecieveItem( sceneId, selfId, x000150_g_MeiHuaBiao, 1 );	
	end
	local szTransferEquip = GetBagItemTransfer(sceneId, selfId, nBagIndex)
			
	--获取暗器[/tx44913]		
	x000150_NotifyFailTips(sceneId, selfId, "#{AQFC_090115_08}")
	--特效
  LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
  --公告
 	local message = format("#{AQ_04}#{_INFOUSR%s}#{AQ_01}#{_INFOMSG%s}#{AQ_02}#{_INFOMSG%s}#{AQ_03}",LuaFnGetName(sceneId, selfId),szTransferStone, szTransferEquip)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	--统计
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MEIHUABIAO, guid);--[tx43454]新版本增加了guid
	--[/tx43453]	
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x000150_NotifyFailTips( sceneId, selfId, Tip )--[tx43453]
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--关闭窗口
--**********************************
function x000150_CloseWindow(sceneId,selfId, targetId)--[tx43453]
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--死亡事件
--**********************************
function x000150_OnDie( sceneId, selfId, killerId )
end

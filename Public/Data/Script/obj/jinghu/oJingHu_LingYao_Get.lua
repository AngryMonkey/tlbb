--太湖NPC
--造反恶贼
--普通

--脚本号
x005112_g_ScriptId	= 005112

--**********************************
--事件交互入口
--**********************************
function x005112_OnDefaultEvent( sceneId, selfId,targetId )
	
	x005112_UpdateEventList( sceneId, selfId, targetId )
	
	
end


--**********************************
--事件列表
--**********************************
function x005112_UpdateEventList( sceneId, selfId, targetId )
	
	local nYaoDingCount = GetItemCount(sceneId, selfId, 40004415);
	
	if nYaoDingCount <= 0 then
		BeginEvent(sceneId)

			AddText(sceneId,"灵药已经炼制成功，只有炼药的人才能取得灵药——大还丹。")
		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif nYaoDingCount >= 1 then
	
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004415);
				
		local actId = 36;
		
		local status = GetActivityParam( sceneId, actId, 0 );
				
		local YaoDing_LianYao_TimeCur = GetActivityParam( sceneId, actId, 4 );	
		local YaoDing_LianYao_TimeItem = GetBagItemParam( sceneId, selfId, nItemBagIndex, 3, 2 );
		
		if YaoDing_LianYao_TimeCur ~= YaoDing_LianYao_TimeItem then
			DelItem(sceneId, selfId, 40004415, 1)
			return 0;
		end
		
		BeginEvent(sceneId)

			AddText(sceneId,"灵药——大还丹已经炼制成功，请问您是否现在要领取？")
			AddNumText(sceneId, x005112_g_ScriptId, "领取大还丹", 2, 0)

		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	end 
	
end


--**********************************
--事件列表选中一项
--**********************************
function x005112_OnEventRequest( sceneId, selfId, targetId, eventId )

	if	GetNumText()==0 then
	
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x808004_MsgBox( sceneId, selfId, targetId, "  你的背包空间不够了，整理后再来找我。" )
			return 0;
		end
		
		
		if TryRecieveItem( sceneId, selfId, 30505076, 1 ) >= 0 then
			str		= "#Y你获得了"..GetItemName( sceneId, 30505076 ).."。"
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x005112_NotifyTip( sceneId, selfId, str )
			
			DelItem(sceneId, selfId, 40004415, 1)
			
			BeginEvent(sceneId)
				AddText(sceneId,"你获得了大还丹!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			LuaFnDeleteMonster(sceneId, targetId)
			
			--统计信息
			local guidSelf = 
			LuaFnAuditHDXianCaoZhengDuo(sceneId, selfId, "大还丹成");

		end		
		
		
	end
	
end

--**********************************
--醒目提示
--**********************************
function x005112_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

-- 领奖NPC

x889065_g_scriptId = 889065

--**********************************
--事件交互入口
--**********************************
function x889065_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( (300053), "JiaRuMenPai", sceneId, selfId, 200 )
end

--**********************************
--事件列表选中一项
--**********************************
function x889065_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "JiaRuMenPai", sceneId, selfId, GetNumText())
end
--**********************************
--对话提示
--**********************************
function x889065_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x889065_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--恢复血和气
--**********************************
function x889065_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	RestoreRage( sceneId, selfId )
end
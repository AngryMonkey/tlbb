--脚本号
x892004_g_scriptId = 892004

--**********************************
-- 
--**********************************
function x892004_SendParamToClient(sceneId, selfId, param1,param2)
	if param1 == 1 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,param2)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 201107281)
	end
end
--**********************************
--醒目提示
--**********************************
function x892004_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x892004_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--脚本号
x892001_g_scriptId = 892001

--**********************************
--事件交互入口
--**********************************
function x892001_GetLWInfo( sceneId, selfId)
	local longwen1 =	GetMissionData( sceneId, selfId, MY_LONGWEN1 )
	local longwen2 =	GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 =	GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,selfId)
		UICommand_AddInt(sceneId,longwen1)
		UICommand_AddInt(sceneId,longwen2)
		UICommand_AddInt(sceneId,longwen3)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 20111124)
end

function x892001_GetTargetLWInfo( sceneId, selfId, targetId)
	local TargetGUID = LuaFnObjId2Guid( sceneId, selfId )
	local targetId123 = LuaFnGetTargetObjID(sceneId, TargetGUID)
	--local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	--for i=0, nHumanCount-1 do
	--	local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
	--	local PlayerName=GetName(sceneId,nHumanId);
	--	x892001_NotifyTip( sceneId, selfId, PlayerName )
	--end
	x892001_NotifyTip( sceneId, selfId, targetId123 )
	local objType = GetCharacterType( sceneId, targetId )
	if(objType ~= 1)then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,0)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 201111241)
	else
		local longwen1 =	GetMissionData( sceneId, targetId, MY_LONGWEN1 )
		local longwen2 =	GetMissionData( sceneId, targetId, MY_LONGWEN2 )
		local longwen3 =	GetMissionData( sceneId, targetId, MY_LONGWEN3 )
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,1)
			UICommand_AddInt(sceneId,longwen1)
			UICommand_AddInt(sceneId,longwen2)
			UICommand_AddInt(sceneId,longwen3)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 201111241)
	end
end

--**********************************
--醒目提示
--**********************************
function x892001_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x892001_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--大理NPC
--华赫艮
--普通

--脚本号
x002014_g_scriptId = 002014

--所拥有的事件ID列表
x002014_g_eventList={200001,200005}


--**********************************
--事件交互入口
--**********************************
function x002014_OnDefaultEvent( sceneId, selfId,targetId )
  local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0004}")

		for i, eventId in x002014_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 选中一项
--**********************************
function x002014_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002014_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end

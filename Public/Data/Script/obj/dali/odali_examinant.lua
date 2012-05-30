--大理NPC
--考官
--普通
--脚本号
x801017_g_scriptId = 801017

--所拥有的事件ID列表
x801017_g_eventList={801016}	

--**********************************
--事件列表
--**********************************
function x801017_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "姑娘"
		else
			PlayerSex = "少侠"
		end
		AddText(sceneId,"#{EXAM_INFO_1}")
		
		AddNumText( sceneId, x801017_g_scriptId, "科举介绍", 11, 10 )
		
		for i, eventId in x801017_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x801017_OnDefaultEvent( sceneId, selfId,targetId )
	x801017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x801017_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_062}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	local Numtext = GetNumText();
	CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, Numtext )
	return
end

--**********************************
--死亡事件
--**********************************
function x801017_OnDie( sceneId, selfId, killerId )
end

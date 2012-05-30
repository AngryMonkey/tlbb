--苏州NPC
--范纯仁
--建立帮会
--脚本号
x001084_g_scriptId = 001084

--所拥有的事件ID列表
x001084_g_eventList={600000}

--**********************************
--事件交互入口
--**********************************
function x001084_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{BHCS_090219_01}")
		AddNumText( sceneId, x001084_g_scriptId, "#{BHCS_090219_04}", 11, 10 )
		AddNumText(sceneId,x001084_g_scriptId,"#{BHCS_090219_05}",6,2)	
		AddNumText(sceneId,x001084_g_scriptId,"#{BHCS_090219_06}",6,4)
		if(GetHumanGuildID(sceneId, selfId) ~= -1) then
			if(CityGetSelfCityID(sceneId, selfId) ~= -1) then
				AddNumText(sceneId,x001084_g_scriptId,"#{BHCS_090219_07}",9,6)
			end
		end
		AddNumText(sceneId,x001084_g_scriptId,"#{BHCS_090219_08}",11,11)
		AddNumText(sceneId,x001084_g_scriptId,"#{BHCS_090219_09}",11,12)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001084_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_069}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 11 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{Guild_Boom_Help}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if GetNumText() == 12 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{TM_20080331_07}".."#{TM_20080320_02}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	local sel = GetNumText();
	for i, eventId in x001084_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId, sel)
	end
end

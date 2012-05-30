--周游
--村民
--普通

x021009_g_scriptId = 021009

--**********************************
--事件交互入口
--**********************************
function x021009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    朋友，这银皑雪原上的怪物个个都拥有寒冰神力，只有#G冰抗#W足够高才能在这里横行无忌。在下可以帮你提升一些冰抗，但更多的冰抗还需要你自己来努力。")
		AddNumText(sceneId, x021009_g_scriptId, "提升一些冰抗",6,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x021009_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 153, 0)
	end
end

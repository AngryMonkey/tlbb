--´óÀíNPC
--ÜÇË¹
--ÆÕÍ¨

--½Å±¾ºÅ
x002090_g_scriptId	= 002090

--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x002090_g_eventList	= { 808005 }

--**********************************
--ÊÂ¼şÁĞ±í
--**********************************
function x002090_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  TÕi hÕ t× „n Ğµ xa xôi t¾i ğây, vô cùng ngßŞng mµ vån hoá ¦m thñc cüa Thiên tri«u thßşng qu¯c, ngoài ra tÕi hÕ cûng phøng l®nh ch÷n mua mµt vài trân thú bäo bäo mang v« ğ¤t nß¾c chúng tôi." )
		for i, eventId in x002090_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId,selfId,targetId )
end

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x002090_OnDefaultEvent( sceneId, selfId, targetId )
	x002090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x002090_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x002090_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002090_g_eventList do
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
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x002090_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼şÁĞ±í
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			x002090_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌĞø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x002090_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x002090_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--Íæ¼ÒÌá½»µÄÎïÆ·¼°ÕäÊŞ
--**********************************
function x002090_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if scriptId ~= nil then
		CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	end
end

--**********************************
--ËÀÍöÊÂ¼ş
--**********************************
function x002090_OnDie( sceneId, selfId, killerId )
end

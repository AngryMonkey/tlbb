
x001026_g_scriptId = 1026


function x001026_OnDefaultEvent( sceneId, selfId,targetId )
	  BeginEvent(sceneId)
     
			AddNumText(sceneId, 7, "������",5,-1)
			AddNumText(sceneId, 8, "�����µ�������",5,-1)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
function x001026_OnEventRequest( sceneId, selfId, targetId, eventId )
	BeginEvent(sceneId)
		--������
		if eventId == 7 then
			BankBegin(sceneId, selfId)	
		--�����µ�������
		elseif eventId == 8 then
			EnableBankRentIndex(sceneId, selfId, 2)
		end

  EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

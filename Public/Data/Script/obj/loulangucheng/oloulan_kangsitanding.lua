--NPC
--
--��ͨ
x001105_g_scriptId = 001105
--**********************************
--�¼��������
--**********************************
function x001105_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  #{LLGC_20080321_09}")
		AddNumText(sceneId,x001105_g_scriptId,"#{JZBZ_081031_02}",11,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001105_OnEventRequest( sceneId, selfId, targetId, eventId )
		
		if GetNumText() == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{JZBZ_081031_01}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
    end
end

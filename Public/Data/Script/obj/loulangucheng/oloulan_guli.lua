--¥��NPC....
--纷�....

--�ű���
x001134_g_scriptId = 001134

--��ӵ�е��¼�ID�б�
x001134_g_eventList = { 801010 }

--**********************************
--�¼��������
--**********************************
function x001134_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{loulan_huanfa_20080329}")
		AddNumText( sceneId, x001134_g_scriptId, "�޸ķ��ͽ���", 11, 1 )
		AddNumText(sceneId,x001134_g_scriptId,"�޸ķ���", 6, 2 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x001134_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_061}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 2 then

		-- �޸ķ���
		CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, targetId )

	end

end

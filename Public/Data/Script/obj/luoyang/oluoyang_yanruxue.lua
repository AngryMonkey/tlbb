--�ű���
x000088_g_scriptId = 000088

--��ӵ�е��¼�ID�б�
x000088_g_eventList = { 801010 }

--**********************************
--�¼��������
--**********************************
function x000088_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����Ʈ��ˮ������������˿���Գ��ů��˪�����䣬���°������繳����Ȼ�޴��Գ�β����������أ�")
		
		AddNumText( sceneId, x000088_g_scriptId, "�޸ķ��ͽ���", 11, 10 )
		
		AddNumText(sceneId,x000088_g_scriptId,"�޸ķ���",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000088_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_061}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 1 then
		-- �޸ķ���
		CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, targetId )
		return
	end

end

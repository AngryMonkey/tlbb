-- 000131
-- 
--�ű���
x000131_g_scriptId = 000131

--��ӵ�е��¼�ID�б�
x000131_g_eventList = { 805029, 805030 }

--**********************************
--�¼��������
--**********************************
function x000131_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �׻�˵�������������͹ٶ��Լ�����ò�ɷ������أ�Ҫ��Ҫ������Щ�ı䣿")
		AddNumText( sceneId, x000131_g_scriptId, "������ò����", 11, 10 )
		AddNumText(sceneId,x000131_g_scriptId,"������ò",6,1)
		AddNumText( sceneId, x000131_g_scriptId, "�޸�ͷ�����", 11, 14 )
		AddNumText(sceneId,x000131_g_scriptId,"�޸�ͷ��",6,4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000131_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_088}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if GetNumText() == 14 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{INTERHEAD_XML_008}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText() == 1 then
		-- �޸�����
		CallScriptFunction( 805029, "OnEnumerate",sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 4 then
		-- �޸�ͷ��
		CallScriptFunction( 805030, "OnEnumerate",sceneId, selfId, targetId )
		return
	end
	
end

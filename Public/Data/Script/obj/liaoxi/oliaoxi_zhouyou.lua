--����
--����
--��ͨ

x021009_g_scriptId = 021009

--**********************************
--�¼��������
--**********************************
function x021009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    ���ѣ�������ѩԭ�ϵĹ��������ӵ�к���������ֻ��#G����#W�㹻�߲�������������޼ɡ����¿��԰�������һЩ������������ı�������Ҫ���Լ���Ŭ����")
		AddNumText(sceneId, x021009_g_scriptId, "����һЩ����",6,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x021009_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 153, 0)
	end
end

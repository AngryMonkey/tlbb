--����NPC
--��ԭ��Ϊ
--��ͨ

--�ű���
x000029_g_scriptId = 000029

--**********************************
--�¼��������
--**********************************
function x000029_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �ǳ����˼����㣬���γ����Ǹ������Ĺ��ҡ��Һ�ϲ�����ϣ���Ժ��л���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--��ϪNPC
--��ķ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x027001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �Ϸ���������ʢ����������һ����׽�������ظ������˿�����֪����������ò������ǹ��⺮���ң������鱻��д���ˡ���Ϫ��̸��֮�С����ڿ��Ǹ���ظ����ֱ����һ��С���ӵ����⡭��#r  ���������ǲ����Բ���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

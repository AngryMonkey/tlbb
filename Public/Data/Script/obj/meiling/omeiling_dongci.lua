--÷��NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �Ҿ�������������������֬ˮ�ۣ�Ҳͦ�ÿ��İ���Ҫ�ӵ�����͸����ˡ��ţ���ëҲӦ������һ���ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

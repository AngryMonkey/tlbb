--÷��NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������ѹ�ȣ�������з���������ɽԽ���������ٺ����ǵ��汲����һ������ɽԽŮ��˾��ѹ���ˣ���ʹ������һ����ʧ���ˣ����ǵ��������Ҳ�ᷴ����ȥ�ģ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

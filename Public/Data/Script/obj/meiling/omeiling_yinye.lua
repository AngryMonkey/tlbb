--÷��NPC
--��Ҷ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���˾����󻤷�һϯ������֪����ȥ��ʮ��ȫ�ǰ׻��ˡ��Ժ��Ҹ��ž����󻤷����ϵ�ɽ���͹������ĸ���Ը��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

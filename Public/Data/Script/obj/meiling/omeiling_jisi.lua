--÷��NPC
--��˾
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��˵����ɽ��ޱ����Ǳ߳��˲������飬�ö���ö����ˡ���������ֻ֪����Щ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--����NPC
--ʯ��
--��ͨ

x011035_g_scriptId = 011035

--**********************************
--�¼��������
--**********************************
function x011035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ٱ�����Χ�˹���������鷳���������Ķ���Щ����С�䣬��Ը��ȥ����ȭ����")
		AddNumText(sceneId,x011035_g_scriptId,"ȥ�ֵ�Χ��",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x011035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<31  then	
			BeginEvent( sceneId )
			local strText = "��������С�䣬Ҳ����С�죬�㻹����31����Ϊ����İ�ȫ���ҿ����������������ɡ�"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 141,97,157)
		end
	end
end

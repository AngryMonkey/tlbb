--��ңNPC
--�����ӳ�
--��ͨ

x014035_g_scriptId = 014035

--**********************************
--�¼��������
--**********************************
function x014035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"������������ҵ��˱��ɽ������飬������Ϊ����Ȼ������������ܡ����ǹ��ܷǳ����ƺ�����˼������ȥ��ʶ��ʶô��")
		AddNumText(sceneId,x014035_g_scriptId,"ȥ��ʶ�������",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x014035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<81  then	
			BeginEvent( sceneId )
			local strText = "��Ҫ̫С���ҹ�ұ�ӳ��ļ��գ��ȼ��ﲻ��81�������ǲ��������������ܵġ�"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 144,51,129)
		end
	end
end

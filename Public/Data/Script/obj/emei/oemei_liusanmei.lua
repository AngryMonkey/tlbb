--����NPC
--������
--��ͨ

x015035_g_scriptId = 015035

--**********************************
--�¼��������
--**********************************
function x015035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"����ɽ�ԹŶ���Գ�Ϊ���������Щ��Գ�ֵ�Խ��Խ���ɻ�����Ȼ�����ɺ��֣���Ը������ȥ����������")
		AddNumText(sceneId,x015035_g_scriptId,"ȥ����Գ�",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x015035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<21  then	
			BeginEvent( sceneId )
			local strText = "�ɲ�ҪС����Щ��Գ���ҿ��㻹�ǵȼ�����21���������Ұɡ�"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 145,89,142)
		end
	end
end

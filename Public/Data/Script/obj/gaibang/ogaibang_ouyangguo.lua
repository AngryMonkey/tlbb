--ؤ��NPC
--ŷ����
--��ͨ

x010035_g_scriptId = 010035

--**********************************
--�¼��������
--**********************************
function x010035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��Щ���һ��������Ǿƽ�͵�ƣ����ǿɶ����ǽ�ѵ�����Ǽ��Σ�����֪���˵�����ؤ���ܶ棬Ҫȥ������Щ��ɫ��")
		AddNumText(sceneId,x010035_g_scriptId,"ȥ�ֵ����",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<11  then	
			BeginEvent( sceneId )
			local strText = "�ɲ�ҪС����Щ���ҿ��㻹�ǵȼ�����11���������Ұɡ�"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 140,91,151)
		end
	end
end

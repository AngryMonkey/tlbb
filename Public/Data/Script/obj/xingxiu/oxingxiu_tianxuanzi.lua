--����NPC
--�����
--��ͨ

x016035_g_scriptId = 016035

--**********************************
--�¼��������
--**********************************
function x016035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"ǰ�ղ����������죬ʦ������ľ��������������֮�������������޴�֩�룬�����������ĺ�ʱ�������Ը��ȥ������")
		AddNumText(sceneId,x016035_g_scriptId,"��֩������",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x016035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<51  then	
			BeginEvent( sceneId )
			local strText = "���������Ľ������ˣ�����51�����ϣ������书ƽƽ���ҿɲ��Ҵ���ȥ��"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 146,91,144)
		end
	end
end

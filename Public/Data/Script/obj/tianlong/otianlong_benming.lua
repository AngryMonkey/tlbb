--������NPC
--����
--��ͨ

x013035_g_scriptId = 013035

--**********************************
--�¼��������
--**********************************
function x013035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��ɮ��������˺������ϵ������������˹����������࣬������ս��˵�е�ħ�����ܵ���")
		AddNumText(sceneId,x013035_g_scriptId,"ȥ��ս����",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x013035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<91  then	
			BeginEvent( sceneId )
			local strText = "���ʩ���ȼ�����91���������þ�����Σ��֮������"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 143,95,134)
		end
	end
end

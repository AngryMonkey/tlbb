--ʥ�𴫵�NPC - ����

x050108_g_ScriptId = 050108; --�ű���
x050108_g_name	="��Ң";

--��ӵ�е��¼�ID�б�
x050108_g_eventId_yes = 0;
x050108_g_eventId_no = 1;

--**********************************
--�¼��������
--**********************************
function x050108_OnDefaultEvent( sceneId, selfId, targetId )
	x050108_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x050108_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "�ҿ��Խ������ͳ�ȥ���Ƿ�Ҫ���ͣ�" );
		AddNumText( sceneId, x050108_g_ScriptId, "ȷ��", 9, x050108_g_eventId_yes);
		AddNumText( sceneId, x050108_g_ScriptId, "ȡ��", 8, x050108_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x050108_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId then
		if selectEventId == x050108_g_eventId_yes then
			NewWorld( sceneId, selfId, 24, 208, 49) ;
		else
			return 0;
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x050108_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x050108_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

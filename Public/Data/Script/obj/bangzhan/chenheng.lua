--NPC ���� A��

x402293_g_ScriptId = 402293; --�ű���
x402293_g_name	="����";

--��ӵ�е��¼�ID�б�
x402293_g_eventId_yes = 0;
x402293_g_eventId_no = 1;

--**********************************
--�¼��������
--**********************************
function x402293_OnDefaultEvent( sceneId, selfId, targetId )
	x402293_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x402293_UpdateEventList( sceneId, selfId, targetId )

	if CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_21}" );
			AddNumText( sceneId, x402293_g_ScriptId, "ȷ��", 9, x402293_g_eventId_yes);
			AddNumText( sceneId, x402293_g_ScriptId, "ȡ��", 8, x402293_g_eventId_no);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402293_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId and CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId ) == 1 then
		if selectEventId == x402293_g_eventId_yes then
			--��ս��buff���ܴ���
			if CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) == 0 then
				CallScriptFunction(402047, "Exit", sceneId, selfId)
			else
				BeginEvent(sceneId);
					AddText( sceneId, "#{BHXZ_081103_77}" );
				EndEvent(sceneId);
				DispatchEventList(sceneId, selfId, targetId);
			end
		else
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402293_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x402293_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

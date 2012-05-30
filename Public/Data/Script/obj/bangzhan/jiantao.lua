--NPC ��������Ϣ�� ����NPC ���

x402304_g_ScriptId = 402304; --�ű���
x402304_g_name	="���";

--��ӵ�е��¼�ID�б�
x402304_g_eventId_yes = 0;
x402304_g_eventId_no = 1;

x402304_g_Exit_SceneID = 0 --��������ID
x402304_g_Win_X = 160 --��ʤ������
x402304_g_Win_Z = 106
x402304_g_Fail_X = 61 --ʧ�ܷ�����
x402304_g_Fail_Z = 134

x402304_g_SheepBuff = 31550											--����buff

--**********************************
--�¼��������
--**********************************
function x402304_OnDefaultEvent( sceneId, selfId, targetId )
	x402304_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x402304_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId);
		AddText( sceneId, "#{BHXZ_081210_158}" );
		AddNumText( sceneId, x402304_g_ScriptId, "#{BHXZ_081210_159}", 4, x402304_g_eventId_yes);
		--AddNumText( sceneId, x402304_g_ScriptId, "ȡ��", 8, x402304_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
	
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402304_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId == x402304_g_eventId_yes then
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x402304_g_SheepBuff) == 1 then
			NewWorld( sceneId, selfId, x402304_g_Exit_SceneID, x402304_g_Fail_X, x402304_g_Fail_Z )
		else
			NewWorld( sceneId, selfId, x402304_g_Exit_SceneID, x402304_g_Win_X, x402304_g_Win_Z )
		end
		
	else
--		BeginUICommand( sceneId )
--		UICommand_AddInt( sceneId, targetId )
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 1000 )
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x402304_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x402304_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

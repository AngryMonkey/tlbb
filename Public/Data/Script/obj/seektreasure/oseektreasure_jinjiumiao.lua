--¥��Ѱ�� ����NPC  
-- created by ��ΰ

x044700_g_ScriptId = 044700; --�ű���
x044700_g_name	="�����";

--��ӵ�е��¼�ID�б�
x044700_g_eventId_yes = 1;
x044700_g_eventId_no = 0;

--**********************************
--�¼��������
--**********************************
function x044700_OnDefaultEvent( sceneId, selfId, targetId )
	x044700_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x044700_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{LLXB_8815_07}" );
		AddText( sceneId, "���Ҫ��ȥ��");
		AddNumText( sceneId, x044700_g_ScriptId, "ȷ��", 9, x044700_g_eventId_yes);
		AddNumText( sceneId, x044700_g_ScriptId, "ȡ��", 8, x044700_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x044700_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x044700_g_eventId_yes then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186, 162, 77); -- ¥������鴦
	elseif GetNumText() == x044700_g_eventId_no then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	end
end


--����NPC		�߼�װ������
--Ѧ��
--�ű���

x001056_g_ScriptId = 001056

--**********************************
--�¼��������
--**********************************
function x001056_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{SQXL_20071011}")
		AddNumText(sceneId,x001056_g_ScriptId,"��Ҫ����װ��",6,1)
		AddNumText(sceneId, x001056_g_ScriptId,"װ���������",11,12);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001056_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		--PrintNum(sceneId )
		--PrintNum(targetId )

		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )
	end
	
	if GetNumText() == 12 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_043}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
end

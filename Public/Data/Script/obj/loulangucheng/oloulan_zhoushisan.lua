--¥��NPC		װ������
--��ʮ��
--�ű���

x001106_g_ScriptId = 001106

--**********************************
--�¼��������
--**********************************
function x001106_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLXL_081113_1}")
		AddNumText(sceneId,x001106_g_ScriptId,"��Ҫ����װ��",6,1)
		AddNumText(sceneId,x001106_g_ScriptId,"���ӿ��������", 6, 2) --zchw
		AddNumText(sceneId, x001106_g_ScriptId,"װ���������",11,12);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001106_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )
	elseif GetNumText() == 2 then
		BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1004)
		return
	end
	
	if GetNumText() == 12 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_043}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
end

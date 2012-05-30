--���ͬ�˻�������

x650000_g_ScriptId = 650000;

function x650000_OnDefaultEvent( sceneId, selfId, targetId )
	local num = GetNumText()
	if num == 1 then
		--�鿴ͬ���б�
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1206)
	elseif num == 2 then
		--����ͬ��
		if GetGuildPos(sceneId,selfId) ~= GUILD_POSITION_CHIEFTAIN then		
			BeginEvent(sceneId)
				AddText(sceneId,"#{TM_20080311_01}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)	
		elseif LuaFnGetHumanGuildLeagueID( sceneId, selfId ) >= 0 then			
			BeginEvent(sceneId)
				AddText(sceneId,"#{TM_20080311_02}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)	
		else
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1207)
		end
	elseif num == 3 then
		--�鿴ͬ����Ϣ
		if LuaFnGetHumanGuildLeagueID( sceneId, selfId ) >= 0 then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1208)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"#{TM_20080311_13}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)			
		end
	elseif num == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TM_20080320_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x650000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x650000_g_ScriptId, "�鿴ͬ���б�", 6, 1 )
	AddNumText(sceneId, x650000_g_ScriptId, "����ͬ��", 6, 2 )
	AddNumText(sceneId, x650000_g_ScriptId, "�鿴������ϸ��Ѷ", 6, 3 )
	AddNumText(sceneId, x650000_g_ScriptId, "ͬ�˽���", 11, 4 )
end

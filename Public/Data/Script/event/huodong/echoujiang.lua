--NPC�齱

x808062_g_ScriptId						= 808062

--**********************************
--�о��¼�
--**********************************
function x808062_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x808062_g_ScriptId, "��ȡ�����", 2, 1)
end

--**********************************
--������ں���
--**********************************
function x808062_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()

	if TextNum == 1 then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)
	end
end

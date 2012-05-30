--���縱������npc

--�ű���
x000090_g_scriptId = 000090


--��ӵ�е��¼�ID�б�
x000090_g_eventList={401001}

--**********************************
--�¼��б�
--**********************************
function x000090_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
	
		AddNumText( sceneId, x000090_g_scriptId, "��ֽ���", 11, 10 )
	
		if sceneId == 0 then
			AddNumText( sceneId, x000090_g_scriptId, "����������һ��Ϣ��", 9, 20 )
			AddNumText( sceneId, x000090_g_scriptId, "���������ڶ���Ϣ��", 9, 21 )
			AddNumText( sceneId, x000090_g_scriptId, "������Ϣ��", 11, 30 )
		elseif sceneId == 1 then
			AddNumText( sceneId, x000090_g_scriptId, "����������Ϣ��", 9, 22 )
			AddNumText( sceneId, x000090_g_scriptId, "������Ϣ��", 11, 31 )
		elseif sceneId == 2 then
			AddNumText( sceneId, x000090_g_scriptId, "���������Ϣ��", 9, 23 )
			AddNumText( sceneId, x000090_g_scriptId, "������Ϣ��", 11, 32 )
		end

		AddNumText( sceneId, x000090_g_scriptId, "�����ˢ���л�ø���ľ���", 11, 519 )
		--[tx45411]AddNumText(sceneId, x000090_g_scriptId, "#{NSRQ_081110_2}", 11, 999); --zchw

		for i, findId in x000090_g_eventList do
			CallScriptFunction( x000090_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��������
--**********************************
function x000090_OnDefaultEvent( sceneId, selfId,targetId )
	x000090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000090_OnEventRequest( sceneId, selfId, targetId, eventId )

	--[tx45411]if GetNumText() == 999 then
		--BeginEvent(sceneId)					
		--	AddText( sceneId, "#{NSRQ_081110_3}" )						
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return		
	--[/tx45411]end
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_063}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 519 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{QJ_20080522_03}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	local NumText = GetNumText()
	if NumText == 20 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 418,32,16 )
		return
	elseif  NumText == 21 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 419,32,16 )
		return
	elseif  NumText == 22 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 518,32,16 )
		return
	elseif  NumText == 23 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 193,32,16 )
		return
	elseif  NumText == 30 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJXXS_1105_1}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif  NumText == 31 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJXXS_1105_2}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif  NumText == 32 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJXXS_1105_3}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	for i, findId in x000090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000090_OnDie( sceneId, selfId, killerId )
end

--**********************************
--����Ƿ���Խ��������Ϣ��
--**********************************
function x000090_CheckCanEnterRest( sceneId, selfId, targetId, s, x, y )

	if LuaFnHasTeam(sceneId, selfId) ~= 0 then

		if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
			BeginEvent(sceneId)	
				AddText( sceneId, "  ֻ�жӳ����ܴ�����ѽ�����Ϣ�ҡ�" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId)
		local nearMemberCount = GetNearTeamCount(sceneId, selfId)
		if teamMemberCount ~= nearMemberCount then
			BeginEvent(sceneId)	
				AddText( sceneId, "  ��Ķ��������˲��ڸ�����" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		local memId;
		for	i = 0, nearMemberCount - 1 do
			memId = GetNearTeamMember(sceneId, selfId, i);
			NewWorld(sceneId, memId, s, x, y);
		end

	else

		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, s, x, y )

	end

end

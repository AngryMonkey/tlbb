--��˼��

--�ű���
x001083_g_scriptId = 001083

--�̵���
x001083_g_shoptableindex=102

--��ӵ�е��¼�ID�б�
x001083_g_eventList={400918, 400963}	--	ȥ���䵺��ȥʥ��ɽ}	

--**********************************
--�¼��б�
--**********************************
function x001083_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{YXZ_80917_01}")
	
	--AddNumText( sceneId, x001083_g_scriptId, "����޵�", 6, 10 )	--ȥ������޵й���--del by Heanqi
	
	for i, eventId in x001083_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	AddNumText(sceneId,x001083_g_scriptId,"������＼����",7,2)
--	AddNumText(sceneId,x001083_g_scriptId,"��ѯ���޳ɳ���",6,3)
--	AddNumText(sceneId,x001083_g_scriptId,"���޵��ϳ�",6,4)
	AddNumText(sceneId,x001083_g_scriptId,"#{XXWD_8916_07}",11,5)
--	AddNumText(sceneId,x001083_g_scriptId,"���޵��ϳɽ���",11,6)
--	AddNumText(sceneId,x001083_g_scriptId,"��θ����޿�������",11,7)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001083_OnDefaultEvent( sceneId, selfId,targetId )
	x001083_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001083_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001083_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	if GetNumText() == 2 then
		DispatchShopItem( sceneId, selfId,targetId, x001083_g_shoptableindex )
--	elseif GetNumText() == 3 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "  ��ѯ���޵ĳɳ��ʣ���ѯһ����Ҫ��ȡ#{_MONEY100}�ķ��á�" )
--		AddNumText( sceneId, x001083_g_scriptId, "ȷ��", -1, 4 )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
--	elseif GetNumText() == 4 then
--		BeginUICommand( sceneId )
--			UICommand_AddInt( sceneId, targetId )
--			UICommand_AddInt( sceneId, 6 )				--���޲�ѯ��֧
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 3 )	--�������޽���
	elseif GetNumText() == 4 then --���޵��ϳ�
--		BeginUICommand( sceneId )
--			UICommand_AddInt( sceneId, targetId )
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 19824 )	--�������޵��ϳɽ���
	elseif GetNumText() == 5 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{XXWD_8916_08}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 6 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "#{JNHC_81015_12}" )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 7 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "#{ZSKSSJ_081126_5}" )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
	end
	if GetNumText() == 10 then
	    if eventId == x001083_g_scriptId then	
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 50, 0 )	--ȥ������޵й���--del by Heanqi
			return
		end
	end
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001083_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x001083_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			x001083_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001083_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001083_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001083_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ύ����
--**********************************
function x001083_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
--ע�⣬��������дʡ������eventlist������scriptId��һ���֣����ܻ�������
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end

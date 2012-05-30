--�¹���

--�ű���
x010000_g_scriptId = 010000

--��ӵ�е��¼�ID�б�
x010000_g_eventList={221900,808004}
--x010000_g_eventList={200922,201021,201121,221900}

--**********************************
--�¼��б�
--**********************************
function x010000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  ���ǳ¹��㣬�����������к���ָ�̣�");
	for i, eventId in x010000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	local mp = GetMenPai(sceneId, selfId)
	if mp == 9 then 
		AddNumText(sceneId, x010000_g_scriptId, "��������",6,0)
	end
	AddNumText(sceneId, x010000_g_scriptId, "���ɽ���",8,1)
	AddNumText(sceneId, x010000_g_scriptId, "���ѧϰ���ɼ���",8,6)		--ָ·������ѧϰ��
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x010000_OnDefaultEvent( sceneId, selfId,targetId )
	x010000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010000_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x010000_g_MenPai = GetMenPai(sceneId, selfId)
		if x010000_g_MenPai == 2 then
			BeginEvent(sceneId)
				AddText(sceneId, "��������ǲΪʦ�ˣ���������ؤ����ӣ�����ʲôʦ�ء�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x010000_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ�ؤ�ﲻ���㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_002}")
			AddNumText(sceneId, x010000_g_scriptId, "��ȷ��Ҫ����ؤ��",6,3)
			AddNumText(sceneId, x010000_g_scriptId, "����ʱ�������������",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	
	if	GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  ����һ�±�������Ҫ��������λ�ã��һ��н������㣡")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"�㻹�ǵȵ�10��֮��������ʦѧ�հɣ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x010000_g_MenPai = GetMenPai(sceneId, selfId)
			if x010000_g_MenPai == 2 then
				BeginEvent(sceneId)
					AddText(sceneId, "��������ǲΪʦ�ˣ���������ؤ����ӣ�����ʲôʦ�ء�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--����ֵΪ9��ʾ������
			elseif x010000_g_MenPai==9	then
				AddText(sceneId,"��ô�����ڿ�ʼ���������ؤ������µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 2)

				-- ���ó�ʼ��Npc��ϵֵ
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- ����ص��ķ�����Ϊ10����  13,16,17
				LuaFnSetXinFaLevel(sceneId,selfId,13,10)
				LuaFnSetXinFaLevel(sceneId,selfId,16,10)
				LuaFnSetXinFaLevel(sceneId,selfId,17,10)

				BeginEvent(sceneId)
					AddText(sceneId,"���Ѿ�����ؤ�");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				if TryRecieveItem( sceneId, selfId, 10124002, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124002 ).."��"
					x010000_MsgBox( sceneId, selfId, str)					
				end
				
				--����ҷ���,��������������,����׬Ǯ
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_6}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_gaibang_0001}" )
				
				--���ɽ����ټ���
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x010000_MsgBox( sceneId, selfId, "�õ�20ö�����ټ��" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ�����ؤ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
					CallScriptFunction( 221900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ�����ؤ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
					CallScriptFunction( 221900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ�ؤ�ﲻ���㡣")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_gaibang_0002}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x010000_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_GAIBANG )
				return
			end
		end
	end
	--ָ·
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "�����93��99�����Խ̸�������ս�����ܣ����������Աߡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 93, 99, "������" )
		return
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x010000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
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
function x010000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			x010000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x010000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x010000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x010000_OnDie( sceneId, selfId, killerId )
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x010000_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

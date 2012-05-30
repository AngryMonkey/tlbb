--�䵱NPC
--������
--������
--��ͨ

x012006_g_scriptId = 012006
x012006_g_eventList={223900,229009,808004,229012, 808092}
--**********************************
--�¼��������
--**********************************
function x012006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ƶ������������Ҳ���䵱ɽ�ϵĵ����������ƶ��ʮ����ǰ������")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x012006_g_scriptId, "��������",6,0)
		end
		AddNumText(sceneId, x012006_g_scriptId, "���ɽ���",8,1)
		AddNumText(sceneId, x012006_g_scriptId, "���ѧϰ���ɼ���",8,6)		--ָ·������ѧϰ��
		for i, eventId in x012006_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x012006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x012006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_WUDANG )
			return
		end
	end

	if GetNumText()==0	then

		x012006_g_MenPai = GetMenPai(sceneId, selfId)
		if x012006_g_MenPai == 3   then
			BeginEvent(sceneId)
				AddText(sceneId, "��������ǲΪʦ�ˣ����������䵱���ӣ�����ʲôʦ�ء�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x012006_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ����ǲ����㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_003}")
			AddNumText(sceneId, x012006_g_scriptId, "��ȷ��Ҫ�����䵱��",6,3)
			AddNumText(sceneId, x012006_g_scriptId, "����ʱ�������������",8,4)
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

	if GetNumText()==3	then
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
			x012006_g_MenPai = GetMenPai(sceneId, selfId)
			if x012006_g_MenPai == 3 then
				BeginEvent(sceneId)
					AddText(sceneId, "��������ǲΪʦ�ˣ����������䵱���ӣ�����ʲôʦ�ء�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--����ֵΪ9��ʾ������
			elseif x012006_g_MenPai==9	then
				AddText(sceneId,"��ô�����ڿ�ʼ����������䵱�����µ����ˡ�")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 3)

				-- ���ó�ʼ��Npc��ϵֵ
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- ����ص��ķ�����Ϊ10����  19,22,23
				LuaFnSetXinFaLevel(sceneId,selfId,19,10)
				LuaFnSetXinFaLevel(sceneId,selfId,22,10)
				LuaFnSetXinFaLevel(sceneId,selfId,23,10)

				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ������䵱�ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
				--����ҷ���,��������������,����׬Ǯ
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_9}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_wudang_0002}" )
				
				--���ɽ����ټ���
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x012006_MsgBox( sceneId, selfId, "�õ�20ö�����ټ��" )

				if TryRecieveItem( sceneId, selfId, 10124004, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124004 ).."��"
					x012006_MsgBox( sceneId, selfId, str )
				end
				
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ������䵱�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
					CallScriptFunction( 223900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ������䵱�ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
					CallScriptFunction( 223900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ����ǲ����㡣")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_wudang_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--ָ·
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "��Զɽ��82��85�����Խ̸�������ս�����ܣ����������Աߡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 82, 85, "��Զɽ" )
		return
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x012006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012006_g_eventList do
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
function x012006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x012006_g_eventList do
		if missionScriptId == findId then
			x012006_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x012006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x012006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x012006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x012006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x012006_OnDie( sceneId, selfId, killerId )
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x012006_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

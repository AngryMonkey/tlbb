--����NPC
--����
--��ͨ

x009003_g_scriptId = 009003
x009003_g_eventList={220900, 808004}
--**********************************
--�¼��������
--**********************************
function x009003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �������ţ�ʩ���������к��°���")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x009003_g_scriptId, "��������",6,0)
		end
		AddNumText(sceneId, x009003_g_scriptId, "���ɽ���",8,1)
		AddNumText(sceneId, x009003_g_scriptId, "���ѧϰ���ɼ���",8,6)		--ָ·������ѧϰ��
		for i, eventId in x009003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x009003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText()==0	then
		x009003_g_MenPai = GetMenPai(sceneId, selfId)
		if x009003_g_MenPai == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "��������ǲΪʦ�ˣ������������ֵ��ӣ�����ʲôʦ�ء�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x009003_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ�ˡ������������С���ݲ�����������")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_000}")
			AddNumText(sceneId, x009003_g_scriptId, "��ȷ��Ҫ����������",6,3)
			AddNumText(sceneId, x009003_g_scriptId, "����ʱ�������������",8,4)
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
				AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x009003_g_MenPai = GetMenPai(sceneId, selfId)
			if x009003_g_MenPai == 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "��������ǲΪʦ�ˣ������������ֵ��ӣ�����ʲôʦ�ء�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--����ֵΪ9��ʾ������
			elseif x009003_g_MenPai==9	then
				
				LuaFnJoinMenpai(sceneId, selfId, targetId, 0)

				-- ���ó�ʼ��Npc��ϵֵ
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- ����ص��ķ�����Ϊ10����  1,4,5
				LuaFnSetXinFaLevel(sceneId,selfId,1,10)
				LuaFnSetXinFaLevel(sceneId,selfId,4,10)
				LuaFnSetXinFaLevel(sceneId,selfId,5,10)
				
				BeginEvent(sceneId)
	  				AddText(sceneId,"���Ѿ����������ɣ�");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
	  			
	  			if TryRecieveItem( sceneId, selfId, 10124000, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124000).."��"
					x009003_MsgBox( sceneId, selfId, str )
				end
				
				--����ҷ���,��������������,����׬Ǯ
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_3}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_shaolin_0001}" )
				
				--���ɽ����ټ���
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x009003_MsgBox( sceneId, selfId, "�õ�20ö�����ټ��" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ����������ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"���Ѿ����������ɣ�",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"�����Ǳ�����ɵĸ�ͽ�ˣ�ˡ������������С���ݲ�����������")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_shaolin_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x009003_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_SHAOLIN )
				return
			end
		end
	end
	--ָ·
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "���Ѵ�ʦ��91��71�����Խ̸�������ս�����ܣ����������Աߡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 91, 71, "����" )
		return
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x009003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009003_g_eventList do
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
function x009003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			--UpdateEventList( sceneId, selfId, targetId ) --������û�����������who do �ģ�����
			x009003_OnDefaultEvent( sceneId, selfId,targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x009003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x009003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x009003_OnDie( sceneId, selfId, killerId )
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x009003_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

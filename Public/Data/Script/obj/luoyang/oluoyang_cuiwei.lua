--����NPC
--��έ
--��ͨ

--�ű���
x000153_g_scriptId = 000153

--��ӵ�е��¼�ID�б�
x000153_g_eventList={}

x000153_g_SheepBuff = 31550											--����buff

--**********************************
--�¼��б�
--**********************************
function x000153_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{BHXZ_081103_74}")
		AddNumText( sceneId, x000153_g_scriptId, "#{BHXZ_081103_75}", 4, 1 )
	EndEvent(sceneId)
	for i, eventId in x000153_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��������
--**********************************
function x000153_OnDefaultEvent( sceneId, selfId,targetId )
	x000153_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000153_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	if key == 1 then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x000153_g_SheepBuff) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,x000153_g_SheepBuff)
			BeginEvent( sceneId )
				AddText( sceneId, "  ���Ѿ����������ˣ��Ժ��Ҫ�ú����ˡ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			LuaFnCancelSpecificImpact(sceneId,selfId,x000153_g_SheepBuff)
			BeginEvent( sceneId )
				AddText( sceneId, "  �㲢û�б���򰡡�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
		return
	end

	for i, findId in x000153_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()��addnumtext�����ı���
			return
		end
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x000153_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000153_g_eventList do
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
function x000153_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000153_g_eventList do
		if missionScriptId == findId then
			x000153_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000153_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000153_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000153_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000153_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

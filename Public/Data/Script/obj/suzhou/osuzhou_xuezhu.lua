--����NPC   ѧϰ���켼��  �������켼��
--Ѧ��
--һ��

--�ű���
x001043_g_ScriptId = 001043

--�̵���
x001043_g_shoptableindex=67

--��ӵ�е��¼�Id�б�
--estudy_zhuzao = 713505
--elevelup_zhuzao = 713564
--edialog_zhuzao = 713604
--��ӵ�е��¼�ID�б�
x001043_g_eventList={713505,713564,713604}
--**********************************
--�¼��б�
--**********************************
function x001043_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0016}")
	for i, eventId in x001043_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x001043_g_ScriptId,"�������ͼ",7,ABILITY_TEACHER_SHOP)
  AddNumText(sceneId,x001043_g_ScriptId,"#{INTERFACE_XML_1194}",7,12)	  
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001043_OnDefaultEvent( sceneId, selfId,targetId )
	x001043_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001043_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001043_g_shoptableindex )
	elseif GetNumText()== 12 	then
    DispatchShopItem( sceneId, selfId,targetId, 199 ) 
	end
	for i, findId in x001043_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001043_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001043_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001043_g_eventList do
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
function x001043_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001043_g_eventList do
		if missionScriptId == findId then
			x001043_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001043_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001043_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001043_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001043_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001043_OnDie( sceneId, selfId, killerId )
end

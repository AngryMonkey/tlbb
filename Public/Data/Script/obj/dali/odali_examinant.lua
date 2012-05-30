--����NPC
--����
--��ͨ
--�ű���
x801017_g_scriptId = 801017

--��ӵ�е��¼�ID�б�
x801017_g_eventList={801016}	

--**********************************
--�¼��б�
--**********************************
function x801017_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "����"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"#{EXAM_INFO_1}")
		
		AddNumText( sceneId, x801017_g_scriptId, "�ƾٽ���", 11, 10 )
		
		for i, eventId in x801017_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x801017_OnDefaultEvent( sceneId, selfId,targetId )
	x801017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801017_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_062}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	local Numtext = GetNumText();
	CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, Numtext )
	return
end

--**********************************
--�����¼�
--**********************************
function x801017_OnDie( sceneId, selfId, killerId )
end

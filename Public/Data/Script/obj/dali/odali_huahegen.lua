--����NPC
--������
--��ͨ

--�ű���
x002014_g_scriptId = 002014

--��ӵ�е��¼�ID�б�
x002014_g_eventList={200001,200005}


--**********************************
--�¼��������
--**********************************
function x002014_OnDefaultEvent( sceneId, selfId,targetId )
  local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0004}")

		for i, eventId in x002014_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- ѡ��һ��
--**********************************
function x002014_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002014_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end

--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002015_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

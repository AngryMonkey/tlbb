--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000044_OnDefaultEvent( sceneId, selfId,targetId )
local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ߺߺ���ⲻ��"..PlayerName..PlayerSex.."#{OBJ_luoyang_0015}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

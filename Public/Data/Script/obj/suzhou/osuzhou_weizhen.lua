--����NPC
--κ��
--һ��

--**********************************
--�¼��������
--**********************************
function x001035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	  local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "����"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"    "..PlayerName..PlayerSex.."��÷��׮�ϱ��Բż�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--����NPC
--����
--һ��

--**********************************
--�¼��������
--**********************************
function x001004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	  local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "����"
		else
			PlayerSex = "����"
		end
		AddText(sceneId,"  "..PlayerName..PlayerSex.."����Ҳ���μӿ��ԣ��ȿ��Խ�����Ҫȥ�ݼ���ʦ��"..PlayerSex.."����һ��ǰ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

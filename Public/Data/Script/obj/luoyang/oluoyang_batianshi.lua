--����NPC
--����ʯ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000019_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ����"..PlayerName..PlayerSex.."����Ȼ������������ˡ�����ÿ�βμ���ϴ�����������̫�Ӷ�����ѡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

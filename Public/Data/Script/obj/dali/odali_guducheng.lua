--����NPC
--���Ƴ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002012_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."�����ղ����ˣ��������ڵ����ء�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

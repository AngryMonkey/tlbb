--����NPC
--ҵ��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000096_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."�����Ź��ڴ�������ô��ô������ѽ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

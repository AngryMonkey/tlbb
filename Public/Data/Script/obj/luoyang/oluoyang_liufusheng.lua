--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000097_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ģ�"..PlayerName..PlayerSex.."����һ���ᾡ���μӱ����ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

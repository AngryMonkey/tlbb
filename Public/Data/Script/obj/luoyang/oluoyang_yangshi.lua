--����NPC
--��ʱ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000040_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."����Ҳ�����ݼ���ʦ�����Һ�ʦ��ר�������������˼ң����ȵ���ʦ���Ǿ�һֱ���ߡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

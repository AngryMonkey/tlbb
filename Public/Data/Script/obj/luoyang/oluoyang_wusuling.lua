--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000173_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId," #G "..PlayerName..PlayerSex.."�����㲻�����ģ���ôȱǮ���������Ϲ������Űɣ��˼Ҷ�˵���ǲ���үת��o(��_��)o")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--����NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000028_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ˭˵���Ǹ����������Ĺ����ˣ���˵������û�е����顣"..PlayerName..PlayerSex.."��Ҫ�����������˺�������ʹ��������ң��ҵ�Ҫ�ú���������ֻ�۾����������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

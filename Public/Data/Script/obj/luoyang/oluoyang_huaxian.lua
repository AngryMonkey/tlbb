--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000094_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
 	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  �������཭ˮƽ�����ɽ��ϳ������������ճ������꣬��������ȴ���硣"..PlayerName..PlayerSex.."����ϲ��ֻ��ԧ�첻���ɵ����ӣ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

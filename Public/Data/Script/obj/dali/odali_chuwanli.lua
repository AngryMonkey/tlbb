--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002011_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ������һ��õ��书��������һ����Ϊ�ʼһ�����"..PlayerName..PlayerSex.."������԰���Ŵ����ɣ���̳���оŴ����ɵ�ָ���ˣ���ȥ��������ȥ������û׼����������ջ��ء�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

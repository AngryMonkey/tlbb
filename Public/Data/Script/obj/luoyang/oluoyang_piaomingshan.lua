--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000046_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  ������ĵ�����������鴫���������Ǹ�����ɽ�軨�е�һ�ȡ���˵�����������ݳ�ҲƯ���ĺܣ�"..PlayerName..PlayerSex.."������ȥ����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--����NPC
--���޹�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002067_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local roll = random(0,2)
	if roll <= 0 then
			AddText(sceneId,"  ���������������������޵�ż�����������Ұ��㣬�������󰮴��ף�")
	elseif roll <= 1 then
			AddText(sceneId,"  ����Ϊ�Ҳ���˵������������ͽ̹�����˵���ˡ����ţ����Ǳ��Ա��ԣ�")
	else
			AddText(sceneId,"  ��֪������˵��������������㣬�������㳤��һģһ��Ŷ��")
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

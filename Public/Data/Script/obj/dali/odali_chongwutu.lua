--����NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002068_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local roll = random(0,2)
	if roll <= 0 then
			AddText(sceneId,"  ��ƮƮ����������������޵�ż��ƮƮƮƮ�Ұ��㣬�������󰮴��ף�")
	elseif roll <= 1 then
			AddText(sceneId,"  ����Ϊ�Ҳ���˵����ƮƮ�����ͽ̹�����˵���ˡ����ţ����Ǳ��Ա��ԣ�")
	else
			AddText(sceneId,"  ��֪������˵ƮƮ�����һ������һ�����ã���ƮƮ��㳤��һģһ��Ŷ��")
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

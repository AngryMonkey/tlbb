--���ӹ���NPC
--ľ��
--һ��

x001204_g_MsgInfo = { "#{SHGZ_0612_21}",
											"#{SHGZ_0620_61}",
											"#{SHGZ_0620_62}",
											"#{SHGZ_0620_63}",
										}

--**********************************
--�¼��������
--**********************************
function x001204_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001204_g_MsgInfo))
		AddText(sceneId, x001204_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

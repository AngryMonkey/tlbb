--���ӹ���NPC
--�������
--һ��

x001217_g_MsgInfo = { "#{SHGZ_0612_34}",
											"#{SHGZ_0620_100}",
											"#{SHGZ_0620_101}",
											"#{SHGZ_0620_102}",
										}

--**********************************
--�¼��������
--**********************************
function x001217_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001217_g_MsgInfo))
		AddText(sceneId, x001217_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

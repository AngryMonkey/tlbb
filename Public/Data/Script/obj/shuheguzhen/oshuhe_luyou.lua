--���ӹ���NPC
--¶��
--һ��

x001205_g_MsgInfo = { "#{SHGZ_0612_22}",
											"#{SHGZ_0620_64}",
											"#{SHGZ_0620_65}",
											"#{SHGZ_0620_66}",
										}

--**********************************
--�¼��������
--**********************************
function x001205_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001205_g_MsgInfo))
		AddText(sceneId, x001205_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--���ӹ���NPC
--����
--һ��

x001177_g_MsgInfo = { "#{SHGZ_0612_37}",
											"#{SHGZ_0620_109}",
											"#{SHGZ_0620_110}",
											"#{SHGZ_0620_111}",
										}

--**********************************
--�¼��������
--**********************************
function x001177_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001177_g_MsgInfo))
		AddText(sceneId, x001177_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

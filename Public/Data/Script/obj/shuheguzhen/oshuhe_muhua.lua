--���ӹ���NPC
--ľ��
--һ��

x001203_g_MsgInfo = { "#{SHGZ_0612_20}",
											"#{SHGZ_0620_58}",
											"#{SHGZ_0620_59}",
											"#{SHGZ_0620_60}",
										}

--**********************************
--�¼��������
--**********************************
function x001203_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001203_g_MsgInfo))
		AddText(sceneId, x001203_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

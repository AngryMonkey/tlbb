--���ӹ���NPC
--����
--һ��

x001175_g_MsgInfo = { "#{SHGZ_0612_35}",
											"#{SHGZ_0620_103}",
											"#{SHGZ_0620_104}",
											"#{SHGZ_0620_105}",
										}

--**********************************
--�¼��������
--**********************************
function x001175_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001175_g_MsgInfo))
		AddText(sceneId, x001175_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

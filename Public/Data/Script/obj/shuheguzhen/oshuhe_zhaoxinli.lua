--���ӹ���NPC
--������
--һ��

x001211_g_MsgInfo = { "#{SHGZ_0612_28}",
											"#{SHGZ_0620_82}",
											"#{SHGZ_0620_83}",
											"#{SHGZ_0620_84}",
										}

--**********************************
--�¼��������
--**********************************
function x001211_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001211_g_MsgInfo))
		AddText(sceneId, x001211_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

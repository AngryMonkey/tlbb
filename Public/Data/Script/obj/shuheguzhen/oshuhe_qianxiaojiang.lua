--���ӹ���NPC
--ǮС��
--һ��

x001213_g_MsgInfo = { "#{SHGZ_0612_30}",
											"#{SHGZ_0620_88}",
											"#{SHGZ_0620_89}",
											"#{SHGZ_0620_90}",
										}

--**********************************
--�¼��������
--**********************************
function x001213_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001213_g_MsgInfo))
		AddText(sceneId, x001213_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

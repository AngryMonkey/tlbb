--���ӹ���NPC
--��ң
--һ��

x001209_g_MsgInfo = { "#{SHGZ_0612_26}",
											"#{SHGZ_0620_79}",
											"#{SHGZ_0620_80}",
											"#{SHGZ_0620_81}",
										}

--**********************************
--�¼��������
--**********************************
function x001209_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001209_g_MsgInfo))
		AddText(sceneId, x001209_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

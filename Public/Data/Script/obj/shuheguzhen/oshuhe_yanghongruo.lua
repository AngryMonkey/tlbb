--���ӹ���NPC
--�����
--һ��

x001208_g_MsgInfo = { "#{SHGZ_0612_25}",
											"#{SHGZ_0620_73}",
											"#{SHGZ_0620_74}",
											"#{SHGZ_0620_75}",
										}

--**********************************
--�¼��������
--**********************************
function x001208_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001208_g_MsgInfo))
		AddText(sceneId, x001208_g_MsgInfo[msgidx])
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

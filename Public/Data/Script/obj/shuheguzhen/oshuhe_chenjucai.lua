--���ӹ���NPC
--Ǯׯ�ϰ�
--��ͨ
x001182_g_scriptId = 001182
x001182_g_MsgInfo = { "#{SHGZ_0612_07}",
											"#{SHGZ_0620_19}",
											"#{SHGZ_0620_20}",
											"#{SHGZ_0620_21}",
										}

--**********************************
--�¼��������
--**********************************
function x001182_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		local msgidx = random(getn(x001182_g_MsgInfo))
		AddText(sceneId, x001182_g_MsgInfo[msgidx])
		AddNumText(sceneId,x001182_g_scriptId,"#{JZBZ_081031_02}",11,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001182_OnEventRequest( sceneId, selfId, targetId, eventId )
		
		if GetNumText() == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{JZBZ_081031_01}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
    end
end

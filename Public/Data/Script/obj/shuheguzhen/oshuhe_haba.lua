--NPC
--����
--�䷽��Ʒ

x001170_g_scriptId = 001170
x001170_g_shoptableindex = 183
x001170_g_MsgInfo = { "#{SHGZ_0612_03}",
											"#{SHGZ_0620_07}",
											"#{SHGZ_0620_08}",
											"#{SHGZ_0620_09}",
										}

--**********************************
--�¼��������
--**********************************
function x001170_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local msgidx = random(getn(x001170_g_MsgInfo))
		AddText( sceneId, x001170_g_MsgInfo[msgidx] )	
--**********************************
--NPC�԰�
--**********************************
		AddNumText( sceneId, x001170_g_scriptId, "���������Ķ���", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001170_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x001170_g_shoptableindex )
	end
end


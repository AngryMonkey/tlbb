--����NPC
--С��

x001070_g_ScriptId	= 001070

--�䷽��
x001070_g_shoptableindex= 168
--**********************************
--�¼��������
--**********************************
function x001070_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{PFBQ_20070926_001}" )
		AddNumText( sceneId, x001070_g_ScriptId, "�ع��䷽", 7, 100 )
		AddNumText( sceneId, x001070_g_ScriptId, "�����ع��䷽", 11, 101 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001070_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	if key == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x001070_g_shoptableindex )
	elseif key == 101 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{CGPF_2007_0109}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

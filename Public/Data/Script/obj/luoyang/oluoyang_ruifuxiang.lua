--����NPC
--����
--��ͨ

--ҩ��

x000099_g_scriptId = 000099

x000099_g_shoptableindex=16

--**********************************
--�¼��������
--**********************************
function x000099_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ������������Ϊ������������������Ϊ������" )
		AddNumText( sceneId, x000099_g_scriptId, "�����ӻ�", 7, 1 )
			--for i, eventId in x000099_g_eventList do
				--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId)
			--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000099_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1	then
		DispatchShopItem( sceneId, selfId, targetId, x000099_g_shoptableindex)
	end
end

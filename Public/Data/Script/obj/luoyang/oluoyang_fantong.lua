--����NPC
--��ͳ
--�����ϰ�

x000059_g_ShopTabId	= 15

x000059_g_ScriptId	= 000059

--**********************************
--�¼��������
--**********************************
function x000059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����������¥������ˮϯ�ɣ��������֮����Ҳ�����뿪������")
		AddNumText(sceneId,x000059_g_ScriptId,"����ʳ��",7,0)
--		AddNumText(sceneId,x000059_g_ScriptId,"������",6,1)
--		AddNumText(sceneId,x000059_g_ScriptId,"������",6,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000059_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	local	ene	= GetHumanEnergy( sceneId, selfId )	--����
	local	vig	= GetHumanVigor( sceneId, selfId )	--����
	
	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x000059_g_ShopTabId )
		
	elseif key == 1 then
		if ene >= 40 then
			SetHumanEnergy( sceneId, selfId, ene-40 )
			AddMoney( sceneId, selfId, 3000 )
			x000059_MsgBox( sceneId, selfId, "�������40����,���30������" );
		else
			x000059_MsgBox( sceneId, selfId, "��ľ�������40��,�ϰ岻��Ҫ���" );
		end
	elseif key == 2 then
		if vig >= 40 then
			SetHumanVigor( sceneId, selfId, vig-40 )
			AddMoney( sceneId, selfId, 3000 )
			x000059_MsgBox( sceneId, selfId, "�������40����,���30������" );
		else
			x000059_MsgBox( sceneId, selfId, "��Ļ�������40��,�ϰ岻��Ҫ���" );
		end
	end
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x000059_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

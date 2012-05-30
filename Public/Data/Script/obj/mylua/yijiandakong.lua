--��Ե����

--�ű���
x889071_g_scriptId = 889071

--��ӵ�е��¼�ID�б�

--**********************************
--�¼��б�#G���ǰ�����뱣֤������һ��8��������8���޲���8��������
--**********************************
function x889071_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText( sceneId, "  #e0e8de5#Yһ��#W���#G(#cFF0000ǿ��#G)#G˵����" )	

	AddText( sceneId, "  #Y��#G���#G(#cFF0000ǿ��#G)��װ��#Gȫ������#cFF0000������" )
	AddText( sceneId, "  #GȻ��#W��ֻ��Ҫ#G���#Y���#G(#cFF0000ǿ��#G)#cFF0000����" )
	AddText( sceneId, "  #Yװ��#W���#G(#cFF0000ǿ��#G)����һ������ʵ�ֱ���ȫ��װ��3�ס�" )
	AddText(sceneId,"   #G���������ѿ�ͨ#cFF0000������#W��#cFF0000��Ƕ ")	
	AddText(sceneId,"   #Y����#G.#Y���#G.#Yʱװ#G.#Y����#G����#cFF0000��վ���#Y����Ϸ��#G��Ƕ��")	
	AddText( sceneId, "  ��NPCֻ֧��#cFF0000100��#G����#Wװ��ǿ��,#cFF0000100��#G����#Wװ���뵽#Y������#W����ǿ��" )	
	--AddText( sceneId, "  #W��Ϸ�ڿ���#Gǿ����#cFF00009#G,ǿ��#cFF000010-15#G�뵽��վ#Y��̨��" )
	AddNumText( sceneId, x889071_g_scriptId, "#gffff00#Yһ��#W���", 2, 300)
	AddNumText( sceneId, x889071_g_scriptId, "#gffff00#Yһ��#Wǿ��", 2, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x889071_OnDefaultEvent( sceneId, selfId,targetId )
	x889071_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889071_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend   = GetBasicBagEndPos(sceneId, selfId)
		for i=bagbegin, bagend do
	       nLevel = GetBagItemLevel( sceneId, selfId, i )
	              if nLevel <= 100 then
                           if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
                               LuaFnEquipEnhance( sceneId, selfId, i, 0 )
		             end
	              end
	       end
	       x889071_NotifyTip( sceneId, selfId, "����100����������װ���ѳɹ�ǿ�� 1 �Ρ�" )
	       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	elseif GetNumText() == 300 then
		x889071_NotifyFailBox( sceneId, selfId, targetId, "#Y#Gһ�����#Y��ʹ��#r#G����ʯ#Y��#G��ʯ����#Y��#G��Ҫ���#Y��#r���һ�μ���ʵ��һ������ȫ��3��#r#Gע��:���÷��������" )
	elseif GetNumText() == 100 then
		local	tEquipGemTable	= { 0, 1, 2, 3, 4, 5, 6, 7, 8, 12, 14, 15, 16, 17, 18 }

		local	Bore_Count			= GetBagGemCount( sceneId, selfId, 0 )
		local nLevel					= GetBagItemLevel( sceneId, selfId, 0 )
		local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		local find						= 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end
			end
		--if find == 0 then
			--x889071_NotifyTip( sceneId, selfId, "��װ�����ܴ�ס�" )
			--return
		--end
		--if nLevel < 1 then
			--x889071_NotifyTip( sceneId, selfId, "ֻ�ṩ1���ϵ�װ����ס�" )
			--return
		--end
		--if  GetItemCount( sceneId, selfId, 20500008 ) < 1 or GetItemCount( sceneId, selfId, 20501008 ) < 1 or GetItemCount( sceneId, selfId, 20502008 ) < 1 then
			--x889071_NotifyTip( sceneId, selfId, "��ȷ���������㹻�Ĳ��ϡ�" )
			--return
		--end
		--if  GetItemCount( sceneId, selfId, 20500008 ) > 0 then
			--DelItem( sceneId, selfId, 20500008, 1 )
		--else if  GetItemCount( sceneId, selfId, 20501008 ) > 0 then
			--DelItem( sceneId, selfId, 20501008, 1 )
		--else if  GetItemCount( sceneId, selfId, 20502008 ) > 0 then
			--DelItem( sceneId, selfId, 20502008, 1 )
		--end
              AddBagItemSlot( sceneId, selfId, 0 )
              AddBagItemSlot( sceneId, selfId, 1 )
              AddBagItemSlot( sceneId, selfId, 2 )
              AddBagItemSlot( sceneId, selfId, 3 )
              AddBagItemSlot( sceneId, selfId, 4 )
              AddBagItemSlot( sceneId, selfId, 5 )
              AddBagItemSlot( sceneId, selfId, 6 )
              AddBagItemSlot( sceneId, selfId, 7 )
              AddBagItemSlot( sceneId, selfId, 8 )
              AddBagItemSlot( sceneId, selfId, 9 )
              AddBagItemSlot( sceneId, selfId, 10 )
              AddBagItemSlot( sceneId, selfId, 11 )
              AddBagItemSlot( sceneId, selfId, 12 )
              AddBagItemSlot( sceneId, selfId, 13 )
              AddBagItemSlot( sceneId, selfId, 14 )
              AddBagItemSlot( sceneId, selfId, 15 )
              AddBagItemSlot( sceneId, selfId, 16 )
              AddBagItemSlot( sceneId, selfId, 17 )
              AddBagItemSlot( sceneId, selfId, 18 )
              AddBagItemSlot( sceneId, selfId, 19 )
              AddBagItemSlot( sceneId, selfId, 20 )
              AddBagItemSlot( sceneId, selfId, 21 )
              AddBagItemSlot( sceneId, selfId, 22 )
              AddBagItemSlot( sceneId, selfId, 23 )
              AddBagItemSlot( sceneId, selfId, 24 )
              AddBagItemSlot( sceneId, selfId, 25 )
              AddBagItemSlot( sceneId, selfId, 26 )
              AddBagItemSlot( sceneId, selfId, 27 )
              AddBagItemSlot( sceneId, selfId, 28 )
              AddBagItemSlot( sceneId, selfId, 29 )
		x889071_NotifyTip( sceneId, selfId, "��������װ���ѳɹ���� 1 �Ρ�" )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x889071_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	
end

--**********************************
--�ܾ���NPC������
--**********************************
function x889071_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
end

--**********************************
--�������Ѿ���������
--**********************************
function x889071_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--�ύ�����������
--**********************************
function x889071_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

--**********************************
--�����¼�
--**********************************
function x889071_OnDie( sceneId, selfId, killerId )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x889071_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x889071_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x889071_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

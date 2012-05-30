-- ����NPC
-- ������
-- һ��

-- �ű���
x001037_g_scriptId = 001037

x001037_g_shoptableindex = 25

x001037_g_ControlScript = 050009
x001037_g_ExchangeList = { id = 40004304, name = "��������", cost = 30 }
x001037_g_yiexihuFlag = 1;

--**********************************
--�¼��������
--**********************************
function x001037_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{BSR_80919_1}" )
		AddNumText( sceneId, x001037_g_scriptId, "���������Ķ���", 7, 0 )
		--if x001037_g_yiexihuFlag == 1 then
		--	AddNumText( sceneId, x001037_g_scriptId, "ȥҹ����", 6, 3 )
			AddNumText( sceneId, x001037_g_scriptId, "��׽ө������", 11, 14 )
			AddNumText( sceneId, x001037_g_scriptId, "ѩ���̶���������֭�����", 11, 15 )
		--end

		if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x001037_g_scriptId, "��ȡʳ��", 6, 1 )
			--AddNumText( sceneId, x001037_g_scriptId, "ʳ����ʲô��", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001037_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == x001037_g_scriptId then
		local selectItem = GetNumText();
		if selectItem == 0 then
			DispatchShopItem( sceneId, selfId, targetId, x001037_g_shoptableindex )
		end
		
		if x001037_g_yiexihuFlag == 1 then
			if selectItem == 3 then
				--CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 121, 40, 52);
			elseif selectItem == 14 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_091}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			elseif selectItem == 15 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_092}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			end
		end
	end

	if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "    Ҫ��һ��" .. x001037_g_ExchangeList.name ..
				"����Ҫ����" .. x001037_g_ExchangeList.cost .. "�㣬������ֻ��" .. score .. "�֣��ƺ���������" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "  ��Ŀǰ���������Ϊ" .. score .. "�֣���ȡһ��" ..
					x001037_g_ExchangeList.name .. "����Ҫ����" .. x001037_g_ExchangeList.cost .. "�㣬��ȷ��Ҫ����" )

				AddNumText( sceneId, x001037_g_scriptId, "ȷ��Ҫ��", -1, 3 )
				AddNumText( sceneId, x001037_g_scriptId, "��ֻ��·��", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x001037_NotifyFailBox( sceneId, selfId, targetId, "    ����������127��" ..
				"154�������ݰ����٣�190��168������������ڣ�109��170���ֱ�" ..
				"���ֲ�ͬ��ʳ�ĺ������ݣ�193��148������Բ���͵�������������" ..
				"������Ʒ��" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x001037_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "    �����ռ�������" )
			end

			score = score - x001037_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x001037_NotifyFailBox( sceneId, selfId, targetId, "    ʣ����֣�" .. score .. "��" )
			return
		elseif GetNumText() == 4 then
			BeginUICommand( sceneId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
		return
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x001037_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

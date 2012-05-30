-- ����NPC		�Ƶ��ϰ�
-- ����
-- ��ͨ

-- �ű���
x000102_g_scriptId = 000102
-- �̵��
x000102_g_ShopTabId = 15 
--��ӵ�е��¼�ID�б�
x000102_g_eventList = { }

x000102_g_ControlScript = 050009
x000102_g_ExchangeList = { id = 40004303, name = "�������", cost = 20 }

--**********************************
--�¼��б�
--**********************************
function x000102_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ���Ϸɵġ������ܵġ�ˮ���εģ����ʲô��������¥��Ӧ�о��С�" )
		AddNumText(sceneId,x000102_g_scriptId,"����ʳ��",7,1111)
		if CallScriptFunction( x000102_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x000102_g_scriptId, "��ȡʳ��", 6, 1 )
			--AddNumText( sceneId, x000102_g_scriptId, "ʳ����ʲô��", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x000102_OnDefaultEvent( sceneId, selfId, targetId )
	x000102_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000102_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1111 then
		DispatchShopItem( sceneId, selfId, targetId, x000102_g_ShopTabId);
	end
	local i, findId
	for i, findId in x000102_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if CallScriptFunction( x000102_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x000102_g_ExchangeList.cost then
				x000102_NotifyFailBox( sceneId, selfId, targetId, "    Ҫ��һ��" .. x000102_g_ExchangeList.name ..
				"����Ҫ����" .. x000102_g_ExchangeList.cost .. "�㣬������ֻ��" .. score .. "�֣��ƺ���������" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "  ��Ŀǰ���������Ϊ" .. score .. "�֣���ȡһ��" ..
					x000102_g_ExchangeList.name .. "����Ҫ����" .. x000102_g_ExchangeList.cost .. "�㣬��ȷ��Ҫ����" )

				AddNumText( sceneId, x000102_g_scriptId, "ȷ��Ҫ��", -1, 3 )
				AddNumText( sceneId, x000102_g_scriptId, "��ֻ��·��", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x000102_NotifyFailBox( sceneId, selfId, targetId, "    ����������127��" ..
				"154�������ݰ����٣�190��168������������ڣ�109��170���ֱ�" ..
				"���ֲ�ͬ��ʳ�ĺ������ݣ�193��148������Բ���͵�������������" ..
				"������Ʒ��" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x000102_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x000102_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x000102_NotifyFailBox( sceneId, selfId, targetId, "    �����ռ�������" )
			end

			score = score - x000102_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x000102_NotifyFailBox( sceneId, selfId, targetId, "    ʣ����֣�" .. score .. "��" )
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
--���ܴ�NPC������
--**********************************
function x000102_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000102_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			x000102_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000102_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000102_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000102_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x000102_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

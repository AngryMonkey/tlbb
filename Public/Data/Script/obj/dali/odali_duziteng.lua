--������

--�ű���
x002028_g_scriptId = 002028

x002028_g_shoptableindex=5

--��ӵ�е��¼�ID�б�
x002028_g_eventList = { 210201, 210202, 210203 }

x002028_g_ControlScript = 050009
x002028_g_ExchangeList = { id = 40004305, name = "�Ϻ�����", cost = 55 }

--**********************************
--�¼��б�
--**********************************
function x002028_UpdateEventList( sceneId, selfId, targetId )
    local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )

	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end

	BeginEvent( sceneId )
		AddText( sceneId, "  " .. PlayerName .. PlayerSex .. "���벻�볢�����Ǵ����������С�ԣ�������˰����ְ��룬��Ҳ�������ˡ�")
		AddNumText( sceneId, x002028_g_scriptId, "����ʳƷ", 7, 0 )

		for i, eventId in x002028_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		if CallScriptFunction( x002028_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x002028_g_scriptId, "��ȡʳ��", 6, 1 )
			--AddNumText( sceneId, x002028_g_scriptId, "ʳ����ʲô��", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x002028_OnDefaultEvent( sceneId, selfId, targetId )
	x002028_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002028_OnEventRequest( sceneId, selfId, targetId, eventId )
	local i, findId

	for i, findId in x002028_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002028_g_shoptableindex )
	end

	if CallScriptFunction( x002028_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x002028_g_ExchangeList.cost then
				x002028_NotifyFailBox( sceneId, selfId, targetId, "    Ҫ��һ��" .. x002028_g_ExchangeList.name ..
				"����Ҫ����" .. x002028_g_ExchangeList.cost .. "�㣬������ֻ��" .. score .. "�֣��ƺ���������" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "  ��Ŀǰ���������Ϊ" .. score .. "�֣���ȡһ��" ..
					x002028_g_ExchangeList.name .. "����Ҫ����" .. x002028_g_ExchangeList.cost .. "�㣬��ȷ��Ҫ����" )

				AddNumText( sceneId, x002028_g_scriptId, "ȷ��Ҫ��", -1, 3 )
				AddNumText( sceneId, x002028_g_scriptId, "��ֻ��·��", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x002028_NotifyFailBox( sceneId, selfId, targetId, "    ����������127��" ..
				"154�������ݰ����٣�190��168������������ڣ�109��170���ֱ�" ..
				"���ֲ�ͬ��ʳ�ĺ������ݣ�193��148������Բ���͵�������������" ..
				"������Ʒ��" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x002028_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x002028_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x002028_NotifyFailBox( sceneId, selfId, targetId, "    �����ռ�������" )
			end

			score = score - x002028_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x002028_NotifyFailBox( sceneId, selfId, targetId, "    ʣ����֣�" .. score .. "��" )
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
function x002028_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x002028_g_eventList do
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
function x002028_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	local i, findId
	for i, findId in x002028_g_eventList do
		if missionScriptId == findId then
			x002028_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002028_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x002028_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002028_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x002028_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002028_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x002028_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

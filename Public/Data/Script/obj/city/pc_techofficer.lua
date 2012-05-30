--����NPC
--�Ƽ���Ա

x805015_g_scriptId = 805015
x805015_g_BuildingID9 = 13

--��ӵ�е��¼�ID�б�
x805015_g_eventList = { 600012 }

-- �����¼� ID �б������¼��������¼�
x805015_g_eventSetList = { 600012 }

--��ȡ�̽�������Ҫ�İﹱ����	--add by xindefeng
x805015_g_MingTieNeedBangGong = 50
--�̽�����ID	--add by xindefeng
x805015_g_TangJinMingTieID = 30505205
--ÿ�ο�����ȡ�̽���������
x805015_g_TangJinMingTieCount = 1

--**********************************
--�¼��б�
--**********************************
function x805015_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	
	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    ����֮�ˣ��޲��ڸ���֮��������ͬ���ֵܣ���ʲô���ܰ���ģ����ܿ��ڡ�" )
			for i, eventId in x805015_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805015_g_scriptId, "�Ƽ��������", 11, 1 )
			--AddNumText( sceneId, x805015_g_scriptId, "�޸İ��ƺ�", 6, 3 )	--��һ��Ҫ��ɵ�--del by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "�о��µ���Ʒ", 6, 4 )
			AddNumText( sceneId, x805015_g_scriptId, "���е���", 6, 5 )
			AddNumText( sceneId, x805015_g_scriptId, "����������", 6, 6 )
			AddNumText( sceneId, x805015_g_scriptId, "�鷿����", 11, 2 )
			AddNumText( sceneId, x805015_g_scriptId, "��ȡ�̽�����", 6, 20 )	--add by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "������ȡ����Զ��ƺ�", 11, 22 )	--add by xindefeng
		
			--life ���������������Ӧ�����ѡ��
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805015_g_scriptId,x805015_g_BuildingID9,888)
		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "����"
			elseif PlayerGender == 1 then
				rank = "����"
			else
				rank = "����"
			end

			AddText( sceneId, "    ��ѽ��" .. rank .. "�����Ǳ������ˣ�С��������������" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805015_OnDefaultEvent( sceneId, selfId, targetId )
	x805015_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳ���¼��Ƿ����ͨ���� NPC ִ��
--**********************************
function x805015_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805015_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805015_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805015_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life ����������������Ӧ�����ѡ��
	elseif eventId ~= x805015_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805015_g_scriptId, x805015_g_BuildingID9 )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Tec_Mission_Help}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_ShuFang}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	--elseif GetNumText() == 3 then--��һ��Ҫ��ɵ�--del by xindefeng
	--	BeginEvent(sceneId)
	--	AddText( sceneId, "������ܼ�������" )		
	--	EndEvent(sceneId)
	--	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 5 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 20 then																--��ȡ�̽�����	--add by xindefeng
		-- ����ȷ��ҳ��			add by WTT
		BeginEvent(sceneId)
			-- ��ȡ�̽�������Ҫ����50���ṱ�׶ȡ���ȷ��Ҫ��ȡ��
			AddText( sceneId, "#{TJMT_090213_01}" )
			--ȷ���һ���ť
			AddNumText(sceneId, x805015_g_scriptId, "�ǣ���ȷ����", 6, 201)				
			--������һҳ��ť
			AddNumText(sceneId, x805015_g_scriptId, "�����һ��ǲ�Ҫ�ˡ�", 6, 202)		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then																-- ȷ����ȡ�̽�����		add by WTT
		x805015_GetTangJinMinTie(sceneId, selfId, targetId)

	elseif GetNumText() == 202 then																-- ������ȡ�̽�����		add by WTT
		BeginEvent( sceneId )
			x805015_OnDefaultEvent( sceneId, selfId, targetId )				-- ������һҳ
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 22 then	--������ȡ����Զ���ƺ�	--add by xindefeng
		BeginEvent(sceneId)
			AddText( sceneId, "#{TangJinMingTie_Help}")
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805015_g_BuildingID9 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x805015_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805015_NotifyFailTips( sceneId, selfId, "�����ڲ�����ȡ�������" )
		elseif ret == -2 then
			x805015_NotifyFailTips( sceneId, selfId, "�޷����ܸ�������" )
		end

		return
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x805015_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805015_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x805015_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ�����������
--**********************************
function x805015_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805015_OnDie( sceneId, selfId, killerId )
end

function x805015_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--��ȡ�̽�����	--add by xindefeng
--**********************************
function x805015_GetTangJinMinTie(sceneId, selfId, targetId)
	--���ﹱ
	local szMsg = nil
	local nBangGongPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)	--��ȡ�ﹱ����
  if nBangGongPoint < x805015_g_MingTieNeedBangGong then
  	szMsg = format("    ���µİ�ṱ�ײ���#G%d#W���޷��һ��Զ�ְλ���ơ�", x805015_g_MingTieNeedBangGong)
  	x805015_NotifyFailTips( sceneId, selfId, szMsg)
  	return
  end
  	
  --��ⱳ���Ƿ��еط�
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x805015_g_TangJinMingTieCount) then
		--��Ŀ��ʾ"�ռ䲻��"
		x805015_NotifyFailTips(sceneId, selfId, "#{YRJ_BagFullTip}")
		return
	end	
	
	--����ͨ��
	
	--ɾ���ﹱ
  local ret = CityChangeAttr(sceneId, selfId, 6, -x805015_g_MingTieNeedBangGong)
	if not ret or ret ~= 1 then		
		x805015_NotifyFailTips(sceneId, selfId, "    �޷��۳��ﹱ�������ԣ�")	--��Ŀ��ʾ"�޷�ɾ���ﹱ"
		return
	end
	
	--����һ��"�̽�����"
	BeginAddItem(sceneId)
		AddItem(sceneId, x805015_g_TangJinMingTieID, x805015_g_TangJinMingTieCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--����Ʒ�����
	
	--������,�½���:���պ�:)
	BeginEvent( sceneId )
		AddText( sceneId, "    ����һ��#G�̽�����#W����ȥ���ú�ʹ�ã�" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

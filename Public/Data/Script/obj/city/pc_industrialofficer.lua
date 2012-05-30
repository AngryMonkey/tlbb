--����NPC
--����

x805008_g_scriptId = 805008
x805008_g_BuildingID16 = 5

--��ӵ�е��¼�ID�б�
x805008_g_eventList = { 600002 }

-- �����¼� ID �б������¼��������¼�
x805008_g_eventSetList = { 600002 }

--**********************************
--�¼��б�
--**********************************
function x805008_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    ���﹤��֮�£��������Ұ���������������֮�����������ǡ�" )
			for i, eventId in x805008_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805008_g_scriptId, "�����������", 11, 7 )
			AddNumText( sceneId, x805008_g_scriptId, "����װ��", 6, 9 )
			AddNumText( sceneId, x805008_g_scriptId, "����ϳɱ�ʯ", 6, 10 )
			AddNumText( sceneId, x805008_g_scriptId, "�䷽�̵�", 7, 6 )
			AddNumText( sceneId, x805008_g_scriptId, "��̨����", 11, 8 )
			AddNumText( sceneId, x805008_g_scriptId, "���ڹػ�����", 11, 11 )
			AddNumText( sceneId, x805008_g_scriptId, "��ȡ�ػ�����", 6, 12 )

			--life ���������������Ӧ�����ѡ��
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805008_g_scriptId,x805008_g_BuildingID16,888)
		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "��Ů"
			elseif PlayerGender == 1 then
				rank = "����"
			else
				rank = "����"
			end

			AddText( sceneId, "    ������һ���ˣ�" .. rank .. "�кμ��̣�" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805008_OnDefaultEvent( sceneId, selfId, targetId )
	x805008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳ���¼��Ƿ����ͨ���� NPC ִ��
--**********************************
function x805008_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805008_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805008_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

function x805008_CheckFavorOfGuild( sceneId, selfId )
    --�ɹ����� 0
    --���ɲ������� 1
    --�ﹱ���㷵�� 2
    --������ȡʱ�� 3
    --��ά��״̬   4

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	if( Humanguildid ~= cityguildid ) then
		return 1   --���Ǳ����Ա
	end

	local GuidPoint = CityGetAttr( sceneId, selfId, 6 )

	local CurDay = GetDayTime()
	local OldDay = GetMissionData( sceneId, selfId, MD_FAVOROFGUILD_LASTTIME ) --ȡ���ϴ���ȡ���ɹػ���ʱ��

	if( CurDay <= OldDay ) then
	    return 3  --���ϴ���ȡʱ�䲻��1��
	end

	if( GuidPoint < 1 ) then
	    return 2   --�ﹱ����1��
	end

	local citySceneId = CityGetSelfCityID( sceneId, selfId )
	local Status = CityGetMaintainStatus( sceneId, selfId, citySceneId )

	if( Status == 1 ) then
	    return 4     --��ά��״̬,������ȡ���ɹػ�
	end

	return 0  --�ɹ�
end

function x805008_SetFavorOfGuild( sceneId, selfId )

    local FavorCode = x805008_CheckFavorOfGuild( sceneId, selfId )
	if( 0 ~= FavorCode ) then
	    return
	end

	local Level = GetLevel( sceneId, selfId )
	--���ݵȼ�����buff

	local Name = GetName( sceneId, selfId )
	local Point = 0
	local BuffLevel = 0

	if( Level >= 10 and Level < 20 ) then
	    Point = 10
	    BuffLevel = 7800
	elseif ( Level >= 20 and Level < 30 ) then
	    Point = 15
	    BuffLevel = 7801
	elseif ( Level >= 30 and Level < 40 ) then
	    Point = 20
	    BuffLevel = 7802
	elseif ( Level >= 40 and Level < 50 ) then
	    Point = 25
	    BuffLevel = 7803
	elseif ( Level >= 50 and Level < 60 ) then
	    Point = 30
	    BuffLevel = 7804
	elseif ( Level >= 60 and Level < 70 ) then
	    Point = 35
	    BuffLevel = 7805
	elseif ( Level >= 70 and Level < 80 ) then
	    Point = 40
	    BuffLevel = 7806
	elseif ( Level >= 80 and Level < 90 ) then
	    Point = 45
	    BuffLevel = 7807
	elseif ( Level >= 90 and Level < 100 ) then
	    Point = 50
	    BuffLevel = 7808
	elseif ( Level >= 100 and Level < 110 ) then
	    Point = 55
	    BuffLevel = 30000
	elseif ( Level >= 110 and Level < 120 ) then
	    Point = 60
	    BuffLevel = 30001
	elseif ( Level >= 120 and Level < 130 ) then
	    Point = 65
	    BuffLevel = 30002
	elseif ( Level >= 130 and Level < 140 ) then
	    Point = 70
	    BuffLevel = 30003
	elseif ( Level >= 140 and Level < 150 ) then
	    Point = 75
	    BuffLevel = 30004
	elseif ( Level >= 150 and Level <= 160) then
	    Point = 80
	    BuffLevel = 30005
	else
	    Point = 0
	    BuffLevel = 0
	end

	if( Point > 0 ) then
	    local CurDay = GetDayTime()
	    local GuidPoint = CityGetAttr( sceneId, selfId, 6 )

        --CitySetAttr( sceneId, selfId, 6, GuidPoint - 1 )   --����һ��ﹱ
        CityChangeAttr( sceneId, selfId, 6, -1 )   --����һ��ﹱ

        SetMissionData( sceneId, selfId, MD_FAVOROFGUILD_LASTTIME, CurDay ) --������ȡ���ɹػ���ʱ��
        local sMessage = format("@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00�ڹ�ҵ��Ա#c00ff00��Ӧ��#cffff00���ɹ�����ȡ�˽���İ��ɹػ�����#c00ff00����#cffff00��#c00ff00����#cffff00��������#c00ff00%d#cffff00�㡣", Name, Point );

	    BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
	    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, BuffLevel, 0)   --����buff
	end



end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805008_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805008_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life ����������������Ӧ�����ѡ��
	elseif eventId ~= x805008_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805008_g_scriptId, x805008_g_BuildingID16 )
		return
	end
	if GetNumText() == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )								--���ó����̵����
			UICommand_AddInt( sceneId, x805008_g_BuildingID16 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 104 )
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Industry_Mission_Help}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_DuanTai}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 9 then
		BeginEvent(sceneId)
			AddText( sceneId, "������ܼ�������" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 10 then
		BeginEvent(sceneId)
			AddText( sceneId, "������ܼ�������" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 11 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{function_help_085}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 12 then
	    local FavorCode = x805008_CheckFavorOfGuild( sceneId, selfId )
	    if( 0 == FavorCode ) then  --��������
	        x805008_SetFavorOfGuild( sceneId, selfId )
	    elseif( 1 == FavorCode ) then  --���Ǳ���
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_NOTMEMBER}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
	    elseif( 2 == FavorCode ) then  --�ﹱ����1��
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_POINTNOTENOUGH}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
	    elseif( 3 == FavorCode ) then  --������ȡʱ�� 3
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_TIMENOTENOUGH}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
        elseif( 4 == FavorCode ) then  --��ά��״̬   4
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_CITYSTATENOTENOUGH}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
	    end



	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life ���������������Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805008_g_BuildingID16 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x805008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805008_NotifyFailTips( sceneId, selfId, "�����ڲ�����ȡ�������" )
		elseif ret == -2 then
			x805008_NotifyFailTips( sceneId, selfId, "�޷����ܸ�������" )
		end

		return
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x805008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805008_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x805008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ�����������
--**********************************
function x805008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805008_OnDie( sceneId, selfId, killerId )
end

function x805008_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

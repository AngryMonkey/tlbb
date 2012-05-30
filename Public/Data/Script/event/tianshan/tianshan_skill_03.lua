-- ��ɽ��ˮ

--MisDescBegin

-- �ű���
x228904_g_ScriptId = 228904

-- Ŀ�� NPC
x228904_g_Position_X = 217
x228904_g_Position_Z = 255
x228904_g_SceneID = 2
x228904_g_AccomplishNPC_Name = "����"

-- �����
x228904_g_MissionId = 949

-- ǰ������
x228904_g_PreMissionId = 948

-- �������� NPC ����
x228904_g_Name = "����"

--�������
x228904_g_MissionKind = 28

--����ȼ�
x228904_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x228904_g_IfMissionElite = 0

--������
x228904_g_MissionName = "��ɽ��ˮ"
x228904_g_MissionInfo = "#{TIANSHAN_SKILL_06}"
x228904_g_MissionTarget = "    ��5����ҽ������������̨#W��#R����#W#{_INFOAIM217,255,2,����}��"
x228904_g_MissionContinue = "#{TIANSHAN_SKILL_07}"
x228904_g_MissionComplete = "#{TIANSHAN_SKILL_08}"

x228904_g_MoneyCost = 50000

x228904_g_MoneyBonus = 1000
x228904_g_exp = 2000

x228904_g_IsMissionOkFail = 0					-- �Ƿ��������ı��λ
x228904_g_IsFindTarget = 1						-- �Ƿ��ҵ����ر��λ

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x228904_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228904_g_Name then
		return 0
	end

	--��������ɹ��������
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return
	elseif IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228904_g_AccomplishNPC_Name then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsFindTarget, 1 )
			x228904_OnContinue( sceneId, selfId, targetId )
		end
	--���������������
	elseif x228904_CheckAccept( sceneId, selfId ) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x228904_g_MissionName )
			AddText( sceneId, x228904_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228904_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228904_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228904_g_ScriptId, x228904_g_MissionId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x228904_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x228904_g_PreMissionId ) <= 0 then
		return
	end

	--��������ɹ��������
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return
	--����ѽӴ�����
	elseif IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228904_g_AccomplishNPC_Name then
			AddNumText( sceneId, x228904_g_ScriptId, x228904_g_MissionName, 2, -1 )
		end
	--���������������
	elseif GetName( sceneId, targetId ) == x228904_g_Name and GetLevel( sceneId, selfId ) >= x228904_g_MissionLevel then
		AddNumText( sceneId, x228904_g_ScriptId, x228904_g_MissionName, 1, -1 )
	end
end

--**********************************
--����������
--**********************************
function x228904_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228904_g_PreMissionId ) <= 0 then
		return 0
	end

	-- 1���������ǲ����Ѿ�����
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return 0
	end

	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x228904_g_MissionLevel then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x228904_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228904_g_Name then
		return 0
	end

	if x228904_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	--������������б�
	local ret = AddMission( sceneId, selfId, x228904_g_MissionId, x228904_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		x228904_NotifyFailBox( sceneId, selfId, targetId, "    #Y���������־�Ѿ�����" )
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail, 0 )	-- ��ʼ��������ɱ��
	SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsFindTarget, 0 )		-- ��ʼ�����

	--��ʾ���ݸ�������Ѿ�����������
	x228904_NotifyFailTips( sceneId, selfId, "�����������" .. x228904_g_MissionName )
	Msg2Player( sceneId, selfId, "#Y��������" .. x228904_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x228904_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x228904_g_MissionId )
end

--**********************************
--����
--**********************************
function x228904_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent( sceneId )
		AddText( sceneId, x228904_g_MissionName )
		AddText( sceneId, x228904_g_MissionContinue )
		AddMoneyBonus( sceneId, x228904_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo( sceneId, selfId, targetId, x228904_g_ScriptId, x228904_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x228904_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228904_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )				-- �õ���������к�
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x228904_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228904_g_AccomplishNPC_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x228904_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	if GetMoney( sceneId, selfId ) < x228904_g_MoneyCost then
		x228904_NotifyFailBox( sceneId, selfId, targetId, "    ��Я����Ǯ���㣬�޷��������" )
		return
	end

	--��Ǯ
	CostMoney( sceneId, selfId, x228904_g_MoneyCost )

	--���������
	AddMoney( sceneId, selfId, x228904_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x228904_g_exp )

	DelMission( sceneId, selfId, x228904_g_MissionId )
	--���������Ѿ�����ɹ�
	MissionCom( sceneId, selfId, x228904_g_MissionId )

	-- �������ǲ�����ɽ�ɵĵ���
	if GetMenPai( sceneId, selfId ) == MP_TIANSHAN then
		-- ���������514�ż���
		AddSkill( sceneId, selfId, 514 )
		x228904_NotifyFailTips( sceneId, selfId, "��ѧ���ˡ��������������ܡ�" )
	end

	x228904_NotifyFailBox( sceneId, selfId, targetId, x228904_g_MissionComplete )
	Msg2Player( sceneId, selfId, "#Y�������" .. x228904_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--ɱ����������
--**********************************
function x228904_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x228904_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x228904_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x228904_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x228904_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

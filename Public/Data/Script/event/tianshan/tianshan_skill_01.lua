-- �����Ż�

-- �ҵ�����

--MisDescBegin

-- �ű���
x228902_g_ScriptId = 228902

-- Ŀ�� NPC
x228902_g_Position_X = 217
x228902_g_Position_Z = 255
x228902_g_SceneID = 2
x228902_g_AccomplishNPC_Name = "����"

-- �����
x228902_g_MissionId = 944

-- ǰ������
-- g_PreMissionId = -1

-- �������� NPC ����
x228902_g_Name = "����"

--�������
x228902_g_MissionKind = 28

--����ȼ�
x228902_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x228902_g_IfMissionElite = 0

--������
x228902_g_MissionName = "�����Ż�"
x228902_g_MissionInfo = "#{TIANSHAN_SKILL_01}"
x228902_g_MissionTarget = "    ��#G���������̨#W�ҵ�#R����#W#{_INFOAIM217,255,2,����}��"
x228902_g_MissionContinue = "    "
x228902_g_MissionComplete = "#{TIANSHAN_SKILL_02}"

x228902_g_MoneyBonus = 1000
x228902_g_exp = 2000

x228902_g_IsMissionOkFail = 0					-- �Ƿ��������ı��λ
x228902_g_IsFindTarget = 1						-- �Ƿ��ҵ����ر��λ
x228902_g_Custom = { { id = "���ҵ�����", num = 1 } }

--MisDescEnd

x228902_g_XinfaDemand = {
	{ id = 43, lvl = 10 },				-- ���չ� -- zchw
	{ id = 44, lvl = 10 },				-- С���๦
	{ id = 45, lvl = 10 },				-- ��Ϣ��
	{ id = 46, lvl = 10 },				-- ��ɽ��ѩ��
	{ id = 47, lvl = 10 },				-- ��ɽ��÷��
	{ id = 48, lvl = 10 },				-- ��ɽ�������ķ�
}

--**********************************
--������ں���
--**********************************
function x228902_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return
	elseif IsHaveMission( sceneId, selfId, x228902_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228902_g_AccomplishNPC_Name then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x228902_g_MissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsFindTarget, 1 )
			x228902_OnContinue( sceneId, selfId, targetId )
		end
	--���������������
	elseif x228902_CheckAccept( sceneId, selfId ) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x228902_g_MissionName )
			AddText( sceneId, x228902_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228902_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228902_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228902_g_ScriptId, x228902_g_MissionId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x228902_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return
	--����ѽӴ�����
	elseif IsHaveMission( sceneId, selfId, x228902_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228902_g_AccomplishNPC_Name then
			AddNumText( sceneId, x228902_g_ScriptId, x228902_g_MissionName, 2, -1 )
		end
	--���������������
	elseif GetName( sceneId, targetId ) == x228902_g_Name and GetLevel( sceneId, selfId ) >= x228902_g_MissionLevel then
		AddNumText( sceneId, x228902_g_ScriptId, x228902_g_MissionName, 1, -1 )
	end
end

--**********************************
--����������
--**********************************
function x228902_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if IsMissionHaveDone( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return 0
	end

	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x228902_g_MissionLevel then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228902_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x228902_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228902_g_Name then
		return 0
	end

	if x228902_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	for i, xinfa in x228902_g_XinfaDemand do										-- ����ķ������Ƿ��㹻
		if HaveXinFa( sceneId, selfId, xinfa.id ) < xinfa.lvl then
			x228902_NotifyFailBox( sceneId, selfId, targetId, "    ���#{_XINFA" .. xinfa.id
				.. "}�ķ���������������" .. xinfa.lvl .. " ����" )
			return
		end
	end

	--������������б�
	local ret = AddMission( sceneId, selfId, x228902_g_MissionId, x228902_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		x228902_NotifyFailBox( sceneId, selfId, targetId, "    #Y���������־�Ѿ�����" )
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228902_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsMissionOkFail, 0 )	-- ��ʼ��������ɱ��
	SetMissionByIndex( sceneId, selfId, misIndex, x228902_g_IsFindTarget, 0 )		-- ��ʼ�����

	--��ʾ���ݸ�������Ѿ�����������
	x228902_NotifyFailTips( sceneId, selfId, "�����������" .. x228902_g_MissionName )
	Msg2Player( sceneId, selfId, "#Y��������" .. x228902_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x228902_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x228902_g_MissionId )
end

--**********************************
--����
--**********************************
function x228902_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent( sceneId )
		AddText( sceneId, x228902_g_MissionName )
		AddText( sceneId, x228902_g_MissionComplete )
		AddMoneyBonus( sceneId, x228902_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo( sceneId, selfId, targetId, x228902_g_ScriptId, x228902_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x228902_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228902_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228902_g_MissionId )				-- �õ���������к�
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228902_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x228902_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228902_g_AccomplishNPC_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x228902_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	--���������
	AddMoney( sceneId, selfId, x228902_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x228902_g_exp )

	DelMission( sceneId, selfId, x228902_g_MissionId )
	--���������Ѿ�����ɹ�
	MissionCom( sceneId, selfId, x228902_g_MissionId )
	Msg2Player( sceneId, selfId, "#Y�������" .. x228902_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--ɱ����������
--**********************************
function x228902_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x228902_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x228902_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x228902_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x228902_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

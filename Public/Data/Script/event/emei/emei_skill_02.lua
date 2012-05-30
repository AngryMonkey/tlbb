--x212117_g_ScriptId = 212117
-- ��������

-- ��5G���飬

--MisDescBegin

--�ű���
x212117_g_ScriptId = 212117

--��������NPC����
x212117_g_Position_X=217
x212117_g_Position_Z=255
x212117_g_SceneID=2
x212117_g_AccomplishNPC_Name="����"

--�����
x212117_g_MissionId = 923

--ǰ������
x212117_g_PreMissionId = 922

--Ŀ��NPC
x212117_g_Name	="����"

--�������
x212117_g_MissionKind = 26

--����ȼ�
x212117_g_MissionLevel = 20

--�Ƿ��Ǿ�Ӣ����
x212117_g_IfMissionElite = 0

--������
x212117_g_MissionName="��������"
x212117_g_MissionInfo="#{emei_skill_mis_06}"
x212117_g_MissionTarget="  ��#G5�����#W�������������̨#W��#R����#W#{_INFOAIM217,255,2,����}��"
x212117_g_MissionContinue="  �����Ҫѧϰ������ɽ١�����"
x212117_g_MissionComplete="#{emei_skill_mis_07}"

x212117_g_MoneyBonus=2000
x212117_g_exp=1000

--x212117_g_Custom	= { {id="",num=1} }
x212117_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212117_OnDefaultEvent( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212117_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212117_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212117_g_Name then
			x212117_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x212117_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212117_g_MissionName)
			AddText(sceneId,x212117_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212117_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212117_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212117_g_ScriptId,x212117_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212117_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212117_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212117_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212117_g_Name then
			AddNumText(sceneId, x212117_g_ScriptId,x212117_g_MissionName,2,-1);
		end
	--���������������
	elseif x212117_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212117_g_ScriptId,x212117_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x212117_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212117_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x212117_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x212117_g_PreMissionId) < 1  then
		return 0
	end
	return 1
end

--**********************************
--����
--**********************************
function x212117_OnAccept( sceneId, selfId, targetId )
	if x212117_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x212117_g_MissionId, x212117_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y�������񣺾�������",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212117_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x212117_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212117_g_MissionId )
end

--**********************************
--����
--**********************************
function x212117_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x212117_g_MissionName)
		AddText(sceneId,x212117_g_MissionComplete)
		AddMoneyBonus( sceneId, x212117_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212117_g_ScriptId,x212117_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212117_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212117_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	if GetMoney(sceneId, selfId) < 50000   then
		return 2
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x212117_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x212117_CheckSubmit( sceneId, selfId, selectRadioId ) == 2 then
    BeginEvent(sceneId)
			AddText(sceneId,"������û���㹻�Ľ�Ǯ������������.")
    EndEvent( )
    DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if x212117_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- �۳����5��G
		if CostMoney(sceneId, selfId, 50000)  == 1  then
			--���������
			AddMoney(sceneId,selfId,x212117_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,x212117_g_exp)
			
			-- �������ǲ��Ƕ�ü�ɵĵ���
			--PrintNum(GetMenPai(sceneId, selfId))
			if GetMenPai(sceneId, selfId) == 4  then
				-- ���������423�ż���
				AddSkill(sceneId, selfId, 423)
		    BeginEvent(sceneId)
					AddText(sceneId,"��ѧ���ˡ�����ɽ١����ܡ�")
		    EndEvent( )
		    DispatchMissionTips(sceneId,selfId)
			end
			
			DelMission( sceneId,selfId,  x212117_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x212117_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y������񣺾�������",MSG2PLAYER_PARA )
			
			-- ���ú�������
			CallScriptFunction((200087), "OnDefaultEvent",sceneId, selfId, targetId )
		
		else
	    BeginEvent(sceneId)
				AddText(sceneId,"�۳���Ǯ����.")
	    EndEvent( )
	    DispatchMissionTips(sceneId,selfId)
			return
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x212117_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212117_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212117_OnItemChanged( sceneId, selfId, itemdataId )
	
end

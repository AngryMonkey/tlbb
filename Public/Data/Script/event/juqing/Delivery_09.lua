-- 200083 
-- �������� 

-- ����ʦ -> ����

--MisDescBegin
--�ű���
x200083_g_ScriptId = 200083

--��������NPC����
x200083_g_Position_X=128.5046
x200083_g_Position_Z=74.7418
x200083_g_SceneID=1
x200083_g_AccomplishNPC_Name="����"

--�����
x200083_g_MissionId = 9

--ǰ������
x200083_g_PreMissionId = 8

--Ŀ��NPC
x200083_g_Name	="����"

--�������
x200083_g_MissionKind = 48

--����ȼ�
x200083_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x200083_g_IfMissionElite = 0

--������
x200083_g_MissionName="����Ľ��"
x200083_g_MissionInfo="#{Mis_juqing_0009}"
x200083_g_MissionTarget="#{Mis_juqing_Tar_0009}"
x200083_g_MissionComplete="  $N�����������ˣ��ҵ���þ��ˡ�"

x200083_g_MoneyBonus=4800
x200083_g_exp=4800

x200083_g_Custom	= { {id="���ҵ�����",num=1} }
x200083_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200083_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200083_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200083_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200083_g_Name then
			x200083_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200083_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200083_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200083_g_MissionName)
				AddText(sceneId,x200083_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200083_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200083_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200083_g_ScriptId,x200083_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200083_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200083_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200083_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200083_g_Name then
			AddNumText(sceneId, x200083_g_ScriptId,x200083_g_MissionName,2,-1);
		end
	--���������������
	elseif x200083_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200083_g_Name then
			AddNumText(sceneId,x200083_g_ScriptId,x200083_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200083_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200083_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200083_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200083_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200083_OnAccept( sceneId, selfId, targetId )
	if x200083_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200083_g_MissionId, x200083_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y�������񣺹���Ľ��",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200083_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--����
--**********************************
function x200083_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200083_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200083_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200083_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200083_g_MissionName)
		AddText(sceneId,x200083_g_MissionComplete)
		AddMoneyBonus( sceneId, x200083_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200083_g_ScriptId,x200083_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200083_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200083_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200083_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200083_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x200083_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200083_g_exp)
		DelMission( sceneId,selfId,  x200083_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200083_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������񣺹���Ľ��",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200084), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200083_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200083_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200083_OnItemChanged( sceneId, selfId, itemdataId )
end

-- 200081 
-- �������� 

-- ������ -> ����

--MisDescBegin

--�ű���
x200081_g_ScriptId = 200081

--�����
x200081_g_MissionId = 2

--ǰ������
x200081_g_PreMissionId = 1

--Ŀ��NPC
x200081_g_Name	="����"

--��������NPC����
x200081_g_Position_X=74
x200081_g_Position_Z=50
x200081_g_SceneID=2
x200081_g_AccomplishNPC_Name="������"

--�������
x200081_g_MissionKind = 51

--����ȼ�
x200081_g_MissionLevel = 20

--�Ƿ��Ǿ�Ӣ����
x200081_g_IfMissionElite = 0

--������
x200081_g_MissionName="���������շ���"
x200081_g_MissionInfo="#{Mis_juqing_0002}"
x200081_g_MissionTarget="#{Mis_juqing_Tar_0002}"
x200081_g_MissionComplete="    �����㲻����$N���������Ҷ���������"

x200081_g_MoneyBonus=10
x200081_g_exp=6900

x200081_g_Custom	= { {id="���ҵ�����",num=1} }
x200081_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200081_OnDefaultEvent( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200081_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200081_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200081_g_Name then
			x200081_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200081_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200081_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200081_g_MissionName)
				AddText(sceneId,x200081_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200081_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200081_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200081_g_ScriptId,x200081_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200081_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200081_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200081_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200081_g_Name then
			AddNumText(sceneId, x200081_g_ScriptId,x200081_g_MissionName,2,-1);
		end
	--���������������
	elseif x200081_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200081_g_Name then
			AddNumText(sceneId,x200081_g_ScriptId,x200081_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200081_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200081_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200081_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200081_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200081_OnAccept( sceneId, selfId, targetId )
	if x200081_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200081_g_MissionId, x200081_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y�����������������շ���",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200081_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--����
--**********************************
function x200081_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200081_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200081_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200081_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200081_g_MissionName)
		AddText(sceneId,x200081_g_MissionComplete)
		AddMoneyBonus( sceneId, x200081_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200081_g_ScriptId,x200081_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200081_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200081_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200081_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200081_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x200081_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200081_g_exp)
		DelMission( sceneId,selfId,  x200081_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200081_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y����������������շ���",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200003), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200081_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200081_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200081_OnItemChanged( sceneId, selfId, itemdataId )
end

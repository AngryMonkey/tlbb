-- 200085
-- �������� 

-- Ľ�ݸ� -> ������

--MisDescBegin
--�ű���
x200085_g_ScriptId = 200085

--�����
x200085_g_MissionId = 13

--ǰ������
x200085_g_PreMissionId = 12

--Ŀ��NPC
x200085_g_Name	="������"

--�������
x200085_g_MissionKind = 48

--����ȼ�
x200085_g_MissionLevel = 30

--�Ƿ��Ǿ�Ӣ����
x200085_g_IfMissionElite = 0

--��������NPC����
x200085_g_Position_X=81
x200085_g_Position_Z=266
x200085_g_SceneID=1
x200085_g_AccomplishNPC_Name="�Ϲ�"

--������
x200085_g_MissionName="һƷ��"
x200085_g_MissionInfo="#{Mis_juqing_0013}"
x200085_g_MissionTarget="#{Mis_juqing_Tar_0013}"
x200085_g_MissionComplete="  $N�����������������ˣ�"

x200085_g_MoneyBonus=8100
x200085_g_exp=8000

x200085_g_Custom	= { {id="���ҵ�������",num=1} }
x200085_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200085_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200085_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200085_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200085_g_Name then
			x200085_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200085_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200085_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200085_g_MissionName)
				AddText(sceneId,x200085_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200085_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200085_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200085_g_ScriptId,x200085_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200085_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200085_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200085_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200085_g_Name then
			AddNumText(sceneId, x200085_g_ScriptId,x200085_g_MissionName,2,-1);
		end
	--���������������
	elseif x200085_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200085_g_Name then
			AddNumText(sceneId,x200085_g_ScriptId,x200085_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200085_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200085_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200085_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200085_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200085_OnAccept( sceneId, selfId, targetId )
	if x200085_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200085_g_MissionId, x200085_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y��������һƷ��",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200085_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x200085_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200085_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200085_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200085_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200085_g_MissionName)
		AddText(sceneId,x200085_g_MissionComplete)
		AddMoneyBonus( sceneId, x200085_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200085_g_ScriptId,x200085_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200085_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200085_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200085_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200085_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId,x200085_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200085_g_exp)
		
		DelMission( sceneId,selfId,  x200085_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200085_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y�������һƷ��",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200015), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200085_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200085_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200085_OnItemChanged( sceneId, selfId, itemdataId )
end

-- 200094 
-- �������� 

--MisDescBegin

--�ű���
x200094_g_ScriptId = 200094

--��������NPC����
x200094_g_Position_X=125.5508
x200094_g_Position_Z=144.8913
x200094_g_SceneID=14
x200094_g_AccomplishNPC_Name="���Ǻ�"

--�����
x200094_g_MissionId = 33

--ǰ������
x200094_g_PreMissionId = 32

--Ŀ��NPC
x200094_g_Name	="���Ǻ�"

--�������
x200094_g_MissionKind = 53

--����ȼ�
x200094_g_MissionLevel = 60

--�Ƿ��Ǿ�Ӣ����
x200094_g_IfMissionElite = 0

--������
x200094_g_MissionName="�������"
x200094_g_MissionInfo="#{Mis_juqing_0033}"
x200094_g_MissionTarget="#{Mis_juqing_Tar_0033}"
x200094_g_MissionComplete="  ����$N����֮��������һ���������Ǳ�Ƿ�������������ǰ�˰���"

x200094_g_MoneyBonus=18000
x200094_g_exp=37500

x200094_g_Custom	= { {id="���ҵ����Ǻ�",num=1} }
x200094_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200094_OnDefaultEvent( sceneId, selfId, targetId )
	
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200094_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200094_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200094_g_Name then
			x200094_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200094_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200094_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200094_g_MissionName)
				AddText(sceneId,x200094_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200094_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200094_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200094_g_ScriptId,x200094_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200094_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200094_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200094_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200094_g_Name then
			AddNumText(sceneId, x200094_g_ScriptId,x200094_g_MissionName,2,-1);
		end
	--���������������
	elseif x200094_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200094_g_Name then
			AddNumText(sceneId,x200094_g_ScriptId,x200094_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200094_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200094_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200094_g_MissionLevel then
		return 0
	end
	
	-- ǰ�������������
	if IsMissionHaveDone(sceneId,selfId,x200094_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--����
--**********************************
function x200094_OnAccept( sceneId, selfId, targetId )
	if x200094_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200094_g_MissionId, x200094_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200094_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x200094_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200094_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200094_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200094_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200094_g_MissionName)
		AddText(sceneId,x200094_g_MissionComplete)
		AddMoneyBonus( sceneId, x200094_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200094_g_ScriptId,x200094_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200094_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200094_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200094_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200094_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId,x200094_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200094_g_exp)
		DelMission( sceneId,selfId,  x200094_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x200094_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y��������������",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200041), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200094_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200094_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200094_OnItemChanged( sceneId, selfId, itemdataId )
end

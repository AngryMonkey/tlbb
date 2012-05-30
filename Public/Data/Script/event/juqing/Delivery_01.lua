-- 200080 
-- �������� 

-- ����ʦ -> ������

--MisDescBegin
--�ű���
x200080_g_ScriptId = 200080

--��������NPC����
x200080_g_Position_X=62.9422
x200080_g_Position_Z=35.9417
x200080_g_SceneID=2
x200080_g_AccomplishNPC_Name="������"

--�����
x200080_g_MissionId = 1

--ǰ������
x200080_g_PreMissionId = 3

--Ŀ��NPC
x200080_g_Name	="������"

--�������
x200080_g_MissionKind = 51

--����ȼ�
x200080_g_MissionLevel = 20

--�Ƿ��Ǿ�Ӣ����
x200080_g_IfMissionElite = 0

--������
x200080_g_MissionName="˭���ӵ�˭��Ժ"
x200080_g_MissionInfo="#{Mis_juqing_0001}"
x200080_g_MissionTarget="#{Mis_juqing_Tar_0001}"
x200080_g_MissionComplete="  $N�����������ˣ��ҵ���þ��ˡ�"

x200080_g_MoneyBonus=10
x200080_g_exp=2800

x200080_g_Custom	= { {id="���ҵ�������",num=1} }
x200080_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x200080_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x200080_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200080_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200080_g_Name then
			x200080_OnContinue( sceneId, selfId, targetId )
		end
	
	--���������������
	elseif x200080_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200080_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200080_g_MissionName)
				AddText(sceneId,x200080_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200080_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200080_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200080_g_ScriptId,x200080_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x200080_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x200080_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x200080_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200080_g_Name then
			AddNumText(sceneId, x200080_g_ScriptId,x200080_g_MissionName,2,-1);
		end
	--���������������
	elseif x200080_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200080_g_Name then
			AddNumText(sceneId,x200080_g_ScriptId,x200080_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x200080_CheckAccept( sceneId, selfId )
	
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200080_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel( sceneId, selfId ) < x200080_g_MissionLevel then
		return 0
	end
	
	return 1	
end

--**********************************
--����
--**********************************
function x200080_OnAccept( sceneId, selfId, targetId )
	if x200080_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--������������б�
	local ret = AddMission( sceneId,selfId, x200080_g_MissionId, x200080_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y��������˭���ӵ�˭��Ժ",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200080_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--����
--**********************************
function x200080_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200080_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200080_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200080_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x200080_g_MissionName)
	AddText(sceneId,x200080_g_MissionComplete)
	AddMoneyBonus( sceneId, x200080_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200080_g_ScriptId,x200080_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200080_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200080_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200080_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200080_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x200080_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200080_g_exp)
		
		--���������Ѿ�����ɹ�
		DelMission( sceneId,selfId,  x200080_g_MissionId )
		MissionCom( sceneId,selfId,  x200080_g_MissionId )

		Msg2Player(  sceneId, selfId,"#Y�������˭���ӵ�˭��Ժ",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200081), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200080_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x200080_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200080_OnItemChanged( sceneId, selfId, itemdataId )
end

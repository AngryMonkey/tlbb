--��������
--����ʦѰ��Ǯ��
--MisDescBegin
--�ű���
x210205_g_ScriptId = 210205

--��������NPC����
x210205_g_Position_X=147.4986
x210205_g_Position_Z=146.2925
x210205_g_SceneID=2
x210205_g_AccomplishNPC_Name="Ǯ��"

--�����
x210205_g_MissionId = 445

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x210205_g_Name	="Ǯ��"

--�������
x210205_g_MissionKind = 13

--����ȼ�
x210205_g_MissionLevel = 2

--�Ƿ��Ǿ�Ӣ����
x210205_g_IfMissionElite = 0

--������
x210205_g_MissionName="��ʶ������"
x210205_g_MissionInfo="#{event_dali_0008}"
x210205_g_MissionTarget="��#G������廪̳#W�ҵ��Ĵ�����֮һ��#RǮ��#W#{_INFOAIM145,139,2,Ǯ��}��#b#G�����������ѡ���»��ߵ����꣬�������ҵ���NPC��#l"
x210205_g_MissionComplete="#{event_dali_0009}"
x210205_g_MoneyBonus=1
x210205_g_SignPost = {x = 145, z = 138, tip = "Ǯ��"}

x210205_g_Custom	= { {id="���ҵ�Ǯ��",num=1} }
x210205_g_IsMissionOkFail = 1		--�����ĵ�0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210205_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210205_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210205_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210205_g_Name then
			x210205_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210205_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210205_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210205_g_MissionName)
				AddText(sceneId,x210205_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210205_g_MissionTarget)
				AddMoneyBonus( sceneId, x210205_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210205_g_ScriptId,x210205_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210205_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210205_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210205_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210205_g_Name then
			AddNumText(sceneId, x210205_g_ScriptId,x210205_g_MissionName,2,-1);
		end
    --���������������
    elseif x210205_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210205_g_Name then
			AddNumText(sceneId,x210205_g_ScriptId,x210205_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210205_CheckAccept( sceneId, selfId )
	--��Ҫ2�����ܽ�
	if GetLevel( sceneId, selfId ) >= 2 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210205_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210205_g_MissionId, x210205_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y����������ʶ������",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210205_g_SignPost.x, x210205_g_SignPost.z, x210205_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210205_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x210205_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210205_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210205_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210205_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210205_g_MissionName)
		AddText(sceneId,x210205_g_MissionComplete)
		AddMoneyBonus( sceneId, x210205_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210205_g_ScriptId,x210205_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210205_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210205_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210205_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210205_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId,x210205_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,100)
		DelMission( sceneId,selfId,  x210205_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210205_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y���������ʶ������",MSG2PLAYER_PARA )
		CallScriptFunction( 210207, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210205_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210205_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210205_OnItemChanged( sceneId, selfId, itemdataId )
end

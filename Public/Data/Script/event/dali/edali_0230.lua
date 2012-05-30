--��������
--����ʦѰ�һ�üɮ
--MisDescBegin
--�ű���
x210230_g_ScriptId = 210230

--��������NPC����
x210230_g_Position_X=275.2234
x210230_g_Position_Z=49.2906
x210230_g_SceneID=2
x210230_g_AccomplishNPC_Name="��üɮ"

--�����
x210230_g_MissionId = 710

--��һ�������ID
--g_MissionIdPre =

--Ŀ��NPC
x210230_g_Name	="��üɮ"

--�������
x210230_g_MissionKind = 13

--����ȼ�
x210230_g_MissionLevel = 9

--�Ƿ��Ǿ�Ӣ����
x210230_g_IfMissionElite = 0

--������
x210230_g_MissionName="��ľ������"
x210230_g_MissionInfo="#{event_dali_0043}"
x210230_g_MissionTarget="ȥ#G����Ƕ����ǵ��黨��#W�ҵ�#R��üɮ#W#{_INFOAIM275,49,2,��üɮ}��#b#G�����������ѡ���»��ߵ����꣬�������ҵ���NPC��#l"
x210230_g_MissionComplete="  ʩ���������ּ����ˡ���ʩ��׼���������õ�װ����ҩƷ������#GСľ����#W��"
x210230_g_MoneyBonus=72
x210230_g_SignPost = {x = 275, z = 50, tip = "��üɮ"}

x210230_g_Custom	= { {id="���ҵ���üɮ",num=1} }
x210230_g_IsMissionOkFail = 1		--�����ĵ�0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210230_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x210230_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210230_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210230_g_Name then
			x210230_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x210230_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210230_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210230_g_MissionName)
				AddText(sceneId,x210230_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210230_g_MissionTarget)
				AddMoneyBonus( sceneId, x210230_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210230_g_ScriptId,x210230_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210230_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210230_g_MissionId) > 0 then
    	return
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210230_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210230_g_Name then
			AddNumText(sceneId, x210230_g_ScriptId,x210230_g_MissionName,2,-1);
		end
    --���������������
    elseif x210230_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210230_g_Name then
			AddNumText(sceneId,x210230_g_ScriptId,x210230_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x210230_CheckAccept( sceneId, selfId )
	--��Ҫ9�����ܽ�
	if GetLevel( sceneId, selfId ) >= 9 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210230_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210230_g_MissionId, x210230_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������񣺴�Сľ������",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210230_g_SignPost.x, x210230_g_SignPost.z, x210230_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210230_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x210230_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x210230_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210230_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210230_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210230_g_MissionName)
		AddText(sceneId,x210230_g_MissionComplete)
		AddMoneyBonus( sceneId, x210230_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210230_g_ScriptId,x210230_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210230_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210230_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210230_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210230_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId,x210230_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,300)
		DelMission( sceneId,selfId,  x210230_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210230_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺴�Сľ������",MSG2PLAYER_PARA )
		CallScriptFunction( 210231, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210230_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210230_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210230_OnItemChanged( sceneId, selfId, itemdataId )
end

--��������
--����Ѱ�һ۷�
--MisDescBegin
--�ű���
x220900_g_ScriptId = 220900

--�����
x220900_g_MissionId = 1064

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x220900_g_Name	="�۷�"

--�������
x220900_g_MissionKind = 20

--����ȼ�
x220900_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x220900_g_IfMissionElite = 0

--������
x220900_g_MissionName="Ϊʦ�Ŷ�ս"
x220900_g_MissionInfo="#{event_shaolin_0001}"
x220900_g_MissionTarget="    ���������ҵ��۷�#{_INFOAIM96,82,9,�۷�}��"
x220900_g_MissionComplete="  ����������ͬ�Űɣ�������̫���ˣ��������кܶ�������Ҫ���æ�ء�"
x220900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x220900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x220900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x220900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x220900_g_Name then
			x220900_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x220900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x220900_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x220900_g_MissionName)
				AddText(sceneId,x220900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x220900_g_MissionTarget)
				AddMoneyBonus( sceneId, x220900_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x220900_g_ScriptId,x220900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x220900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x220900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x220900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x220900_g_Name then
			AddNumText(sceneId, x220900_g_ScriptId,x220900_g_MissionName,2,-1);
		end
	--���������������
	elseif x220900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x220900_g_Name then
			AddNumText(sceneId,x220900_g_ScriptId,x220900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x220900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 0 then
		return 0
	else
		return 1
	end
end

--**********************************
--����
--**********************************
function x220900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x220900_g_MissionId, x220900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x220900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x220900_g_MissionId )
end

--**********************************
--����
--**********************************
function x220900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x220900_g_MissionName)
		AddText(sceneId,x220900_g_MissionComplete)
		AddMoneyBonus( sceneId, x220900_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x220900_g_ScriptId,x220900_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x220900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x220900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x220900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x220900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x220900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x220900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x220900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y�������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x220900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x220900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x220900_OnItemChanged( sceneId, selfId, itemdataId )
end

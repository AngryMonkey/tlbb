--��������
--��ʮ����Ѱ������
--MisDescBegin
--�ű���
x226900_g_ScriptId = 226900

--�����
x226900_g_MissionId = 1094

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x226900_g_Name	="����"

--�������
x226900_g_MissionKind = 26

--����ȼ�
x226900_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x226900_g_IfMissionElite = 0

--������
x226900_g_MissionName="Ϊʦ�Ŷ�ս"
x226900_g_MissionInfo="#{event_emei_0001}"
x226900_g_MissionTarget="    �ڶ���ɽ�ҵ�����#{_INFOAIM95,86,15,����}��"
x226900_g_MissionComplete="  ����������ͬ�Űɣ�������̫���ˣ��������кܶ�������Ҫ���æ�ء�"
x226900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x226900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x226900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x226900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x226900_g_Name then
			x226900_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x226900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x226900_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x226900_g_MissionName)
				AddText(sceneId,x226900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x226900_g_MissionTarget)
				--( sceneId, x226900_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x226900_g_ScriptId,x226900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x226900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x226900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x226900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x226900_g_Name then
			AddNumText(sceneId, x226900_g_ScriptId,x226900_g_MissionName,2,-1);
		end
	--���������������
	elseif x226900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x226900_g_Name then
			AddNumText(sceneId,x226900_g_ScriptId,x226900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x226900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 4 then
		return 0
	else
		return 1
	end
end

--**********************************
--����
--**********************************
function x226900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x226900_g_MissionId, x226900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x226900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x226900_g_MissionId )
end

--**********************************
--����
--**********************************
function x226900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x226900_g_MissionName)
		AddText(sceneId,x226900_g_MissionComplete)
		--( sceneId, x226900_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x226900_g_ScriptId,x226900_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x226900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x226900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x226900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x226900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x226900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x226900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x226900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y�������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x226900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x226900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x226900_OnItemChanged( sceneId, selfId, itemdataId )
end

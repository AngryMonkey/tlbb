--��������
--��ʦ��Ѱ������
--MisDescBegin
--�ű���
x222900_g_ScriptId = 222900

--�����
x222900_g_MissionId = 1074

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x222900_g_Name	="����"

--�������
x222900_g_MissionKind = 22

--����ȼ�
x222900_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x222900_g_IfMissionElite = 0

--������
x222900_g_MissionName="Ϊʦ�Ŷ�ս"
x222900_g_MissionInfo="#{event_mingjiao_0001}"
x222900_g_MissionTarget="    �ڹ������ҵ�����#{_INFOAIM98,105,11,����}��"
x222900_g_MissionComplete="  ����������ͬ�Űɣ�������̫���ˣ��������кܶ�������Ҫ���æ�ء�"
x222900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x222900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x222900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x222900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x222900_g_Name then
			x222900_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x222900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x222900_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x222900_g_MissionName)
				AddText(sceneId,x222900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x222900_g_MissionTarget)
				
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x222900_g_ScriptId,x222900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x222900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x222900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x222900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x222900_g_Name then
			AddNumText(sceneId, x222900_g_ScriptId,x222900_g_MissionName,2,-1);
		end
	--���������������
	elseif x222900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x222900_g_Name then
			AddNumText(sceneId,x222900_g_ScriptId,x222900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x222900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--����
--**********************************
function x222900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x222900_g_MissionId, x222900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x222900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x222900_g_MissionId )
end

--**********************************
--����
--**********************************
function x222900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x222900_g_MissionName)
		AddText(sceneId,x222900_g_MissionComplete)
		
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x222900_g_ScriptId,x222900_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x222900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x222900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x222900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x222900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x222900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x222900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x222900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y�������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x222900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x222900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x222900_OnItemChanged( sceneId, selfId, itemdataId )
end

--��������
--÷��Ѱ�ҷ�����
--MisDescBegin
--�ű���
x228900_g_ScriptId = 228900

--�����
x228900_g_MissionId = 1104

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x228900_g_Name	="������"

--�������
x228900_g_MissionKind = 28

--����ȼ�
x228900_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x228900_g_IfMissionElite = 0

--������
x228900_g_MissionName="Ϊʦ�Ŷ�ս"
x228900_g_MissionInfo="#{event_tianshan_0001}"
x228900_g_MissionTarget="    �����չ��ҵ�������#{_INFOAIM95,60,17,������}"
x228900_g_MissionComplete="  ����������ͬ�Űɣ�������̫���ˣ��������кܶ�������Ҫ���æ�ء�"
x228900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x228900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x228900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x228900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x228900_g_Name then
			x228900_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x228900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x228900_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x228900_g_MissionName)
				AddText(sceneId,x228900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x228900_g_MissionTarget)
				AddMoneyBonus( sceneId, x228900_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x228900_g_ScriptId,x228900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x228900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x228900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x228900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x228900_g_Name then
			AddNumText(sceneId, x228900_g_ScriptId,x228900_g_MissionName,2,-1);
		end
	--���������������
	elseif x228900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x228900_g_Name then
			AddNumText(sceneId,x228900_g_ScriptId,x228900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x228900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 7 then
		return 0
	else
		return 1
	end
end

--**********************************
--����
--**********************************
function x228900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x228900_g_MissionId, x228900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x228900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x228900_g_MissionId )
end

--**********************************
--����
--**********************************
function x228900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x228900_g_MissionName)
		AddText(sceneId,x228900_g_MissionComplete)
		AddMoneyBonus( sceneId, x228900_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x228900_g_ScriptId,x228900_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x228900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x228900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x228900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x228900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x228900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x228900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y�������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x228900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x228900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x228900_OnItemChanged( sceneId, selfId, itemdataId )
end

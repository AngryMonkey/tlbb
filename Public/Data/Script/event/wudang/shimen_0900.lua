--��������
--������Ѱ��������
--MisDescBegin
--�ű���
x223900_g_ScriptId = 223900

--�����
x223900_g_MissionId = 1079

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x223900_g_Name	="������"

--�������
x223900_g_MissionKind = 23

--����ȼ�
x223900_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x223900_g_IfMissionElite = 0

--������
x223900_g_MissionName="Ϊʦ�Ŷ�ս"
x223900_g_MissionInfo="#{event_wudang_0001}"
x223900_g_MissionTarget="    ���䵱ɽ�ҵ�������#{_INFOAIM78,95,12,������}��"
x223900_g_MissionComplete="  ����������ͬ�Űɣ�������̫���ˣ��������кܶ�������Ҫ���æ�ء�"
x223900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x223900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x223900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x223900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x223900_g_Name then
			x223900_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x223900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x223900_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x223900_g_MissionName)
				AddText(sceneId,x223900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x223900_g_MissionTarget)
				
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x223900_g_ScriptId,x223900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x223900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x223900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x223900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x223900_g_Name then
			AddNumText(sceneId, x223900_g_ScriptId,x223900_g_MissionName,2,-1);
		end
	--���������������
	elseif x223900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x223900_g_Name then
			AddNumText(sceneId,x223900_g_ScriptId,x223900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x223900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 3 then
		return 0
	else
		return 1
	end
end

--**********************************
--����
--**********************************
function x223900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x223900_g_MissionId, x223900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x223900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x223900_g_MissionId )
end

--**********************************
--����
--**********************************
function x223900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x223900_g_MissionName)
		AddText(sceneId,x223900_g_MissionComplete)
		
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x223900_g_ScriptId,x223900_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x223900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x223900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x223900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x223900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x223900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x223900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x223900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y�������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x223900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x223900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x223900_OnItemChanged( sceneId, selfId, itemdataId )
end

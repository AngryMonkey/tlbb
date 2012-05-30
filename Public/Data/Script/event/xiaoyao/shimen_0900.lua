--��������
--���Ǻ�Ѱ���ع�
--MisDescBegin
--�ű���
x225900_g_ScriptId = 225900

--�����
x225900_g_MissionId = 1089

--��һ�������ID
--g_MissionIdPre = 

--Ŀ��NPC
x225900_g_Name	="�ع�"

--�������
x225900_g_MissionKind = 25

--����ȼ�
x225900_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x225900_g_IfMissionElite = 0

--������
x225900_g_MissionName="Ϊʦ�Ŷ�ս"
x225900_g_MissionInfo="#{event_xiaoyao_0001}"
x225900_g_MissionTarget="    �ڜR�����ҵ��ع�#{_INFOAIM119,152,14,�ع�}��"
x225900_g_MissionComplete="  ����������ͬ�Űɣ�������̫���ˣ��������кܶ�������Ҫ���æ�ء�"
x225900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x225900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
    if (IsMissionHaveDone(sceneId,selfId,x225900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x225900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x225900_g_Name then
			x225900_OnContinue( sceneId, selfId, targetId )
		end
    --���������������
    elseif x225900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x225900_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x225900_g_MissionName)
				AddText(sceneId,x225900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x225900_g_MissionTarget)
				--( sceneId, x225900_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x225900_g_ScriptId,x225900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x225900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x225900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x225900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x225900_g_Name then
			AddNumText(sceneId, x225900_g_ScriptId,x225900_g_MissionName,2,-1);
		end
	--���������������
	elseif x225900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x225900_g_Name then
			AddNumText(sceneId,x225900_g_ScriptId,x225900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--����������
--**********************************
function x225900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 8 then
		return 0
	else
		return 1
	end
end

--**********************************
--����
--**********************************
function x225900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x225900_g_MissionId, x225900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y��������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x225900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x225900_g_MissionId )
end

--**********************************
--����
--**********************************
function x225900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x225900_g_MissionName)
		AddText(sceneId,x225900_g_MissionComplete)
		--( sceneId, x225900_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x225900_g_ScriptId,x225900_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x225900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x225900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x225900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x225900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x225900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x225900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x225900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y�������Ϊʦ�Ŷ�ս",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x225900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x225900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x225900_OnItemChanged( sceneId, selfId, itemdataId )
end

--ҹ���� ������ҹ���� �������
--050019

--MisDescBegin
--�ű���
x050019_g_ScriptId = 050019

--�����
x050019_g_MissionId = 132

--Ŀ��NPC
x050019_g_Name	="�R��"

--�������
x050019_g_MissionKind = 3

--����ȼ�
x050019_g_MissionLevel = 10

--�Ƿ��Ǿ�Ӣ����
x050019_g_IfMissionElite = 0

--������
x050019_g_MissionName="#{ZQSY_2007912_001}"
x050019_g_MissionInfo="#{ZQSY_2007912_002}"
x050019_g_MissionTarget="#{ZQSY_2007912_003}"
x050019_g_MissionContinue="#{ZQSY_2007912_004}"
x050019_g_MissionComplete="#{ZQSY_2007912_005}"

x050019_g_Custom	= { {id="��ȼ�Ź������",num=1} }
x050019_g_IsMissionOkFail = 0
--MisDescEnd

x050019_g_MissionId_mutex = 131;

--�ʱ��
x050019_g_StartDayTime = 8257   --���ʼʱ�� 2008-9-14,��������
x050019_g_EndDayTime = 8282   --�����ʱ�� 2008-10-09,��������

--**********************************
--������ں���
--**********************************
function x050019_OnDefaultEvent( sceneId, selfId, targetId )
	if IsHaveMission(sceneId, selfId, x050019_g_MissionId) > 0 then
		local bDone = x050019_CheckSubmit( sceneId, selfId )
		BeginEvent(sceneId)
			AddText(sceneId,x050019_g_MissionName)
			AddText(sceneId,x050019_g_MissionContinue)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x050019_g_ScriptId,x050019_g_MissionId,bDone)		
	elseif x050019_CheckAccept(sceneId,selfId) > 0 then
	
		if x050019_AcceptCountCheck(sceneId, selfId) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,x050019_g_MissionName)
				AddText(sceneId,x050019_g_MissionInfo)
				AddText(sceneId,x050019_g_MissionTarget)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x050019_g_ScriptId,x050019_g_MissionId)
		else
			x050019_NotifyBox(sceneId, selfId, targetId, "#{ZQSY_2007912_006}");
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x050019_OnEnumerate( sceneId, selfId, targetId )
	if IsHaveMission(sceneId, selfId, x050019_g_MissionId) > 0 then
		AddNumText(sceneId, x050019_g_ScriptId, x050019_g_MissionName, 4, -1);
	elseif x050019_CheckAccept(sceneId, selfId) == 1 then
		AddNumText(sceneId, x050019_g_ScriptId, x050019_g_MissionName, 3, -1);
	end
end

--**********************************
--����������
--**********************************
function x050019_CheckAccept( sceneId, selfId )
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x050019_g_MissionLevel then
		return 0;
	end
	
	--�Ѿ�����
	if IsHaveMission(sceneId, selfId, x050019_g_MissionId) > 0
	 or IsHaveMission(sceneId, selfId, x050019_g_MissionId_mutex) > 0 then
		return 0;
	end
	
	local timeCheck = x050019_TimeCheck(sceneId, selfId);
	if not timeCheck or timeCheck ~= 1 then
		return 0;
	end
	return 1
end

--**********************************
--����
--**********************************
function x050019_OnAccept( sceneId, selfId, targetId )
	if x050019_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	if x050019_AcceptCountCheck(sceneId, selfId) ~= 1 then
		return 0
	end

	local ret = AddMission( sceneId,selfId, x050019_g_MissionId, x050019_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(sceneId, selfId, "#Y���������־�Ѿ�����", MSG2PLAYER_PARA);
		return
	end

	Msg2Player(sceneId, selfId, "#Y��������"..x050019_g_MissionName.."��", MSG2PLAYER_PARA);

	-- �������
	local misIndex = GetMissionIndexByID(sceneId, selfId, x050019_g_MissionId);
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
end

function x050019_OnSceneTimer(sceneId, selfId)
end

--**********************************
--����
--**********************************
function x050019_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission(sceneId, selfId, x050019_g_MissionId);
end

--**********************************
--����
--**********************************
function x050019_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x050019_g_MissionName)
	AddText(sceneId,x050019_g_MissionComplete)
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x050019_g_ScriptId,x050019_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050019_CheckSubmit( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x050019_g_MissionId) <= 0 then
		return 0;
	end

	local misIndex = GetMissionIndexByID(sceneId, selfId, x050019_g_MissionId);
	if not misIndex or misIndex < 0 then
		return 0;
	end
	
	local misParam0 = GetMissionParam(sceneId, selfId, misIndex, 0);
	if not misParam0 or misParam0 ~= 1 then
		return 0;
	end
	
	return 1;
end

--**********************************
--�ύ
--**********************************
function x050019_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x050019_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		local level = GetLevel(sceneId, selfId);
		local k = 80;
		local b = -326;
		local c = 2;
		local exp = (k*level+b)*c;
		if exp > 0 then
			LuaFnAddExp( sceneId, selfId, exp)
		end
		DelMission( sceneId, selfId, x050019_g_MissionId )
		MissionCom( sceneId, selfId, x050019_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y�������"..x050019_g_MissionName.."��",MSG2PLAYER_PARA )
	
		--���½�����˼�������
		local misData = GetMissionData(sceneId, selfId, MD_SHANG_YUE_FANG_YIAN_HUA);
		if misData then
			local lastDay = floor(misData / 1000);
			local dayCount = misData - lastDay * 1000;
			local thisDay = GetDayTime();
			thisDay = (thisDay * 1000);
			thisDay = floor(thisDay / 1000);
			if thisDay ~= lastDay then
				dayCount = 1;
			else
				dayCount = dayCount + 1;
			end

			misData = thisDay * 1000 + dayCount;
			SetMissionData(sceneId, selfId, MD_SHANG_YUE_FANG_YIAN_HUA, misData);
		end
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x050019_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x050019_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050019_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����ʹ��
--**********************************
function x050019_OnItemUsed( sceneId, selfId, itemdataId )
	if not itemdataId or itemdataId ~= 30505124 then
		return 0;
	end
	
	local timeCheck = x050019_TimeCheck(sceneId, selfId);
	if not timeCheck or timeCheck ~= 1 then
		return 0;
	end
	
	local xPos, zPos = LuaFnGetWorldPos(sceneId, selfId);
	if xPos and zPos and sceneId
		and xPos >= 267 and xPos <= 282
		and zPos >= 173 and zPos <= 187
		and sceneId == 121
		and IsHaveMission(sceneId, selfId, x050019_g_MissionId) > 0 then
		
		local misIndex = GetMissionIndexByID(sceneId, selfId, x050019_g_MissionId);
		if not misIndex or misIndex < 0 then
			return 0;
		end
		
		local misParam0 = GetMissionParam(sceneId, selfId, misIndex, 0);
		if misParam0 and misParam0 ~= 1 then
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			SetMissionByIndex(sceneId, selfId, misIndex, 1, 1);
			
			x050019_NotifyTips(sceneId, selfId, "���������");
		end
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050019_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x050019_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�����Ƿ��Ѿ���������
--**********************************
function x050019_AcceptCountCheck(sceneId, selfId)
	local misData = GetMissionData(sceneId, selfId, MD_SHANG_YUE_FANG_YIAN_HUA);
	if not misData then
		return 0;
	end
	
	local lastDay = floor(misData / 1000);
	local dayCount = misData - lastDay * 1000;
	local thisDay = GetDayTime();
	thisDay = (thisDay * 1000);
	thisDay = floor(thisDay / 1000);
	if thisDay == lastDay and dayCount >= 10 then
		return 0;
	end
	
	return 1;
end

--**********************************
--ʱ��ļ��
--**********************************
function x050019_TimeCheck(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end
	
	if curDay < x050019_g_StartDayTime or curDay > x050019_g_EndDayTime then
		return 0;
	end

	local nHour = GetHour();
	if (nHour >= 12 and nHour < 13) or (nHour >= 18 and nHour < 19) then
	else
		return 0;
	end
	
	return 1;
end

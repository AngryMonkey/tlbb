--����Ѳ������
--MisDescBegin
--�ű���
x250036_g_ScriptId = 250036

--�����
x250036_g_MissionId = 1020

--����Ŀ��npc
x250036_g_TargetNpcName	="ϲ����"

--�������
x250036_g_MissionKind = 3

--����ȼ�
x250036_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x250036_g_IfMissionElite = 0

--������ʱ
x250036_g_MissionLimitTime = 60 * 60 * 1000; --����

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--�����Ƕ�̬**************************************************************

--�����ı�����
x250036_g_MissionName="����Ѳ��";
x250036_g_MissionInfo="��������[177,94]��ϲ���ְ��Ż���Ѳ�Ρ�";
x250036_g_MissionTarget="����������ϲ����#{_INFOAIM177,94,0,ϲ����}���Ż���Ѳ�Ρ�";		--����Ŀ��
x250036_g_ContinueInfo1="�ܱ�Ǹ����Ԥ����ʱ���Ѿ���ȥ�ˣ���ֻ�ܷ����ˡ���";
x250036_g_ContinueInfo2="����Ҫ�߻���˵��лл��";
x250036_g_MissionComplete="�������ǿ�ʼ�ɡ�";

--������
x250036_g_MoneyBonus = 0

--MisDescEnd

x250036_g_eventId_begin = 0;	--�������Ѳ��������¼�
x250036_g_eventId_start = 1;	--�����ʼѲ�ε��¼�
x250036_g_eventId_close = 2;	--����Ȼ��ٿ�ʼ���¼�

x250036_g_busDataIds = {3, 4, 5};	--������DataID
x250036_g_busPatrolPathId = 3;		--����·��ID


--**********************************
--������ں���
--**********************************
function x250036_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	local selectEventId	= GetNumText();
	
	--�������Ѳ��������¼�
	if x250036_g_eventId_begin == selectEventId then
		x250036_OnBegin(sceneId, selfId, targetId);
	--�����ʼѲ�ε��¼�
	elseif x250036_g_eventId_start == selectEventId then
		x250036_OnStart(sceneId, selfId, targetId);
	--����Ȼ��ٿ�ʼ���¼�
	elseif x250036_g_eventId_close == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end

end

--**********************************
--�о��¼�
--**********************************
function x250036_OnEnumerate(sceneId, selfId, targetId)
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x250036_g_MissionId) > 0 then
		AddNumText(sceneId, x250036_g_ScriptId, x250036_g_MissionName, 6, x250036_g_eventId_begin);
    end
end

--**********************************
--����������
--**********************************
function x250036_CheckAccept(sceneId, selfId)
	return 1;
end

--**********************************
--����
--**********************************
function x250036_OnAccept(sceneId, selfId, marryLevel)

	--������������б�
	AddMission(sceneId, selfId, x250036_g_MissionId, x250036_g_ScriptId, 0, 0, 0);
	misIndex = GetMissionIndexByID(sceneId, selfId, x250036_g_MissionId);			--�õ���������к�
	if misIndex and misIndex >= 0 then
		StartMissionTimer(sceneId,selfId, x250036_g_MissionId);
		SetMissionByIndex(sceneId,selfId,misIndex, 0, 1);						--�������кŰ���������ĵ�0λ��0 (����������)
		SetMissionByIndex(sceneId,selfId,misIndex, 7, x250036_g_MissionLimitTime);
		SetMissionByIndex(sceneId,selfId,misIndex, 2, marryLevel);
		
		Msg2Player(sceneId, selfId,"#Y��������"..x250036_g_MissionName.."",MSG2PLAYER_PARA);	--���촰����ʾ
	end
end

--**********************************
--����
--**********************************
function x250036_OnAbandon(sceneId, selfId)
	--ɾ����������б��ж�Ӧ������
 	local checkMission = IsHaveMission(sceneId, selfId, x250036_g_MissionId);
	if checkMission and checkMission == 1 then
	  DelMission(sceneId, selfId, x250036_g_MissionId);
	 end
end

--**********************************
--����
--**********************************
function x250036_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x250036_CheckSubmit(sceneId, selfId)
	return 0;
end

--**********************************
--�ύ
--**********************************
function x250036_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--ɱ����������
--**********************************
function x250036_OnKillObject(sceneId, selfId, objdataId ,objId)
end

--**********************************
--���������¼�
--**********************************
function x250036_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--���߸ı�
--**********************************
function x250036_OnItemChanged(sceneId, selfId, itemdataId)
end

--**********************************
--��ʱ�¼�
--**********************************
function x250036_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local saveTime = GetMissionParam(sceneId, selfId, misIndex, 7);
		if saveTime and saveTime > 0 then
			saveTime = saveTime - 1000;
			if saveTime <= 0 then
				StopMissionTimer(sceneId, selfId, x250036_g_MissionId);
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 2);
				saveTime = 0;
			end
			SetMissionByIndex(sceneId, selfId, misIndex, 7, saveTime);
		end
	end
end

--**********************************
--�������Ѳ��������¼�
--**********************************
function x250036_OnBegin(sceneId, selfId, targetId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250036_MessageBox(sceneId, selfId, targetId, "��������̫�٣��Ұ��źõĽη��߹��ˣ��޷��ð컨��Ѳ���ˡ�");
			DelMission(sceneId, selfId, x250036_g_MissionId);
		else
			BeginEvent(sceneId);
				AddText(sceneId, "��ϲ���ǣ��η��Ѿ�׼�����ˣ�������������ʼѲ�ΰɡ�");
				AddNumText(sceneId, x250036_g_ScriptId, "���ھͿ�ʼѲ��", 8, x250036_g_eventId_start);
				AddNumText(sceneId, x250036_g_ScriptId, "�Ȼ��ٿ�ʼ����", 8, x250036_g_eventId_close);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end
	end
end

--**********************************
--�����ʼѲ�ε��¼�
--**********************************
function x250036_OnStart(sceneId, selfId, targetId)
	local marryLevel = 0;
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250036_MessageBox(sceneId, selfId, targetId, "��������̫�٣��Ұ��źõĽη��߹��ˣ��޷��ð컨��Ѳ���ˡ�");
			DelMission(sceneId, selfId, x250036_g_MissionId);
			return 0;
		else
			marryLevel = GetMissionParam(sceneId, selfId, misIndex, 2);
		end
	else
		x250036_MessageBox(sceneId, selfId, targetId, "δ�ҵ�����Ѳ�ε�����");
		return 0;
	end
		
	local szMsg = "����뻨��Ѳ�Σ�����Ů˫��2�����һ���������ҡ�"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "�������ֻ���ɷ���˫����ɣ������в�����������Ա��"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "ֻ��2�˶��ߵ�����߲ſ��Կ�ʼ����Ѳ�Ρ�"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "���Ƿ��޲��ܿ�ʼ����Ѳ�Ρ�"
	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	--zchw
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if LuaFnIsStalling(sceneId, memId) == 1 then
			x250036_MessageBox(sceneId, selfId, targetId, "#{CWHL_081208_1}")
			return 0;
		end
	end
	
	local busIndex = 1;
	if marryLevel and marryLevel > -1 and marryLevel < 3 then
		busIndex = marryLevel + 1;
	else
		busIndex = 1;
	end
	
	local busObjID = LuaFnCreateBusByPatrolPathId(sceneId, x250036_g_busDataIds[busIndex], x250036_g_busPatrolPathId, 0);
	if busObjID and busObjID ~= -1 then
		local succeeded, strText;
		succeeded = 0;
		local addPassergerRet = LuaFnBusAddPassengerList(sceneId, busObjID, targetId, 1, 2, maleId, femaleId);
		if addPassergerRet and addPassergerRet == OR_OK then
			local busStartRet = LuaFnBusStart(sceneId, busObjID);
			if busStartRet and busStartRet == 1 then
				BeginUICommand(sceneId);
				EndUICommand(sceneId);
				DispatchUICommand(sceneId, selfId, 1000);
				DelMission(sceneId, selfId, x250036_g_MissionId);
				CallScriptFunction(250037, "OnAccept", sceneId, selfId, marryLevel);
				succeeded = 1;
			else
				strText = "�ڲ�����(start failed)������Ѳ������ʧ�ܣ�����GM��ϵ��"
			end
		end
		
		if succeeded and succeeded == 1 then
		else
			LuaFnBusRemoveAllPassenger(sceneId, busObjID);
			LuaFnDeleteBus(sceneId, busObjID);
			if strText then
				x250036_MessageBox(sceneId, selfId, targetId, strText);
			end
		end
	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x250036_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end


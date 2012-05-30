--���������
--MisDescBegin
--�ű���
x250037_g_ScriptId = 250037

--�����
x250037_g_MissionId = 1021

--����Ŀ��npc
x250037_g_TargetNpcName	="ϲ����"

--�������
x250037_g_MissionKind = 3

--����ȼ�
x250037_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x250037_g_IfMissionElite = 0

--������ʱ
x250037_g_MissionLimitTime = 60 * 60 * 1000; --����

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--�����Ƕ�̬**************************************************************

--�����ı�����
x250037_g_MissionName="�����";
x250037_g_MissionInfo="��������[177,94]��ϲ���ְ��Ű���ء�";
x250037_g_MissionTarget="    ������ϲ����#{_INFOAIM177,94,0,ϲ����}���Ű���ء�";		--����Ŀ��
x250037_g_ContinueInfo1="��������ʵ��̫���ˣ���ʱ�ѹ�����Ҳû�취�ˡ�";
x250037_g_ContinueInfo2="����Ҫ�߻���˵��лл��";
x250037_g_MissionComplete="�������ǿ�ʼ�ɡ�";

--������
x250037_g_MoneyBonus = 0

--MisDescEnd

x250037_g_eventId_begin = 0;	--��������������¼�
x250037_g_eventId_start = 1;	--�����ʼ����ص��¼�
x250037_g_eventId_close = 2;	--����Ȼ��ٿ�ʼ���¼�


--**********************************
--������ں���
--**********************************
function x250037_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�
	local selectEventId	= GetNumText();
	
	--��������������¼�
	if x250037_g_eventId_begin == selectEventId then
		x250037_OnBegin(sceneId, selfId, targetId);
	--�����ʼ����ص��¼�
	elseif x250037_g_eventId_start == selectEventId then
		x250037_OnStart(sceneId, selfId, targetId);
	--����Ȼ��ٿ�ʼ���¼�
	elseif x250037_g_eventId_close == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end

end

--**********************************
--�о��¼�
--**********************************
function x250037_OnEnumerate(sceneId, selfId, targetId)
    --����ѽӴ�����
    if IsHaveMission(sceneId,selfId,x250037_g_MissionId) > 0 then
		AddNumText(sceneId, x250037_g_ScriptId, x250037_g_MissionName, 3, x250037_g_eventId_begin);
    end
end

--**********************************
--����������
--**********************************
function x250037_CheckAccept(sceneId, selfId)
	return 1;
end

--**********************************
--����
--**********************************
function x250037_OnAccept(sceneId, selfId, marryLevel)

	--������������б�
	AddMission(sceneId, selfId, x250037_g_MissionId, x250037_g_ScriptId, 0, 0, 0);
	misIndex = GetMissionIndexByID(sceneId, selfId, x250037_g_MissionId);			--�õ���������к�
	if misIndex and misIndex >= 0 then
		StartMissionTimer(sceneId,selfId, x250037_g_MissionId);
		SetMissionByIndex(sceneId,selfId,misIndex, 0, 1);						--�������кŰ���������ĵ�0λ��0 (����������)
		SetMissionByIndex(sceneId,selfId,misIndex, 7, x250037_g_MissionLimitTime);
		SetMissionByIndex(sceneId,selfId,misIndex, 2, marryLevel);
		
		Msg2Player(sceneId, selfId,"#Y��������"..x250037_g_MissionName.."",MSG2PLAYER_PARA);	--���촰����ʾ
	end
end

--**********************************
--����
--**********************************
function x250037_OnAbandon(sceneId, selfId)
	--ɾ����������б��ж�Ӧ������
 	local checkMission = IsHaveMission(sceneId, selfId, x250037_g_MissionId);
	if checkMission and checkMission == 1 then
		DelMission(sceneId, selfId, x250037_g_MissionId);
	end
end

--**********************************
--����
--**********************************
function x250037_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x250037_CheckSubmit(sceneId, selfId)
	return 0;
end

--**********************************
--�ύ
--**********************************
function x250037_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--ɱ����������
--**********************************
function x250037_OnKillObject(sceneId, selfId, objdataId ,objId)
end

--**********************************
--���������¼�
--**********************************
function x250037_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--���߸ı�
--**********************************
function x250037_OnItemChanged(sceneId, selfId, itemdataId)
end

--**********************************
--��ʱ�¼�
--**********************************
function x250037_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250037_g_MissionId);
	if misIndex and misIndex >= 0 then
		local saveTime = GetMissionParam(sceneId, selfId, misIndex, 7);
		if saveTime and saveTime > 0 then
			saveTime = saveTime - 1000;
			if saveTime <= 0 then
				StopMissionTimer(sceneId, selfId, x250037_g_MissionId);
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 2);
				saveTime = 0;
			end
			SetMissionByIndex(sceneId, selfId, misIndex, 7, saveTime);
		end
	end
end

--**********************************
--��������������¼�
--**********************************
function x250037_OnBegin(sceneId, selfId, targetId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250037_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250037_MessageBox(sceneId, selfId, targetId, x250037_g_ContinueInfo1);
			DelMission(sceneId, selfId, x250037_g_MissionId);
		else
			BeginEvent(sceneId);
				AddText(sceneId, "Ѳ��Ҳ�������ֵĽ����ˣ����ڸÿ�ʼ���������");
				AddNumText(sceneId, x250037_g_ScriptId, "�������ھͿ�ʼ", 8, x250037_g_eventId_start);
				AddNumText(sceneId, x250037_g_ScriptId, "���ǻ�Ҫ��һ�ᡭ��", 8, x250037_g_eventId_close);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end
	end
end

--**********************************
--�����ʼ����ص��¼�
--**********************************
function x250037_OnStart(sceneId, selfId, targetId)
	local marryLevel = 0;
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250037_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250037_MessageBox(sceneId, selfId, targetId, x250037_g_ContinueInfo1);
			DelMission(sceneId, selfId, x250037_g_MissionId);
			return 0;
		else
			marryLevel = GetMissionParam(sceneId, selfId, misIndex, 2);
		end
	else
		x250037_MessageBox(sceneId, selfId, targetId, "δ�ҵ�����ص�����");
		return 0;
	end
		
	local szMsg = "��������أ�����Ů˫��2�����һ���������ҡ�"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "�������ֻ���ɷ���˫����ɣ������в�����������Ա��"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "ֻ��2�˶��ߵ�����߲ſ��Կ�ʼ����ء�"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "���Ƿ��޲��ܿ�ʼ����ء�"
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
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end


	DelMission(sceneId, selfId, x250037_g_MissionId);

	CallScriptFunction(401030, "Create", sceneId, maleId, femaleId, marryLevel);

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x250037_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

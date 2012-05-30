-- ��ʫ�Ծ�����
--MisDescBegin
-- �ű���
x600013_g_ScriptId = 600013

--�����
x600013_g_MissionId = 1107

--����Ŀ��npc
x600013_g_Name = "ƈд"

--�������
x600013_g_MissionKind = 50

--����ȼ�
x600013_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600013_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600013_g_IsMissionOkFail = 0							-- ������ɱ��
x600013_g_MissionParam_SubId = 1						-- ������ű��Ŵ��λ��
x600013_g_MissionParam_PoemIssued = 2					-- �Ƿ��Ѿ�����ʫ��
x600013_g_MissionParam_IsFailed = 3						-- ��ȷ���������λ��
x600013_g_MissionParam_PoemIndex = 4					-- ʫ���������λ��
x600013_g_MissionParam_AnswerIndex = 5					-- ��ȷ���������λ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600013_g_MissionName = "�Ƽ�����"
x600013_g_MissionInfo = "    ��������Ҫ %s �ˣ�ȥ���������ɣ�"			--��������
x600013_g_MissionTarget = "    ��Թ�ʫ�Ծ�һ�⡣"						--����Ŀ��
x600013_g_ContinueInfo = "    �������û�����ô��"					--δ��������npc�Ի�
x600013_g_SubmitInfo = "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600013_g_MissionComplete = "    �ɵò����������á�"					--�������npc˵���Ļ�

x600013_g_StrForePart = 5
x600013_g_Offset = 140000												-- Suppose to 150000, ����ڼ�����Ʒ�е�ƫ����

x600013_g_MissionRound = 42

-- ͨ�ó�������ű�
x600013_g_CityMissionScript = 600001
x600013_g_SciTechScript = 600012

--������

--MisDescEnd

x600013_g_Answer = 3

--**********************************
--������ں���
--**********************************
function x600013_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) > 0 then
		local bDone = x600013_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600013_g_SubmitInfo
		else
			strText = x600013_g_ContinueInfo
		end

		if bDone == 0 then												--����δ���
			if GetNumText() == 0 then
				BeginEvent( sceneId )
					AddText( sceneId, x600013_g_MissionName )
					x600013_IssueQuiz( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			else
				x600013_CheckAnswer( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--�����Ѿ����
			BeginEvent( sceneId )
				AddText( sceneId, x600013_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600013_g_ScriptId, x600013_g_MissionId, bDone )
		end
	--���������������
	elseif x600013_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600013_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600013_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600013_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) > 0 then
		AddNumText( sceneId, x600013_g_ScriptId, x600013_g_MissionName, 3, 0 )
	end
end

--**********************************
--����������
--**********************************
function x600013_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600013_g_SciTechScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������ҵȼ��õ�
--**********************************
function x600013_GetMissionPoemOffset( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nPos = 1
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nPos = 2
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nPos = 3
	else													-- 85 ~ 100
		nPos = 4
	end

	return nPos
end

--**********************************
--���񷢲�
--**********************************
function x600013_IssueQuiz( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) <= 0 then	-- û������
		return
	end

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    ��˵��Ÿ߰˶�����Ҫ����һ����" )
	else
		missionInfo = format( "    ��Щ�������ǰ�˼������⣬�ܰ��ҽ����" )
	end

	AddText( sceneId, missionInfo )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600013_g_MissionId )
	local QuizTable
	local nPoemIndex

	if GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_IsFailed ) == 1
	 or GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIssued ) ~= 1 then
		local nOffset = x600013_GetMissionPoemOffset( sceneId, selfId )
		local nPosStart = x600013_g_Offset + nOffset * 10000

		-- ʹ���µĽӿڻ����Ŀ���
		nPoemIndex = GetRandomQuestionsIndex(2)

		-- ʫ���������λ��
		SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIndex, nPoemIndex )
	else
		nPoemIndex = GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIndex )
	end

	local Quiz
	local Opt = {}
	local Key = {}
	Quiz, Opt[1], Opt[2], Opt[3], Opt[4], Opt[5], Opt[6],
		  Key[1], Key[2], Key[3], Key[4], Key[5], Key[6] = GetQuestionsRecord( nPoemIndex )

	AddText( sceneId, Quiz )

	local RandomOrder = { 1, 2, 3, 4, 5, 6 }
	local newPos
	local i
	for i = 1, x600013_g_Answer do
		if Key[i] == 1 then
			newPos = random( x600013_g_Answer )
			RandomOrder[i] = newPos
			RandomOrder[newPos] = i
		end
	end

	-- ��ȷ���������λ��
	SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_AnswerIndex, newPos )
	SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIssued, 1 )
	SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_IsFailed, 0 )

	for i = 1, x600013_g_Answer do
		AddNumText( sceneId, x600013_g_ScriptId, Opt[RandomOrder[i]], -1, i )		-- 9 + i �ƶ��ͻ����ض���ͼ�� (ѡ��ͼ��Ϊ������)
	end

end

--**********************************
--����
--**********************************
function x600013_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600013_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600013_g_MissionId, x600013_g_ScriptId, 0, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600013_g_SciTechScript, "OnAccept", sceneId, selfId, targetId, x600013_g_ScriptId )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		x600013_IssueQuiz( sceneId, selfId )
		AddText( sceneId, "#r    �����������" .. x600013_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600013_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600013_g_SciTechScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600013_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600013_g_MissionName )
		AddText( sceneId, x600013_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600013_g_ScriptId, x600013_g_MissionId )
end

--**********************************
--����
--**********************************
function x600013_CheckAnswer( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) <= 0 then	-- û������
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600013_g_MissionId )

	BeginEvent( sceneId )
		AddText( sceneId, x600013_g_MissionName )

		local ContinueInfo = ""
		local bDone = 0
		if GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIssued ) ~= 1 then
			return
		end

		if GetNumText() == GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_AnswerIndex ) then
			ContinueInfo = format( "    ��Ȼ�߲ţ�С����������" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_IsMissionOkFail, 1 )	-- ���
			bDone = 1
		else
			ContinueInfo = format( "    ��Ҳ��Ҳ���ҿ�Ҳ����Ȼ����������һ�Ρ�" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_IsFailed, 1 )	-- ʧ��
		end

		AddText( sceneId, ContinueInfo )
	EndEvent( )
	DispatchMissionDemandInfo( sceneId, selfId, targetId, x600013_g_ScriptId, x600013_g_MissionId, bDone )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600013_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600013_g_SciTechScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600013_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600013_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600013_g_SciTechScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600013_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600013_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600013_OnItemChanged( sceneId, selfId, itemdataId )
end

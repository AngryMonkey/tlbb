-- ��������֮�����������¼��ű�
-- �ű���
x600002_g_ScriptId = 600002

-- �����
x600002_g_MissionId = 1105

-- ����Ŀ��npc
x600002_g_Name = "��Ӧ��"

-- �����ı�����
x600002_g_MissionName = "��������"
x600002_g_MissionInfo = "������������������"			--��������
x600002_g_MissionTarget = "�����Ӧ�۵�����"			--����Ŀ��
x600002_g_ContinueInfo = "    �������û�����ô��"	--δ��������npc�Ի�
x600002_g_MissionComplete = "̫лл����"				--�������npc˵�Ļ�

x600002_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600002_g_CityMissionScript = 600001

-- �������
x600002_g_SubMissionScriptList = { 600003 , 600004, 600005, 600006 }

-- ������
x600002_g_ItemAwardIndexOffset = 6						-- ��Ʒ�������ڱ���е���ƫ��

x600002_g_MissionRound = MD_CITY_ENGINEERING_ROUND		-- ����
x600002_g_MissionAbandonTime = MD_CITY_ENGINEERING_TIME	-- ����ʱ��

--**********************************
--������ں���
--**********************************
function x600002_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600002_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local rand = random( getn(x600002_g_SubMissionScriptList) )
	CallScriptFunction( x600002_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600002_g_MissionId, x600002_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600002_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600002_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600002_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600002_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600002_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600002_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600002_g_ScriptId, x600002_g_MissionName,4,-1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600002_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600002_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600002_g_MissionId, x600002_g_MissionAbandonTime )
	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600002_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600002_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600002_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600002_g_MissionId, x600002_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600002_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600002_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600002_g_MissionId, x600002_g_MissionAbandonTime, x600002_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600002_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600002_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600002_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600002_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600002_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600002_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600002_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600002_g_MissionId, x600002_g_MissionRound )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600002_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600002_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600002_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600002_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, ContribBonus )
		end

		-- רҵ����
		local SpecBonus = CallScriptFunction( x600002_g_CityMissionScript, "CalcSpecBonus", sceneId, selfId, x600002_g_MissionRound )
		-- print(SpecBonus)
		if SpecBonus > 0 then
			CityChangeAttr( sceneId, selfId, GUILD_IND_LEVEL, SpecBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600002_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600002_g_MissionRound, x600002_g_ItemAwardIndexOffset )
		
		-- ����������
		CallScriptFunction( x600002_g_CityMissionScript, "RandomItemMeltingAward", sceneId, selfId,
			x600002_g_MissionRound )
			
		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600002_g_MissionName)

		-- ��¼��������һ������
		CallScriptFunction( x600002_g_CityMissionScript, "MissionComplete", sceneId, selfId)
	end
end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600002_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600002_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end


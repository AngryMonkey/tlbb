-- ��������֮�о��������¼��ű�
-- �ű���
x600040_g_ScriptId = 600040

-- �����
x600040_g_MissionId = 1113

-- ����Ŀ��npc
x600040_g_Name = "֣����"

-- �����ı�����
x600040_g_MissionName = "�о�����"
x600040_g_MissionInfo = "�����������о�����"			--��������
x600040_g_NoMissionInfo = "    �����ƺ�û���о�ʲô��"	--�����о�ʱ��ʾ
x600040_g_MissionTarget = "��ɰ����ܹܵ�����"		--����Ŀ��
x600040_g_ContinueInfo = "    �������û�����ô��"	--δ��������npc�Ի�
x600040_g_MissionComplete = "̫лл����"				--�������npc˵�Ļ�

x600040_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600040_g_CityMissionScript = 600001

-- �������
x600040_g_SubMissionScriptList = { 600041, 600042, 600043 }

-- ������
x600040_g_ItemAwardIndexOffset = 30						-- ��Ʒ�������ڱ���е���ƫ��
x600040_g_MissionRound = MD_CITY_RESEARCH_ROUND			-- ���������о�����
x600040_g_MissionAbandonTime = MD_CITY_RESEARCH_TIME	-- ���������о�������������ʱ��
x600040_g_ContribType = GUILD_CONTRIB_POINT				-- ��ṱ�׶�
x600040_g_CityProcess = 1								-- 0:�о���1:�о�

--**********************************
--������ں���
--**********************************
function x600040_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600040_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if CityInBuildingResearch( sceneId, selfId, sceneId ) ~= 1 then
		x600040_NotifyFailBox( sceneId, selfId, targetId, x600040_g_NoMissionInfo )
		return
	end

	local rand = random( getn(x600040_g_SubMissionScriptList) )
	CallScriptFunction( x600040_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600040_g_MissionId, x600040_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600040_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600040_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600040_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600040_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600040_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600040_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600040_g_ScriptId, x600040_g_MissionName,4,-1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600040_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600040_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionAbandonTime )
	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600040_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600040_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600040_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600040_g_MissionId, x600040_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600040_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600040_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionAbandonTime, x600040_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600040_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600040_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600040_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600040_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600040_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600040_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionRound )

		-- �����о�
		CityIncProgress( sceneId, selfId, sceneId, x600040_g_CityProcess )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600040_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600040_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600040_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600040_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600040_g_ContribType, ContribBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600040_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600040_g_MissionRound, x600040_g_ItemAwardIndexOffset )

		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600040_g_MissionName)
	end
end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600040_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600040_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x600040_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

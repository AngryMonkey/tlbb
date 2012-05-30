-- ��������֮��չ�������¼��ű�
-- �ű���
x600007_g_ScriptId = 600007

-- �����
x600007_g_MissionId = 1106

-- ����Ŀ��npc
x600007_g_Name = "������"

-- �����ı�����
x600007_g_MissionName = "��չ����"
x600007_g_MissionInfo = "������������չ����"			--��������
x600007_g_MissionTarget = "��������ѵ�����"			--����Ŀ��
x600007_g_ContinueInfo = "    �������û�����ô��"	--δ��������npc�Ի�
x600007_g_MissionComplete = "̫лл����"				--�������npc˵�Ļ�

x600007_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600007_g_CityMissionScript = 600001

-- �������
x600007_g_SubMissionScriptList = { 600008, 600009, 600010, 600011 }

-- ������
x600007_g_ItemAwardIndexOffset = 10						-- ��Ʒ�������ڱ���е���ƫ��

x600007_g_MissionRound = MD_CITY_DEVELOPMENT_ROUND		-- ����
x600007_g_MissionAbandonTime = MD_CITY_DEVELOPMENT_TIME	-- ����ʱ��

--**********************************
--������ں���
--**********************************
function x600007_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600007_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local rand = random( getn(x600007_g_SubMissionScriptList) )
	CallScriptFunction( x600007_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600007_g_MissionId, x600007_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600007_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600007_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600007_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600007_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600007_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600007_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600007_g_ScriptId, x600007_g_MissionName,4,-1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600007_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600007_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600007_g_MissionId, x600007_g_MissionAbandonTime )
	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600007_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600007_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600007_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600007_g_MissionId, x600007_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600007_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600007_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600007_g_MissionId, x600007_g_MissionAbandonTime, x600007_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600007_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600007_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600007_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600007_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600007_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600007_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600007_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600007_g_MissionId, x600007_g_MissionRound )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600007_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600007_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600007_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600007_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, ContribBonus )
		end

		-- רҵ����
		local SpecBonus = CallScriptFunction( x600007_g_CityMissionScript, "CalcSpecBonus", sceneId, selfId, x600007_g_MissionRound )
		-- print(SpecBonus)
		if SpecBonus > 0 then
			CityChangeAttr( sceneId, selfId, GUILD_AGR_LEVEL, SpecBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600007_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600007_g_MissionRound, x600007_g_ItemAwardIndexOffset )
			
			-- ����������
		CallScriptFunction( x600007_g_CityMissionScript, "RandomItemMeltingAward", sceneId, selfId,
			x600007_g_MissionRound )

		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600007_g_MissionName)

		-- ��¼��������һ������
		CallScriptFunction( x600007_g_CityMissionScript, "MissionComplete", sceneId, selfId)
	end
end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600007_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600007_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end


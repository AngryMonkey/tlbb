x600022_g_ScriptId = CITY_BUILDING_ABILITY_SCRIPT

--*******************************************************************************
--��������ܼ�鱨����Ϣ
--*******************************************************************************
x600022_g_ErrorMsg = {
	{-1, "����û���������ܡ�"},
	{-2, "�ȼ�������"},
	{-3, "��Ǯ������"},
	{-4, "���鲻����"},
	{-5, "����Ҫ������������"},
	{-6, "�㻹ûѧ���������ܡ�"},
	{-7, "���Ѿ�ѧ���������ܡ�"},
	{-8, "�㲻��ʹ��������еĹ��ܡ�"},
	{-9, "��������æ�����Ժ����ԡ�"},
	{-10, "û���ҵ��ﹱ������Ϣ��"},
	{-11, "�ﹱ������"},
	{-12, "���������Ȳ�����"},
	{-13, "����Ҫ������������"},
	{-14, "���Ѿ��ﵽ����ܵ���ߵȼ���������������"},
	{-15, "�˽���Ŀǰ�Ѿ�����ߵȼ���ֻ�������˼��ܵ��˼����޷���������"},
}
x600022_g_CITY_BUILDING_MaxLevel = {
					[CITY_BUILDING_SHUFANG]		= 4,
					[CITY_BUILDING_DUANTAI]		= 4,
					[CITY_BUILDING_MICANG]		= 4,
					[CITY_BUILDING_JIFANG]		=	4,
					[CITY_BUILDING_JIUSI]			=	3,
					[CITY_BUILDING_YISHE]			=	3,
					[CITY_BUILDING_QIANZHUANG]=	4,

}

--�۳��ﹱ����
x600022_g_Contribution_Lock	=	0					--enum Obj_Human::BITLOCKTYPE
x600022_g_Contribution_AttrType = 6

--���ȼ���12��������ܵİﹱ���ı�
x600022_g_Contribution_Cost_12 = {
	30,		-- 0 -> 1
	40,		-- 1 -> 2
	50,
	60,
	70,
	100,
	250,
	500,
	1000,
	2000,
	6870,
	7500,		-- 11 -> 12
}

--���ȼ���100��������ܵİﹱ���ı�
--minlv ��С���ܵȼ�
--maxlv ����ܵȼ�
--costrate ��Ҫcostrate*curlv�ﹱ
--x600022_g_Contribution_Cost_100 = {
--	{minlv=1,		maxlv=20,		costrate=1},
--	{minlv=21,	maxlv=40,		costrate=2},
--	{minlv=41,	maxlv=60,		costrate=3},
--	{minlv=61,	maxlv=80,		costrate=4},
--	{minlv=81,	maxlv=100,	costrate=5},
--}

x600022_g_ExtraNPCName = {{"ľ����", "������", "Ү�ɴ�ʯ"}
													,{ABILITY_FENGREN, ABILITY_GONGYI, ABILITY_ZHUZAO}}

function x600022_GetCostContributionByAbilityLevel(aid,alv)
	if CITY_ABILITY_DETAIL[aid] then
		local ret, maxlevel = LuaFnGetAbilityMaxLevel(aid);
		if ret and ret == 1 and maxlevel then
			if 10 == maxlevel then
			--12���ⶥ�ļ��ܣ�����۳����ٰﹱ
				return x600022_g_Contribution_Cost_12[alv+1]
			elseif 100 == maxlevel or 99 == maxlevel then
			--100���ⶥ�ļ��ܣ�ͨ�����ܵȼ������
				return floor( x600022_g_Contribution_Cost_12[ floor( alv/10 ) + 1 ] / 10 )

			--	for i = 1, getn(x600022_g_Contribution_Cost_100) do
			--		local l = x600022_g_Contribution_Cost_100[i]
			--		if alv+1 >= l.minlv and alv+1 <= l.maxlv then
			--			return (alv+1)*l.costrate
			--		end
			--	end
			end
		end
	end
	--if CITY_ABILITY_DETAIL[aid] and CITY_ABILITY_DETAIL[aid].cond[alv+1] then
	--	if 12 == getn(CITY_ABILITY_DETAIL[aid].cond) then
	--	--12���ⶥ�ļ��ܣ�����۳����ٰﹱ
	--		return x600022_g_Contribution_Cost_12[alv+1]
	--	elseif 100 == getn(CITY_ABILITY_DETAIL[aid].cond) then
	--	--100���ⶥ�ļ��ܣ�ͨ�����ܵȼ������
	--		for i = 1, getn(x600022_g_Contribution_Cost_100) do
	--			local l = x600022_g_Contribution_Cost_100[i]
	--			if alv+1 >= l.minlv and alv+1 <= l.maxlv then
	--				return (alv+1)*l.costrate
	--			end
	--		end
	--	end
	--end

	return -1
end

function x600022_ShowErrorMsg(sceneId,selfId,errid)
	for i = 1, getn(x600022_g_ErrorMsg) do
		if x600022_g_ErrorMsg[i][1] == errid then
			Msg2Player( sceneId,selfId,"@*;SrvMsg;DBD:"..x600022_g_ErrorMsg[i][2],MSG2PLAYER_PARA)
			--BeginEvent(sceneId)
      --	AddText(sceneId,x600022_g_ErrorMsg[i][2]);
      --EndEvent(sceneId)
      --DispatchMissionTips(sceneId,selfId)
			break
		end
	end
	return errid
end

--�����û�����Ĵ˽�����������ѡ��
function x600022_OnDefaultEvent( sceneId, selfId, targetId, eventScriptId, npcScriptId, bid )
	--�ж�����ǲ�����������������ĳ�Ա
	--if GetNumText() == 666 then
	--	BeginEvent(sceneId)
	--		AddText(sceneId, "#{JZBZ_081031_01}");
	--	EndEvent()
	--	DispatchEventList(sceneId, selfId, targetId)
	--end
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return end

	local nUserSelNum = GetNumText();
	if(eventScriptId == x600022_g_ScriptId) then
		--���ѡ����һ�������
		local aid = nUserSelNum;
		if(aid and CITY_ABILITY_DETAIL[aid]) then
			BeginEvent(sceneId)
			for i = 1, getn(CITY_ABILITY_DETAIL[aid].script) do
				if(CITY_ABILITY_DETAIL[aid].script[i] > 0) then
					-- i == 1	ѧϰ
					-- i == 2 ����
					-- i == 3 �˽�
					CallScriptFunction( CITY_ABILITY_DETAIL[aid].script[i], "OnEnumerate",sceneId, selfId, targetId, bid, i)
				end
			end
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	else
		--���弼�ܵĴ�����
		if x600022_IsValidCityLifeSkill_Script_Id(eventScriptId) == 1 then
			CallScriptFunction( eventScriptId, "OnDefaultEvent",sceneId, selfId, targetId, nUserSelNum, npcScriptId, bid )
		end
	end
end

--�������¼�Id�ǲ��ǳ��������ѧϰ��ϵ�Ľű�
function x600022_IsValidCityLifeSkill_Script_Id(eid)
	if nil == eid then return 0 end
	for i = 1, getn(CITY_ABILITY_DETAIL) do
		if CITY_ABILITY_DETAIL[i] then
			local letb = CITY_ABILITY_DETAIL[i].script
			for k = 1, getn(letb) do
				if eid == letb[k] then return 1 end
			end
		end
	end
	return 0
end

--�оٴ˽���������ܵ�ѡ��
function x600022_GetLifeAbilityByBuildingId(bid)
	local aRet = {}
	if bid and CITY_BUILDING_ABILITY_LIST[bid] then
		aRet = CITY_BUILDING_ABILITY_LIST[bid]
	end

	return aRet	--���ؽ��
end

--���ѧϰ�����ѡ��
function x600022_AddCityLifeAbilityOpt(sceneId, selfId, scriptid, bid, optid)
	--�ж�����ǲ�����������������ĳ�Ա
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return end
	
	local lifeNum = getn(x600022_GetLifeAbilityByBuildingId(bid))
	if lifeNum > 0 then
		AddNumText( sceneId, scriptid, "ѧϰ�����", 6, optid )
		--AddNumText( sceneId, x600022_g_ScriptId, "#{JZBZ_081031_02}", 11, 666)
	end
end

--�������ܵ���ϸ����
function x600022_IsHaveLifeAbilityByBuildingId(sceneId, selfId, bid)
	return getn(x600022_GetLifeAbilityByBuildingId(bid))
end

function x600022_OnEnumerate( sceneId, selfId, targetId, bid )
	--�ж�����ǲ�����������������ĳ�Ա
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return end
	--������������ܵı���
	AddText( sceneId, "#{BPJZ_081103_05}" )
	local aTable = x600022_GetLifeAbilityByBuildingId(bid)
	for i = 1, getn(aTable) do
		AddNumText( sceneId, x600022_g_ScriptId, CITY_ABILITY_DETAIL[aTable[i]].aname, 6, aTable[i])
	end
end

--�����������������Լ������������ܽű�������ѯ
--checktype = 1	ѧϰ���
--checktype = 2	�������
--checktype = 3 ����(Client)				--ѧϰ���ڸ�����ܽű���ֱ����ɵ�
--checktype = 4 ѧϰ����ʾ��Ϣ����Ҫ������(Server)
--checktype = 5 �о�ѧϰѡ��ʱ�ļ��
--checktype = 6 �о�����ѡ��ʱ�ļ��
function x600022_OnCityCheck(sceneId, selfId, aid, bid, checktype, ex1, targetId)
	--�ж�����ǲ�����������������ĳ�Ա
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return x600022_ShowErrorMsg(sceneId, selfId, -8) end

	--������������ܵı���
	local blv = CityGetBuildingLevel(sceneId, selfId, sceneId, bid)
	local rl = nil
	if CITY_BUILDING_ABILITY_RULE[bid] and CITY_BUILDING_ABILITY_RULE[bid][blv] then
		local aTable = CITY_BUILDING_ABILITY_RULE[bid][blv]
	for i = 1, getn(aTable) do
		if aTable[i].aid == aid then rl = aTable[i] end
	end
	end

	--��ü������
	local alv
	if(1 == checktype or 5 == checktype) then alv = 0 end	--ѧϰ
	if(2 == checktype or 3 == checktype or 6 == checktype) then --����
		alv = QueryHumanAbilityLevel(sceneId, selfId, aid)
	end

	--�����ҵ������������
	if CITY_BUILDING_SIXRATE[bid] then
		--��ȡѧϰ��ʾ������
		if(4 == checktype) then return 1 end
		if(2 == checktype) then 
			local ret, maxlevel = LuaFnGetAbilityMaxLevel(aid);
			if ret and ret == 1 and alv>=maxlevel then
				return x600022_ShowErrorMsg(sceneId, selfId, -14);
			end;
			if(alv<1)then
				return x600022_ShowErrorMsg(sceneId, selfId, -6)
			end;
			return 1;			
		end
		--�Ƿ�ѧ���˼���
		--ѧϰ
		if 1 == checktype and QueryHumanAbilityLevel(sceneId, selfId, aid) > 0 then
			return x600022_ShowErrorMsg(sceneId, selfId, -7)
		end
		if 5 == checktype and QueryHumanAbilityLevel(sceneId, selfId, aid) > 0 then
			return x600022_ShowErrorMsg(sceneId, selfId, -7)
		end
		--����
		if 3 == checktype  then	--Client
			local ret, maxlevel = LuaFnGetAbilityMaxLevel(aid);
			if ret and ret == 1 and alv>=maxlevel then
				return x600022_ShowErrorMsg(sceneId, selfId, -14);
			end;
			if(alv<1)then
				return x600022_ShowErrorMsg(sceneId, selfId, -6)
			end;
		end
		if 6 == checktype and alv < 1 then	--Server
			return x600022_ShowErrorMsg(sceneId, selfId, -6)
		end

		if rl and 5 ~= checktype and 6 ~= checktype then
			--������С���ȼ����
			if alv >= rl.amax	or alv+1 < rl.amin then
				if x600022_g_CITY_BUILDING_MaxLevel[bid] and x600022_g_CITY_BUILDING_MaxLevel[bid]<=blv then
					return x600022_ShowErrorMsg(sceneId, selfId, -15);
				end;
				return x600022_ShowErrorMsg(sceneId, selfId, -5)
			end
		
			local tempAbilityId = rl.aid;
			local tempAbilityLevel = alv+1;
			local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(tempAbilityId, tempAbilityLevel);
			
			--��д����NPC�߼�
			for i = 1, getn(x600022_g_ExtraNPCName[1]) do
				--PrintStr(GetName(sceneId, targetId).." "..x600022_g_ExtraNPCName[1][i].." "..tempAbilityId .." ".. x600022_g_ExtraNPCName[2][i])
				if GetName(sceneId, targetId) == x600022_g_ExtraNPCName[1][i] and tempAbilityId == x600022_g_ExtraNPCName[2][i] then
					demandMoney = extraMoney
					demandExp = extraExp
					break
				end
			end
			
			if ret and ret == 1 then
				--����ȼ����
				if GetLevel(sceneId,selfId) < limitLevel then
					return x600022_ShowErrorMsg(sceneId, selfId, -2)
				end
				--�����Ǯ���
				local rate = -0.2	--CITY_BUILDING_SIXRATE[bid]		������������Ķ�Ӧ��ֵ
				if GetMoney(sceneId,selfId) + GetMoneyJZ(sceneId, selfId) < floor((1+rate)*demandMoney) then
					return x600022_ShowErrorMsg(sceneId, selfId, -3)
				end
				--���ﾭ����
				if 1 ~= checktype and 4 ~= checktype then
				if GetExp(sceneId,selfId) < floor((1+rate)*demandExp) then
					return x600022_ShowErrorMsg(sceneId, selfId, -4)
				end
				end
				--�����ṱ�׶ȼ��
				local costContribution = x600022_GetCostContributionByAbilityLevel(aid, alv)
				if costContribution < 0 then
					return x600022_ShowErrorMsg(sceneId, selfId, -10)
				end
				local curContribute = CityGetAttr(sceneId,selfId,x600022_g_Contribution_AttrType)
				if ex1 and ex1 < curContribute then curContribute = ex1 end
				if curContribute < costContribution then
					return x600022_ShowErrorMsg(sceneId, selfId, -11)
				end
				--���＼�������ȼ��
				local aexp = GetAbilityExp(sceneId, selfId, aid)
				if checktype == 3 then
					if aexp < limitAbilityExp then
						return x600022_ShowErrorMsg(sceneId, selfId, -12)
					end
				end
			else
				return 0;
			end
		else
			if nil == rl and 5~= checktype and 6 ~= checktype then
				return x600022_ShowErrorMsg(sceneId, selfId, -13)
			end
		end
	else
		return x600022_ShowErrorMsg(sceneId, selfId, -1)			--û���ҵ������������Բ������ּ���
	end

	return 1				--���ɹ�
end

--������������ʵ�ʸÿ۵Ľ�Ǯ�����׶ȡ��������ֵ����������ܽű�����
--checktype = 1	ѧϰ���(Server)
--checktype = 2	�������(Server)
--checktype = 3 ����(Client)				--ѧϰ���ڸ�����ܽű���ֱ����ɵ�
--checktype = 4 ѧϰ����ʾ��Ϣ����Ҫ������(Server)
function x600022_OnCityAction(sceneId, selfId, targetId, aid, bid, checktype, ex1)
	--������������ܵı���
	local blv = CityGetBuildingLevel(sceneId, selfId, sceneId, bid)
	local rl = nil
	if CITY_BUILDING_ABILITY_RULE[bid] and CITY_BUILDING_ABILITY_RULE[bid][blv] then
		local aTable = CITY_BUILDING_ABILITY_RULE[bid][blv]
	for i = 1, getn(aTable) do
		if aTable[i].aid == aid then rl = aTable[i] end
	end
	end

	--�����ҵ�������������
	if x600022_OnCityCheck(sceneId, selfId, aid, bid, checktype, ex1, targetId) == 1 then
		local alv = QueryHumanAbilityLevel(sceneId, selfId, aid)
		local rate = -0.2	--CITY_BUILDING_SIXRATE[bid]		������������Ķ�Ӧ��ֵ

		local tempAbilityId = aid;
		local tempAbilityLevel = alv+1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(tempAbilityId, tempAbilityLevel);
		
		--��д����NPC�߼�
		for i = 1, getn(x600022_g_ExtraNPCName[1]) do
			--PrintStr(GetName(sceneId, targetId).." "..x600022_g_ExtraNPCName[1][i].." "..tempAbilityId .." ".. x600022_g_ExtraNPCName[2][i])
			if GetName(sceneId, targetId) == x600022_g_ExtraNPCName[1][i] and tempAbilityId == x600022_g_ExtraNPCName[2][i] then
				demandMoney = extraMoney
				demandExp = extraExp
				break
			end
		end
		
		if ret and ret == 1 then
			local Need_Money = floor((1+rate)*demandMoney)				--��Ҫ��ҵĽ�Ǯ
			local Need_Level	= limitLevel			--��Ҫ��ҵĵȼ�
			local Need_Exp		=	floor((1+rate)*demandExp)		--��Ҫ��ҵľ���ֵ
			local Need_Aexp	=	limitAbilityExpShow		--��Ҫ�ļ���������

			local costContribution = x600022_GetCostContributionByAbilityLevel(aid, alv)
			if costContribution < 0 then
				return x600022_ShowErrorMsg(sceneId, selfId, -10)
			end
			local Need_Contribute = costContribution																--��Ҫ��ҵİﹱ

			--��鵱ǰ�Ƿ��ܿ۳��ﹱ����
			if Need_Contribute > 0 and 1 == checktype and 3 == checktype then
				if IsLocked(sceneId, selfId, x600022_g_Contribution_Lock) then return x600022_ShowErrorMsg(sceneId, selfId, -9) end
			end

			local User_Contribute = CityGetAttr(sceneId,selfId,x600022_g_Contribution_AttrType)			--��ҵ�ǰ�İﹱ
			if ex1 and ex1 < User_Contribute then User_Contribute = ex1 end	--Ϊ����ʱ��ʾʹ�ã���Ϊ�ﹱ���ԱȽ�����

			if rl and checktype == 1 then	--Server
				--�۳�����
				LuaFnCostMoneyWithPriority(sceneId,selfId,Need_Money)
				--ѧϰ����ܲ��ľ���ֵ
				--if Need_Exp > 0 then AddExp(sceneId,selfId,Need_Exp*-1)	end
				CityChangeAttr(sceneId,selfId,x600022_g_Contribution_AttrType,Need_Contribute*-1)
				--ѧϰ�����
				SetHumanAbilityLevel(sceneId,selfId,rl.aid,1)
				--��npc���촰��֪ͨ����Ѿ�ѧ����
				BeginEvent(sceneId)
					AddText(sceneId,"��ѧ����"..CITY_ABILITY_DETAIL[rl.aid].aname.."����")
				EndEvent()
				DispatchEventList(sceneId,selfId,targetId)
			elseif checktype == 2 then	--Server
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,targetId) --���ó�������ܽ���
					UICommand_AddInt(sceneId,aid)
					UICommand_AddInt(sceneId,Need_Aexp)
					UICommand_AddInt(sceneId,Need_Money)
					UICommand_AddInt(sceneId,Need_Level)
					UICommand_AddInt(sceneId,Need_Exp)
					UICommand_AddInt(sceneId,Need_Contribute)
					UICommand_AddInt(sceneId,bid)
					UICommand_AddInt(sceneId,User_Contribute)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 555)
			elseif checktype == 3 then	--Client
				--�۳�����
				local bOk = CityChangeAttr(sceneId,selfId,x600022_g_Contribution_AttrType,Need_Contribute*-1)
				if bOk > 0 then
					--���ȿ۳����� zchw
					local HumanMoney = LuaFnGetMoney( sceneId, selfId )
  					local HumanMoneyJZ = GetMoneyJZ( sceneId, selfId );
					if HumanMoney + HumanMoneyJZ  <  Need_Money then
						return 0;
					end
					local nDelJZ, nDelMoney = LuaFnCostMoneyWithPriority(sceneId, selfId, Need_Money);
					if (nDelJZ == -1) then
						return 0;
					end

					if Need_Exp > 0 then AddExp(sceneId,selfId,Need_Exp*-1)	end
					--CityChangeAttr(sceneId,selfId,x600022_g_Contribution_AttrType,Need_Contribute*-1)
					--���������
					SetHumanAbilityLevel(sceneId,selfId,aid,alv+1)
					--���¼���ͻ��˵�������ť
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,targetId) --���ó�������ܽ���
						UICommand_AddInt(sceneId,aid)
						UICommand_AddInt(sceneId,bid)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 556)
					--�ݹ�����Լ�����ʾ��һ������Ϣ
					x600022_OnCityAction(sceneId, selfId, targetId, aid, bid, 2, User_Contribute-Need_Contribute)
				end
			elseif checktype ==4 then	--Server
				return Need_Level,Need_Money,Need_Contribute
			end
		else
			return x600022_ShowErrorMsg(sceneId, selfId, -1)			--û���ҵ������������Բ������ּ���
		end
	else
		return 0			--û���ҵ������������Բ������ּ���
	end

	return 1				--���ɹ�
end

--�����еĵ�ǰά��״̬����ά��״̬ʱ������ʾ��Ϣ��
function x600022_CheckCityStatus(sceneId, selfId,targetId)
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return -2 end
	
	if CityGetMaintainStatus( sceneId, selfId, sceneId ) == 1 then				-- ��ά��״̬
		BeginEvent(sceneId)
			AddText(sceneId,"���������ʽ��㣬���Ƕ����������������Ұ��ָܻ�����ά���������Ұɡ�")
		EndEvent()
		DispatchEventList(sceneId,selfId,targetId)
  	return -1
	end
	
	return 1
end

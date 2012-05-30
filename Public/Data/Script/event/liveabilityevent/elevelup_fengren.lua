--���Ҽ�������

--�ű���
x713565_g_ScriptId = 713565

--��npc������������ߵȼ�
x713565_g_MaxLevel = 5

----���ܱ��
x713565_g_AbilityID = ABILITY_FENGREN

--��������
x713565_g_AbilityName = "����"

x713565_g_Name1 = "ľ����"

--**********************************
--������ں���
--**********************************
function x713565_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713565_g_AbilityID)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, x713565_g_AbilityID)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ��"..x713565_g_AbilityName.."���ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	--������ڳ���������
	if bid then
		--�������Ƿ��ڵ�ά��״̬
		if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
			return
		end
		local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713565_g_AbilityID, bid, 2)
		if ret > 0 then
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713565_g_AbilityID, bid, 2)
		end
		return
	end
	
	local MaxLevel = x713565_g_MaxLevel;
	if GetName(sceneId, targetId) == x713565_g_Name1   then
		MaxLevel = 10;
	end
	
	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= MaxLevel then
		BeginEvent(sceneId)
			if GetName(sceneId, targetId) == x713565_g_Name1   then
				strText = "��ֻ�ܽ���1-10����"..x713565_g_AbilityName.."����."
			else
			strText = "��ֻ�ܽ���1-5����"..x713565_g_AbilityName.."����,�뵽�����л����ҷ��������Ϊ��տ��#Yľ����#G������#{_INFOAIM107,135,2,ľ����}��#Wѧϰ���߼���"..x713565_g_AbilityName.."��"
			end
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713565_g_ScriptId, x713565_g_AbilityID, LEVELUP_ABILITY_FENGREN[AbilityLevel+1].Money, LEVELUP_ABILITY_FENGREN[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_FENGREN[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_FENGREN[AbilityLevel+1].HumanLevelLimit)
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_FENGREN, AbilityLevel + 1);
		
		if GetName(sceneId, targetId) == x713565_g_Name1   then
			demandMoney = extraMoney;
			demandExp		=	extraExp;
		end
		
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713565_g_ScriptId, x713565_g_AbilityID, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x713565_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713565_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713565_g_ScriptId,"����"..x713565_g_AbilityName.."����", 12, 1) end
			return
		end
		--��������ȼ�����ʾѡ��
		--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_FENGREN[1].HumanLevelLimit then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_FENGREN, 1);
		if ret and ret == 1 and 1 then
			AddNumText(sceneId,x713565_g_ScriptId,"����"..x713565_g_AbilityName.."����", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713565_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713565_OnAccept( sceneId, selfId, x713565_g_AbilityID )
end

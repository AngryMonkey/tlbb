--���ռ�������

--�ű���
x713566_g_ScriptId = 713566

--��npc������������ߵȼ�
x713566_g_MaxLevel = 5

----���ܱ��
x713566_g_AbilityID = ABILITY_GONGYI

--��������
x713566_g_AbilityName = "����"

x713566_g_Name1 = "������"
--**********************************
--������ں���
--**********************************
function x713566_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713566_g_AbilityID)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, x713566_g_AbilityID)
	--�����ж�

	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ��"..x713566_g_AbilityName.."���ܣ�"
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
		local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713566_g_AbilityID, bid, 2)
		if ret > 0 then
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713566_g_AbilityID, bid, 2)
		end
		return
	end
	
	local MaxLevel = x713566_g_MaxLevel;
	if GetName(sceneId, targetId) == x713566_g_Name1   then
		MaxLevel = 10;
	end
	
	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= MaxLevel then
		BeginEvent(sceneId)
			if GetName(sceneId, targetId) == x713566_g_Name1   then
				strText = "��ֻ�ܽ���1-10����"..x713566_g_AbilityName.."����."
			else
			strText = "��ֻ�ܽ���1-5����"..x713566_g_AbilityName.."����,�뵽�����л����ҹ��������Ϊ��տ��#Y������#G������#{_INFOAIM108,140,5,������}��#Wѧϰ���߼���"..x713566_g_AbilityName.."��"
			end
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713566_g_ScriptId, x713566_g_AbilityID, LEVELUP_ABILITY_GONGYI[AbilityLevel+1].Money, LEVELUP_ABILITY_GONGYI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_GONGYI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_GONGYI[AbilityLevel+1].HumanLevelLimit)
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_GONGYI, AbilityLevel + 1);
		
		if GetName(sceneId, targetId) == x713566_g_Name1   then
			demandMoney = extraMoney;
			demandExp		=	extraExp;
		end
		
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713566_g_ScriptId, x713566_g_AbilityID, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x713566_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713566_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713566_g_ScriptId,"����"..x713566_g_AbilityName.."����", 12, 1) end
			return
		end
		--��������ȼ�����ʾѡ��
		--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_GONGYI[1].HumanLevelLimit then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_GONGYI, 1);
		if ret and ret == 1 and 1 then
			AddNumText(sceneId,x713566_g_ScriptId,"����"..x713566_g_AbilityName.."����", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713566_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713566_OnAccept( sceneId, selfId, x713566_g_AbilityID )
end

--�����پ���������

--�ű���
x713592_g_ScriptId = 713592

--��npc������������ߵȼ�
x713592_g_nMaxLevel = 100

--**********************************
--������ں���
--**********************************
function x713592_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_JINGMAIBAIJUE)
	--��Ҿ����پ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_JINGMAIBAIJUE)
	--�����ж�

	--�ж��Ƿ��Ǵ����ɵ���,���Ǵ����ɵ��Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= MP_DALI then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ�ᾭ���پ����ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= x713592_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:29 �޸� ]
			strText = "Ŀǰ�˼���ֻ��ѧϰ��100��"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713592_g_ScriptId, ABILITY_JINGMAIBAIJUE, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713592_g_ScriptId;
		local tempAbilityId = ABILITY_JINGMAIBAIJUE;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,tempScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x713592_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if 1 then
			AddNumText(sceneId,x713592_g_ScriptId,"���������پ�����", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713592_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713592_OnAccept( sceneId, selfId, ABILITY_JINGMAIBAIJUE )
end

--���շ�Ǽ�������

--�ű���
x713596_g_ScriptId = 713596

--��npc������������ߵȼ�
x713596_g_nMaxLevel = 100

--**********************************
--������ں���
--**********************************
function x713596_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_LIUYIFENGGU)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_LIUYIFENGGU)
	--�����ж�

	--�ж��Ƿ�����ң�ɵ���,������ң���Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= MP_XIAOYAO then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ�����շ�Ǽ��ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= x713596_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:33 �޸� ]
			strText = "Ŀǰ�˼���ֻ��ѧϰ��100��"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713596_g_ScriptId, ABILITY_LIUYIFENGGU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713596_g_ScriptId;
		local tempAbilityId = ABILITY_LIUYIFENGGU;
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
function x713596_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if 1 then
			AddNumText(sceneId,x713596_g_ScriptId,"�������շ�Ǽ���", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713596_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713596_OnAccept( sceneId, selfId, ABILITY_LIUYIFENGGU )
end

--�ƹƼ�������

--�ű���
x713575_g_ScriptId = 713575

--��npc������������ߵȼ�
x713575_g_nMaxLevel = 10

--**********************************
--������ں���
--**********************************
function x713575_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIGU)
	--����ƹƼ��ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIGU)
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
			strText = "�㻹û��ѧ���ƹƼ��ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= x713575_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-10�����ƹƼ���,�뵽������ѧϰ���߼����ƹ�."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713575_g_ScriptId, ABILITY_ZHIGU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_ZHIGU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713575_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x713575_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if 1 then
			AddNumText(sceneId,x713575_g_ScriptId,"�����ƹƼ���", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713575_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713575_OnAccept( sceneId, selfId, ABILITY_ZHIGU )
end

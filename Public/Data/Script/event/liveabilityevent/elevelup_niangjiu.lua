--��Ƽ�������

--�ű���
x713573_g_ScriptId = 713573

--��npc������������ߵȼ�
x713573_g_nMaxLevel = 10

--**********************************
--������ں���
--**********************************
function x713573_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_NIANGJIU)
	--�����Ƽ��ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_NIANGJIU)
	--�����ж�

	--�ж��Ƿ���ؤ�����,����ؤ����Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= MP_GAIBANG then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ����Ƽ��ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= x713573_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "��ֻ�ܽ���1-10������Ƽ���,�뵽������ѧϰ���߼������."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713573_g_ScriptId, ABILITY_NIANGJIU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_NIANGJIU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713573_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x713573_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if 1 then
			AddNumText(sceneId,x713573_g_ScriptId,"������Ƽ���", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713573_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713573_OnAccept( sceneId, selfId, ABILITY_NIANGJIU )
end

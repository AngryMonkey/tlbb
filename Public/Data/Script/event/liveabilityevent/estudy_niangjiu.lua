--��Ƽ���ѧϰ

--�ű���
x713514_g_ScriptId = 713514

--��npc������������ߵȼ�
x713514_g_nMaxLevel = 5

--ѧϰ����Ҫ˵�Ļ�
x713514_g_MessageStudy = "�����ﵽ%d�����ҿϻ���#{_EXCHG%d}�Ϳ���ѧ����Ƽ��ܡ������ѧϰô��"


--**********************************
--������ں���
--**********************************
function x713514_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_NIANGJIU)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_NIANGJIU)
	--�����ж�

	--�ж��Ƿ���ؤ���ɵ���,����ؤ����Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= MP_GAIBANG then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�ж��Ƿ��Ѿ�ѧ�������,���ѧ����,����ʾ�Ѿ�ѧ����
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"���Ѿ�ѧ����Ƽ�����");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--���������ǡ�ѧϰ���ܡ���������=0��
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_NIANGJIU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713514_g_MessageStudy)
			local addText = format(x713514_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--ȷ��ѧϰ��ť
					AddNumText(sceneId,x713514_g_ScriptId,"��ȷ��Ҫѧϰ", 6, 2)
			--ȡ��ѧϰ��ť
					AddNumText(sceneId,x713514_g_ScriptId,"��ֻ��������", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--���������ǡ���ȷ��Ҫѧϰ��
		local tempAbilityId = ABILITY_NIANGJIU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			--�������Ƿ���һ�����ҵ��ֽ�
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					AddText(sceneId,"��Ľ�Ǯ����");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--�����ҵȼ��Ƿ�ﵽҪ��
			if GetLevel(sceneId,selfId) < limitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"��ĵȼ�����");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--ɾ����Ǯ
			LuaFnCostMoneyWithPriority(sceneId,selfId,demandMoney)
			--����������1
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_NIANGJIU,1)
			--��npc���촰��֪ͨ����Ѿ�ѧ����
			BeginEvent(sceneId)
				AddText(sceneId,"��ѧ������Ƽ���")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	else --����������ֻ����������
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x713514_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713514_g_ScriptId,"ѧϰ��Ƽ���", 12, 0)
		--end
		return
end

--**********************************
--����������
--**********************************
function x713514_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713514_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end

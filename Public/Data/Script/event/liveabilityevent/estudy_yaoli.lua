--ҩ����ѧϰ

--�ű���
x713527_g_ScriptId = 713527

--��npc������������ߵȼ�
x713527_g_nMaxLevel = 30

--ѧϰ����Ҫ˵�Ļ�
x713527_g_MessageStudy = "ֻҪ��ϻ���#{_EXCHG%d}�Ϳ���ѧ��ҩ���ܡ������ѧϰô��"

x713527_g_AbilityName = "ҩ��"

x713527_g_AbilityID = ABILITY_YAOLI

--**********************************
--������ں���
--**********************************
function x713527_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YAOLI)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YAOLI)
	--�����ж�

	--�ж��Ƿ��Ѿ�ѧ����ҩ��,���ѧ����,����ʾ�Ѿ�ѧ����
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"���Ѿ�ѧ��ҩ������");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--�ڳ�����ѧϰ�������
	if bid then
		x713527_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end

	--���������ǡ�ѧϰ���ܡ���������=0��
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_YAOLI;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713527_g_MessageStudy)
			local addText = format(x713527_g_MessageStudy, demandMoney);
			AddText(sceneId,addText)
			--ȷ��ѧϰ��ť
					AddNumText(sceneId,x713527_g_ScriptId,"��ȷ��Ҫѧϰ", 6, 2)
			--ȡ��ѧϰ��ť
					AddNumText(sceneId,x713527_g_ScriptId,"��ֻ��������", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--���������ǡ���ȷ��Ҫѧϰ��
		local tempAbilityId = ABILITY_YAOLI;
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
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_YAOLI,1)
			--��npc���촰��֪ͨ����Ѿ�ѧ����
			BeginEvent(sceneId)
				AddText(sceneId,"��ѧ����ҩ����")
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
function x713527_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, ABILITY_YAOLI, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713527_g_ScriptId,"ѧϰ"..x713527_g_AbilityName.."����", 12, 0) end
			return
		end
		--��������ȼ�����ʾѡ��
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713527_g_ScriptId,"ѧϰҩ����", 12, 0)
		--end
		return
end

--**********************************
--����������
--**********************************
function x713527_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713527_OnAccept( sceneId, selfId, ABILITY_YAOLI )
end

--�ڳ�����ѧϰ�������ʱ��Ҫִ�еĺ���
function x713527_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--�������Ƿ��ڵ�ά��״̬
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			--���������ʾ����
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, ABILITY_YAOLI, bid, 4)
			local studyMsg = format("�����ﵽ%d�����ҿϻ���#{_EXCHG%d}��%d��ﹱ�Ϳ���ѧ��"..x713527_g_AbilityName.."���ܡ������ѧϰô��", lv, money, con)
			AddText(sceneId,studyMsg)
			--ȷ��ѧϰ��ť
					AddNumText(sceneId,x713527_g_ScriptId,"��ȷ��Ҫѧϰ", 6, 2)
			--ȡ��ѧϰ��ť
					AddNumText(sceneId,x713527_g_ScriptId,"��ֻ��������", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713527_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713527_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--���ϼӹ�����ѧϰ

--�ű���
x713538_g_ScriptId = 713538

--ѧϰ����Ҫ˵�Ļ�
x713538_g_MessageStudy = "�����ﵽ%d�����ҿϻ���#{_EXCHG%d}�Ϳ���ѧ����ϼӹ����ܡ������ѧϰô��"

--���ܱ��
x713538_g_AbilityID = ABILITY_CAILIAOHECHENG

--��������
x713538_g_AbilityName = "���ϼӹ�"

--ѧϰ�����ܵĵȼ�����
x713538_g_LimitLevel = 10

--Ҫ�����ѧ����䷽�б�
x713538_g_PeiFangID = { 399, 400, 401, 402, 403, 404, 405, 406, 407 }


--**********************************
--������ں���
--**********************************
function x713538_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713538_g_AbilityID)

	--�����ж�

	--�ж��Ƿ��Ѿ�ѧ���˲��ϼӹ�,���ѧ����,����ʾ�Ѿ�ѧ����
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"���Ѿ�ѧ��"..x713538_g_AbilityName.."������");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	
	--���������ǡ�ѧϰ���ܡ���������=0��
	if ButtomNum == 0 then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(x713538_g_AbilityID, 1);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			local addText = format(x713538_g_MessageStudy, x713538_g_LimitLevel, demandMoney);
			AddText(sceneId, addText)
			--ȷ��ѧϰ��ť
					AddNumText(sceneId,x713538_g_ScriptId,"��ȷ��Ҫѧϰ", 6, 2)
			--ȡ��ѧϰ��ť
					AddNumText(sceneId,x713538_g_ScriptId,"��ֻ��������", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--���������ǡ���ȷ��Ҫѧϰ��
	--�������Ƿ����㹻���ֽ�
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(x713538_g_AbilityID, 1);
		if ret and ret == 1 then
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					local addText2 = format( "�Բ�����Я���Ľ�Ǯ��������Я��#{_EXCHG%d}ǰ��ѧϰ��", demandMoney )
					AddText( sceneId, addText2 );
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--�����ҵȼ��Ƿ�ﵽҪ��
			if GetLevel(sceneId,selfId) < x713538_g_LimitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"��ĵȼ�����");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--ɾ����Ǯ
			LuaFnCostMoneyWithPriority(sceneId, selfId, demandMoney)
			--����������1
			SetHumanAbilityLevel(sceneId,selfId,x713538_g_AbilityID,1)
			--�����ѧ������9���䷽
			x713538_AddAllPeiFang( sceneId, selfId )
			--��npc���촰��֪ͨ����Ѿ�ѧ����
			BeginEvent(sceneId)
				AddText(sceneId,"��ѧ����"..x713538_g_AbilityName.."����")
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
function x713538_OnEnumerate( sceneId, selfId, targetId )

		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(x713538_g_AbilityID, 1);
		if ret and ret == 1 then
			AddNumText(sceneId,x713538_g_ScriptId,"ѧϰ"..x713538_g_AbilityName.."����", 12, 0)
		end
		return

end

--**********************************
--����������
--**********************************
function x713538_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713538_OnAccept( sceneId, selfId, x713538_g_AbilityID )
end


function x713538_AddAllPeiFang( sceneId, selfId )

	for i, pfID in x713538_g_PeiFangID do
	
		if IsPrescrLearned( sceneId, selfId, pfID ) == 0 then
			SetPrescription( sceneId, selfId, pfID, 1 )
		end

	end

end

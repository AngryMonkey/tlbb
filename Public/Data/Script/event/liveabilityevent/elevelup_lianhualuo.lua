--�����似������

--�ű���
x713590_g_ScriptId = 713590

--��npc������������ߵȼ�
x713590_g_nMaxLevel = 100

--**********************************
--������ں���
--**********************************
function x713590_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_LIANHUALUO)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_LIANHUALUO)
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
			strText = "�㻹û��ѧ�������似�ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= x713590_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:26 �޸� ]
			strText = "Ŀǰ�˼���ֻ��ѧϰ��100��"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713590_g_ScriptId, ABILITY_LIANHUALUO, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713590_g_ScriptId;
		local tempAbilityId = ABILITY_LIANHUALUO;
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
function x713590_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if 1 then
			AddNumText(sceneId,x713590_g_ScriptId,"���������似��", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713590_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713590_OnAccept( sceneId, selfId, ABILITY_LIANHUALUO )
end

--��������������

--�ű���
x713593_g_ScriptId = 713593

--��npc������������ߵȼ�
x713593_g_nMaxLevel = 100

--**********************************
--������ں���
--**********************************
function x713593_OnDefaultEvent( sceneId, selfId, targetId )
	--��Ҽ��ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YINCHONGSHU)
	--������������ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YINCHONGSHU)
	--�����ж�

	--�ж��Ƿ��������ɵ���,�������޵��Ӳ���ѧϰ
		if GetMenPai(sceneId,selfId) ~= MP_XINGSU then
			BeginEvent(sceneId)
        		AddText(sceneId,"�㲻�Ǳ��ɵ��ӣ��Ҳ��ܽ��㡣");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--�����û��ѧ��������
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "�㻹û��ѧ�����������ܣ�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�������ܵȼ��Ѿ�������npc���̵ܽķ�Χ
	if AbilityLevel >= x713593_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:30 �޸� ]
			strText = "Ŀǰ�˼���ֻ��ѧϰ��100��"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713593_g_ScriptId, ABILITY_YINCHONGSHU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713593_g_ScriptId;
		local tempAbilityId = ABILITY_YINCHONGSHU;
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
function x713593_OnEnumerate( sceneId, selfId, targetId )
		--��������ȼ�����ʾѡ��
		if 1 then
			AddNumText(sceneId,x713593_g_ScriptId,"��������������", 12, 1)
		end
		return
end

--**********************************
--����������
--**********************************
function x713593_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713593_OnAccept( sceneId, selfId, ABILITY_YINCHONGSHU )
end

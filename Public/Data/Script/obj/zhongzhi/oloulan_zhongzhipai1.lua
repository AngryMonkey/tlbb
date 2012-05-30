--¥��
--��ֲ��1

--�ű���
x714201_g_ScriptId = 714201

event_xuanzezhiwu = 713550

--ֲ���Ʒ����б�
x714201_g_eventList={20104007,20104008, 20104009, 20104010, 20105007,20105008,20105009, 20105010,} --ֲ��ı��,����scriptId
--**********************************
--�¼��������
--**********************************
function x714201_OnDefaultEvent( sceneId, selfId,targetId )
	--PLANTFLAG[1] =0
	--PLANTFLAG[2] =0
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	--�����Ҳ�����ֲ����
	if AbilityLevel == 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "����ȥѧϰ��ֲ���ܰ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--�����һ���ֲ����
	if AbilityLevel >= 7	then
		BeginEvent(sceneId)
			AddText(sceneId, "ÿ�����ﶼ���Է�Ϊ�����������֣�����ĳ����ڴ��Ϊ5���ӣ�����Ĵ��Ϊ70�������ң����ǵ����ջ�϶ࡣ��Ҫѡ����ֲ�������")
			AddNumText(sceneId, x714201_g_ScriptId, "��ֲ���ֲ��",6,254)
			AddNumText(sceneId, x714201_g_ScriptId, "��ֲ���ֲ��",6,255)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId)
			AddText(sceneId, "����������ֲ�ȼ���7��������")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x714201_OnEventRequest( sceneId, selfId, targetId, eventId )
	local name_Index
	local NumText = GetNumText()

	if NumText == 254 or NumText == 255 then
		BeginEvent(sceneId)
			AddText(sceneId, "��ѡ����Ҫ�ֵ�ֲ��")
			--ͨ��x714201_g_eventList��scriptglobal�е�ֲ���б�Աȣ������������ֲ���ܵȼ�����ʾ��Ӧֲ��
			for i, eventId in x714201_g_eventList do	--������������˿�����ֲ��ֲ���б�
				for j,g_ZhiWuId in V_ZHONGZHI_ID do		--����scriptglobal�е�����ֲ���б�
					if eventId == g_ZhiWuId then
						AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
						if AbilityLevel >= V_ZHONGZHI_NEEDLEVEL[j] then --��������ֲ���ܵȼ�>=��ֲ��Ҫ���ܵȼ�]
							
							if NumText == 254 then
								name_Index = j								
							else
								name_Index = j + getn(V_ZHONGZHI_NAME)/2
							end

							AddNumText(sceneId, x714201_g_ScriptId, V_ZHONGZHI_NAME[name_Index].."("..V_ZHONGZHI_NEEDLEVEL[j].."��)",6,name_Index)
							break
						end
					end
				end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return

	end
	
	zhiwuId = NumText
	for i, findId in x714201_g_eventList do
		if zhiwuId <= getn(V_ZHONGZHI_NAME) then
			CallScriptFunction( 713550, "OnDefaultEvent",sceneId, selfId, targetId, zhiwuId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC��������ʱ��������ӿڣ�
--**********************************
function x714201_OnMissionSubmit( sceneId, selfId, targetId, scriptId )
	for i, findId in x714201_g_eventList do
		if scriptId == findId then
			ret = CallScriptFunction( scriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( scriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )
				CallScriptFunction( scriptId, "OnDefaultEvent",sceneId, selfId, targetId, ABILITY_ZHONGZHI )
			end
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x714201_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x714201_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )	
			end
			return
		end
	end
end


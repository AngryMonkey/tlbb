--����
--��ֲ��1

--�ű���
x714129_g_ScriptId = 714129

event_xuanzezhiwu = 713550

--ֲ���Ʒ����б�
x714129_g_eventList={20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
	                   20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,20105009,20105010} --ֲ��ı��,����scriptId

x714129_g_eventList1 = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010}; --��ʳ����
x714129_g_eventList2 = {20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,20105009,20105010}; --��������

x714129_g_eventList_temp = {};
--**********************************
--�¼��������
--**********************************
function x714129_OnDefaultEvent( sceneId, selfId,targetId )
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
	if AbilityLevel ~= 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "ÿ�����ﶼ���Է�Ϊ�����������֣�����ĳ����ڴ��Ϊ5���ӣ�����Ĵ��Ϊ70�������ң����ǵ����ջ�϶ࡣ��Ҫѡ����ֲ�������")
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_1}",6,254)
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_2}",6,255)
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_3}",6,256)
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_4}",6,257)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x714129_OnEventRequest( sceneId, selfId, targetId, eventId )
	local name_Index
	local NumText = GetNumText()

	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)

	if NumText == 254 or NumText == 255 or NumText == 256 or NumText == 257 then
		BeginEvent(sceneId)
			AddText(sceneId, "��ѡ����Ҫ�ֵ�ֲ��")
			if NumText == 254 or NumText == 256 then
				x714129_g_eventList_temp = x714129_g_eventList1;
			else
				x714129_g_eventList_temp = x714129_g_eventList2;
			end
			--ͨ��x714129_g_eventList��scriptglobal�е�ֲ���б�Աȣ������������ֲ���ܵȼ�����ʾ��Ӧֲ��
			for i, eventId in x714129_g_eventList_temp do	--������������˿�����ֲ��ֲ���б�
				for j,g_ZhiWuId in V_ZHONGZHI_ID do		--����scriptglobal�е�����ֲ���б�
					if eventId == g_ZhiWuId then
						if AbilityLevel >= V_ZHONGZHI_NEEDLEVEL[j] then --��������ֲ���ܵȼ�>=��ֲ��Ҫ���ܵȼ�]

							if NumText == 254 or NumText == 255 then
								name_Index = j
							else
								name_Index = j + getn(V_ZHONGZHI_NAME)/2
							end

							AddNumText(sceneId, x714129_g_ScriptId, V_ZHONGZHI_NAME[name_Index].."("..V_ZHONGZHI_NEEDLEVEL[j].."��)",6,name_Index)
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
	for i, findId in x714129_g_eventList do
		if zhiwuId <= getn(V_ZHONGZHI_NAME) then
			CallScriptFunction( 713550, "OnDefaultEvent",sceneId, selfId, targetId, zhiwuId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC��������ʱ��������ӿڣ�
--**********************************
function x714129_OnMissionSubmit( sceneId, selfId, targetId, scriptId )
	for i, findId in x714129_g_eventList do
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
function x714129_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x714129_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )
			end
			return
		end
	end
end


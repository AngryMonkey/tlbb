--�Ի��¼� npc��ӱ��

--�ű���
x713618_g_ScriptId = 713512

--�Ի�����
x713618_g_dialog = {"#{event_liveabilityevent_0021}",
			"�ڶ��仰",
			"ֻҪ����ѧϰ��ֲ���ܾͿ�����ֲ�ˣ���Ȼ����ĵȼ�Խ�ߣ������ֵ�ֲ������Խ��",
			"ֻҪѧϰ����ֲ���ܣ���û�п�ʼ���ֵ�����Ա��뿴����صĵ����˶Ի���Ȼ��ѡ������ֲ��ֲ��Ϳ�����",
			"#{event_liveabilityevent_0022}"}
x713618_g_button = {"������������˵��ʵ�ʵ�",
			"������������ֲ��?",
			"Ȼ����?",
			"�����ջ���?",
			}

--**********************************
--������ں���
--**********************************
function x713618_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
		BeginEvent(sceneId)
			AddText(sceneId, x713618_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713618_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713618_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713618_g_ScriptId,"�����˽���ֲ",11,-1)
end

--**********************************
--����������
--**********************************
function x713618_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713618_OnAccept( sceneId, selfId, AbilityId )
end

--�Ի��¼� npc��ӱ��

--�ű���
x713612_g_ScriptId = 713512

--�Ի�����
x713612_g_dialog = {"#{event_liveabilityevent_0013}",
			"�ڶ��仰",
			"ֻҪ����ѧϰ��ֲ���ܾͿ�����ֲ�ˣ���Ȼ����ĵȼ�Խ�ߣ������ֵ�ֲ������Խ��",
			"ֻҪѧϰ����ֲ���ܣ���û�п�ʼ���ֵ�����Ա��뿴����صĵ����˶Ի���Ȼ��ѡ������ֲ��ֲ��Ϳ�����",
			"#{event_liveabilityevent_0014}"}
x713612_g_button = {"������������˵��ʵ�ʵ�",
			"������������ֲ��?",
			"Ȼ����?",
			"�����ջ���?",
			}

--**********************************
--������ں���
--**********************************
function x713612_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum�ǶԻ���ţ����ڵ��ò�ͬ�Ի�
		BeginEvent(sceneId)
			AddText(sceneId, x713612_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713612_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713612_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713612_g_ScriptId,"�����˽���ֲ",11,-1)
end

--**********************************
--����������
--**********************************
function x713612_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713612_OnAccept( sceneId, selfId, AbilityId )
end

-- ����
--����
--��·�ű�
x500045_g_scriptId = 500045

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500045_g_Signpost = {
	{ type=2, name="����", x=160, y=257, tip="����", desc="����ͨ�����������û��25���������Ȳ�Ҫȥ����Ϊ�á�", eventId=-1 },
	{ type=2, name="����", x=288, y=152, tip="����", desc="����ͨ������ɽ��10�����µ����ȥ�������á�", eventId=-1 },
	{ type=2, name="����", x=31, y=151, tip="����", desc="����ͨ������10�����µ����ȥ�������á�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500045_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500045_g_Signpost do
		AddNumText(sceneId, x500045_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500045_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500045_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end

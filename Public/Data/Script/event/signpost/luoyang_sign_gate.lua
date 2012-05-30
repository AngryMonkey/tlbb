-- ����
--����
--��·�ű�
x500004_g_scriptId = 500004

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500004_g_Signpost = {
	{ type=2, name="����", x=159, y=251, tip="����", desc="����ͨ����ɽ������15~20�������ǰ����", eventId=-1 },
	{ type=2, name="����", x=260, y=134, tip="����", desc="����ͨ�����ϣ�����30~36�������ǰ����", eventId=-1 },
	{ type=2, name="����", x=58, y=135, tip="����", desc="����ͨ���ػͣ�����9~16�������ǰ����", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500004_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500004_g_Signpost do
		AddNumText(sceneId, x500004_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500004_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500004_g_Signpost[GetNumText()]

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

-- ����
--��ʦ����
--��·�ű�
x500013_g_scriptId = 500013

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500013_g_Signpost = {
	{ type=2, name="���", x=144, y=68, tip="�·�֮", desc="��������·�֮��144��68�����������ڣ�������ݾ�ȥ����������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500013_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500013_g_Signpost do
		AddNumText(sceneId, x500013_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500013_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500013_g_Signpost[GetNumText()]

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

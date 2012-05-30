-- ����
--Ǯׯ
--��·�ű�
x500044_g_scriptId = 500044

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500044_g_Signpost = {
	{ type=2, name="Ǯׯ", x=211, y=172, tip="��ӱ", desc="���ϰ��Ǯׯ�ھ����廪̳��Զ�Ķ����·�ϣ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�Ǯׯ�Ļ�ƿ��԰���洢��Ʒ�ͽ�Ǯ��", eventId=-1 },
	{ type=2, name="����", x=81, y=162, tip="������", desc="�����ϰ庫�����������·�ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500044_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500044_g_Signpost do
		AddNumText(sceneId, x500044_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500044_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500044_g_Signpost[GetNumText()]

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

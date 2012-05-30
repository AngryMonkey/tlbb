-- ����
--Ǯׯ
--��·�ű�
x500003_g_scriptId = 500003

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500003_g_Signpost = {
	{ type=2, name="����", x=95, y=152, tip="������", desc="�����ϰ�����ƣ�95��152���������ڵĵ��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="Ǯׯ", x=80, y=152, tip="����ƽ", desc="Ǯׯ�ϰ�����ƽ��80��152���������ڵ�Ǯׯ�ڣ����Ļ�ƿ��԰���洢��Ʒ�ͽ�Ǯ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="Ԫ����", x=206, y=172, tip="����ү", desc="Ԫ�����˽���ү��206��172���ڶ��С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500003_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500003_g_Signpost do
		AddNumText(sceneId, x500003_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500003_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500003_g_Signpost[GetNumText()]

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

-- ����
--������Ʒ
--��·�ű�
x500042_g_scriptId = 500042

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500042_g_Signpost = {
	{ type=2, name="������", x=216, y=133, tip="����", desc="��������ڶ����·��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���ε�", x=238, y=171, tip="�ƹ���", desc="���ε���ڶ����·�ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��Ʒ��", x=248, y=171, tip="С��", desc="��Ʒ����ڶ����·�ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���޵�", x=265, y=128, tip="��ƮƮ", desc="���޵���ڶ����·������վ�Ķ������򡣰���TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ҩ��", x=102, y=131, tip="¬����", desc="ҩ���������·��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�Ƶ�", x=110, y=159, tip="������", desc="�Ƶ��������·�ϣ���������򵽸������ڻظ���ʳƷ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ӻ���", x=57, y=131, tip="������", desc="�ӻ����������ڣ����ߵ�ũ���Աߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500042_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500042_g_Signpost do
		AddNumText(sceneId, x500042_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500042_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500042_g_Signpost[GetNumText()]

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

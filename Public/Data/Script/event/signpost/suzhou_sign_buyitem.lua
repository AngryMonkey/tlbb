-- ����
--������Ʒ
--��·�ű�
x500021_g_scriptId = 500021

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500021_g_Signpost = {
	{ type=2, name="���ε�", x=217, y=88, tip="�󼾸�", desc="���ε��ϰ��󼾸ߣ�217,88���ڱ��п�����ͷ����������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��Ʒ��", x=217, y=81, tip="����˫", desc="��Ʒ���ϰ�����˫��217,81���ڱ��п�����ͷ����������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���޵�", x=87, y=142, tip="������", desc="���񷻷�����������87,142�����������򱱵ĳ����ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ҩ��", x=99, y=155, tip="����", desc="ҩ���ϰ������99,155���������Ͽڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�Ƶ�", x=190, y=168, tip="������", desc="�Ƶ��ϰ�����٣�190,168����״Ԫ���ϱߵľƵ��ſڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ӻ���", x=128, y=173, tip="������", desc="�ӻ����ϰ�������128,173���ڷ��Ž����ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ʯ����", x=110, y=133, tip="�����", desc="��ʯ���˷���ɣ�110,133��������·��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500021_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500021_g_Signpost do
		AddNumText(sceneId, x500021_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500021_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500021_g_Signpost[GetNumText()]

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

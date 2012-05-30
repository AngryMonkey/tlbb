--��ң
--��·�ű�
x500069_g_scriptId = 500069

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500069_g_Signpost = {
	{ type=2, name="�ݼ�����", x=125, y=144, tip="����", desc="�������������Ǻ��������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="������ң��", x=125, y=144, tip="���Ǻ�", desc="#{JRMP_090113_03}", eventId=-1 },
	{ type=2, name="ѧϰ��ң��ս������", x=125, y=142, tip="ѧϰ��ң��ս������", desc="��������Խ����㱾���书���������㡣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ң�������", x=62, y=68, tip="ѧϰ��ң�������", desc="��۵ķ밢�����Խ��������Ŷݼ���������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ң�ɸ�������", x=53, y=150, tip="ѧϰ��ң�ɸ�������", desc="ѧϰ��ң�ɸ���������Ҫ��˼����ʯ��¶������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ң����˼���", x=53, y=56, tip="ѧϰ��˼���", desc="�������̸�����˼��ܣ������鷿�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=65, y=55, tip="��������", desc="��¹����Աƈ��������������鷿�Աߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ң������", x=120, y=153, tip="��ң������", desc="��ң�����񷢲����ع������㡣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ң�ɴ�����", x=48, y=124, tip="��ң�ɴ�����", desc="����ٶ��ߵ�����ܿ��Դ���ȥ�������������ݻ����������ɡ�С����������Ŷ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ȵ�", x=62, y=68, tip="�ȵ�", desc="��۵ķ밢�����Դ����ɵ��ӵ���ң�ȵס�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ң���Ṧ", x=54, y=149, tip="��ң���Ṧ������", desc="ѧϰ��ң���ṦҪ��˼��������ʯ���ء�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500069_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500069_g_Signpost do
		AddNumText(sceneId, x500069_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500069_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500069_g_Signpost[GetNumText()]

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

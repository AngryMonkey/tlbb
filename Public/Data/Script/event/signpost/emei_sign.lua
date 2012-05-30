--����
--��·�ű�
x500065_g_scriptId = 500065

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500065_g_Signpost = {
	{ type=2, name="�ݼ�����", x=96, y=73, tip="����", desc="������˫�ű��棬һֱ�����߾Ϳ������ˡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�������", x=96, y=51, tip="��ʮ����", desc="#{JRMP_090113_07}", eventId=-1 },
	{ type=2, name="ѧϰ����ս������", x=98, y=51, tip="ѧϰ����ս������", desc="���Ƕ�������̻����ѧϰ���յģ�������������ǰ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ���������", x=43, y=108, tip="ѧϰ���������", desc="������ʹ�����ɶ��е��Ʒ����ܣ�����Ե��ܷ�����ȥ����������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ���Ҹ�������", x=39, y=109, tip="ѧϰ���Ҹ�������", desc="���������Ʒ��ĸ������ܣ��ܷ����Ƶ��������̸���ġ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ������˼���", x=141, y=51, tip="ѧϰ��˼���", desc="��ˮ��������ˮ��̸�����˷�˵ı��졣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=145, y=53, tip="��������", desc="�������һֻ��˾͵���ˮ����������񡣰���TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=95, y=86, tip="��������", desc="��˫�ŵ�����ʦ���������˰�æ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���Ҵ�����", x=86, y=142, tip="���Ҵ�����", desc="�������ϵ���������Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�һ���", x=96, y=73, tip="�һ���", desc="������һ����Ҫ��˫�ű��������š�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����Ṧ", x=105, y=58, tip="�����Ṧ������", desc="ѧϰ�����Ṧ��˫�ű�������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500065_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500065_g_Signpost do
		AddNumText(sceneId, x500065_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500065_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500065_g_Signpost[GetNumText()]

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

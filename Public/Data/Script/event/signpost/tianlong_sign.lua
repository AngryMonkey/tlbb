--����
--��·�ű�
x500066_g_scriptId = 500066

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500066_g_Signpost = {
	{ type=2, name="�ݼ�����", x=96, y=66, tip="����", desc="����ݼ������ʦ�������ڴ��۱������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����������", x=96, y=66, tip="����", desc="#{JRMP_090113_06}", eventId=-1 },
	{ type=2, name="ѧϰ������ս������", x=97, y=67, tip="ѧϰ������ս������", desc="���۱����ſڵı��ۻ���㱾���书������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����������", x=35, y=86, tip="ѧϰ�����������", desc="��ɽ�����ı����ʦ���Խ����ƹƼ��ܡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����ɸ�������", x=64, y=151, tip="ѧϰ�����ɸ�������", desc="ǧѰ̨�ı��ο��Խ̸��㾭���پ����ܡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��������˼���", x=148, y=92, tip="ѧϰ��˼���", desc="��ѧϰ�����������ţ�ɣ���������ǡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=146, y=95, tip="��������", desc="����һƥƯ������������������ţ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����������", x=95, y=88, tip="����������", desc="������ʦ����Ҫ���ɵ��Ӱ�æ�������۱����ϱߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�����ɴ�����", x=99, y=120, tip="�����ɴ�����", desc="ɽ�Ŵ����������Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����", x=35, y=86, tip="����", desc="���ɵ��Ӳ������������ף��ҿ�ɽ�����ı����ʦ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�������Ṧ", x=35, y=86, tip="�������Ṧ������", desc="�����Ժ��ʢ�������Խ̸��㱾���Ṧ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500066_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500066_g_Signpost do
		AddNumText(sceneId, x500066_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500066_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500066_g_Signpost[GetNumText()]

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

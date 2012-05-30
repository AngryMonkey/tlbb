--����
--��·�ű�
x500061_g_scriptId = 500061

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500061_g_Signpost = {
	{ type=2, name="�ݼ�����", x=38, y=98, tip="����", desc="����ݼ����ȴ�ʦ�������ڴ�ĦԺ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����������", x=89, y=72, tip="���ּ�������", desc="#{JRMP_090113_04}", eventId=-1 },
	{ type=2, name="ѧϰ����ս������", x=91, y=71, tip="ѧϰ����ս������", desc="���־����������£����Ѵ�ʦ���Խ̸��㣬���ڴ��۱����ſڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ���������", x=128, y=86, tip="ѧϰ���������", desc="���ɴ�ʦ���Խ̸������ֶ��еĿ��⼼�ܣ���������Ժ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ���ָ�������", x=135, y=90, tip="ѧϰ���ɸ�������", desc="������ʦ���Խ̸���𷨼��ܣ���������Ժ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ������˼���", x=57, y=88, tip="ѧϰ��˼���", desc="�����ʦ���Խ�������ϻ��ı��죬������¥���ϱߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=60, y=82, tip="��������", desc="�������������ʦ�����ϻ���������¥���ϱߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����������", x=96, y=89, tip="��������", desc="���������Щ�������һ۷�ʦ�ְɣ����ڴ��۱����ϱߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�����ɴ�����", x=932, y=131, tip="���ɴ�����", desc="ɽ���ڵĻ���ʦ�ֿ��Դ���ȥ�������������ݺ��������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����", x=61, y=62, tip="�����ػ���", desc="����ս���־���¥�����δ�ʦ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����Ṧ", x=38, y=102, tip="�����Ṧ������", desc="ѧϰ�Ṧȥ��ĦԺ�Ҳ������á�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500061_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500061_g_Signpost do
		AddNumText(sceneId, x500061_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500061_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500061_g_Signpost[GetNumText()]

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

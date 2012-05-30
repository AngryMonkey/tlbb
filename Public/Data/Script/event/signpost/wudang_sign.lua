--�䵱
--��·�ű�
x500064_g_scriptId = 500064

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500064_g_Signpost = {
	{ type=2, name="�ݼ�����", x=77, y=85, tip="����", desc="������������������ȥ�ݼ���ô������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�����䵱", x=77, y=85, tip="������", desc="#{JRMP_090113_01}", eventId=-1 },
	{ type=2, name="ѧϰ�䵱ս������", x=82, y=84, tip="ѧϰ�䵱ս������", desc="������������Զɽ���Խ����䵱�ɵĵļ��ܡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�䵱�����", x=44, y=56, tip="ѧϰ�䵱�����", desc="���Ƶ��˿��Խ���������ͨ����׾����ҵ����ˡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�䵱��������", x=41, y=58, tip="ѧϰ�䵱��������", desc="����ɢ�˿��Խ��������ͨ����׾����ҵ����ˡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�䵱��˼���", x=102, y=112, tip="ѧϰ��˼���", desc="�������ž��ۻ�̸�����׵ı��졣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=101, y=115, tip="��������", desc="��������ž�Ľ�����ɺ������������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�䵱����", x=78, y=92, tip="�䵱����", desc="�������Ϊ������Щ���飬�͵��������ǰȥ�������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�䵱������", x=101, y=136, tip="�䵱������", desc="�����ű���Ī̫����Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���Է�", x=58, y=73, tip="���Է�", desc="��ʦ�������ع������Է�Ľ��룬������׺���������м䡣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�䵱�Ṧ", x=65, y=109, tip="�䵱�Ṧ������", desc="�����ľ���ɢ�˿��Խ����㱾���Ṧ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500064_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500064_g_Signpost do
		AddNumText(sceneId, x500064_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500064_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500064_g_Signpost[GetNumText()]

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

--��ɽ
--��·�ű�
x500068_g_scriptId = 500068

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500068_g_Signpost = {
	{ type=2, name="�ݼ�����", x=91, y=44, tip="����", desc="�����˲��ڣ�����÷�������ճ������������չ�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="������ɽ��", x=91, y=44, tip="÷��", desc="#{JRMP_090113_05}", eventId=-1 },
	{ type=2, name="ѧϰ��ɽ��ս������", x=88, y=44, tip="ѧϰ��ɽ��ս������", desc="���չ����������Խ̸��㱾���书������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ɽ�������", x=119, y=67, tip="ѧϰ��ɽ�������", desc="������汱�ߵ����Ż�̸����ɵ���������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ɽ�ɸ�������", x=123, y=67, tip="ѧϰ��ɽ�ɸ�������", desc="������汱�ߵ�ʯɩ��̸����ɵ��Ӳɱ���������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ɽ����˼���", x=45, y=69, tip="ѧϰ��˼���", desc="��Ȫ�����«��ͤ���Խ�����˵�ı��졣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=39, y=71, tip="��������", desc="��Ȫ������ηɺ���������㱾�ɵ�����񡣰���TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ɽ������", x=95, y=60, tip="��ɽ������", desc="�����������ұ��ɵ��Ӱ�æ�����������չ��ϱߵ���Ů�����¡�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ɽ�ɴ�����", x=90, y=120, tip="��ɽ�ɴ�����", desc="��ɽ�ɴ��������ϴ���Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��÷��", x=101, y=44, tip="��÷��", desc="�ս�����÷����ػ��ˣ��������չ�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��ɽ���Ṧ", x=98, y=44, tip="��ɽ���Ṧ������", desc="ѧϰ��ɽ���ṦҪ���񽣣��������չ�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500068_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500068_g_Signpost do
		AddNumText(sceneId, x500068_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500068_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500068_g_Signpost[GetNumText()]

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

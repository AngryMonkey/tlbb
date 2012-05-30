-- ����
--����ܴ�ʦ
--��·�ű�
x500046_g_scriptId = 500046

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500046_g_Signpost = {
	{ type=2, name="��ֲ��ʦ", x=277, y=167, tip="�������", desc="��ѧ�ֵؾ͵������ڿ���ũ��Ĺ�����壬�������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ɿ��ʦ", x=214, y=117, tip="ͯ����", desc="ѧ�ɿ�Ҫ��ͯ���������ڱ����̵ĺ��棬��TAB��ͼ��д�����ֵĵط����ǡ�", eventId=-1 },
	{ type=2, name="��ҩ��ʦ", x=99, y=133, tip="����ū", desc="��ҩ��ʦ����ū�������·��ҩ�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���", x=103, y=157, tip="������", desc="����������������·�ϣ��Ƶ��Աߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���մ�ʦ", x=207, y=195, tip="³����", desc="���մ�ʦ³������Ǯׯ���档����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���Ҵ�ʦ", x=240, y=171, tip="��籲�", desc="���Ҵ�ʦ��籲��ڶ����·�ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�����ʦ", x=216, y=109, tip="������", desc="�����ʦ�������ڱ����̺��档����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��⿴�ʦ", x=117, y=157, tip="���ӷ�", desc="��⿴�ʦ���ӷ��������·�ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ҩ��ʦ", x=99, y=128, tip="������", desc="��ҩ��ʦ�������������·��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ع��䷽", x=141, y=133, tip="С��", desc="#G�ع��䷽��#W��ĳ�ֲ��ɿ�ԭ����������ѧ���#G�ӹ��������䷽����ͷ�䷽����/��/�߼�ʳ�����䷽����������䷽#W��ʧ�����Ե�#G����#W��#GС�ߣ�96��127��#W������#G���䷽#W������ۼ۸�#GͳһΪ1��#W��", eventId=-1 },
	{ type=2, name="���ϼӹ�����", x=-1, y=-1, tip="", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--�о��¼�
--**********************************
function x500046_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500046_g_Signpost do
		AddNumText(sceneId, x500046_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500046_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500046_g_Signpost[GetNumText()]

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

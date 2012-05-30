-- ����
--����ܵ�ʦ
--��·�ű�
x500005_g_scriptId = 500005

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500005_g_Signpost = {
	{ type=2, name="��ֲ��ʦ", x=219, y=262, tip="����ũ", desc="�߳��������ţ��ڹ���֮ǰ���ߣ��ͻ���ũ�����ҵ���ֲ��ʦ����ũ��219��262��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ɿ��ʦ", x=212, y=151, tip="Ѧͭ��", desc="�ɿ��ʦѦͭ����212��151���ڶ��еı������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ҩ��ʦ", x=120, y=169, tip="�ϰٲ�", desc="��ҩ��ʦ�ϰٲݣ�120��169��������·��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���", x=207, y=184, tip="����", desc="����棨207��184���ڶ����Ͽڣ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���մ�ʦ", x=60, y=146, tip="������", desc="���մ�ʦ�����٣�60��146���������ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���Ҵ�ʦ", x=193, y=172, tip="����֮", desc="���Ҵ�ʦ����֮��193��172���ڶ��С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�����ʦ", x=213, y=160, tip="���¸�", desc="�����ʦ���¸���213��160���ڶ��еı������ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��⿴�ʦ", x=134, y=152, tip="�����", desc="��⿴�ʦ����죨134��152��������������ֽ��㴦�ľƵ��ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ҩ��ʦ", x=138, y=164, tip="������", desc="��ҩ��ʦ��������138��164�����������ϴ��֮���ҩ���ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������ʦ", x=132, y=156, tip="Ǿޱ", desc="��������ʦǾޱ��132��156��������������ֽ��㴦�ľƵ��ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ҩ��ѧ��ʦ", x=136, y=169, tip="��ӱ��", desc="ҩ��ѧ��ʦ��ӱ����136��169�����������ϴ��֮���ҩ���ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ع��䷽", x=141, y=133, tip="С��", desc="#G�ع��䷽��#W��ĳ�ֲ��ɿ�ԭ����������ѧ���#G�ӹ��������䷽����ͷ�䷽����/��/�߼�ʳ�����䷽����������䷽#W��ʧ�����Ե�#G����#W��#GС�ߣ�96��127��#W������#G���䷽#W������ۼ۸�#GͳһΪ1��#W��", eventId=-1 },
	{ type=2, name="���ϼӹ�����", x=153, y=171, tip="������", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--�о��¼�
--**********************************
function x500005_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500005_g_Signpost do
		AddNumText(sceneId, x500005_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500005_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500005_g_Signpost[GetNumText()]

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

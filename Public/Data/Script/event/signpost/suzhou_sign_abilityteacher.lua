-- ����
--�����
--��·�ű�
x500023_g_scriptId = 500023

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500023_g_Signpost = {
		{ type=2, name="��ֲ��ʦ", x=64, y=200, tip="�ֺ;�", desc="�߳��������������ߣ�����һ��С�žͿ�����ֲ��ʦ�ֺ;���64��200��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="�ɿ��ʦ", x=259, y=132, tip="��С��", desc="�ɿ��ʦ��С�ӣ�259��132���ڳǶ��ı������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="��ҩ��ʦ", x=106, y=109, tip="����֥", desc="��ҩ��ʦ����֥��106��109�������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="�����ʦ", x=238, y=77, tip="��ƽ", desc="�����ʦ��ƽ��238��77���ڳǶ�������ͷ�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="���մ�ʦ", x=109, y=130, tip="����ʡ", desc="���մ�ʦ����ʡ��109��130�������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="���Ҵ�ʦ", x=211, y=90, tip="�໯��", desc="���Ҵ�ʦ�໯����211��90���ڱ��п�����ͷ����������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="�����ʦ", x=251, y=151, tip="Ѧ��", desc="�����ʦѦ��251��151���ڳǶ��ı������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="��⿴�ʦ", x=189, y=173, tip="�ǻ�", desc="��⿴�ʦ�ǻ���189��173����״Ԫ���ϱߵľƵ��ſڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=2, name="�ع��䷽", x=96, y=127, tip="С��", desc="#G�ع��䷽��#W��ĳ�ֲ��ɿ�ԭ����������ѧ���#G�ӹ��������䷽����ͷ�䷽����/��/�߼�ʳ�����䷽����������䷽#W��ʧ�����Ե�#G����#W��#GС�ߣ�96��127��#W������#G���䷽#W������ۼ۸�#GͳһΪ1��#W��", eventId=-1 },
		{ type=2, name="���ϼӹ�����", x=-1, y=-1, tip="", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--�о��¼�
--**********************************
function x500023_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500023_g_Signpost do
		AddNumText(sceneId, x500023_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500023_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500023_g_Signpost[GetNumText()]

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

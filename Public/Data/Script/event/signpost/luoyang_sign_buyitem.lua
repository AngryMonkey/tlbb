-- ����
--������Ʒ
--��·�ű�
x500001_g_scriptId = 500001

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500001_g_Signpost = {
	{ type=2, name="������", x=210, y=154, tip="���¹�", desc="�������ϰ����¹�210��154���ڶ��еı������С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ӻ�����", x=254, y=145, tip="�Ǹ���", desc="�ӻ������Ǹ��飨254��146���ڶ����ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���ε�", x=182, y=183, tip="��Ψ˼", desc="���ε��ƹ���Ψ˼��182��183�����ϴ�ֵķ��εꡣ����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��Ʒ��", x=178, y=177, tip="������", desc="��Ʒ���ƹ�����䣨178��177�����ϴ�ֵķ��εꡣ����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ҩ��", x=135, y=164, tip="������", desc="ҩ���ƹ��������135��164�����ϴ�ֵ�ҩ�ꡣ����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�Ƶ�", x=138, y=140, tip="��ͳ", desc="�Ƶ��ƹ�ͳ��138��140���������·�ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�鱦����", x=63, y=147, tip="�ɷ���", desc="�鱦�����ɷ��ˣ�63��147���������ڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500001_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500001_g_Signpost do
		AddNumText(sceneId, x500001_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500001_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500001_g_Signpost[GetNumText()]

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

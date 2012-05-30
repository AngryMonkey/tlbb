--����
--��·�ű�
x500067_g_scriptId = 500067

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500067_g_Signpost = {
	{ type=2, name="�ݼ�����", x=142, y=55, tip="����", desc="�������ɣ�������أ��������Ž��ޱȡ���������ľ����ȥ�ݼ���ҪС�ģ�С���������Ƴ�ҩ¨�ӡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����������", x=95, y=75, tip="������", desc="#{JRMP_090113_02}", eventId=-1 },
	{ type=2, name="ѧϰ������ս������", x=87, y=70, tip="ѧϰ������ս������", desc="�����ɹ���ʩȫѧϰ�������书������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����������", x=101, y=87, tip="ѧϰ�����������", desc="�����������ܲ����ƶ����쵽��޵���ժ���ӡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����ɸ�������", x=101, y=89, tip="ѧϰ�����ɸ�������", desc="��޵��ʨ���ӿ��Խ̸���������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ��������˼���", x=94, y=46, tip="ѧϰ��˼���", desc="���¹����ƾ��ӿ��Խ�������ţ�����İɣ���ţ����û�ж�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=97, y=46, tip="��������", desc="�����ӵ��һֻ��ţ����͵����¹�����ӥ�ӣ��ٸ�Ǯ���ɲ���Ӧ��С��������һֻ������ţ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����������", x=96, y=92, tip="����������", desc="���񷢲����ڷ��ɵ����޵��м䣬������Ҫ�˰�æ�ء�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�����ɴ�����", x=99, y=150, tip="�����ɴ�����", desc="���ϱ��ſڵ������ӿ��Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="����", x=128, y=78, tip="����", desc="������ĺ���ʦ�ã�������ĺ���ʦ�á���������ʦ�á������Ǻǣ��Ǻ� ������Ŷ���ԣ�ȥ���񶴾��������ˡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�������Ṧ", x=90, y=88, tip="�������Ṧ������", desc="���ɵ��ſڵĳ����ӿ��Խ̸��㱾���Ṧ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500067_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500067_g_Signpost do
		AddNumText(sceneId, x500067_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500067_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500067_g_Signpost[GetNumText()]

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

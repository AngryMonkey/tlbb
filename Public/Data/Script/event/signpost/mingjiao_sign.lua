--����
--��·�ű�
x500062_g_scriptId = 500062

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500062_g_Signpost = {
	{ type=2, name="�ݼ�����", x=98, y=52, tip="����", desc="�벻Ҫ�������������������������ȥ����̳�ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=108, y=56, tip="��������", desc="#{JRMP_090113_08}", eventId=-1 },
	{ type=2, name="ѧϰ����ս������", x=109, y=59, tip="ѧϰ����ս������", desc="ѧϰ����ս�������뵽����̳ȥ�����򴺡�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ���������", x=87, y=61, tip="ѧϰ���������", desc="������̳�ĳ���˿��Խ̸������̶��е�ʥ����������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ���̸�������", x=87, y=58, tip="ѧϰ���̸�������", desc="������̳�ķ��춨���Խ̸������̶��еĲɻ���������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ������˼���", x=66, y=118, tip="ѧϰ��˼���", desc="�ڰ׽��챱�ߵ������ӿ��Խ̻������ʨ�ӡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=64, y=115, tip="��������", desc="������ڰ׽��챱���ҵ���Ԫ������������ʨ�ӡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=98, y=105, tip="��������", desc="ʥ��̨�������������˰�æ��һЩ���ڵ����񡣰���TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���̴�����", x=102, y=167, tip="���̴�����", desc="���ſڵ����̴���ʹ���߷���Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="������", x=89, y=56, tip="������", desc="����̳�Ĺ�����ʹ�������Դ���ȥ��ս������������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰ�����Ṧ", x=133, y=137, tip="�����Ṧ������", desc="��ѧϰ�ṦҪ����ľ�챱�ߵķ��ٻ�������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500062_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500062_g_Signpost do
		AddNumText(sceneId, x500062_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500062_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500062_g_Signpost[GetNumText()]

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

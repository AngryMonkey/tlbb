--ؤ��
--��·�ű�
x500063_g_scriptId = 500063

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500063_g_Signpost = {
	{ type=2, name="����ؤ��", x=91, y=98, tip="�¹���", desc="#{JRMP_090113_09}", eventId=-1 },
	{ type=2, name="ѧϰؤ��ս������", x=94, y=99, tip="ѧϰؤ��ս������", desc="������Ͽ��Խ̸��㱾��ļ��ܣ����ھ������ſڡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰؤ�������", x=114, y=91, tip="ѧϰؤ�������", desc="�������ſڵ��ⳤ�糤�Ͽ��Խ̸�����Ƽ��ܡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰؤ�︨������", x=131, y=83, tip="ѧϰؤ�︨������", desc="����԰ȥ����������������������᲻����������䡣����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰؤ����˼���", x=38, y=89, tip="ѧϰ��˼���", desc="���᷿�Ľ���ͤ���Խ�����������ǡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=54, y=86, tip="��������", desc="�������������᷿������Խ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ؤ������", x=92, y=70, tip="ؤ������", desc="��ͨ�ھ����ú��棬���������˰�æ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ؤ�ﴫ����", x=93, y=118, tip="ؤ�ﴫ����", desc="�����������ȫ����Դ���ȥ�������������ݻ����������ɡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="�ƽ�", x=41, y=144, tip="�ƽ�", desc="�ƽ����˵��ң�ȥС��԰�ҷ�ӡ����ȥ�������ǡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ѧϰؤ���Ṧ", x=112, y=90, tip="ؤ���Ṧ������", desc="�������ſڵ���ѩ�����Խ̸��㱾���Ṧ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500063_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500063_g_Signpost do
		AddNumText(sceneId, x500063_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500063_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500063_g_Signpost[GetNumText()]

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

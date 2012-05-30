-- ����
--ѭ������
--��·�ű�
x500024_g_scriptId = 500024

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500024_g_Signpost = {
	{ type=2, name="��������ʹ", x=234, y=78, tip="½ʿ�", desc="��������ʹ½ʿ�234��78�������ݳǶ����ǵ���ͷ�Աߡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="ˮ��", x=243, y=215, tip="���ӱ�", desc="���ӱ���243��215���ڳǶ��ϵĸ���ǰ���ҵ������Խ���ƽ��ˮ���������񡣰���TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=127, y=133, tip="��d", desc="�����ܲ�ͷ��d��127��133���ڷ��Ƚ֣����������˰���������ͽ���п��ܵõ��ر�ͼŶ������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="���", x=174, y=147, tip="���Ĺ�", desc="��ֻʹ�����Ĺ���174��147����״Ԫ���С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��ɽ�۽�", x=194, y=139, tip="�ս���", desc="��ɽ�۽�ʹ���ս��루194��139����״Ԫ���С�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
	{ type=2, name="��������", x=62, y=162, tip="Ǯ����", desc="����УξǮ���62��162�������ݳ������⣬����������ȡ�����������񡣰���TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500024_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500024_g_Signpost do
		AddNumText(sceneId, x500024_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500024_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500024_g_Signpost[GetNumText()]

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

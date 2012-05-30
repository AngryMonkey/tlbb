-- ����
--��վ
--��·�ű�
x500043_g_scriptId = 500043

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500043_g_Signpost = {
	{ type=2, name="��վ", x=241, y=136, tip="�޷��", desc="������·��������飬��ȥ�����ط���������վ�����ġ���վ���ϴ޾��ڶ���ֵ�·��������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500043_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500043_g_Signpost do
		AddNumText(sceneId, x500043_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500043_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500043_g_Signpost[GetNumText()]

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

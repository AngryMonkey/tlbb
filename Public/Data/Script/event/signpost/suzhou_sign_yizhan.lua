-- ����
--ѭ������
--��·�ű�
x500026_g_scriptId = 500026

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500026_g_Signpost = {
	{ type=2, name="��˷�", x=111, y=160, tip="��˷�", desc="��վ�ϰ���˷磨111��160���������Ͽ��򶫵Ľ��ϡ�����TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
}

--**********************************
--�о��¼�
--**********************************
function x500026_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500026_g_Signpost do
		AddNumText(sceneId, x500026_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500026_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500026_g_Signpost[GetNumText()]

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

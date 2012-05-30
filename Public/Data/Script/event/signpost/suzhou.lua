-- ������·�ű�
x500020_g_scriptId = 500020

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500020_g_Signpost = {
		{ type=1, name="��μ�������", eventId=500049, x=0, y=0, tip=" ", desc=" " },
		{ type=2, name="�����ȡ˫������", x=164, y=80, tip="���", desc="���������Σ�164,80����ȡ˫�����飬�������ݱ��Ÿ���������TAB������ͼ�ϻ�����˸�ı�ʶ�ġ�", eventId=-1 },
		{ type=1, name="���������Ʒ", eventId=500021, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="���������ȥ��ϰ����", eventId=500022, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="����ѧϰ�����", eventId=500023, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="�����븱��", eventId=500024, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="����", eventId=500025, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="��վ", eventId=500026, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="Ǯׯ", eventId=500027, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="װ��ǿ�������", eventId=500028, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="ȥ��ɱ��", eventId=500029, x=0, y=0, tip=" ", desc=" " },
}
--{ type=2, name="������ջ", x=100.7, y=124.2, tip="���ݶ�����ջ", desc="�������Ŀ�ջ֮һ�����̾����ۼ�֮�ء�" },

--**********************************
--�о��¼�
--**********************************
function x500020_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500020_g_scriptId, "�˺Ű�ȫ", -1, 1009)   --�ʺ�  to  �˺�
	for i, signpost in x500020_g_Signpost do
		AddNumText(sceneId, x500020_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500020_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId, "AccountSafe")
--		return
--	end
	signpost = x500020_g_Signpost[GetNumText()]

	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			AddText(sceneId, "�뵽�����е���վ������Tab���Դ򿪵�ͼ�鿴#G��#W���������͵������ʦ�����ɡ���������֮����#G����ָ·��#W�Ϳ���ѯ�ʰ�ʦ��λ���ˡ����߰�tab���򿪵�ͼ��#Gʦ#W������")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 111, 160, "��˷�" )
		return
	end
		
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

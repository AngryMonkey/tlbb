-- ������·�ű�
x500000_g_scriptId = 500000

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500000_g_Signpost = {
		{ type=1, name="�����ȡ˫������", eventId=500049, x=0, y=0, tip=" ", desc=" " },		--�޵����ű�
		{ type=1, name="��μ�������", eventId=500049, x=0, y=0, tip=" ", desc=" " },			--�޵����ű�
		{ type=1, name="���������Ʒ", eventId=500001, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��վ", eventId=500002, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ǯׯ�����̡�Ԫ������", eventId=500003, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="���������ȥ��ϰ����", eventId=500004, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="ѧϰһЩ�����", eventId=500005, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="�����븱��", eventId=500006, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��Ҫ���", eventId=500007, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="����", eventId=500008, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="�̻�", eventId=500009, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="���", eventId=500010, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��̨", eventId=500011, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��ʯ�ϳ�", eventId=500012, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="���", eventId=500013, x=0, y=0, tip=" ", desc=" " },
}
--{ type=2, name="������ջ", x=100.7, y=124.2, tip="����������ջ", desc="�������Ŀ�ջ֮һ�����̾����ۼ�֮�ء�" },

--**********************************
--�о��¼�
--**********************************
function x500000_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500000_g_scriptId, "�˺Ű�ȫ", -1, 1009)   --�ʺ�  to  �˺�
	for i, signpost in x500000_g_Signpost do
		AddNumText(sceneId, x500000_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500000_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId, "AccountSafe")
--		return
--	end
	signpost = x500000_g_Signpost[GetNumText()]
	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			AddText(sceneId, "�뵽�����Ĺ㳡��150��91������������ȡ˫�����顣")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 150, 91, "������" )
		return
	end
	
	if GetNumText()==2 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			AddText(sceneId, "�뵽�����е���վ������Tab���Դ򿪵�ͼ�鿴#G��#W���������͵������ʦ�����ɡ���������֮����#G����ָ·��#W�Ϳ���ѯ�ʰ�ʦ��λ���ˡ����߰�tab���򿪵�ͼ��#Gʦ#W������")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 139, 182, "��²�" )
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

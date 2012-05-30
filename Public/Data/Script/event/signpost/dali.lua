-- ������·�ű�
x500040_g_scriptId = 500040

-- ��·���� type: 1 Ϊ�����˵�, 2 Ϊֱ����·
x500040_g_Signpost = {
		{ type=1, name="��μ�������", eventId=500049, x=0, y=0, tip=" ", desc=" " },		--ע�⣬��һ�����ǵ�����һ���ű��ķ�ʽ�������ڱ��ļ���ֱ���жϡ�������ʹ�ô��ַ�ʽ
		{ type=1, name="�Ŵ����ɴ�����", eventId=500041, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="���������Ʒ", eventId=500042, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��վ", eventId=500043, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ǯׯ������", eventId=500044, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="���������ȥ��ϰ����", eventId=500045, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="ѧϰһЩ�����", eventId=500046, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="�����븱��", eventId=500047, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��̨", eventId=500048, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="��ʦ", eventId=500049, x=0, y=0, tip=" ", desc=" " },
}

--{ type=2, name="������ջ", x=100.7, y=124.2, tip="��������ջ", desc="�������Ŀ�ջ֮һ�����̾����ۼ�֮�ء�" },
--{ type=2, name="����", x=180.0, y=120.0, tip="������Ȣ�ް�ʦ������ʦ�ĺ�ȥ����", desc="��������ʵ������������롫����" },


--**********************************
--�о��¼�
--**********************************
function x500040_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500040_g_scriptId, "�˺Ű�ȫ", -1, 1009)   --�ʺ�  to  �˺�
	for i, signpost in x500040_g_Signpost do
		AddNumText(sceneId, x500040_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--������ں���
--**********************************
function x500040_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId,"AccountSafe")
--		return
--	end
	signpost = x500040_g_Signpost[GetNumText()]
	
	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "��")
			AddText(sceneId, "�뵽�����е���վ������Tab���Դ򿪵�ͼ�鿴#G��#W���������͵������ʦ�����ɡ���������֮����#G����ָ·��#W�Ϳ���ѯ�ʰ�ʦ��λ���ˡ����߰�tab���򿪵�ͼ��#Gʦ#W������")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 241, 136, "�޷��" )
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

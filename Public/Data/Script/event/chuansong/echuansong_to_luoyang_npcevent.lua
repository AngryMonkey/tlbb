--�¼�
--���͵�����

--�ű���
x400919_g_ScriptId = 400919

--�����ı�����
x400919_g_MissionName="���һ�������"
x400919_g_MissionInfo="�������꿤���ɹ��������ݵıؾ�֮�أ�����·�϶���ö��ԭ������������ɱ���ǰ��ǲŸҳ�ȥ�˲��ϡ�"  --��������
x400919_g_MissionTarget="ɱ��5ֻ��ԭ��"		--����Ŀ��
x400919_g_ContinueInfo="���Ѿ�ɱ��5ֻ��ԭ�������Ǿ��ڴ����ϱߣ����߾Ϳ����ˡ�С�ĵ㰡����һȺ��Χ��������Ͱ�Ϲ�ˡ�"		--δ��������npc�Ի�
x400919_g_MissionComplete="лл�����������ڸҳ�����"					--�������npc˵���Ļ�

--**********************************
--��ں���
--**********************************
function x400919_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 159, 240)
end

--**********************************
--�о��¼�
--**********************************
function x400919_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x400919_g_ScriptId,x400919_g_MissionName)
end

--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801007_g_ScriptId = 801007;

--Ҫ��ʾ�ļ����б� 
x801007_g_DemoSkills = {};
--����������  x801007_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801007_g_DemoSkills[850]="�����";
x801007_g_DemoSkills[851]="�ط����";
x801007_g_DemoSkills[852]="�г��޳�";
x801007_g_DemoSkills[853]="��������";
x801007_g_DemoSkills[854]="�ǿݷ���";
x801007_g_DemoSkills[855]="��������";
x801007_g_DemoSkills[856]="���سɷ�";
x801007_g_DemoSkills[857]="���ﳯ��";
x801007_g_DemoSkills[858]="�׾Թ�϶";
x801007_g_DemoSkills[859]="����";
x801007_g_DemoSkills[860]="������";
x801007_g_DemoSkills[861]="���̽�";
x801007_g_DemoSkills[862]="�׺����";
x801007_g_DemoSkills[863]="΢��˽��";
x801007_g_DemoSkills[864]="�������";

--��ӵ�е��¼�Id�б�
x801007_g_eventList={850,851,852,853,854,855,856,857,858,859,860,861,862,863,864};
--**********************************
--�¼��������
--**********************************
function x801007_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801007_g_eventList) do 
	for nIdx, nEvent in x801007_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801007_g_DemoSkills[nEvent],11,-1);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801007_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801007, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801004_g_ScriptId = 801004;

--Ҫ��ʾ�ļ����б� 
x801004_g_DemoSkills = {};
--����������  x801004_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801004_g_DemoSkills[800]="��Ů����";
x801004_g_DemoSkills[801]="��������";
x801004_g_DemoSkills[802]="���ӳ�ˮ";
x801004_g_DemoSkills[803]="�׺�����";
x801004_g_DemoSkills[804]="����ͷ";
x801004_g_DemoSkills[805]="˫����";
x801004_g_DemoSkills[806]="��������";
x801004_g_DemoSkills[807]="��ȸβ";
x801004_g_DemoSkills[808]="�����ĭ";
x801004_g_DemoSkills[809]="������";
x801004_g_DemoSkills[810]="Ұ�����";
x801004_g_DemoSkills[811]="����Ʊ�";
x801004_g_DemoSkills[812]="��÷ӳѩ";
x801004_g_DemoSkills[813]="�����";
x801004_g_DemoSkills[814]="�����߽���";

--��ӵ�е��¼�Id�б�
x801004_g_eventList={800,801,802,803,804,805,806,807,808,809,810,811,812,813,814};
--**********************************
--�¼��������
--**********************************
function x801004_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801004_g_eventList) do 
	for nIdx, nEvent in x801004_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801004_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801004_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId,  eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

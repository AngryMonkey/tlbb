--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801009_g_ScriptId = 801009;

--Ҫ��ʾ�ļ����б� 
x801009_g_DemoSkills = {};
--����������  x801009_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801009_g_DemoSkills[881]="������̾";
x801009_g_DemoSkills[882]="������";
x801009_g_DemoSkills[883]="���Ž���";
x801009_g_DemoSkills[884]="һ�ֳ���";
x801009_g_DemoSkills[885]="̫������";
x801009_g_DemoSkills[886]="����ͼ";
x801009_g_DemoSkills[887]="���۽�";
x801009_g_DemoSkills[888]="����֮��";
x801009_g_DemoSkills[889]="������";
x801009_g_DemoSkills[890]="�R��΢��";
x801009_g_DemoSkills[891]="��˪����";
x801009_g_DemoSkills[892]="���ܹ���";
x801009_g_DemoSkills[893]="�˱�����";
x801009_g_DemoSkills[894]="����ĺ��";
x801009_g_DemoSkills[895]="һ����Ӧ";

--��ӵ�е��¼�Id�б�
x801009_g_eventList={881,882,883,884,885,886,887,888,889,890,891,892,893,894,895};
--**********************************
--�¼��������
--**********************************
function x801009_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801009_g_eventList) do 
	for nIdx, nEvent in x801009_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801009_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801009_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801009, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

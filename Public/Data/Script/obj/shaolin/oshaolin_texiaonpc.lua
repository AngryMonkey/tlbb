--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801001_g_ScriptId = 801001;

--Ҫ��ʾ�ļ����б� 
x801001_g_DemoSkills = {};
--����������  x801001_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801001_g_DemoSkills[752]="������";
x801001_g_DemoSkills[753]="��շ�ħȦ";
x801001_g_DemoSkills[754]="һ����ɢ";
x801001_g_DemoSkills[755]="Τ����";
x801001_g_DemoSkills[756]="������";
x801001_g_DemoSkills[757]="�����ָ";
x801001_g_DemoSkills[758]="�޺���";
x801001_g_DemoSkills[759]="ʨ�Ӻ�";
x801001_g_DemoSkills[760]="�Ⱥ��ն�";
x801001_g_DemoSkills[761]="������";
x801001_g_DemoSkills[762]="һέ�ɽ�";
x801001_g_DemoSkills[763]="����ȫ��";
x801001_g_DemoSkills[764]="Ħڭ����";
x801001_g_DemoSkills[765]="����Ҷָ";
x801001_g_DemoSkills[766]="������";
 
--��ӵ�е��¼�Id�б�
x801001_g_eventList={752,753,754,755,756,757,758,759,760,761,762,763,764,765,766};
--**********************************
--�¼��������
--**********************************
function x801001_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801001_g_eventList) do 
	for nIdx, nEvent in x801001_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801001_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801001_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

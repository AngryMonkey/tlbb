--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801003_g_ScriptId = 801003;

--Ҫ��ʾ�ļ����б� 
x801003_g_DemoSkills = {};
--����������  x801003_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801003_g_DemoSkills[784]="��Ȼ����";
x801003_g_DemoSkills[785]="���ζ���";
x801003_g_DemoSkills[786]="��������";
x801003_g_DemoSkills[787]="������β";
x801003_g_DemoSkills[788]="��������";
x801003_g_DemoSkills[789]="�����л�";
x801003_g_DemoSkills[790]="�����ۻ�";
x801003_g_DemoSkills[791]="����ҽ�";
x801003_g_DemoSkills[792]="�������";
x801003_g_DemoSkills[793]="�����޹�";
x801003_g_DemoSkills[794]="��������";
x801003_g_DemoSkills[795]="ѹ�⹷��";
x801003_g_DemoSkills[796]="������Ϊǿ";
x801003_g_DemoSkills[797]="����ѿ�";
x801003_g_DemoSkills[798]="������ȱ";

--��ӵ�е��¼�Id�б�
x801003_g_eventList={784,785,786,787,788,789,790,791,792,793,794,795,796,797,798};
--**********************************
--�¼��������
--**********************************
function x801003_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801003_g_eventList) do 
	for nIdx, nEvent in x801003_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801003_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801003_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId,eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801003, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

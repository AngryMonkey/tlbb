--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801005_g_ScriptId = 801005;

--Ҫ��ʾ�ļ����б� 
x801005_g_DemoSkills = {};
--����������  x801005_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801005_g_DemoSkills[816]="������";
x801005_g_DemoSkills[818]="������צ";
x801005_g_DemoSkills[819]="̫������";
x801005_g_DemoSkills[820]="�������";
x801005_g_DemoSkills[821]="����ɽ�";
x801005_g_DemoSkills[822]="����֮��";
x801005_g_DemoSkills[823]="��������";
x801005_g_DemoSkills[824]="�������";
x801005_g_DemoSkills[825]="��������";
x801005_g_DemoSkills[826]="��������";
x801005_g_DemoSkills[827]="�ƻ��";
x801005_g_DemoSkills[828]="�׽�͹�";
x801005_g_DemoSkills[829]="��������";
x801005_g_DemoSkills[830]="��������";
x801005_g_DemoSkills[831]="����֮Ȫ";

--��ӵ�е��¼�Id�б�
x801005_g_eventList={816,818,819,820,821,822,823,824,825,826,827,828,829,830,831};
--**********************************
--�¼��������
--**********************************
function x801005_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801005_g_eventList) do 
	for nIdx, nEvent in x801005_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801005_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801005_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801005, "LuaFnUnitUseSkill",sceneId, selfId,eventId ,targetId);
	--return;
end

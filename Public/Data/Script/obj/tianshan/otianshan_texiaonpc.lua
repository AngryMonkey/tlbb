--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801008_g_ScriptId = 801008;

--Ҫ��ʾ�ļ����б� 
x801008_g_DemoSkills = {};
--����������  x801008_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801008_g_DemoSkills[865]="��ľ����";
x801008_g_DemoSkills[866]="��÷ֹ��";
x801008_g_DemoSkills[867]="��������";
x801008_g_DemoSkills[868]="������Υ";
x801008_g_DemoSkills[869]="�������";
x801008_g_DemoSkills[870]="������ѩ";
x801008_g_DemoSkills[871]="̤ѩ�޺�";
x801008_g_DemoSkills[872]="��Ϣ��";
x801008_g_DemoSkills[873]="�����ݺ�";
x801008_g_DemoSkills[874]="ʮ�����";
x801008_g_DemoSkills[875]="Խ�޴���";
x801008_g_DemoSkills[876]="��ȥ����";
x801008_g_DemoSkills[877]="ƾ������";
x801008_g_DemoSkills[878]="��Ӱ���";
x801008_g_DemoSkills[879]="��������";

--��ӵ�е��¼�Id�б�
x801008_g_eventList={865,866,867,868,869,870,871,872,873,874,875,876,877,878,879};
--**********************************
--�¼��������
--**********************************
function x801008_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801008_g_eventList) do 
	for nIdx, nEvent in x801008_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801008_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801008_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801008, "LuaFnUnitUseSkill",sceneId, selfId, eventId , targetId);
	--return;
end

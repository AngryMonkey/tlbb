--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801002_g_ScriptId = 801002;

--Ҫ��ʾ�ļ����б� 
x801002_g_DemoSkills = {};
--����������  x801002_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801002_g_DemoSkills[768]="������Ƣ";
x801002_g_DemoSkills[769]="��������";
x801002_g_DemoSkills[770]="���ͬ��";
x801002_g_DemoSkills[771]="��������";
x801002_g_DemoSkills[772]="���ǳ���";
x801002_g_DemoSkills[773]="�����䳤��";
x801002_g_DemoSkills[774]="���аٱ�";
x801002_g_DemoSkills[775]="ָ¹Ϊ��";
x801002_g_DemoSkills[776]="͵������";
x801002_g_DemoSkills[777]="Ǩŭ����";
x801002_g_DemoSkills[778]="ŭ�����";
x801002_g_DemoSkills[779]="����֮ŭ";
x801002_g_DemoSkills[780]="�������";
x801002_g_DemoSkills[781]="�������";
x801002_g_DemoSkills[782]="��ʯ���";
 
--��ӵ�е��¼�Id�б�
x801002_g_eventList={768,769,770,771,772,773,774,775,776,777,778,779,780,781,782};
--**********************************
--�¼��������
--**********************************
function x801002_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801002_g_eventList) do 
	for nIdx, nEvent in x801002_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801002_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801002_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

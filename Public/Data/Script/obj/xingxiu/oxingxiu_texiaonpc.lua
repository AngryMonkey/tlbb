--NPC��ʾ������Ч��
--��ʾNPC
--��ͨ
--���NPC����ǲ��ỹ�֣��ɹ��������ǲ����ܵ��κ��˺�
--�ű���
x801006_g_ScriptId = 801006;

--Ҫ��ʾ�ļ����б� 
x801006_g_DemoSkills = {};
--����������  x801006_g_DemoSkills[���ܵı��] = "���ܵ�����"; ע�������Ѽ��ܵı�ŵ��¼���ʹ�� 

x801006_g_DemoSkills[834]="���鸯ʬ��";
x801006_g_DemoSkills[835]="����͸��";
x801006_g_DemoSkills[836]="���ֹ��";
x801006_g_DemoSkills[837]="�����ˮ";
x801006_g_DemoSkills[838]="��ͷ�ö�";
x801006_g_DemoSkills[839]="�ƻ���ľ";
x801006_g_DemoSkills[840]="Ц��ص�";
x801006_g_DemoSkills[841]="Ц�ڳ���";
x801006_g_DemoSkills[842]="Ц�����";
x801006_g_DemoSkills[843]="��ɳ��Ӱ";
x801006_g_DemoSkills[844]="�������";
x801006_g_DemoSkills[845]="����ľ��";
x801006_g_DemoSkills[846]="ˮ���߾�";
x801006_g_DemoSkills[847]="��ʬ����";
x801006_g_DemoSkills[848]="�����ӯ";
--��ӵ�е��¼�Id�б�
x801006_g_eventList={834,835,836,837,838,839,840,841,842,843,844,845,846,847,848};
--**********************************
--�¼��������
--**********************************
function x801006_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    ��ӭ���١���ѡ����Ҫ�ۿ��ļ��ܡ�");
--	for i=1,getn(x801006_g_eventList) do 
	for nIdx, nEvent in x801006_g_eventList do
		--�����ʾ���ܵİ�ť 
		AddNumText(sceneId, nEvent, x801006_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x801006_OnEventRequest( sceneId, selfId, targetId, eventId )
	--����selfId,��TargetId�ֱ���ʲô��ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801006, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

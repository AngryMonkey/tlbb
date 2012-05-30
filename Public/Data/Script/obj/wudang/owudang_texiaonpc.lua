--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801004_g_ScriptId = 801004;

--要演示的技能列表 
x801004_g_DemoSkills = {};
--声明方法：  x801004_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801004_g_DemoSkills[800]="玉女穿梭";
x801004_g_DemoSkills[801]="游刃有余";
x801004_g_DemoSkills[802]="燕子抄水";
x801004_g_DemoSkills[803]="白鹤亮翅";
x801004_g_DemoSkills[804]="虎抱头";
x801004_g_DemoSkills[805]="双峰贯耳";
x801004_g_DemoSkills[806]="三环套月";
x801004_g_DemoSkills[807]="揽雀尾";
x801004_g_DemoSkills[808]="相濡以沫";
x801004_g_DemoSkills[809]="梯云纵";
x801004_g_DemoSkills[810]="野马分鬃";
x801004_g_DemoSkills[811]="如封似闭";
x801004_g_DemoSkills[812]="寒梅映雪";
x801004_g_DemoSkills[813]="大魁星";
x801004_g_DemoSkills[814]="真武七截阵";

--所拥有的事件Id列表
x801004_g_eventList={800,801,802,803,804,805,806,807,808,809,810,811,812,813,814};
--**********************************
--事件交互入口
--**********************************
function x801004_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801004_g_eventList) do 
	for nIdx, nEvent in x801004_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801004_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801004_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId,  eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

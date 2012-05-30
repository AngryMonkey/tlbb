--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801005_g_ScriptId = 801005;

--要演示的技能列表 
x801005_g_DemoSkills = {};
--声明方法：  x801005_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801005_g_DemoSkills[816]="环佩归魂";
x801005_g_DemoSkills[818]="九阴神爪";
x801005_g_DemoSkills[819]="太阿倒持";
x801005_g_DemoSkills[820]="佛光普照";
x801005_g_DemoSkills[821]="金针渡劫";
x801005_g_DemoSkills[822]="宁静之雨";
x801005_g_DemoSkills[823]="冲虚养气";
x801005_g_DemoSkills[824]="妙笔生花";
x801005_g_DemoSkills[825]="起死回生";
x801005_g_DemoSkills[826]="经脉逆行";
x801005_g_DemoSkills[827]="移魂大法";
x801005_g_DemoSkills[828]="易筋锻骨";
x801005_g_DemoSkills[829]="万岳朝宗";
x801005_g_DemoSkills[830]="延年益寿";
x801005_g_DemoSkills[831]="生命之泉";

--所拥有的事件Id列表
x801005_g_eventList={816,818,819,820,821,822,823,824,825,826,827,828,829,830,831};
--**********************************
--事件交互入口
--**********************************
function x801005_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801005_g_eventList) do 
	for nIdx, nEvent in x801005_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801005_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801005_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801005, "LuaFnUnitUseSkill",sceneId, selfId,eventId ,targetId);
	--return;
end

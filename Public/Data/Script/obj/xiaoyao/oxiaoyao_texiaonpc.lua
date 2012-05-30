--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801009_g_ScriptId = 801009;

--要演示的技能列表 
x801009_g_DemoSkills = {};
--声明方法：  x801009_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801009_g_DemoSkills[881]="望洋兴叹";
x801009_g_DemoSkills[882]="蝴蝶阵";
x801009_g_DemoSkills[883]="八门金锁";
x801009_g_DemoSkills[884]="一字长蛇";
x801009_g_DemoSkills[885]="太乙三才";
x801009_g_DemoSkills[886]="八阵图";
x801009_g_DemoSkills[887]="火眼金睛";
x801009_g_DemoSkills[888]="众妙之门";
x801009_g_DemoSkills[889]="神光离合";
x801009_g_DemoSkills[890]="淩波微步";
x801009_g_DemoSkills[891]="履霜冰至";
x801009_g_DemoSkills[892]="欲擒故纵";
x801009_g_DemoSkills[893]="退避三舍";
x801009_g_DemoSkills[894]="朝三暮四";
x801009_g_DemoSkills[895]="一呼百应";

--所拥有的事件Id列表
x801009_g_eventList={881,882,883,884,885,886,887,888,889,890,891,892,893,894,895};
--**********************************
--事件交互入口
--**********************************
function x801009_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801009_g_eventList) do 
	for nIdx, nEvent in x801009_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801009_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801009_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801009, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

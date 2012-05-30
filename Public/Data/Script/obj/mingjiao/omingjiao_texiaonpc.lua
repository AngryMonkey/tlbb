--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801002_g_ScriptId = 801002;

--要演示的技能列表 
x801002_g_DemoSkills = {};
--声明方法：  x801002_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801002_g_DemoSkills[768]="催心裂脾";
x801002_g_DemoSkills[769]="玄阴至阳";
x801002_g_DemoSkills[770]="天地同寿";
x801002_g_DemoSkills[771]="五星连珠";
x801002_g_DemoSkills[772]="火星冲日";
x801002_g_DemoSkills[773]="七星落长空";
x801002_g_DemoSkills[774]="神行百变";
x801002_g_DemoSkills[775]="指鹿为马";
x801002_g_DemoSkills[776]="偷梁换柱";
x801002_g_DemoSkills[777]="迁怒于人";
x801002_g_DemoSkills[778]="怒发冲冠";
x801002_g_DemoSkills[779]="雷霆之怒";
x801002_g_DemoSkills[780]="义愤填膺";
x801002_g_DemoSkills[781]="厚积薄发";
x801002_g_DemoSkills[782]="金石俱焚";
 
--所拥有的事件Id列表
x801002_g_eventList={768,769,770,771,772,773,774,775,776,777,778,779,780,781,782};
--**********************************
--事件交互入口
--**********************************
function x801002_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801002_g_eventList) do 
	for nIdx, nEvent in x801002_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801002_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801002_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801003_g_ScriptId = 801003;

--要演示的技能列表 
x801003_g_DemoSkills = {};
--声明方法：  x801003_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801003_g_DemoSkills[784]="沛然有雨";
x801003_g_DemoSkills[785]="遨游东海";
x801003_g_DemoSkills[786]="见龙在田";
x801003_g_DemoSkills[787]="神龙摆尾";
x801003_g_DemoSkills[788]="飞龙在天";
x801003_g_DemoSkills[789]="亢龙有悔";
x801003_g_DemoSkills[790]="隔岸观火";
x801003_g_DemoSkills[791]="李代桃僵";
x801003_g_DemoSkills[792]="瞒天过海";
x801003_g_DemoSkills[793]="天下无狗";
x801003_g_DemoSkills[794]="拨狗朝天";
x801003_g_DemoSkills[795]="压扁狗背";
x801003_g_DemoSkills[796]="先下手为强";
x801003_g_DemoSkills[797]="金蝉脱壳";
x801003_g_DemoSkills[798]="抱残守缺";

--所拥有的事件Id列表
x801003_g_eventList={784,785,786,787,788,789,790,791,792,793,794,795,796,797,798};
--**********************************
--事件交互入口
--**********************************
function x801003_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801003_g_eventList) do 
	for nIdx, nEvent in x801003_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801003_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801003_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId,eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801003, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

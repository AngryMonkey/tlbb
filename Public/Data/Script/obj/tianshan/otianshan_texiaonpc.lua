--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801008_g_ScriptId = 801008;

--要演示的技能列表 
x801008_g_DemoSkills = {};
--声明方法：  x801008_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801008_g_DemoSkills[865]="落木萧萧";
x801008_g_DemoSkills[866]="望梅止渴";
x801008_g_DemoSkills[867]="阳关三叠";
x801008_g_DemoSkills[868]="阳奉阴违";
x801008_g_DemoSkills[869]="阳歌天钧";
x801008_g_DemoSkills[870]="阳春白雪";
x801008_g_DemoSkills[871]="踏雪无痕";
x801008_g_DemoSkills[872]="龟息功";
x801008_g_DemoSkills[873]="唇亡齿寒";
x801008_g_DemoSkills[874]="十面埋伏";
x801008_g_DemoSkills[875]="越俎代庖";
x801008_g_DemoSkills[876]="归去来兮";
x801008_g_DemoSkills[877]="凭虚御风";
x801008_g_DemoSkills[878]="静影沉璧";
x801008_g_DemoSkills[879]="大象无形";

--所拥有的事件Id列表
x801008_g_eventList={865,866,867,868,869,870,871,872,873,874,875,876,877,878,879};
--**********************************
--事件交互入口
--**********************************
function x801008_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801008_g_eventList) do 
	for nIdx, nEvent in x801008_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801008_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801008_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801008, "LuaFnUnitUseSkill",sceneId, selfId, eventId , targetId);
	--return;
end

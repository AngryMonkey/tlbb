--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801007_g_ScriptId = 801007;

--要演示的技能列表 
x801007_g_DemoSkills = {};
--声明方法：  x801007_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801007_g_DemoSkills[850]="快活三";
x801007_g_DemoSkills[851]="回风拂柳";
x801007_g_DemoSkills[852]="有常无常";
x801007_g_DemoSkills[853]="无众生相";
x801007_g_DemoSkills[854]="非枯非荣";
x801007_g_DemoSkills[855]="金玉满堂";
x801007_g_DemoSkills[856]="立地成佛";
x801007_g_DemoSkills[857]="丹凤朝阳";
x801007_g_DemoSkills[858]="白驹过隙";
x801007_g_DemoSkills[859]="少泽剑";
x801007_g_DemoSkills[860]="商阳剑";
x801007_g_DemoSkills[861]="少商剑";
x801007_g_DemoSkills[862]="白虹贯日";
x801007_g_DemoSkills[863]="微服私访";
x801007_g_DemoSkills[864]="万国来朝";

--所拥有的事件Id列表
x801007_g_eventList={850,851,852,853,854,855,856,857,858,859,860,861,862,863,864};
--**********************************
--事件交互入口
--**********************************
function x801007_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801007_g_eventList) do 
	for nIdx, nEvent in x801007_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801007_g_DemoSkills[nEvent],11,-1);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801007_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801007, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

--NPC演示技能特效用
--演示NPC
--普通
--这个NPC最好是不会还手，可攻击，但是不会受到任何伤害
--脚本号
x801001_g_ScriptId = 801001;

--要演示的技能列表 
x801001_g_DemoSkills = {};
--声明方法：  x801001_g_DemoSkills[技能的编号] = "技能的名字"; 注：后面会把技能的编号当事件号使用 

x801001_g_DemoSkills[752]="般若掌";
x801001_g_DemoSkills[753]="金刚伏魔圈";
x801001_g_DemoSkills[754]="一拍两散";
x801001_g_DemoSkills[755]="韦陀杵";
x801001_g_DemoSkills[756]="铁布衫";
x801001_g_DemoSkills[757]="无相劫指";
x801001_g_DemoSkills[758]="罗汉阵";
x801001_g_DemoSkills[759]="狮子吼";
x801001_g_DemoSkills[760]="慈航普渡";
x801001_g_DemoSkills[761]="礼敬如来";
x801001_g_DemoSkills[762]="一苇渡江";
x801001_g_DemoSkills[763]="气贯全身";
x801001_g_DemoSkills[764]="摩诃无量";
x801001_g_DemoSkills[765]="多罗叶指";
x801001_g_DemoSkills[766]="金钟罩";
 
--所拥有的事件Id列表
x801001_g_eventList={752,753,754,755,756,757,758,759,760,761,762,763,764,765,766};
--**********************************
--事件交互入口
--**********************************
function x801001_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    欢迎光临。请选择想要观看的技能。");
--	for i=1,getn(x801001_g_eventList) do 
	for nIdx, nEvent in x801001_g_eventList do
		--添加演示技能的按钮 
		AddNumText(sceneId, nEvent, x801001_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中一项
--**********************************
function x801001_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别是什么的ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end

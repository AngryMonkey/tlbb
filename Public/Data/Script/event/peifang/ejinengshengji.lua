--升级技能的脚本

--脚本号
x713500_g_ScriptId = 713500

x713500_g_AbilityName = {}
x713500_g_AbilityDescription = {}
x713500_g_StudyCost = {}

x713500_g_AbilityName[1] = "烹饪"
x713500_g_AbilityName[2] = "中医"
x713500_g_AbilityName[3] = "加工"
x713500_g_AbilityName[8] = "采矿"
x713500_g_AbilityName[9] = "采药"
x713500_g_AbilityName[10] = "钓鱼"
x713500_g_AbilityName[11] = "种植"
x713500_g_AbilityDescription[1] = "    做出来的东西都可以吃~~~"
x713500_g_AbilityDescription[2] = "中医可不是一朝一夕能够学会的..."
x713500_g_AbilityDescription[3] = "制作装备、合成宝石需要的技能"
x713500_g_AbilityDescription[8] = "采矿虽然辛苦，却是一门赚钱的手艺啊"
x713500_g_AbilityDescription[9] = "我可以交给你辨别草药的本领，不用费时费力学什么中医，一样可以赚钱"
x713500_g_AbilityDescription[10] = "没有耐心的人是不能钓到大鱼的"
x713500_g_AbilityDescription[11] = "做一个快乐的农场主"


--测试时，升级使用同样的花费定义，正式制作的时候如果需要可以采用二维数组，例如：
--x713500_g_StudyCost[1][1] = 200
x713500_g_StudyCost[1] = 0
x713500_g_StudyCost[2] = 0
x713500_g_StudyCost[3] = 0
x713500_g_StudyCost[8] = 0
x713500_g_StudyCost[9] = 0
x713500_g_StudyCost[10] = 0
x713500_g_StudyCost[11] = 100
--**********************************
--任务入口函数
--**********************************
function x713500_OnDefaultEvent( sceneId, selfId, targetId, AbilityID )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, AbilityID)

	BeginEvent(sceneId)
		AddText(sceneId, "技能名称：" .. x713500_g_AbilityName[AbilityID])
		AddText(sceneId, x713500_g_AbilityDescription[AbilityID])

		if AbilityLevel < 1 then
			AddText(sceneId, "学习这项技能需要花费一两白银。")
		else
			AddText(sceneId, "当前技能等级：" .. AbilityLevel .. " 级")
			AddText(sceneId, "升级这项技能需要花费一两白银。")
		end
	EndEvent(sceneId)

	--熟练度不足
	if ExpPoint < (AbilityLevel + 1) * 10 then
		BeginEvent(sceneId)
			strText = format("你的熟练度不足")
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif GetMoney(sceneId, selfId) < x713500_g_StudyCost[AbilityID] then
		BeginEvent(sceneId)
			strText = format("你的钱不够了")
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		DispatchMissionInfo( sceneId, selfId, targetId, x713500_g_ScriptId, AbilityID )
	end

   	return 1
end

--**********************************
--列举事件   2006-01-06 新增
--**********************************
function x713500_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713500_g_ScriptId,"我要学习技能",12,-1);
end

--**********************************
--检测接受条件
--**********************************
function x713500_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--接受
--**********************************
function x713500_OnAccept( sceneId, selfId, AbilityID )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, AbilityID )
	SetHumanAbilityLevel( sceneId, selfId, AbilityID, AbilityLevel + 1 )
end

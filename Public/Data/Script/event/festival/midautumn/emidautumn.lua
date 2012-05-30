-- 中秋任务

--************************************************************************
--MisDescBegin

-- 脚本号
x050009_g_ScriptId = 050009

-- 任务号
x050009_g_MissionId = 395					-- 395 - 399

--上一个任务的ID
x050009_g_MissionIdNext = 396

-- 任务目标npc
x050009_g_Name = "岳常圆"

--任务归类
x050009_g_MissionKind = 3

--任务等级
x050009_g_MissionLevel = 10000

-- 任务文本描述
x050009_g_MissionName = "中秋任务"
x050009_g_MissionInfo = "    但听闻江湖传言，近日一批一品堂的高手欲乘中秋佳节" ..
				"之际，大举进攻我大宋，此刻已被杨文广将军的大军封锁在" ..
				"敦煌，你可愿意为国而战？"								-- 任务描述

x050009_g_MissionTarget = "    现在速去敦煌（252，144）杨文广将军那里协助他抵挡一品堂高手的进攻。"	-- 任务目标

x050009_g_ContinueInfo = "    "				-- 未完成任务的npc对话
x050009_g_MissionComplete = ""				-- 完成任务npc说的话

-- 任务奖励

--MisDescEnd
--************************************************************************

x050009_g_NumText_Mission = 1				-- 中秋任务
x050009_g_NumText_Intro = 2					-- 任务介绍
x050009_g_NumText_ViewMoon = 3				-- 去往西湖赏月

--**********************************
--判断是否中秋时间
--**********************************
function x050009_IsMidAutumnPeriod( sceneId, selfId )
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()						--当前时间
	--CurTime = CurTime-36500 --这个数据每年都要维护
	local CurTime = GetQuarterTime();
	
	--local today = floor( CurTime/100 )						--当前时间(天)
	local today = mod(floor( CurTime/100 ), 1000)		--当前时间(天)
	local CurQuarterTime = mod( CurTime, 100 )			--当前时间(刻)
	--end modified by zhangguoxin 090207

	local firstDay = 257								-- 2008年9 月 14 日,包含当日
	local lastDay = 283									-- 2008年10 月 9 日,包含当日

	if today == firstDay and CurQuarterTime < 48 then
		return 0
	end

	if today == lastDay and CurQuarterTime > 47 then
		return 0
	end

	if today < firstDay or today > lastDay then
		return 0
	end

	return 1
end

--**********************************
--判断中秋物品是否有效
--**********************************
function x050009_IsItemValid( sceneId, itemSN )--由物品的脚本枣泥馅月饼、薄荷馅月饼、豆沙馅月饼等等调用到这里，已经没有使用
	local today = GetDayTime()							--当前时间(天)
	local lastDay = 6303								-- 10 月 31 日

	-- 10 月 31 日以后失效
	if today > lastDay then
		return 0
	end

	return 1
end

--**********************************
--列举事件
--**********************************
function x050009_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050009_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x050009_IsMidAutumnPeriod( sceneId, selfId ) == 0 then
		return
	end

	if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) <= 0 then
		AddNumText( sceneId, x050009_g_ScriptId, "中秋任务", -1, x050009_g_NumText_Mission )
	else
		AddNumText( sceneId, x050009_g_ScriptId, "去往西湖赏月", -1, x050009_g_NumText_ViewMoon )
	end

	AddNumText( sceneId, x050009_g_ScriptId, "任务介绍", -1, x050009_g_NumText_Intro )
end

--**********************************
--任务入口函数
--**********************************
function x050009_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetNumText() == x050009_g_NumText_Mission then
		x050009_AssignMission( sceneId, selfId, targetId )
	elseif GetNumText() == x050009_g_NumText_Intro then
		x050009_MissionIntro( sceneId, selfId, targetId )
	elseif GetNumText() == x050009_g_NumText_ViewMoon then
		x050009_ViewMoon( sceneId, selfId, targetId )
	else
		return
	end
end

--**********************************
--发布任务
--**********************************
function x050009_AssignMission( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050009_g_MissionName )
		AddText( sceneId, x050009_g_MissionInfo )
	EndEvent( )
	DispatchMissionInfo( sceneId, selfId, targetId, x050009_g_ScriptId, x050009_g_MissionId )
end

--**********************************
--任务介绍
--**********************************
function x050009_MissionIntro( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    在苏州（193，148）岳常圆激活任务——找到" ..
						"敦煌（252，144）杨文广将军进入副本战斗——消灭" ..
						"BOSS获得中秋积分（如果获得一品堂令牌，可交给杨" ..
						"文广有几率获得珍稀物品）——去三大城市三个酒店" ..
						"老板那里用积分换取食材（精质面粉、优质香料、上好蔗糖），" )
		AddText( sceneId, "到任务发布人可传送到西湖赏月，找到夜西湖（280" ..
						"，184）的苏轼用三件食材换取一枚月饼（随机不同的" ..
						"口味：枣泥馅月饼、薄荷馅月饼、豆沙馅月饼、桂圆" ..
						"馅月饼……月饼血气可同时补满，同时增加不同的BUFF，" ..
						"月饼有保鲜期为截止到10月31日），同时每换一枚月饼会" )
		AddText( sceneId, "得到相应的经验奖励。在夜西湖可以购买到中秋礼" ..
						"花，中秋礼花有效期为截止到10月31日。" )
	EndEvent( )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--去往西湖赏月
--**********************************
function x050009_ViewMoon( sceneId, selfId, targetId )
	local scene, x, z = 121, 272, 181
	NewWorld( sceneId, selfId, scene, x, z )
end

--**********************************
--检测接受条件
--**********************************
function x050009_CheckAccept( sceneId, selfId )
	if x050009_IsMidAutumnPeriod( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--接受
--**********************************
function x050009_OnAccept( sceneId, selfId, targetId )
	--检测是否任务已经达到20个,如果到了,则不能接
	if GetMissionCount( sceneId, selfId ) == 20 then
		x050009_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		return
	end

	if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) <= 0 then
		AddMission( sceneId, selfId, x050009_g_MissionId, x050009_g_ScriptId, 0, 0, 0 )		-- kill、area、item
		if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) <= 0 then
			return
		end
	end

	x050009_NotifyFailBox( sceneId, selfId, targetId, x050009_g_MissionTarget )
end

--**********************************
--放弃任务
--**********************************
function x050009_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050009_g_MissionId ) == 0 then
		return
	end

	if IsHaveMission( sceneId, selfId, x050009_g_MissionIdNext ) > 0 then
		x050009_NotifyFailTips( sceneId, selfId, "请先放弃击杀一品堂任务！" )
		return
	end

	DelMission( sceneId, selfId, x050009_g_MissionId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x050009_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x050009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

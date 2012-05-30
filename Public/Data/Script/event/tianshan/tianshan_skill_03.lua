-- 游山玩水

--MisDescBegin

-- 脚本号
x228904_g_ScriptId = 228904

-- 目标 NPC
x228904_g_Position_X = 217
x228904_g_Position_Z = 255
x228904_g_SceneID = 2
x228904_g_AccomplishNPC_Name = "王韶"

-- 任务号
x228904_g_MissionId = 949

-- 前续任务
x228904_g_PreMissionId = 948

-- 接受任务 NPC 属性
x228904_g_Name = "王韶"

--任务归类
x228904_g_MissionKind = 28

--任务等级
x228904_g_MissionLevel = 30

--是否是精英任务
x228904_g_IfMissionElite = 0

--任务名
x228904_g_MissionName = "游山玩水"
x228904_g_MissionInfo = "#{TIANSHAN_SKILL_06}"
x228904_g_MissionTarget = "    把5个金币交给大理城修文台#W的#R王韶#W#{_INFOAIM217,255,2,王韶}。"
x228904_g_MissionContinue = "#{TIANSHAN_SKILL_07}"
x228904_g_MissionComplete = "#{TIANSHAN_SKILL_08}"

x228904_g_MoneyCost = 50000

x228904_g_MoneyBonus = 1000
x228904_g_exp = 2000

x228904_g_IsMissionOkFail = 0					-- 是否完成任务的标记位
x228904_g_IsFindTarget = 1						-- 是否找到王韶标记位

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x228904_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228904_g_Name then
		return 0
	end

	--如果玩家完成过这个任务
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return
	elseif IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228904_g_AccomplishNPC_Name then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsFindTarget, 1 )
			x228904_OnContinue( sceneId, selfId, targetId )
		end
	--满足任务接收条件
	elseif x228904_CheckAccept( sceneId, selfId ) > 0 then
		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, x228904_g_MissionName )
			AddText( sceneId, x228904_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228904_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228904_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228904_g_ScriptId, x228904_g_MissionId )
	end
end

--**********************************
--列举事件
--**********************************
function x228904_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone( sceneId, selfId, x228904_g_PreMissionId ) <= 0 then
		return
	end

	--如果玩家完成过这个任务
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return
	--如果已接此任务
	elseif IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		if GetName( sceneId, targetId ) == x228904_g_AccomplishNPC_Name then
			AddNumText( sceneId, x228904_g_ScriptId, x228904_g_MissionName, 2, -1 )
		end
	--满足任务接收条件
	elseif GetName( sceneId, targetId ) == x228904_g_Name and GetLevel( sceneId, selfId ) >= x228904_g_MissionLevel then
		AddNumText( sceneId, x228904_g_ScriptId, x228904_g_MissionName, 1, -1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x228904_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228904_g_PreMissionId ) <= 0 then
		return 0
	end

	-- 1，检测玩家是不是已经做过
	if IsMissionHaveDone( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return 0
	end

	-- 等级检测
	if GetLevel( sceneId, selfId ) < x228904_g_MissionLevel then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228904_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x228904_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228904_g_Name then
		return 0
	end

	if x228904_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId, selfId, x228904_g_MissionId, x228904_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		x228904_NotifyFailBox( sceneId, selfId, targetId, "    #Y你的任务日志已经满了" )
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail, 0 )	-- 初始化任务完成标记
	SetMissionByIndex( sceneId, selfId, misIndex, x228904_g_IsFindTarget, 0 )		-- 初始化标记

	--显示内容告诉玩家已经接受了任务
	x228904_NotifyFailTips( sceneId, selfId, "你接受了任务：" .. x228904_g_MissionName )
	Msg2Player( sceneId, selfId, "#Y接受任务" .. x228904_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--放弃
--**********************************
function x228904_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x228904_g_MissionId )
end

--**********************************
--继续
--**********************************
function x228904_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent( sceneId )
		AddText( sceneId, x228904_g_MissionName )
		AddText( sceneId, x228904_g_MissionContinue )
		AddMoneyBonus( sceneId, x228904_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo( sceneId, selfId, targetId, x228904_g_ScriptId, x228904_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x228904_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228904_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228904_g_MissionId )				-- 得到任务的序列号
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228904_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x228904_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228904_g_AccomplishNPC_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x228904_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	if GetMoney( sceneId, selfId ) < x228904_g_MoneyCost then
		x228904_NotifyFailBox( sceneId, selfId, targetId, "    你携带金钱不足，无法完成任务。" )
		return
	end

	--扣钱
	CostMoney( sceneId, selfId, x228904_g_MoneyCost )

	--添加任务奖励
	AddMoney( sceneId, selfId, x228904_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x228904_g_exp )

	DelMission( sceneId, selfId, x228904_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId, selfId, x228904_g_MissionId )

	-- 检测玩家是不是天山派的弟子
	if GetMenPai( sceneId, selfId ) == MP_TIANSHAN then
		-- 给玩家增加514号技能
		AddSkill( sceneId, selfId, 514 )
		x228904_NotifyFailTips( sceneId, selfId, "你学会了“柳暗花明”技能。" )
	end

	x228904_NotifyFailBox( sceneId, selfId, targetId, x228904_g_MissionComplete )
	Msg2Player( sceneId, selfId, "#Y完成任务：" .. x228904_g_MissionName, MSG2PLAYER_PARA )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x228904_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x228904_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x228904_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x228904_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x228904_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

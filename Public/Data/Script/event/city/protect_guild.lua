--副本任务
--保护帮派驻地
--

--************************************************************************
--MisDescBegin
--脚本号
x805042_g_ScriptId	= 805042
--副本名称
x805042_g_CopySceneName	= "保护帮会驻地"
--任务号
x805042_g_MissionId			= 1120
--上一个任务的ID
x805042_g_MissionIdPre	= 0
--目标NPC
x805042_g_Name					= "保护帮会驻地"
--是否是精英任务
x805042_g_IfMissionElite= 0
--任务等级
x805042_g_MissionLevel	= 10000
--任务归类
x805042_g_MissionKind		= 1
--任务文本描述
x805042_g_MissionName			= "保护帮会驻地"
--任务描述
x805042_g_MissionInfo			= "  "
--任务目标
x805042_g_MissionTarget		= "  杀死所有的怪物即可完成任务。"
--未完成任务的npc对话
x805042_g_ContinueInfo		= "  "
--完成任务npc说话的话
x805042_g_MissionComplete	= "  "


--**********************************以上是动态****************************
--角色Mission变量说明
x805042_g_Param_IsMissionOkFail	= 0						--0号：当前任务是否完成(0未完成；1完成)
x805042_g_Param_killmonstercount	= 1					--1号：杀死任务小怪的数量
x805042_g_Param_killbosscount	= 2							--2号：杀死任务boss怪的数量
x805042_g_Param_sceneid		= 3									--3号：当前副本任务的场景号
x805042_g_Param_teamid		= 4									--4号：接副本任务时候的队伍号
x805042_g_Param_time			= 5									--5号：完成副本所用时间(单位：秒)
																							--6号：具体副本事件脚本占用
																							--7号：具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x805042_g_CopySceneType			= FUBEN_PROTECTGUILD	--副本类型，定义在ScriptGlobal.lua里面
x805042_g_LimitMembers			= 3		--可以进副本的最小队伍人数
x805042_g_TickTime					= 5		--回调脚本的时钟时间（单位：秒/次）
x805042_g_LimitTotalHoldTime= 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x805042_g_LimitTimeSuccess	= 500	--副本时间限制（单位：次数），如果此时间到了，任务完成
x805042_g_CloseTick					= 7		--副本关闭前倒计时（单位：次数） zchw 3-->7
x805042_g_NoUserTime				= 300	--副本中没有人后可以继续保存的时间（单位：秒）
x805042_g_Fuben_X						= 99	--进入副本的位置X
x805042_g_Fuben_Z						= 152	--进入副本的位置Z
x805042_g_Back_X						= 99	--源场景位置X
x805042_g_Back_Z						= 152	--源场景位置Z
x805042_g_Totalkillmonstercount	= 30	--需要杀死monster数量
x805042_g_Totalkillbosscount	= 1	--需要杀死Boss数量

x805042_g_StartTick				=	3	--任务开始时间
x805042_g_CurrentStage			=	0	--当前所处的阶段	0--15秒开始阶段  1--8分钟清理小怪阶段 2--Boss阶段
x805042_g_FirstStage			=	183	--第一阶段，15分钟限制
x805042_g_FirstStage_msg		=	{4,9,15,21,27,33,39,45,51,57,63,69,75,81,87,93,99,105,111,117,123,129,135,141,147,153,159,165,171,175,177,178,179,180,181,182,}	--第一阶段，剩余时间提示

--副本数据索引对照
x805042_g_keySD					= {}
x805042_g_keySD["typ"]			= 0		--设置副本类型
x805042_g_keySD["spt"]			= 1		--设置副本场景事件脚本号
x805042_g_keySD["tim"]			= 2		--设置定时器调用次数
x805042_g_keySD["currStage"]	= 3		--设置定时器调用次数
x805042_g_keySD["scn"]			= 4		--设置副本入口场景号, 初始化
x805042_g_keySD["cls"]			= 5		--设置副本关闭标志, 0开放，1关闭
x805042_g_keySD["dwn"]			= 6		--设置离开倒计时次数
x805042_g_keySD["tem"]			= 7		--保存队伍号
x805042_g_keySD["x"]			= 8			--人物在入口场景中的x位置
x805042_g_keySD["z"]			= 9			--人物在入口场景中的z位置
x805042_g_keySD["killMonsterNum"]	= 10		--杀死怪物数量
x805042_g_keySD["genMonsterNum"]	= 11			--生成怪物数量
x805042_g_keySD["playerLevel"]	= 12		--记录当前副本的级别

--接取任务的最低等级
x805042_g_minLevel			= 85

--怪物列表
x805042_g_monster_list = {
	[1]={
			StageId=1,
			MonsterList={
				{mType=9626,	x=74, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=72, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=76, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=74, 	z=92,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=50, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=48, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=52, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=50, 	z=95,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=46, 	z=91,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=47, 	z=93,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=47, 	z=89,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=49, 	z=91,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=45, 	z=72,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=47, 	z=72,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=45, 	z=70,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=45, 	z=74,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=44, 	z=59,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=46, 	z=59,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=57,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=61,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=44, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=42, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=46, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=49,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=64, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=62, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=66, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=64, 	z=57,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=134, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=132, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=136, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=134, 	z=52,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=149, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=147, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=151, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=149, 	z=46,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=148, 	z=56,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=146, 	z=56,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=148, 	z=54,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=148, 	z=58,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=147, 	z=96,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=145, 	z=96,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=147, 	z=94,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=147, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=128, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=126, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=130, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=128, 	z=100,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
			}
		},
	[2]={
			StageId=2,
			MonsterList={
				{mType=9631,	x=99,	z=54,	aiType=25,	aiScript=-1,	scriptId=805045 , deltLevel=1	},
			}
		},
}


--**********************************
--任务入口函数
--**********************************
function x805042_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1 then
		if x805042_CheckEnter( sceneId, selfId, targetId ) ~= 1  then
			return
		end
	
		if (x805042_OnAccept( sceneId, selfId ) == 1) then
			LuaFnDeleteMonster( sceneId, targetId)
		end
	elseif GetNumText() == 2 then
		
		if GetName( sceneId, targetId ) == "山鬼" then
			x805042_MsgBox( sceneId, selfId, targetId, "#{bhbpzd_20080522_002}" )
		elseif GetName( sceneId, targetId ) == "山妖" then
			x805042_MsgBox( sceneId, selfId, targetId, "#{bhbpzd_20080522_001}" )
		end
		
	end

end



function x805042_CheckEnter( sceneId, selfId, targetId )

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "山神已经对这个帮会城市忍无可忍，必须发威了！你一个人就想来挑战山神吗，太自不量力了！" )
		return 0
	end
	
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if GetLevel(sceneId,nPlayerId) < x805042_g_minLevel  then
			x805042_MsgBox_With_Help( sceneId, selfId, targetId, "山神已经对这个帮会城市忍无可忍，必须发威了！你们还是都达到85级再来挑战强大的山神吧！" )
			return 0
		end
	end


	if GetTeamSize( sceneId, selfId ) < x805042_g_LimitMembers then
	  x805042_MsgBox_With_Help( sceneId, selfId, targetId, "山神已经对这个帮会城市忍无可忍，必须发威了！你们想要挑战我至少也要来三个人，否则山神是不屑于和你们动手的！" )
	  return 0
	end


	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "山神已经对这个帮会城市忍无可忍，必须发威了！想要挑战我？叫你们的队长来吧！" )
		return 0
	end


	-- 取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "山神已经对这个帮会城市忍无可忍，必须发威了！想要挑战我？还是等你们的人都到齐吧！" )
		return 0
	end
	
	return 1
	
end

--**********************************
--列举事件
--**********************************
function x805042_OnEnumerate( sceneId, selfId, targetId )

	if x805042_CheckEnter( sceneId, selfId, targetId ) ~= 1  then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "山神已经对这个帮会城市忍无可忍，必须发威了！不知死活的凡人啊，尝尝山神的力量吧！" )
		AddNumText( sceneId, x805042_g_ScriptId, "挑战山神" ,10 ,1)
		AddNumText( sceneId, x805042_g_ScriptId, "关于保护帮会" ,11 ,2)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--检测接受条件
--**********************************
function x805042_CheckAccept( sceneId, selfId )

	return 1
end

--**********************************
--接受
--**********************************
function x805042_OnAccept( sceneId, selfId )
	local numMem	= GetNearTeamCount( sceneId, selfId )	
	return x805042_MakeCopyScene( sceneId, selfId, numMem )
end

--**********************************
--放弃
--**********************************
function x805042_OnAbandon( sceneId, selfId )

end

--**********************************
--创建副本
--**********************************
function x805042_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

	local member, mylevel, numerator, denominator = 0, 0, 0, 0

	for	i = 0, nearmembercount - 1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		numerator = numerator + GetLevel( sceneId, member ) ^ 4
		denominator = denominator + GetLevel( sceneId, member ) ^ 3
		mems[i] = member
	end

	if denominator <= 0 then
		mylevel = 0
	else
		mylevel = numerator / denominator
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "protectguild.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x805042_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x805042_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["typ"], x805042_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["spt"], x805042_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["playerLevel"], mylevel)
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] , 0)	
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] , 0)	

	local x,z = GetWorldPos( sceneId, selfId )

	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["x"], x805042_g_Back_X )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["z"], x805042_g_Back_Z )

	LuaFnSetSceneLoad_Monster( sceneId, "protectguild_monster.ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x805042_NotifyTip( sceneId, selfId, "副本创建成功！" )
		return 1
	else
		x805042_NotifyTip( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
		return 0
	end

end

--**********************************
--继续
--**********************************
function x805042_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x805042_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x805042_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x805042_OnKillObject( sceneId, selfId, objdataId, objId )

end



--**********************************
--进入区域事件
--**********************************
function x805042_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x805042_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x805042_OnCopySceneReady( sceneId, destsceneId )
	--设置城市副本特殊数据
	LuaFnSetSceneCopySceneCityData(sceneId, destsceneId )
	LuaFnSetIsCityCopyScene( destsceneId, 1)

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x805042_g_keySD["scn"], sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--找不到该玩家
	if leaderObjId == -1 then
		return
	end

	--处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	
	--活动统计
	LuaFnAuditQuest(sceneId, leaderObjId, x805042_g_MissionName.."-"..x805042_g_CopySceneName)

	local cityName = LuaFnCityGetNameBySceneId( sceneId )
	local strLog = format("CopyScene Start  SceneId=%d, CityName=%s", sceneId, cityName )
	AuditProtectGuild( sceneId, strLog)

	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑的状态

			NewWorld( sceneId, member, destsceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )
			
			local strLog = format("Player Enter CopyScene  SceneId=%d, CityName=%s, PlayerGuid=%x", sceneId, cityName, LuaFnGetGUID(sceneId, member)  )
			AuditProtectGuild( sceneId, strLog)
			
			--活动统计
			LuaFnAuditQuest(sceneId, member, x805042_g_MissionName.."-"..x805042_g_CopySceneName)
		end
	end
	
end

--**********************************
--有玩家进入副本事件
--**********************************
function x805042_OnPlayerEnter( sceneId, selfId )
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x805042_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )

	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x805042_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取得已经执行的定时次数
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["tim"] )
	TickCount = TickCount + 1
	--设置新的定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tim"], TickCount )
	
	x805042_g_CurrentStage = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] )

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["cls"] )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	if membercount==0 and leaveFlag~=1 then
		LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		return
	end

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--需要离开
	if leaveFlag == 1 then
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"] )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"], leaveTickCount )

		if leaveTickCount >= x805042_g_CloseTick then										--倒计时间到，大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["scn"] )	--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end

		elseif leaveTickCount < x805042_g_CloseTick then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在%d秒后离开场景!", (x805042_g_CloseTick-leaveTickCount) * x805042_g_TickTime )

			x805042_TipAllHuman( sceneId,  strText)
		end
	end
	
	
	if x805042_g_CurrentStage == 0 then
		local strText = "";
		
		if TickCount >= x805042_g_StartTick then
			x805042_g_CurrentStage = 1
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] , x805042_g_CurrentStage)
			
			--生成怪物
			x805042_GenObj( sceneId, 1 )
			
			strText = "战斗开始!";
			
			x805042_TipAllHuman( sceneId,  strText)
			x805042_TipAllHuman( sceneId,  "15分钟之内杀死所有山鬼")
			
		else
			strText = format("战斗将在%d秒后开始!", (x805042_g_StartTick - TickCount) * x805042_g_TickTime);
			x805042_TipAllHuman( sceneId,  strText)
		end
	end
	
	if x805042_g_CurrentStage == 1 then
		
		local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
		
		if killNum == genNum then
			x805042_g_CurrentStage = 2
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] , x805042_g_CurrentStage)
			
			--生成怪物
			x805042_GenObj( sceneId, 2 )
		
				
			return
		end
		
		if TickCount >= x805042_g_FirstStage then
			--此处设置副本任务有时间限制的情况，当时间到后处理...
			x805042_TipAllHuman( sceneId,  "任务失败，超时!")
	
			--设置副本关闭标志
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		end
		
		local msgTick = 0
		for msgTick = 1, getn(x805042_g_FirstStage_msg) do
			if TickCount == x805042_g_FirstStage_msg[msgTick] then
				local tickMsg = format("杀死所有山鬼，剩余时间%d秒", (x805042_g_FirstStage-TickCount)*x805042_g_TickTime)
				x805042_TipAllHuman( sceneId,  tickMsg)
				break
			end
		end
	end
	
	if x805042_g_CurrentStage == 2 then
		local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
		
		if killNum == genNum then
			--设置副本关闭标志
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		end
	end
	
	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
	--x805042_TipAllHuman(sceneId, killNum.." / "..genNum )
end


function x805042_GenObj( sceneId, stageid )
	if x805042_g_monster_list[stageid] == nil then
		return
	end
	
    local IndexList = x805042_g_monster_list[stageid].MonsterList
    local IndexListSize = getn( IndexList )
    
    local i=1
    local str
    for i=1, IndexListSize do        
		local MonsterId = x805042_CreateNpc( sceneId, IndexList[i].mType, IndexList[i].x, IndexList[i].z, IndexList[i].aiType, IndexList[i].aiScript, IndexList[i].scriptId, IndexList[i].deltLevel )
    end
end


--**********************************
-- 通用创建怪物函数
--**********************************
function x805042_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script, deltLevel)
	local PlayerLevel = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["playerLevel"])
	local ModifyLevel = 0
	
	--PrintStr("  "..PlayerLevel.." "..x.." "..y.." ")
	
	if PlayerLevel > 80   then
		ModifyLevel = 1
	end
	if PlayerLevel > 90   then
		ModifyLevel = 2
	end
	if PlayerLevel > 100   then         
		ModifyLevel = 3
	end
	if PlayerLevel > 110   then         
		ModifyLevel = 4
	end
	if PlayerLevel > 120   then         
		ModifyLevel = 5
	end
	if PlayerLevel > 130   then         
		ModifyLevel = 6
	end
	if PlayerLevel > 140   then         
		ModifyLevel = 7
	end
	local nNpcId = NpcId + ModifyLevel-1
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel + deltLevel)
	
	-- 看有没有设置称号，有就加称号
	--x805042_SetNpcTitle(sceneId, nMonsterId)
	local strNpcName = GetName(sceneId, nMonsterId )
	if (strNpcName == "大山鬼") or (strNpcName == "山神") then
			SetCharacterTitle(sceneId, nMonsterId, "“石头怪人”")
	end
	
	return nMonsterId
end


--**********************************
--醒目提示
--**********************************
function x805042_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x805042_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

function x805042_MsgBox_With_Help( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText( sceneId, x805042_g_ScriptId, "关于保护帮会" ,11 ,2)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--提示所有副本内玩家
--**********************************
function x805042_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end
end


--玩家进入一个 area 时触发
function x805042_OnEnterArea( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["scn"] )	--取得副本入口场景号
	local x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
	local z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )

	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x805042_OnTimer( sceneId, selfId )

end

--玩家离开一个 area 时触发
function x805042_OnLeaveArea( sceneId, selfId )
	
end

--拾取物品
function x805042_OnPlayerPickUpItem( sceneId, selfId, itemId, bagidx )


end

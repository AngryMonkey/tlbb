-- 在老顾帮助下进入夜间的燕子坞

--************************************************************************
--MisDescBegin
--脚本号
x200011_g_ScriptId = 200011

--MisDescEnd
--************************************************************************

--副本名称
x200011_g_CopySceneName = "燕子坞"

x200011_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200011_g_CopySceneMap = "yanzi_1.nav"
x200011_g_Exit = "yanzi_1.ini"
x200011_g_LimitMembers = 1				--可以进副本的最小队伍人数
x200011_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x200011_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200011_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200011_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x200011_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x200011_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200011_g_Fuben_X = 108					--进入副本的位置X
x200011_g_Fuben_Z = 104					--进入副本的位置Z
x200011_g_Back_X = 66					--源场景位置X
x200011_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200011_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200011_MakeCopyScene(sceneId, selfId)
end


--**********************************
--列举事件
--**********************************
function x200011_OnEnumerate( sceneId, selfId, targetId )

	--检查玩家身上是不是有这个任务
	-- 0，如果玩家完成了12，或者有了13。直接退出
	if IsHaveMission( sceneId, selfId, 13 ) > 0 then
		return 0
	end
	
	if IsHaveMission( sceneId, selfId, 12 ) > 0 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, 12) > 0   then
		return 0
	end
	
	-- 1，玩家有10这个任务可以进入
	if IsHaveMission( sceneId, selfId, 10 ) > 0 then
		AddNumText( sceneId, x200011_g_ScriptId, "送我去燕子坞（夜间）", 10 ,-1  )
		return 0
	end
	
	-- 2，玩家有11这个任务，可以进入
	if IsHaveMission( sceneId, selfId, 11 ) > 0 then
		AddNumText( sceneId, x200011_g_ScriptId, "送我去燕子坞（夜间）", 10 ,-1  )
		return 0
	end
	
	-- 3，玩家完成10，没有11，12，可以进入
	if IsMissionHaveDone(sceneId, selfId, 10) > 0   then
		if IsHaveMission(sceneId, selfId, 11) < 1   then
			AddNumText( sceneId, x200011_g_ScriptId, "送我去燕子坞（夜间）", 10 ,-1  )
			return 0
		end
		if IsHaveMission(sceneId, selfId, 12) < 1   then
			AddNumText( sceneId, x200011_g_ScriptId, "送我去燕子坞（夜间）", 10 ,-1  )
			return 0
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200011_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200011_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200011_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200011_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200011_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yanzi_1.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200011_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200011_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200011_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200011_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量

	-- 剧情用到的变量清空
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetSceneLoad_Area( sceneId, "yanzi_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yanzi_1_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x200011_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个文件没有组队，就传送这个文件自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个晚间是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	-- 检测玩家是不是有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		NewWorld( sceneId, leaderObjId, destsceneId, x200011_g_Fuben_X, x200011_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200011_g_Fuben_X, x200011_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200011_g_Fuben_X, x200011_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200011_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200011_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200011_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200011_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200011_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200011_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200011_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200011_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200011_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200011_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200011_OnCopySceneTimer( sceneId, nowTime )
	
end


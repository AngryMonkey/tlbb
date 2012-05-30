-- 拥有 37 任务后，可以进入白天的副本

-- 擂鼓山  200044

-- 	在范百龄的指引下前往擂鼓山

--************************************************************************
--MisDescBegin
--脚本号
x200044_g_ScriptId = 200044

--任务号
x200044_g_MissionId = 37

--MisDescEnd
--************************************************************************

--副本名称
x200044_g_CopySceneName = "擂鼓山"

x200044_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200044_g_CopySceneMap = "leigu.nav"
x200044_g_Exit = "leigu.ini"
x200044_g_LimitMembers = 1				--可以进副本的最小队伍人数
x200044_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x200044_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200044_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200044_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x200044_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x200044_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200044_g_Fuben_X = 56					--进入副本的位置X
x200044_g_Fuben_Z = 104					--进入副本的位置Z
x200044_g_Back_X = 66					--源场景位置X
x200044_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200044_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200044_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200044_OnEnumerate( sceneId, selfId, targetId )

	-- 1，拥有任务号为37的任务，
	if IsHaveMission( sceneId, selfId, 37 ) > 0 then
		AddNumText( sceneId, x200044_g_ScriptId, "送我去擂鼓山(白天)", 10 ,-1  )
		return 0
	end

end
--**********************************
--检测接受条件
--**********************************
function x200044_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200044_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200044_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200044_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200044_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "leigu.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200044_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200044_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200044_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200044_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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

	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "leigu_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "leigu_monster.ini" )

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
function x200044_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个文件没有组队，就传送这个文件自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个晚间是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end
	
	-- 检测玩家是不是有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		NewWorld( sceneId, leaderObjId, destsceneId, x200044_g_Fuben_X, x200044_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200044_g_Fuben_X, x200044_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--misIndex = GetMissionIndexByID(sceneId,mems[i],x200044_g_MissionId)
				
				--将任务的第2号数据设置为副本的场景号
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200044_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200044_g_Fuben_X, x200044_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200044_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200044_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200044_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200044_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200044_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200044_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200044_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200044_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200044_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200044_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200044_OnCopySceneTimer( sceneId, nowTime )
--PrintNum(2)
	if LuaFnGetCopySceneData_Param(sceneId, 10) == 0  then

		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			
			if GetName(sceneId, nMonsterId)  == "丁春秋"  then
				bHaveMonster = 1
			end
		end
		
		if bHaveMonster == 0  then
			-- 获得所有玩家，然后看这个玩家是不是有这个任务，有就给他这个位置设置为1
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			if nHumanNum == 0  then
				return
			end
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				
				--看这个玩家是不是有这个任务
				if IsHaveMission( sceneId, nHumanId, 37 ) > 0 then
					local misIndex = GetMissionIndexByID(sceneId, nHumanId, x200044_g_MissionId)
					SetMissionByIndex(sceneId, nHumanId, misIndex, 0, 1)
					SetMissionByIndex(sceneId, nHumanId, misIndex, 1, 1)
					BeginEvent(sceneId)
					AddText(sceneId,"已战胜丁春秋：1/1")
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,nHumanId)
					
				end
			end
		end
	end
	
end



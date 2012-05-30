--棋局休息室产生可采集的buff 珍珑之光; 活动的脚本   2008-11-4 by cuiyinjie
--首先要判断是棋局休息室才启动此活动
--随机位置产生buff是从位置表随机读取的
--本功能采用了活动的6个自由参数，1，2，分别记录是否创建了第一和第二次的采集点，防止多次创建。 3，记录是否删除过采集点
-- 4，5，6为晚八点后的记录

--脚本号
x808123_g_ScriptId	= 808123

x808123_g_RestRooms = {193, 418, 419, 518};      -- 棋局休息室的场景id

x808123_g_iMonsterTypeID = 12150; --52000; -- 要采集的怪的id  MonsterAttrExtable.txt

x808123_g_iZhenglongZhiguangBuffId = 76;    -- 珍珑之光buffid，见 StandardImpact.txt


--**********************************
--脚本入口函数
--**********************************
function x808123_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	local i = 1;
	--先判断是否棋局休息室
	local bIsRestRoom = 0
	for i = 1, 4 do
	   if ( sceneId == x808123_g_RestRooms[i] ) then
          bIsRestRoom = 1
          break
	   end
	end
	if ( 1 ~= bIsRestRoom ) then
	    return
	end

	--参数说明：场景ID，活动ID，时间间隔，公告类型（可以不传，默认普通公告类型）
	StartOneActivity( sceneId, actId, floor(10*1000), iNoticeType );
	--启动后先初始化自定义参数
	for i = 1, 6 do
        SetActivityParam( sceneId, actId, i, 0 );
	end
end

--**********************************
--心跳函数
--**********************************
function x808123_OnTimer( sceneId, actId, uTime )
	--PrintStr("hhii");
	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

	-- 用自由参数记录是否已经产生和删除产生的采集点
	local iHour = GetHour();
	local iMinute = GetMinute();
	local schedule =
	{
	    [1] =  { StartTime1 = {11, 25}, StartTime2 = {11, 27}, EndTime = {14, 30}, },
		[2] =  { StartTime1 = {20, 25}, StartTime2 = {20, 27}, EndTime = {22, 00}, },
	}
	local i = 1;
	local iParam = 0;
	for i = 1, 2 do
	    local iOffSet = (i - 1) * 3;
	    if ( iHour == schedule[i].EndTime[1] and iMinute == schedule[i].EndTime[2] ) then -- 删除未采集的采集点
	         iParam = GetActivityParam(sceneId, actId, iOffSet + 3);
	         if ( 1 == iParam ) then
	              x808123_RemoveGatherPoints(sceneId, actId);
	              SetActivityParam( sceneId, actId, iOffSet + 3, 0 );    --标记已经删除采集点
	         end
	    elseif(iHour == schedule[i].StartTime2[1] and iMinute == schedule[i].StartTime2[2]) then
	         iParam = GetActivityParam(sceneId, actId, iOffSet + 2);
	         if ( 0 == iParam ) then
                 x808123_AddGatherPoints(sceneId, actId, 2);
			     SetActivityParam( sceneId, actId, iOffSet + 2, 1 );
			     SetActivityParam( sceneId, actId, iOffSet + 3, 1 );   --标记已创建采集点
		     end
	    elseif(iHour == schedule[i].StartTime1[1] and iMinute == schedule[i].StartTime1[2]) then  --第一次应该产生采集点的时刻
	         iParam = GetActivityParam(sceneId, actId, iOffSet + 1);
	         if ( 0 == iParam ) then
                 x808123_AddGatherPoints(sceneId, actId, 1);
			     SetActivityParam( sceneId, actId, iOffSet + 1, 1 );
			     SetActivityParam( sceneId, actId, iOffSet + 3, 1 );   --标记已创建采集点
		     end
	    end
	end
end


--***********************************
--产生采集点的函数
--iIndex = 1时表示是在创建前10个采集点，=2时为创建后10个采集点
--***********************************
function x808123_AddGatherPoints(sceneId, actId, iIndex)

    --采集点的坐标:
	local AllPos = {
		{ {18,18},{46,18},{18,24},{46,24},{18,30},{46,30},{18,36},{46,36},{18,42},{46,42} },  --在11：25和20：25出现的BUFF生长点坐标
		{ {24,22},{40,22},{24,27},{40,27},{24,32},{40,32},{24,37},{40,37},{24,42},{40,42} },  --在11：27和20：27出现的BUFF生长点坐标
	}

	local iAIType = 7;
	local iAIScriptID = 0;
	local iScriptID = x808123_g_ScriptId;  -- 用这个脚本的id,交互回调函数写在此脚本内
	
	-- 创建10个
	local i = 1;
	local iObjId = -1;
	for i = 1, 10 do     -- 从101-120 ,20个点的objid记录入活动自定义参数，用于删除
		iObjId = LuaFnCreateMonster(sceneId, x808123_g_iMonsterTypeID, AllPos[iIndex][i][1], AllPos[iIndex][i][2], iAIType, iAIScriptID, iScriptID);
	end
end

--***********************************
--删除采集点的函数
--***********************************
function x808123_RemoveGatherPoints(sceneId, actId)
	--遍历所有此采集点类型的obj并删除
	local monsterobjid = -1
	local monstercount = GetMonsterCount(sceneId)
	for i=0, monstercount-1 do
		monsterobjid = GetMonsterObjID(sceneId,i)
		monstertype = GetMonsterDataID(sceneId, monsterobjid) --怪物类型
		if monstertype==x808123_g_iMonsterTypeID then
			LuaFnDeleteMonster(sceneId, monsterobjid)
		end
	end
	
	-- 下面的代码为调试时用，正常应用中每天活动开始时就调用了，删采集点时就不用了
	for i = 1, 6 do
        SetActivityParam( sceneId, actId, i, 0 );
	end
end

--**********************************
--醒目提示
--**********************************
function x808123_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end


--**********************************
--特殊交互:条件判断
--**********************************
function x808123_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- 1 检测队伍是不是够人数
	if GetTeamSize(sceneId,activatorId) < 2  then
		--"你需要一个2人或2人以上的队伍。"
		x808123_NotifyTip( sceneId, activatorId, "你需要一个2人或2人以上的队伍。" )
		return 0
	end
	-- 2 检测玩家是不是队长
	if GetTeamLeader(sceneId,activatorId) ~= activatorId then
        --只有队长才能进行采集。
        x808123_NotifyTip( sceneId, activatorId, "只有队长才能进行采集。" )
		return 0
	end
	
	-- 限制身上的buff
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, activatorId, x808123_g_iZhenglongZhiguangBuffId) == 1 then
	   x808123_NotifyTip( sceneId, activatorId, "珍珑之光已经环绕在你的身上，不要重复采集。" )
	   return 0
	end

	return 1
end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x808123_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x808123_OnActivateEffectOnce( sceneId, selfId, activatorId )

	local SmallBoxBuff = {
				{name="珍珑之光",buff=x808123_g_iZhenglongZhiguangBuffId},  -- buff配置在  StandardImpact.txt

    }
	-- 按照这个Npc的姓名给玩家+buff，
	local szName = GetName(sceneId, selfId)

	if szName == SmallBoxBuff[1].name  then
		LuaFnDeleteMonster(sceneId, selfId)
		--LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, activatorId, SmallBoxBuff[1].buff, 100 )
		-- 给队里其它玩家加上buff
  		local	nearteammembercount = GetNearTeamCount( sceneId, activatorId)
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, activatorId, i)
			LuaFnSendSpecificImpactToUnit(sceneId, mems[i], mems[i], mems[i], SmallBoxBuff[1].buff, 100 )
		end
	end

	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x808123_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时的特殊处理
--**********************************
function x808123_OnActivateActionStart( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互撤消时的特殊处理
--**********************************
function x808123_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--特殊交互:交互中断时的特殊处理
--**********************************
function x808123_OnActivateInterrupt( sceneId, selfId, activatorId )
	return 0
end

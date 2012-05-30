--891000

-- 报名进入生死夺宝的场景

--************************************************************************
--MisDescBegin
--脚本号
x891000_g_ScriptId = 891000

--事件
x891000_g_Update = {

    ["id01"] = 0,
    ["id02"] = 20,
    ["id03"] = 30,

}

--提示信息
x891000_g_msg = {

    ["cj"]	= "参加生死夺宝",
    ["jl"]	= "领取生死夺宝奖励",
    ["Mail"]	= "确认奖励",

}

--活动编号,这个数字需要和活动表中的对应
--其中的数据的第0位位置用来表示活动是否开启
x891000_g_nActivityId = 9

-- 这个活动其实不需要创建副本，直接把所有的人，放入一个场景就可以了 
x891000_g_SceneID = 410

-- 现在是不是活动计数时间的标志
x891000_g_bHuashaning = 0

x891000_g_bEndTime = 0
x891000_g_bMenpai = ""

x891000_g_WorldGlobal = 21

x891000_g_PlayerKc = {}				-- 每个玩家杀人的数目
x891000_g_PlayerName = {}			-- 每个玩家的名字
x891000_g_PlayerNum = 0				-- 玩家数目

--[ QUFEI 2007-07-27 15:04 UPDATE ]
x891000_g_PlayerMenpai = {}		-- 每个玩家的门派
x891000_g_PlayerId = {}

x891000_g_PreTime = 0


--场景中央的2个秘籍刷新点....
x891000_g_MJPosA = {
	{x=135, y=125},{x=141, y=123}
}

--场景四周的6个秘籍刷新点....
x891000_g_MJPosB = {
	{x=143, y=140, rand=-1},
	{x=153, y=121, rand=-1},
	{x=150, y=110, rand=-1},
	{x=138, y=104, rand=-1},
	{x=125, y=107, rand=-1},
	{x=120, y=111, rand=-1},
	{x=122, y=132, rand=-1},
	{x=131, y=138, rand=-1}
}

--秘籍表....
x891000_g_MJTblA = {
	5009,5010
}

--秘籍表....
x891000_g_MJTblB = {
	5004,5005,5006,5007,5008
}

x891000_g_MJNameTbl = {
	"紫色秘笈",
	"黄色秘笈",
	"绿色秘笈",
	"白色秘笈",
	"黑色秘笈",
	"蓝色秘笈",
	"红色秘笈"
}

--秘籍脚本....
x891000_g_MJScript = 001235


--**********************************
--任务入口函数
--**********************************
function x891000_OnDefaultEvent( sceneId, selfId, targetId )
	
    local	key	= GetNumText()

	if key == x891000_g_Update["id01"] then
		if LuaFnHasTeam( sceneId, selfId ) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B生死夺宝");
				AddText(sceneId,"  请离开队伍之后再报名参加。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return 0
		end
    
        -- 0，处于双人骑乘状态的人，不能报名
        if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B生死夺宝");
                AddText(sceneId,"  双人骑乘状态下，不能报名参加生死夺宝。");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end

        -- 1,人物等级高于30
        if GetLevel(sceneId, selfId) < 30  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B生死夺宝");
                AddText(sceneId,"  参加生死夺宝必须要30级以上才能参加，阁下修为还不够，等到30级之后再来找我吧。");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end
      
        -- 3,时间检测，接受报名的时间，8点到8点30分
        local nQuarter = mod(GetQuarterTime(),100);
        if nQuarter < 79 or nQuarter >= 84  then		--报名时间7:45-8:00
            BeginEvent(sceneId)
                AddText(sceneId,"#B生死夺宝");
                AddText(sceneId,"  现在不是参加生死夺宝的进入时间，请在19：45-20：00找我进入。");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return
        end

        -- 4,人数检测,使用活动数据区的数据来保存这些数据
        local nMenpai = LuaFnGetMenPai(sceneId, selfId)
        
        if nMenpai == 9   then
            BeginEvent(sceneId)
                AddText(sceneId,"#B生死夺宝");
                AddText(sceneId,"  对不起，你没有门派，你是怎么混到30级的啊！！！");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
        end
  
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 200, 0)            
        CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 410, 32, 33)
    end
end


--**********************************
--列举事件
--**********************************
function x891000_OnEnumerate( sceneId, selfId, targetId )	
    AddNumText( sceneId, x891000_g_ScriptId, x891000_g_msg["cj"], 6, x891000_g_Update["id01"] )          
    --AddNumText( sceneId, x891000_g_ScriptId, x891000_g_msg["Mail"], 6, x891000_g_Update["id03"] )
    --AddNumText( sceneId, x891000_g_ScriptId, x891000_g_msg["jl"], 6, x891000_g_Update["id02"] )        
   
end

--**********************************
--检测接受条件
--**********************************
function x891000_CheckAccept( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x891000_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x891000_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
-- 有玩家在场景内死亡
--**********************************
function x891000_OnSceneHumanDie( sceneId, selfId, killerId )
	-- 获得玩家身上的 "碎片数量"，统统删除
	local nStoneId = 39910008
	local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
	
	if nStoneCount >= 1  then
		local ret = DelItem(sceneId, selfId, nStoneId, 1)
		
		-- 在地上生成掉落包，把碎片放进去，防止出现刷，只有成功删除，才创建掉落
		if ret > 0   then
			LuaFnCancelSpecificImpact(sceneId,selfId,33816)
			local x
			local z
			x,z = GetWorldPos(sceneId, selfId)
			
			-- 给开启成功的玩家一个掉落包
			local nBoxId = DropBoxEnterScene(	x,z,sceneId )
			AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS, 1, nStoneId)
		end
		
	end
	
end

--**********************************
--玩家拾取物品的回调函数....
--**********************************
function x891000_OnPlayerPickUpItemInLuoyang( sceneId, selfId, itemId, bagidx )

	--公告....
	local playerName = GetName(sceneId, selfId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local rand = random(3)
	local message
	if rand == 1 then
		message = format("#P生死门内风起云涌。#{_INFOUSR%s}#P经过自己的不懈努力，终于将#{_INFOMSG%s}#P抢入手中。", playerName, transfer )
	elseif rand == 2 then
		message = format("#P号外号外。#{_INFOUSR%s}#P在生死门内力克群雄，手脚快速的将#{_INFOMSG%s}#P捡入囊中后低调的转身而去。", playerName, transfer )
	else
		message = format("#P轰隆隆，天空一声雷鸣！#{_INFOUSR%s}#P在生死门内终于把#{_INFOMSG%s}#P得到手中，天下英雄蜂拥追杀之。", playerName, transfer )
	end
	BroadMsgByChatPipe(sceneId, selfId, message, 4)
       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 16114, 0)

	return 1

end

--**********************************
--放弃
--**********************************
function x891000_OnAbandon( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x891000_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x891000_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x891000_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x891000_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x891000_OnScenePlayerEnter( sceneId, playerId )
	
	-- 去除BUFF
	LuaFnCancelSpecificImpact(sceneId,selfId,16114)
	
	SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0", 410, 31, 34 )

end

--**********************************
--道具改变
--**********************************
function x891000_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x891000_OnCopySceneTimer( sceneId, nowTime )
	
end

--[ QUFEI 2007-07-27 11:13 UPDATE ]
--生死夺宝奖励事件
function x891000_OnHuashanJiangli( sceneId, selfId, targetId )
			
end

--**********************************
--生死夺宝场景定时器事件
--**********************************
function x891000_OnHuashanSceneTimer( sceneId, selfId )
	
	-- 检测这个场景内是不是有玩家，如果没有，直接返回
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0  then
		return
	end
	
	--检测当前是不是生死夺宝的活动时间，如果不是，就把场景内的所有玩家都T出去
	local bIsTime = 1
	local NeedCreate = 1

	local nQuarter = mod(GetQuarterTime(),100);

	if nQuarter < 79 or nQuarter >= 84  then
		bIsTime = 0
 	end

      if nQuarter >= 79 and nQuarter < 84  then
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		   if MosDataID == 42195 then
			-- 牙牙，当场景内存在多个怪物时 会刷新出1个BOSS（当场景中还有比霜影ID值更大的怪）。
			   NeedCreate = 0
		   end
	 end
	end

       if NeedCreate == 1
	   local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	   for j=0, nHumanCount-1  do
		   local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, j)
		   if LuaFnGetAvailableItemCount(sceneId, nHumanId, 39910008) >= 1   then
			   NeedBox = 0
                 else
	                 LuaFnCreateMonster(sceneId, 42195, 32, 33, 1, 253, 0);
		   end
	   end
	end

	if bIsTime == 1   then
			local nNowTime = LuaFnGetCurrentTime()
			if x891000_g_PreTime == 0    then
				x891000_g_PreTime = nNowTime
				return
			end
			-- 1，每间隔5分钟，需要通知玩家，前3名的门派，发送给全世界
			if nNowTime > x891000_g_PreTime+300    then
			
				x891000_g_PreTime = nNowTime
				
				--刷新秘籍....
				x891000_GiveMJ( sceneId )
			end
	end

	-- 如果 bIsTime == 0 ,就把所有的玩家T出去
	if bIsTime == 0   then
			
		local i
		for i=0, nHumanNum-1  do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid( sceneId, nHumanId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, nHumanId ) == 1 then
			  BeginEvent(sceneId)
			  	AddText(sceneId, "#P生死夺宝活动结束。")
			  EndEvent()
			  DispatchMissionTips(sceneId, nHumanId)
			       LuaFnCancelSpecificImpact(sceneId,nHumanId,200)
				CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 0, 161, 105)
			end
		end --END for i=0, nHumanNum-1  do
	end --END if bIsTime == 0

end

--**********************************
-- 杀人计数
--**********************************
function x891000_KillPlayer(sceneId, killerId, diedId)

end

--**********************************
-- 增加一个玩家到杀手列表中去
--**********************************
function x891000_AddPlayer(sceneId, Name, PlayerId)
	
end

--**********************************
-- 增加一个玩家到杀手列表中去
--**********************************
function x891000_Id2Menpai(nMenpaiId)
	
end

--**********************************
--对话框提示
--**********************************
function x891000_MyMsgBox( sceneId, selfId, str )
	BeginEvent(sceneId)    
    AddText(sceneId,str);
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,selfId)	
end

--**********************************
--刷新秘籍
--**********************************
function x891000_GiveMJ( sceneId )

	-- 先删除旧的秘籍....
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		for j=1, getn(x891000_g_MJNameTbl)  do
			if szName == x891000_g_MJNameTbl[j]  then
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
		end
	end

	--场景中央刷新2个....
	for i=1, getn(x891000_g_MJPosA)  do
		local Rand = random(getn(x891000_g_MJTblA))
		LuaFnCreateMonster(sceneId, x891000_g_MJTblA[Rand],
																x891000_g_MJPosA[i].x, x891000_g_MJPosA[i].y,
																3, 0, x891000_g_MJScript )

	end

	--场景四周刷新4个....

		--重置权值....
	for i=1, getn(x891000_g_MJPosB) do
		x891000_g_MJPosB[i].rand = random(100)
	end

		--选出权值最大的4个点作为投放秘籍的点....
	for i=1, 4 do

		local MaxVal = -1
		local index = 1

		for j=1, getn(x891000_g_MJPosB) do
			if x891000_g_MJPosB[j].rand > MaxVal then
				MaxVal = x891000_g_MJPosB[j].rand
				x891000_g_MJPosB[j].rand = -1
				index = j
			end
		end

		--投放秘籍....
		local Rand = random(getn(x891000_g_MJTblB))
		LuaFnCreateMonster(sceneId, x891000_g_MJTblB[Rand],
																x891000_g_MJPosB[index].x, x891000_g_MJPosB[index].y,
																3, 0, x891000_g_MJScript )

	end


end

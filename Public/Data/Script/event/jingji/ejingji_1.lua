-- 125020
-- 进入竞技场的控制
-- 本脚本需要server添加启动参数 "-loadscriptonce" 才能正常运行

--
x125020_g_ScriptId = 125020

x125020_g_Position = {
				{id=1,scene=0,x=143,z=151},
				{id=2,scene=1,x=28, z=152},
				{id=3,scene=2,x=149,z=80},
				{id=4,scene=3,x=36, z=49},
				{id=5,scene=420,x=33, z=49},
}

-- 4个buff宝箱位置
x125020_g_BuffPosition = {
				{id=1,x=81, z=53, preTime=0},
				{id=2,x=81, z=146,preTime=0},
				{id=3,x=33, z=99, preTime=0},
				{id=4,x=130,z=99, preTime=0},
				{id=5,x=107,z=74, preTime=0},
				{id=6,x=106,z=124, preTime=0},
				{id=7,x=56 ,z=124, preTime=0},
				{id=8,x=56 ,z=73, preTime=0},
				
}

-- 小宝箱的名字列表
x125020_g_SmallBoxName = {
				"紫色秘笈",
				"黄色秘笈",
				"绿色秘笈",
				"白色秘笈",
				"黑色秘笈",
				"蓝色秘笈",
				"红色秘笈",
}

-- 小宝箱开出来的buff列表
x125020_g_SmallBoxList = {
				{id=1,monId=5004,script=125023,},
				{id=2,monId=5005,script=125023,},
				{id=3,monId=5006,script=125023,},
				{id=4,monId=5007,script=125023,},
				{id=5,monId=5008,script=125023,},
				{id=6,monId=5009,script=125023,},
				{id=7,monId=5010,script=125023,},
}

-- 碎片宝箱位置
x125020_g_StonePosition_1 = {
				{tp=1,x=45,z=65},{tp=1,x=42,z=67},{tp=1,x=47,z=63},
				{tp=1,x=52,z=87},{tp=1,x=63,z=84},{tp=1,x=71,z=78},
				{tp=1,x=68,z=69},{tp=1,x=62,z=64},{tp=1,x=51,z=66},
				{tp=1,x=71,z=74},}

x125020_g_StonePosition_2 = {
				{tp=2,x=92 ,z=65},{tp=2,x=96 ,z=70},{tp=2,x=94 ,z=76},
				{tp=2,x=95 ,z=80},{tp=2,x=104,z=64},{tp=2,x=102,z=84},
				{tp=2,x=108,z=85},{tp=2,x=114,z=81},{tp=2,x=102,z=74},
				{tp=2,x=119,z=67},}
				
x125020_g_StonePosition_3 = {
				{tp=3,x=44,z=106},{tp=3,x=45,z=111},{tp=3,x=43,z=123},
				{tp=3,x=46,z=131},{tp=3,x=44,z=136},{tp=3,x=56,z=133},
				{tp=3,x=61,z=136},{tp=3,x=70,z=136},{tp=3,x=67,z=127},
				{tp=3,x=61,z=115},}

x125020_g_StonePosition_4 = {
				{tp=4,x=87, z=114},{tp=4,x=92, z=115},{tp=4,x=93, z=131},
				{tp=4,x=98, z=136},{tp=4,x=105,z=134},{tp=4,x=114,z=136},
				{tp=4,x=116,z=128},{tp=4,x=120,z=116},{tp=4,x=111,z=113},
				{tp=4,x=120,z=136},}
				
x125020_g_StonePosition_5 = {
				{tp=5,x=147,z=135},{tp=5,x=152,z=124},{tp=5,x=151,z=110},
				{tp=5,x=146,z=100},{tp=5,x=151,z=88},{tp=5,x=133,z=67},
				{tp=5,x=128,z=54},{tp=5,x=110,z=47},{tp=5,x=78,z=39},
				{tp=5,x=59,z=45},}


-- 上一次宝箱刷新的时间
x125020_g_PreCreateBoxTime = -10

-- 创建前一分钟的公告是否已经发送
x125020_g_IsPreBroad = 0

-- 
x125020_g_Step = 0

-- 发送创建前一分钟的公告的时间
x125020_g_PreBroadTime = 0

-- 大宝箱位置
x125020_g_BigBoxPosition = {x=81,z=99}

x125020_g_OutPosition = {scene=0,x=160,z=106}

x125020_g_CampList = {}

-- 同一阵营的最大人数
x125020_g_SameCampMax = 10

-- 传送保护buff的Id
x125020_g_GotoProtect  = 54

-- 上一次刷小宝箱的时间
x125020_g_PreCreateSmallBoxTime = 0

-- 大宝箱信息
x125020_g_BigBoxInfo = {id=5003,x=82,z=100,ai=3,aif=0,script=125022}

-- 石头箱子信息
x125020_g_StoneBoxInfo = {id=5002,ai=3,aif=0,script=125024}

-- 银票编号和漕运buff
x125020_g_Yinpiao = 40002000
x125020_g_CaoyunMisId = 4021

x125020_g_PreCreateStoneBox = 0

function x125020_OnInitScene(sceneId, selfId)
	for i=1, 500  do
		x125020_g_CampList[i] = 0
	end
end

--**********************************
--列举事件
--**********************************
function x125020_OnEnumerate( sceneId, selfId, targetId )	
   AddNumText( sceneId, x125020_g_ScriptId, "进入竞技场", 9, 1 )        
   AddNumText( sceneId, x125020_g_ScriptId, "什么是封禅台竞技", 11, 2 )        
end

--**********************************
--任务入口函数
--**********************************
function x125020_OnDefaultEvent( sceneId, selfId, targetId )
	-- 可进入地图等级：35级
	-- 开放时间：24小时开放，队伍可以随时进入参加战斗，只是不一定有宝箱可以开。
	-- 以下身份者不可进入：接票的漕运商、接票的帮会商人、其他传送受限制者、武林盟主等。
	-- 必须在一支队伍中才能进入。
	
	if GetNumText() == 2  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B什么是封禅台竞技");
      AddText(sceneId,"#{JINGJI_INFO}");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
	end

  -- 0，处于双人骑乘状态的人，不能报名
  if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B竞技场");
      AddText(sceneId,"  双人骑乘状态下，不能进入竞技场。");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
  end

  -- 1,人物等级高于35
  if GetLevel(sceneId, selfId) < 35  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B竞技场");
      AddText(sceneId,"  进入竞技场必须要35级以上才能参加，阁下修为还不够，等到35级之后再来找我吧。");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
  end
  
  -- 2，组队才能进入
  if LuaFnHasTeam( sceneId, selfId ) == 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B竞技场");
      AddText(sceneId,"  进入竞技场必要在一个队伍里头。");
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
    return 0
	end

	-- 跑商状态不能进竞技场
	if GetItemCount(sceneId, selfId, x125020_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  你现在正处于传送受到限制的状态，不能进入嵩山封禅台。" )
		EndEvent( sceneId )
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 玩家处于漕运状态不能进入场景
	if IsHaveMission(sceneId,selfId, x125020_g_CaoyunMisId) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  你现在正处于传送受到限制的状态，不能进入嵩山封禅台。" )
		EndEvent( sceneId )
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 检测完毕，传送
	local nPos_X = 0
	local nPos_Z = 0
	for i, pos in x125020_g_Position  do
		if pos.scene == sceneId   then
			nPos_X = pos.x
			nPos_Z = pos.z
		end
	end
	local nJingjiScnenId = 414
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nJingjiScnenId, nPos_X, nPos_Z)
	
end

--**********************************
-- 玩家进入
--**********************************
function x125020_OnScenePlayerEnter(sceneId, selfId)
	
--	-- 0，如果玩家没有队伍，让玩家离开
--	if LuaFnHasTeam(sceneId, selfId) == 0  then
--		-- 取消玩家身上限制传送的无敌buff后才能传送
--		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x125020_g_GotoProtect) == 1   then
--			LuaFnCancelSpecificImpact(sceneId, selfId, x125020_g_GotoProtect)
--		end
--		
--		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 
--					x125020_g_OutPosition.scene, x125020_g_OutPosition.x, x125020_g_OutPosition.z)
--		return
--	end

	-- 1，检查场景内和自己阵营相同的玩家的数量
	local nTeamId = GetTeamId(sceneId, selfId)
	local nCampID = nTeamId + 500
	if x125020_GetSameCampCount(sceneId, nCampID) >= x125020_g_SameCampMax  then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x125020_g_GotoProtect) == 1   then
			LuaFnCancelSpecificImpact(sceneId, selfId, x125020_g_GotoProtect)
		end

		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 
					x125020_g_OutPosition.scene, x125020_g_OutPosition.x, x125020_g_OutPosition.z)
		return
	end
	
	-- 对没有队伍的玩家，给玩家临时阵营	
	
	
	-- 检测玩家可以留着这里
	if LuaFnHasTeam(sceneId, selfId) == 1  then	
		SetUnitCampID(sceneId, selfId, selfId, nCampID)
		
	-- 没有队伍的玩家，就给一个随机队伍号
	else
		local tempCamp = random(449) + 50
		SetUnitCampID(sceneId, selfId, selfId, tempCamp)
	end
	
	-- end，设置死亡事件
	local x,z = LuaFnGetWorldPos(sceneId, selfId)
	local v = x125020_g_Position
	if x~=v[1].x or z~=v[1].z  and
		 x~=v[2].x or z~=v[2].z  and
		 x~=v[3].x or z~=v[3].z  and
		 x~=v[4].x or z~=v[4].z  and
		 x~=v[5].x or z~=v[5].z  then
			
			x = v[1].x
			z = v[1].z
	end
	
	SetPlayerDefaultReliveInfoEx( sceneId, selfId, "%100", "%100", "0", sceneId, x, z, 125020 )
end

--**********************************
-- x125020_OnRelive
--**********************************
function x125020_OnRelive(sceneId, selfId)
	-- 给这个玩家一个buff BUFF描述：于九莲保护你不会受到意外伤害。
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, 
										selfId, 8054, 100 )
end

--**********************************
-- OnTime
--**********************************
function x125020_OnSceneTimer(sceneId)
	
	-- 1,处理场景中阵营小于10的人，
	x125020_DealNoCampHuman(sceneId)
	
	-- 2,随机的废话
	x125020_RandomBroad(sceneId)
	
	-- 2，宝箱刷新
	local nCurTime = GetHour()
	-- 宝箱刷新条件，
	-- a，需要是双数整点，
	local nMinute = GetMinute()
	
	if (nCurTime==0 or nCurTime==10 or
		 nCurTime==12 or nCurTime==14 or nCurTime==16 or
		 nCurTime==18 or nCurTime==20 or nCurTime==22)   then
		 
		if (nCurTime-x125020_g_PreCreateBoxTime >= 2 or x125020_g_PreCreateBoxTime-nCurTime>=2) and
			 x125020_g_Step == 0  and 
			 nMinute >= 45 and nMinute < 50    then	
			-- 先发一个提示公告，一分钟后再刷出宝箱
			x125020_PreBroad(sceneId)
			x125020_g_PreBroadTime = LuaFnGetCurrentTime()
			x125020_g_IsPreBroad = 0
			x125020_g_Step = 1
		end

		if x125020_g_Step == 1 and LuaFnGetCurrentTime()-x125020_g_PreBroadTime >= 60  then
			x125020_g_PreCreateBoxTime = nCurTime
			x125020_CreateBigBox(sceneId)
			x125020_g_Step = 0
		end
	end
	
	if (nMinute==5 or nMinute==25) and x125020_g_PreCreateStoneBox ~= nMinute  then
		x125020_CreateStoneBox(sceneId)
		x125020_g_PreCreateStoneBox = nMinute
	end
	
	local nNowTime = LuaFnGetCurrentTime()
	if nNowTime-x125020_g_PreCreateSmallBoxTime >= 30  then
		x125020_CreateSmallBox(sceneId)
		x125020_g_PreCreateSmallBoxTime = nNowTime
	end

end

--**********************************
-- 创建宝箱前一分钟的公告
--**********************************
function x125020_PreBroad(sceneId)
	local str = "#Y于九莲#P大喊：天下英雄们！一分钟之后，装满宝物和经验的宝箱就将放在封禅台！想要做武林盟主的英雄们，尽管来拿吧！请找到#G洛阳（155，107）夏侯仁，苏州（186，129）夏遂良，大理（177，133）白崇义#P，进入封禅台竞技场，争夺武林盟主！"
	BroadMsgByChatPipe(sceneId, 0, str, 4)
end

--**********************************
-- 在场景中创建出一个小宝箱
--**********************************
function x125020_CreateSmallBox(sceneId)
	-- 先删除所有的小箱子
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		for j=1, getn(x125020_g_SmallBoxName)  do
			if szName == x125020_g_SmallBoxName[j]  then
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
		end
	end
	
	-- 再随机创建8个箱子
	for i=1, getn(x125020_g_BuffPosition)  do
		local nRand = random(getn(x125020_g_SmallBoxList))
		local nBoxId = LuaFnCreateMonster(sceneId, x125020_g_SmallBoxList[nRand].monId,
																x125020_g_BuffPosition[i].x,
																x125020_g_BuffPosition[i].z,
																3,
																0,
																x125020_g_SmallBoxList[nRand].script)
		
		SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	end
	
end

--**********************************
-- 在场景中创建出一个大宝箱
--**********************************
function x125020_CreateBigBox(sceneId)

	-- 发送系统公告(无论是否这个时候需要创建宝箱，这个公告都是一定要发的)
	local str = "#Y于九莲#P大喊：天下英雄们！装满宝物和经验的宝箱已经放在封禅台！想要做武林盟主的英雄们，尽管来拿吧！请找到#G洛阳夏侯仁(155，107)，苏州夏遂良(186，129)，大理白崇义(177，133)#P，进入封禅台竞技场，争夺武林盟主！"
	BroadMsgByChatPipe(sceneId, 0, str, 4)
	
	-- 先要检测场景中是不是还有这个monster 如果有，就不再创建
	local nCount = GetMonsterCount(sceneId)
	local bHaveBox = 0
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "宝箱"  then
			bHaveBox = 1
		end
	end
	
	if bHaveBox == 1  then
		return
	end
	
	-- 创建一个特别的 monster 
	local v = x125020_g_BigBoxInfo
	local nBoxId = LuaFnCreateMonster(sceneId, v.id, v.x, v.z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
end

--**********************************
-- 在场景中创建出石头箱子
--**********************************
function x125020_CreateStoneBox(sceneId)

	-- 先删除以前有的箱子
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		if szName == "白色宝箱"  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end

	-- 在  x125020_g_StonePosition_1 
	local v = x125020_g_StoneBoxInfo 
	
	local nRand = random(getn(x125020_g_StonePosition_1))
	local x = x125020_g_StonePosition_1[nRand].x
	local z = x125020_g_StonePosition_1[nRand].z
	local nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_2))
	x = x125020_g_StonePosition_2[nRand].x
	z = x125020_g_StonePosition_2[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_3))
	x = x125020_g_StonePosition_3[nRand].x
	z = x125020_g_StonePosition_3[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_4))
	x = x125020_g_StonePosition_4[nRand].x
	z = x125020_g_StonePosition_4[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	
	nRand = random(getn(x125020_g_StonePosition_5))
	x = x125020_g_StonePosition_5[nRand].x
	z = x125020_g_StonePosition_5[nRand].z
	nBoxId = LuaFnCreateMonster(sceneId, v.id, x, z, v.ai, v.aif, v.script)
	SetUnitCampID(sceneId, nBoxId, nBoxId, 0)
	--PrintNum(1)
	
end

--**********************************
-- 获得场景中一个阵营目前的人数
--**********************************
function x125020_GetSameCampCount(sceneId, CampId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local nCount = 0
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if CampId == GetUnitCampID(sceneId, nHumanId, nHumanId)   then
			nCount = nCount+1
		end
	end

	return nCount
end

--**********************************
-- 处理场景中没有阵营的人
--**********************************
function x125020_DealNoCampHuman(sceneId)
	
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) < 500   then
			-- 获得队伍信息
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
				if LuaFnHasTeam(sceneId, nHumanId) == 1  then
					local nTeamId = GetTeamId(sceneId, nHumanId)
					local nCampId = nTeamId + 500 
					if x125020_GetSameCampCount(sceneId, nCampId) >= 10  then
						if LuaFnHaveImpactOfSpecificDataIndex(sceneId, nHumanId, x125020_g_GotoProtect) == 1   then
							LuaFnCancelSpecificImpact(sceneId, nHumanId, x125020_g_GotoProtect)
						end
			
						CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 
									x125020_g_OutPosition.scene, x125020_g_OutPosition.x, x125020_g_OutPosition.z)
						return
					else
						SetUnitCampID(sceneId, nHumanId, nHumanId, nCampId)
					end
				end
			end
		end
	end	
	
end	

--**********************************
-- 随机喊话
--**********************************
function x125020_RandomBroad(sceneId)
	if random(100) == 1  then
		local rand = random(3)
		local str
		if rand == 1  then
			str = "#G[封禅台]#Y于九莲#P大喊：英雄们！拿出你们的真实本领吧！"
		elseif rand == 2  then
			str = "#G[封禅台]#Y于九莲#P大喊：加油！不然信物就要被别人抢走了！"
		elseif rand == 3  then
			str = "#G[封禅台]#Y于九莲#P大喊：战斗吧！为了名位！也为了奖励！"
		end

		CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	end
end

--**********************************
-- 有玩家在场景内死亡
--**********************************
function x125020_OnSceneHumanDie( sceneId, selfId, killerId )
	-- 获得玩家身上的 "碎片数量"，统统删除
	local nStoneId = 40004434
	local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
	
	if nStoneCount >= 1  then
		local ret = DelItem(sceneId, selfId, nStoneId, 1)
		
		-- 在地上生成掉落包，把碎片放进去，防止出现刷，只有成功删除，才创建掉落
		if ret > 0   then
			local x
			local z
			x,z = GetWorldPos(sceneId, selfId)
			
			-- 给开启成功的玩家一个掉落包
			local nBoxId = DropBoxEnterScene(	x,z,sceneId )
			AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS, 1, nStoneId)
		end
		
	end
	
end

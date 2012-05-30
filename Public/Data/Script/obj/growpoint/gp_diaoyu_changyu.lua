--生长点
--对应生活技能：钓鱼	钓鱼技能的编号9
--鲳鱼
--脚本号712008
--鲳鱼100%
--等级1

--每次打开必定获得的产品
x712008_g_MainItemId = 20102008
--可能得到的产品
--g_SubItemId = 20304005
--需要技能Id
x712008_g_AbilityId = 9
--需要技能等级
x712008_g_AbilityLevel = 8


function 	x712008_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- 物品数量
	ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount)	--函数调用
end

function	 x712008_OnOpen(sceneId,selfId,targetId)
	--检查钓鱼技能等级
	AbilityId		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,AbilityId)
	if AbilityLevel<x712008_g_AbilityLevel then
		return OR_NO_LEVEL
	end

	--获得随机数,设置一次钓到鱼的时间
	x712008_g_FishTime = random(80000)+20000	--获得一个20-100秒之间的随机数
	--x712008_g_FishTime = random(8000)+2000	--获得一个2-10秒之间的随机数
	SetAbilityOperaTime(sceneId,selfId,x712008_g_FishTime)	--设置一次钓到鱼的时间
	--SetAbilityOperaRobotTime(sceneId, selfId,g_totaltime)	--把累计时间付给。。。
	
	return OR_OK

end

function	x712008_OnProcOver(sceneId,selfId,targetId)
   
	ret_1 = TryRecieveItem(sceneId,selfId,x712008_g_MainItemId,QUALITY_MUST_BE_CHANGE)
	if ret_1 > 0 then					-->0表示物品成功放入背包中
		Msg2Player(sceneId,selfId,"你钓到一条鲳鱼。",MSG2PLAYER_PARA)
		-- 增加熟练度
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712008_g_AbilityLevel)
	elseif ret_1 == -1 then
		Msg2Player(sceneId,selfId,"背包已满",MSG2PLAYER_PARA)
	end
	return 0
end

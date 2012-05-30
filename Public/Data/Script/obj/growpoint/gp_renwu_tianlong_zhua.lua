--生长点
--满月
--脚本号715006
--满月100%
--等级1

--每次打开必定获得的产品
x715006_g_MainItemId = 40003003

--生成函数开始************************************************************************
--每个ItemBox中最多10个物品
function 		x715006_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入一个物品
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715006_g_MainItemId)	--每个生长点最少能得到一个物品,这里直接放入itembox中一个
	--获得1~3的随机数,如果是1则不需要放入,如果多余1再用AddItemToBox增加物品
	--ItemCount = random(1,3)
	--if ItemCount ~= 1 then
	--	for i=1, (ItemCount - 1) do
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x715006_g_MainItemId)
	--	end
	--end
	--放入次要产品
	--if random(1,100) == 1 then
	--	AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,g_SubItemId)
	--end	
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715006_OnOpen(sceneId,selfId,targetId)
--返回类型
-- 0 表示打开成功
	--ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	--AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	
	--if AbilityLevel<g_AbilityLevel then
	--if	IsHaveMission
	--	return OR_NO_LEVEL
	--else
		return OR_OK
	--	end
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	 x715006_OnRecycle(sceneId,selfId,targetId)
	  --取得当前熟练度
		--ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		--AbilityExp	=	GetAbilityExp(sceneId, selfId, ABilityID)
		--判断以现在的等级是否应该增加熟练度
		--AbilityLevel	=	QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
		--if AbilityLevel - g_AbilityLevel <= 5 then
		--	ExpPlus = 1
		--elseif AbilityLevel - g_AbilityLevel <=10 then
		--	ExpPlus = 1/((AbilityLevel - g_AbilityLevel)+1)
		--else
		--	ExpPlus = 0
		--end
		--判断当前熟练度加上要增加的熟练度后是否超过本等级熟练度上限
		--old
		--if (AbilityExp + ExpPlus) >= LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop then
		--new
		--local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_PENGREN, AbilityLevel + 1);
		--if ret and ret == 1 and (AbilityExp + ExpPlus) >= currentLevelAbilityExpTop then
		--	AbilityExp = currentLevelAbilityExpTop;
		--else
		--	AbilityExp = AbilityExp + ExpPlus
		--end
		--增加熟练度
		--SetAbilityExp(sceneId, selfId, ABilityID, AbilityExp)
		--通知玩家熟练度增加了
		--AbilityExp	=	GetAbilityExp(sceneId, selfId, ABilityID)
		--Msg2Player(sceneId,selfId,"熟练度提升到"..AbilityExp,MSG2PLAYER_PARA)
		
		--返回1，生长点回收
		return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x715006_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x715006_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

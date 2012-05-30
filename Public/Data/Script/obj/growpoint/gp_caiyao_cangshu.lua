--生长点
--对应生活技能：采药	采矿技能的编号8
--苍术
--脚本号710514
--苍术1	0.6		2	0.3		3	0.1		蝎子1	0.12	2	0.06	3	0.02
--等级1

--每次打开必定获得的产品
x710514_g_MainItemId = 20101012
--可能得到的产品
x710514_g_SubItemId = 20304009
--需要技能Id
x710514_g_AbilityId = 8
--需要技能等级
x710514_g_AbilityLevel = 5


--生成函数开始************************************************************************
--每个ItemBox中最多10个物品
function 		x710514_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入一个物品
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710514_g_MainItemId)	--每个生长点最少能得到一个物品,这里直接放入itembox中一个
	--获得1~100的随机数,用来放入主产品和副产品
	--主产品1~60不放，61~90放1个，91~100放2个
	--副产品1~12放1个，13~18放2个，19~20放3个
	local ItemCount = random(1,100)
	if ItemCount >= 61 and ItemCount <= 90 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710514_g_MainItemId)
	elseif ItemCount >= 91 and ItemCount <= 100 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710514_g_MainItemId,x710514_g_MainItemId)
	end
	--放入次要产品
	if ItemCount >= 1 and ItemCount <= 12 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710514_g_SubItemId)
	elseif ItemCount >= 13 and ItemCount <= 18 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710514_g_SubItemId,x710514_g_SubItemId)
	elseif ItemCount >= 19 and ItemCount <= 20 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,3,x710514_g_SubItemId,x710514_g_SubItemId,x710514_g_SubItemId)
	end
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x710514_OnOpen(sceneId,selfId,targetId)
--返回类型
-- 0 表示打开成功
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x710514_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	 x710514_OnRecycle(sceneId,selfId,targetId)
	-- 增加熟练度
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x710514_g_AbilityLevel)
		--返回1，生长点回收
		return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710514_OnProcOver( sceneId, selfId, targetId )
	local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x710514_g_AbilityLevel )
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710514_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--检查生活技能等级
	if AbilityLevel<x710514_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--检查精力
	if GetHumanEnergy(sceneId,selfId)< (floor(x710514_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end

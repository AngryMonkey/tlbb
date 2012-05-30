--无量山 年兽BOSS群刷新脚本

--脚本号
x050050_g_ScriptId	= 050050

--无敌buffid，现缺少?????
x050050_g_Wudibuff = 10489

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x050050_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....

	{ ID=11355, PosX=154,  PosY=53, BaseAI=0, ExtAIScript=260, ScriptID=050051, NeedCreate=1 },
}

--活动时间
x050050_g_StartDayTime = 8030   --活动结束时间 2008-1-31
x050050_g_EndDayTime = 8044   --活动结束时间 2008-2-14

--**********************************
--脚本入口函数
--**********************************
function x050050_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	--检查时间
	local isTime = x050050_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x050050_g_BossData) < 1 then
		return
	end

	CallScriptFunction( 050053, "ClearDromItemFlag", sceneId)

	--重置Boss重建状态....
	for _, Data in x050050_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x050050_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x050050_g_BossData do
		if BossData.NeedCreate == 1 then
			local npcobjid = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			LuaFnSendSpecificImpactToUnit(sceneId, npcobjid, npcobjid, npcobjid, x050050_g_Wudibuff, 0 )
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x050050_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x050050_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x050050_g_BossData do
		if DataID == Data.ID then
			x050050_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

--**********************************
--检测活动是否已结束
--**********************************
function x050050_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050050_g_StartDayTime and curDayTime <= x050050_g_EndDayTime then
		return 1
	else
		return 1
	end

end

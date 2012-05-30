--武夷 BOSS群刷新脚本

--脚本号
x810002_g_ScriptId	= 810002

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x810002_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....

	{ ID=9120, PosX=53,  PosY=242, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9121, PosX=88,  PosY=260, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9122, PosX=54,  PosY=212, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9123, PosX=41,  PosY=159, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9124, PosX=80,  PosY=147, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9125, PosX=114, PosY=43,  BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9126, PosX=267, PosY=136, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9127, PosX=202, PosY=242, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9128, PosX=147, PosY=265, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
	{ ID=9129, PosX=182, PosY=127, BaseAI=30, ExtAIScript=255, ScriptID=810100, NeedCreate=1 },
}


--**********************************
--脚本入口函数
--**********************************
function x810002_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x810002_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x810002_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x810002_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x810002_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			if (BossData.ID == 9120) then
				SetCharacterTitle(sceneId, MonsterID, "终极爆破")
			else
				SetCharacterTitle(sceneId, MonsterID, "最佳配角")
			end
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x810002_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x810002_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x810002_g_BossData do
		if DataID == Data.ID then
			x810002_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

--玄武岛 BOSS群刷新脚本

--脚本号
x810000_g_ScriptId	= 810000

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x810000_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....
	
	{ ID=9100, PosX=181, PosY=38,  BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9101, PosX=182, PosY=66,  BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9102, PosX=233, PosY=37,  BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9103, PosX=135, PosY=75,  BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9104, PosX=132, PosY=278, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9105, PosX=42,  PosY=218, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9106, PosX=74,  PosY=141, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9107, PosX=268, PosY=45,  BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9108, PosX=238, PosY=261, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=9109, PosX=271, PosY=184, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
}


--**********************************
--脚本入口函数
--**********************************
function x810000_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x810000_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x810000_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x810000_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x810000_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			SetCharacterTitle(sceneId, MonsterID, "玄武岛守护兽")
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x810000_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x810000_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x810000_g_BossData do
		if DataID == Data.ID then
			x810000_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

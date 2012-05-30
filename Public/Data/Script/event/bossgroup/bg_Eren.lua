--苍山 BOSS群刷新脚本

--脚本号
x891004_g_ScriptId	= 891004

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x891004_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....

	{ ID=42219, PosX=200,  PosY=298, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42220, PosX=174,  PosY=249, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42221, PosX=103,  PosY=241, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42222, PosX=63, PosY=254, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42223, PosX=81,  PosY=190, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42224, PosX=131,  PosY=185, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42225, PosX=157,  PosY=136, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42226, PosX=198, PosY=104, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42227, PosX=270,  PosY=92, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42228, PosX=272,  PosY=129, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42229, PosX=273,  PosY=161, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42230, PosX=247, PosY=49, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42231, PosX=208,  PosY=44, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42232, PosX=182,  PosY=84, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42233, PosX=165,  PosY=65, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42234, PosX=128, PosY=85, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },
	{ ID=42235, PosX=111,  PosY=121, BaseAI=21, ExtAIScript=230, ScriptID=-1, NeedCreate=1 },
	{ ID=42236, PosX=96,  PosY=91, BaseAI=21, ExtAIScript=228, ScriptID=-1, NeedCreate=1 },
	{ ID=42237, PosX=80,  PosY=70, BaseAI=21, ExtAIScript=227, ScriptID=-1, NeedCreate=1 },
	{ ID=42238, PosX=93, PosY=51, BaseAI=21, ExtAIScript=229, ScriptID=-1, NeedCreate=1 },

}


--**********************************
--脚本入口函数
--**********************************
function x891004_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x891004_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x891004_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x891004_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x891004_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			SetCharacterTitle(sceneId, MonsterID, "苍山狂徒")
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x891004_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x891004_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x891004_g_BossData do
		if DataID == Data.ID then
			x891004_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

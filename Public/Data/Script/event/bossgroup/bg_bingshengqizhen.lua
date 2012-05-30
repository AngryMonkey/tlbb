--玄武岛 BOSS群刷新脚本

--脚本号
x899990_g_ScriptId	= 899990

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x899990_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....

	{ ID=15006, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15007, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },	
	{ ID=15008, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15009, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15010, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

-------一层大BOSS-------
	{ ID=15026, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15027, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15028, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15029, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15030, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },


-------二层大BOSS-------
	{ ID=15031, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15032, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15033, PosX=173, PosY=99, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15034, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15035, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },


-------三层大BOSS-------
	{ ID=15071, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15072, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15073, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15074, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15075, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },


-------最终大BOSS-------
	{ ID=15081, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15082, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15083, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15084, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15085, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15086, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15087, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15088, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15089, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15090, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15096, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15097, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15098, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15099, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15100, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42184, PosX=29, PosY=29, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42185, PosX=27, PosY=27, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42186, PosX=30, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42187, PosX=27, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

}


--**********************************
--脚本入口函数
--**********************************
function x899990_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x899990_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x899990_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x899990_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x899990_g_BossData do
		if BossData.NeedCreate == 1 then
			LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x899990_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x899990_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x899990_g_BossData do
		if DataID == Data.ID then
			x899990_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

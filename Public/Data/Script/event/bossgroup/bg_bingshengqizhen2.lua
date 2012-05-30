--玄武岛 BOSS群刷新脚本

--脚本号
x899989_g_ScriptId	= 899989

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x899989_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....

	{ ID=15106, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15107, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },	
	{ ID=15108, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15109, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15110, PosX=39, PosY=53, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

-------一层大BOSS-------
	{ ID=15126, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15127, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15128, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15129, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15130, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },


-------二层大BOSS-------
	{ ID=15131, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15132, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15133, PosX=173, PosY=99, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15134, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15135, PosX=173, PosY=36, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },


-------三层大BOSS-------
	{ ID=15171, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15172, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15173, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15174, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15175, PosX=192, PosY=194, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },


-------最终大BOSS-------
	{ ID=15181, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15182, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15183, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15184, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15185, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15186, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15187, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15188, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15189, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15190, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15196, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15197, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15198, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15199, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=15200, PosX=52, PosY=202, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42184, PosX=29, PosY=29, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42185, PosX=27, PosY=27, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42186, PosX=30, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
--	{ ID=42187, PosX=27, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

}


--**********************************
--脚本入口函数
--**********************************
function x899989_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x899989_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x899989_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x899989_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x899989_g_BossData do
		if BossData.NeedCreate == 1 then
			LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x899989_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x899989_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x899989_g_BossData do
		if DataID == Data.ID then
			x899989_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

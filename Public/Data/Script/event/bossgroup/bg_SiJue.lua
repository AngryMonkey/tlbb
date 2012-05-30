--玄武岛 BOSS群刷新脚本

--脚本号
x899999_g_ScriptId	= 899999

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x899999_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....
	
	{ ID=42101, PosX=92, PosY=84,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42102, PosX=93, PosY=85,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42103, PosX=94, PosY=86,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42104, PosX=95, PosY=87,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42105, PosX=96, PosY=88,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42106, PosX=97, PosY=89,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42107, PosX=98, PosY=90,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42108, PosX=99, PosY=91,  BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42109, PosX=100, PosY=92, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42110, PosX=101, PosY=93, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42111, PosX=102, PosY=94, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42112, PosX=103, PosY=95, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42113, PosX=104, PosY=96, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42114, PosX=105, PosY=97, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42115, PosX=106, PosY=98, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42116, PosX=107, PosY=99, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42117, PosX=108, PosY=100, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42118, PosX=109, PosY=101, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42119, PosX=110, PosY=102, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
	{ ID=42100, PosX=111, PosY=103, BaseAI=20, ExtAIScript=254, ScriptID=-1, NeedCreate=1 },
-------一层大BOSS-------
	{ ID=42180, PosX=100, PosY=93, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

	{ ID=42120, PosX=18, PosY=110,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42121, PosX=19, PosY=109,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42122, PosX=20, PosY=108,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42123, PosX=21, PosY=107,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42124, PosX=22, PosY=106,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42125, PosX=23, PosY=105,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42126, PosX=24, PosY=104,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42127, PosX=25, PosY=103,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42128, PosX=26, PosY=102,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42129, PosX=27, PosY=101,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42130, PosX=28, PosY=100,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42131, PosX=29, PosY=99,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42132, PosX=30, PosY=98,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42133, PosX=31, PosY=97,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42134, PosX=32, PosY=96,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42135, PosX=33, PosY=95,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42136, PosX=34, PosY=94, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42137, PosX=35, PosY=93, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42138, PosX=36, PosY=92, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42139, PosX=37, PosY=91, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
-------二层大BOSS-------
	{ ID=42181, PosX=25, PosY=104, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

	{ ID=42140, PosX=88, PosY=21, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42141, PosX=89, PosY=22, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42142, PosX=90, PosY=23, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42143, PosX=91, PosY=24, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42144, PosX=92, PosY=25,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42145, PosX=93, PosY=26,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42146, PosX=94, PosY=27,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42147, PosX=95, PosY=28,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42148, PosX=96, PosY=29,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42149, PosX=97, PosY=30,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42150, PosX=98, PosY=31,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42151, PosX=99, PosY=32,  BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42152, PosX=100, PosY=33, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42153, PosX=101, PosY=34, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42154, PosX=102, PosY=35, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42155, PosX=103, PosY=36, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42156, PosX=104, PosY=37, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42157, PosX=105, PosY=38, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42158, PosX=106, PosY=39, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
	{ ID=42159, PosX=107, PosY=40, BaseAI=20, ExtAIScript=256, ScriptID=-1, NeedCreate=1 },
-------三层大BOSS-------
	{ ID=42182, PosX=96, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

	{ ID=42160, PosX=18, PosY=19,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42161, PosX=19, PosY=20,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42162, PosX=20, PosY=21,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42163, PosX=21, PosY=22,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42164, PosX=22, PosY=23,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42165, PosX=23, PosY=24,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42166, PosX=24, PosY=25,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42167, PosX=25, PosY=26,  BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42168, PosX=26, PosY=27, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42169, PosX=27, PosY=28, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42170, PosX=28, PosY=29, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42171, PosX=29, PosY=30, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42172, PosX=30, PosY=31, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42173, PosX=31, PosY=32, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42174, PosX=32, PosY=33, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42175, PosX=33, PosY=34, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42176, PosX=34, PosY=35, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42177, PosX=35, PosY=36, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42178, PosX=36, PosY=37, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
	{ ID=42179, PosX=37, PosY=38, BaseAI=20, ExtAIScript=255, ScriptID=-1, NeedCreate=1 },
-------最终大BOSS-------
	{ ID=42183, PosX=28, PosY=28, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=42184, PosX=29, PosY=29, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=42185, PosX=27, PosY=27, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=42186, PosX=30, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },
	{ ID=42187, PosX=27, PosY=30, BaseAI=20, ExtAIScript=253, ScriptID=810100, NeedCreate=1 },

}


--**********************************
--脚本入口函数
--**********************************
function x899999_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x899999_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x899999_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x899999_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x899999_g_BossData do
		if BossData.NeedCreate == 1 then
			LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x899999_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x899999_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x899999_g_BossData do
		if DataID == Data.ID then
			x899999_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

--生长点 白虎石
--帮战副本
--脚本号710016
----等级1

--每次打开必定获得的产品
x710016_g_MainItemId = 30900052
----任务号
--x710016_g_MissionId = 1070

--生成函数开始************************************************************************
--每个ItemBox中最多10个物品
function	x710016_OnCreate(sceneId,growPointType,x,y)
	
	--放入ItemBox同时放入一个物品
	local targetId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710016_g_MainItemId)	--每个生长点最少能得到一个物品,这里直接放入itembox中一个
	
	local rand = random(1,100)
	if rand >= 70 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710016_g_MainItemId)
	end
	
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x710016_OnOpen(sceneId,selfId,targetId)
--	local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x710016_g_MissionId,x710016_g_MainItemId)
	if CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) ~= 0 then
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	else
		return OR_OK
	end
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	x710016_OnRecycle(sceneId,selfId,targetId)
	--返回1，生长点回收
	return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710016_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x710016_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

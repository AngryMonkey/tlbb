-- 连环副本回城市的传送点

x050105_g_ScriptId = 050105
x050105_g_ControlScript = 050100

x050105_g_Back_X = 60
x050105_g_Back_Z = 161

-- 玩家进入传送点
function x050105_OnEnterArea( sceneId, selfId )
	--CallScriptFunction( x050105_g_ControlScript, "Exit", sceneId, selfId )	
	--2007.12.6 by alan，防止组队跟随的队员被传送点传走
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, oldsceneId,x050105_g_Back_X,x050105_g_Back_Z)
end

-- 玩家停留在传送点
function x050105_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x050105_OnLeaveArea( sceneId, selfId )
	return
end

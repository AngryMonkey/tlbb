-- 连环副本回城市的传送点

x050103_g_ScriptId = 050103
x050103_g_ControlScript = 050100

x050103_g_Back_X = 60
x050103_g_Back_Z = 161

-- 玩家进入传送点
function x050103_OnEnterArea( sceneId, selfId )
	--CallScriptFunction( x050103_g_ControlScript, "Exit", sceneId, selfId )	
	--2007.12.6 by alan，防止组队跟随的队员被传送点传走
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, oldsceneId,x050103_g_Back_X,x050103_g_Back_Z)
end

-- 玩家停留在传送点
function x050103_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x050103_OnLeaveArea( sceneId, selfId )
	return
end

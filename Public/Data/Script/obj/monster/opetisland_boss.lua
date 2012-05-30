--玄武岛BOSS绑定

--脚本编号
x501999_g_ScriptId	= 501999

--**********************************
--Monster Timer
--**********************************
function x501999_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--全球公告

	str	= format( "#G玄武岛#P上的凶兽#{_BOSS49}#P已经出现，请各位大侠速往玄武岛收伏，以防其危害百姓。" )
	AddGlobalCountNews( sceneId, str )

	--取消时钟
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--死亡事件
--**********************************
function x501999_OnDie( sceneId, objId, killerId )

	--全球公告
	local	nam_ply	= GetName( sceneId, killerId )
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		nam_ply = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		nam_ply = GetName( sceneId, leaderID )
	end
	
	if nam_ply ~= nil then
		str	= format( "#P经过#W#{_INFOUSR%s}#P和其队伍的一番苦战，#{_BOSS49}#P终于被打败了。", nam_ply )
		AddGlobalCountNews( sceneId, str )
	end
	
end

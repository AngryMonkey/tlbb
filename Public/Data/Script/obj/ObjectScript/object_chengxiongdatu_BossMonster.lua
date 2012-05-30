x807000_g_scriptId=807000

x807000_g_dropitemId = 20309009

function x807000_OnDie(sceneId, objId, killerId)

	--如果是宠物打死的就获取其主人的ID....
	local PlayerId = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		PlayerId = GetPetCreator( sceneId, killerId )
	end

	AddMonsterDropItem(sceneId, objId, PlayerId, x807000_g_dropitemId)

end

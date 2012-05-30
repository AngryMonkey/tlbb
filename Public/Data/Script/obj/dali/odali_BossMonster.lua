x002074_g_scriptId=002074

x002074_g_dropitemId = 30701020

function x002074_OnDie(sceneId, objId, killerId)

  --如果是宠物打死的就获取其主人的ID....
	local PlayerId = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		PlayerId = GetPetCreator( sceneId, killerId )
	end
	
	AddMonsterDropItem(sceneId, objId, PlayerId, x002074_g_dropitemId)

end

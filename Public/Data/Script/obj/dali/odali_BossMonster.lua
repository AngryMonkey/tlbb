x002074_g_scriptId=002074

x002074_g_dropitemId = 30701020

function x002074_OnDie(sceneId, objId, killerId)

  --����ǳ�������ľͻ�ȡ�����˵�ID....
	local PlayerId = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		PlayerId = GetPetCreator( sceneId, killerId )
	end
	
	AddMonsterDropItem(sceneId, objId, PlayerId, x002074_g_dropitemId)

end

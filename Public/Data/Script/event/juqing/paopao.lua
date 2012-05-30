--200060

--**********************************
--泡泡通用，用名字查找这个场景是不是有这个Npc,有就＋
--**********************************
function x200060_Paopao( sceneId, NpcName, sceneName, nPaopaoStr )
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHave = 0
	local ii = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == NpcName  then
			--MonsterTalk(sceneId, nMonsterId, nPaopaoStr)
			MonsterTalk(sceneId, nMonsterId, sceneName, nPaopaoStr)
		end
	end
end

function x200060_Duibai( sceneId, NpcName, sceneName, szStr )
	
	if NpcName == ""   then
		MonsterTalk(sceneId, -1, sceneName, szStr)
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	local bHave = 0
	local ii = 0
	local bOk =0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == NpcName  then
			MonsterTalk(sceneId, nMonsterId, sceneName, szStr)
			bOk =1
		end
	end
	
	if bOk == 0  then
		MonsterTalk(sceneId, -1, sceneName, szStr)
	end
end


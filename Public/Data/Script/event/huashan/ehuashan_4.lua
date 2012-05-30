-- 1233
--华山论剑的相关逻辑处理

x001233_g_ScriptId = 001233

x001233_g_ActivityId = 39

function x001233_OnScenePlayerEnter( sceneId, playerId )
	
	-- 把玩家的Id记录到活动数据区，
	-- 查找一个空位置，用来保存
	for i=0, 500    do
		local nId = GetActivityParam(sceneId, x001233_g_ActivityId, i)
		if nId == -1   then
			SetActivityParam(sceneId, x001233_g_ActivityId, i, playerId)
			SetActivityParam(sceneId, x001233_g_ActivityId, i + 500, 0)
			break
		end
	end
	
	-- 每个门派的复活点是不一样的 
	local nPos_X
	local nPos_Z
	local nMenpai = LuaFnGetMenPai(sceneId, playerId)
	if nMenpai == 0  then
		nPos_X = 134
		nPos_Z = 18
	elseif nMenpai == 1   then
		nPos_X = 22
		nPos_Z = 123
	elseif nMenpai == 2   then
		nPos_X = 236
		nPos_Z = 108
	elseif nMenpai == 3   then
		nPos_X = 193
		nPos_Z = 233
	elseif nMenpai == 4   then
		nPos_X = 93
		nPos_Z = 236
	elseif nMenpai == 5   then
		nPos_X = 236
		nPos_Z = 174
	elseif nMenpai == 6   then	
		nPos_X = 23
		nPos_Z = 182
	elseif nMenpai == 7   then
		nPos_X = 48
		nPos_Z = 34
	elseif nMenpai == 8   then
		nPos_X = 228
		nPos_Z = 38
	elseif nMenpai == 9    then
		--没有门派的人应该是不出现的，避免错误出现，设置个位置
		nPos_X = 100
		nPos_Z = 100
	end
	
	-- 调整玩家阵营
	SetUnitCampID(sceneId, playerId, playerId, 10+nMenpai)
	
	SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0", sceneId, nPos_X, nPos_Z )

end

function x001233_OnSceneHumanDie( sceneId, selfId, killerId )

	-- 如果这个杀手是个宠物，需要现找到主人
	local nObjType = GetCharacterType(sceneId, killerId);
	local nHumanId = -1;
	if nObjType then
		if nObjType == 1 then
			nHumanId = killerId;
		elseif nObjType == 3 then
			nHumanId = GetPetCreator(sceneId, killerId);
		end
	end

	if nHumanId == -1 then
		return
	end

	-- 判定这些奖励的获得条件，
	-- 1，杀死自己的人，不能是本帮派的人，
	if LuaFnGetMenPai(sceneId, selfId) == LuaFnGetMenPai(sceneId, nHumanId)    then
		return
	end

	
	--挪到ehuashan_1.lua中去了 changed by xindefeng
	-- 2，给这个 killerId 的门派贡献度+1
	--local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, nHumanId)
	--SetHumanMenpaiPoint(sceneId, nHumanId, nMenpaiPoint+1)
	
	-- 3，给这个 killerId 的门派杀人数+1
	CallScriptFunction((001230), "KillPlayer",sceneId, nHumanId, selfId)

end

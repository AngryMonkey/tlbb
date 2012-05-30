x311011_g_scriptId=311011

--**********************************
--死亡事件
--**********************************
function x311011_OnDie( sceneId, selfId, killerId )
--	if random(1000) < 25 then
--		local pos_x,pos_z = LuaFnGetUnitPosition(sceneId,selfId)
--		local killer_type = GetCharacterType(sceneId,killerId)
--
--		if killer_type == -1 or killer_type == 2 then
--			return
--		elseif killer_type == 3 then
--			killerId = GetPetCreator(sceneId,killerId)
--		end
--
--		local guid = GetHumanGUID(sceneId,killerId)
--
--		local ret = DropBoxEnterScene(	pos_x,pos_z,sceneId )
--		if ret > 0 then
--			AddItemToBox(sceneId,ret,QUALITY_MUST_BE_CHANGE,1,30501035)
--			SetItemBoxOwner(sceneId,ret,guid)
--		end
--	end
--	
--	if random(10000) < 250 then
--		LuaFnSendSpecificImpactToUnit(sceneId,killerId,killerId,killerId,135,0)
--	end
end

--**********************************
--时钟事件
--**********************************
function x311011_OnCharacterTimer( sceneId, selfId, dataId, nowtime )
end


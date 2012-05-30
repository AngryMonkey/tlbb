--挂机终结者

--脚本号

x300026_g_scriptId = 300026


--**********************************
--事件交互入口
--**********************************
function x300026_OnDefaultEvent( sceneId, selfId, BagIndex )
end

--**********************************
--死亡事件
--**********************************
function x300026_OnDie( sceneId, selfId, killerId )

	local nObjType = GetCharacterType(sceneId, killerId);
	if nObjType then
		local nHumanId = -1;
		if nObjType == 1 then
			nHumanId = killerId;
		elseif nObjType == 3 then
			nHumanId = GetPetCreator(sceneId, killerId);
		end
		
		if nHumanId ~= -1 then
			LuaFnSendGuajiQuestion(sceneId, nHumanId);
		end
	end
end




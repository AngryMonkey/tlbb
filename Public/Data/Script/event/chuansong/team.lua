
--传送函数
x400900_g_scriptId=400900

x400900_g_Impact_No_ChangeScene = 38

x400900_g_Yinpiao = 40002000

function x400900_TransferFunc( sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel )
	local humanList = {};
	local humanCount = 0;
	
	--双人骑乘状态
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--处于双人骑乘状态，且是被动的，交给主动方来处理
			return
		end
	end
	
	--队友
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			--未知错误
			return
		end
		
		if teamLeaderFlag == 1 then
			if teamFollowFlag == 1 then
				--是队长且是组队跟随状态
				local followMemberCount = LuaFnGetFollowedMembersCount(sceneId, selfId);
				local i;
				local followMembers = {};
				for	i = 0, followMemberCount - 1 do
					followMembers[i] = GetFollowedMember(sceneId, selfId, i);
					if followMembers[i] and followMembers[i] ~= -1 then
						
						if followMembers[i] ~= selfId and IsHaveMission(sceneId, followMembers[i], 4021) > 0 then
							x400900_NotifyFailTips(sceneId, selfId, "您还有跟随的队友处于漕运状态中，无法传送。")
							return
						end
						
						if followMembers[i] ~= selfId and GetItemCount(sceneId, followMembers[i], x400900_g_Yinpiao) >=1 then
							x400900_NotifyFailTips(sceneId, selfId, "您还有跟随的队友处于跑商状态中，无法传送。")
							return
						end
	
						--双人骑乘状态
						local memberHasDRideFlag = LuaFnGetDRideFlag(sceneId, followMembers[i]);
						if memberHasDRideFlag and memberHasDRideFlag == 1 then
							local memberIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, followMembers[i]);
							if memberIsDRideMountOwner and memberIsDRideMountOwner == 1 then
							else
								--双人骑乘怎么可能与组队跟随并存呢?
								x400900_NotifyFailTips(sceneId, selfId, "双人骑乘不能与组队跟随并存。")
								return
							end
						end
						
						humanCount = humanCount + 1;
						humanList[humanCount] = followMembers[i];
					else
						x400900_NotifyFailTips(sceneId, selfId, "您还有跟随的队友没有到达本场景，暂时不能离开。")
						return
					end
				end
			else
				--是队长且不是组队跟随状态
				humanCount = humanCount + 1;
				humanList[humanCount] = selfId;
			end
		else
			if teamFollowFlag == 1 then
				--不是队长且是组队跟随状态，不理会，让队长的这个函数来处理
				return
			end
			humanCount = humanCount + 1;
			humanList[humanCount] = selfId;
		end
	else
		humanCount = humanCount + 1;
		humanList[humanCount] = selfId;
	end
	
	--各角色的双人骑乘
	local saveHumanCount = humanCount;
	local i;
	for i = 1, saveHumanCount do
		local tempHumanId = humanList[i];
		local drideFlag = LuaFnGetDRideFlag(sceneId, tempHumanId);
		if drideFlag and drideFlag == 1 then
			local isDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, tempHumanId);
			if isDRideMountOwner and isDRideMountOwner == 1 then
				local drideTargetID = LuaFnGetDRideTargetID(sceneId, tempHumanId);
				if drideTargetID and drideTargetID ~= -1 then
					
					if drideTargetID ~= selfId and IsHaveMission(sceneId, drideTargetID, 4021) > 0 then
						x400900_NotifyFailTips(sceneId, selfId, "您或您的跟随队伍中有双人骑乘的对方处于漕运状态中，无法传送。")
						return
					end
					
					if drideTargetID ~= selfId and GetItemCount(sceneId, drideTargetID, x400900_g_Yinpiao) >=1 then
						x400900_NotifyFailTips(sceneId, selfId, "您或您的跟随队伍中有双人骑乘的对方处于跑商状态中，无法传送。")
						return
					end
					
					humanCount = humanCount + 1;
					humanList[humanCount] = drideTargetID;
				end
			else
				--前面的检测出错了
				return
			end
		end
	end
	
	local checkHumanId;
	for _, checkHumanId in humanList do
		local checkRet, errorTips, errorSelfTips = x400900_CheckChangeScene(sceneId, checkHumanId, newSceneId, posX, posY, minLevel, maxLevel);
		if checkRet and checkRet == 1 then
		else
			if errorTips then
				x400900_NotifyFailTips(sceneId, checkHumanId, errorTips);
			end
			if checkHumanId ~= selfId and errorSelfTips then
				x400900_NotifyFailTips(sceneId, selfId, errorSelfTips);
			end
			return
		end
	end
	
	if sceneId ~= newSceneId then
		for _, checkHumanId in humanList do
			NewWorld(sceneId, checkHumanId, newSceneId, posX, posY);
		end
	else
		for _, checkHumanId in humanList do
			SetPos(sceneId, checkHumanId, posX, posY)
		end
	end
end

function x400900_TransferFuncFromNpc( sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel )
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		BeginEvent( sceneId )
			local strText = "您处于漕运状态中，不可以使用传送的功能。"
			AddText( sceneId, strText )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1 then
		BeginEvent( sceneId )
			local strText = "您处于跑商状态中，不可以使用传送的功能。"
			AddText( sceneId, strText )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	else
		x400900_TransferFunc(sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel);
	end
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x400900_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 级别限制的检测
--**********************************
function x400900_CheckChangeScene(sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel)
	if not sceneId or not selfId or not newSceneId or not posX or not posY then
		return 0, "无效传送请求，无法传送。", "无效传送请求，无法传送。";
	end

	local selfLevel = LuaFnGetLevel(sceneId, selfId);
	if not selfLevel then
		return 0, "无效传送请求，无法传送。", "无效传送请求，无法传送。";
	end
	
	local livingFlag = LuaFnIsCharacterLiving(sceneId, selfId);
	if not livingFlag or livingFlag ~= 1 then
		return 0, "你已经死亡，无法传送。", GetName(sceneId, selfId).."已经死亡，无法传送。";
	end
	
	if minLevel and selfLevel < minLevel then
		return 0, "你的级别不足"..tostring(minLevel).."，无法传送。", GetName(sceneId, selfId).."的级别不足"..tostring(minLevel).."，无法传送。"; 
	end
	
	if maxLevel and selfLevel >= maxLevel then
		return 0, "你的级别必需小于"..tostring(maxLevel).."，才能传送。", GetName(sceneId, selfId).."的级别必需小于"..tostring(maxLevel).."，才能传送。";
	end
	
	local changeSceneImpactCheck = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x400900_g_Impact_No_ChangeScene);
	if not changeSceneImpactCheck or changeSceneImpactCheck ~= 0 then
		return 0, "你现在还不能离开。", GetName(sceneId, selfId).."现在还不能离开。";
	end
	
	--if IsHaveMission(sceneId, selfId, 4021) > 0 then
	--	return 0,"你正处于漕运状态中，无法传送。", GetName(sceneId, selfId).."正处于漕运状态中，无法传送。";
	--end
	
	--if GetItemCount(sceneId, selfId, x400900_g_Yinpiao) >=1 then
	--	return 0, "你正处于跑商状态中，无法传送。", GetName(sceneId, selfId).."正处于跑商状态中，无法传送。";
	--end
	
	return 1, "", "";
end

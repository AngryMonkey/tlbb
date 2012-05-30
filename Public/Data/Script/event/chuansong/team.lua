
--���ͺ���
x400900_g_scriptId=400900

x400900_g_Impact_No_ChangeScene = 38

x400900_g_Yinpiao = 40002000

function x400900_TransferFunc( sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel )
	local humanList = {};
	local humanCount = 0;
	
	--˫�����״̬
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--����˫�����״̬�����Ǳ����ģ�����������������
			return
		end
	end
	
	--����
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			--δ֪����
			return
		end
		
		if teamLeaderFlag == 1 then
			if teamFollowFlag == 1 then
				--�Ƕӳ�������Ӹ���״̬
				local followMemberCount = LuaFnGetFollowedMembersCount(sceneId, selfId);
				local i;
				local followMembers = {};
				for	i = 0, followMemberCount - 1 do
					followMembers[i] = GetFollowedMember(sceneId, selfId, i);
					if followMembers[i] and followMembers[i] ~= -1 then
						
						if followMembers[i] ~= selfId and IsHaveMission(sceneId, followMembers[i], 4021) > 0 then
							x400900_NotifyFailTips(sceneId, selfId, "�����и���Ķ��Ѵ�������״̬�У��޷����͡�")
							return
						end
						
						if followMembers[i] ~= selfId and GetItemCount(sceneId, followMembers[i], x400900_g_Yinpiao) >=1 then
							x400900_NotifyFailTips(sceneId, selfId, "�����и���Ķ��Ѵ�������״̬�У��޷����͡�")
							return
						end
	
						--˫�����״̬
						local memberHasDRideFlag = LuaFnGetDRideFlag(sceneId, followMembers[i]);
						if memberHasDRideFlag and memberHasDRideFlag == 1 then
							local memberIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, followMembers[i]);
							if memberIsDRideMountOwner and memberIsDRideMountOwner == 1 then
							else
								--˫�������ô��������Ӹ��沢����?
								x400900_NotifyFailTips(sceneId, selfId, "˫����˲�������Ӹ��沢�档")
								return
							end
						end
						
						humanCount = humanCount + 1;
						humanList[humanCount] = followMembers[i];
					else
						x400900_NotifyFailTips(sceneId, selfId, "�����и���Ķ���û�е��ﱾ��������ʱ�����뿪��")
						return
					end
				end
			else
				--�Ƕӳ��Ҳ�����Ӹ���״̬
				humanCount = humanCount + 1;
				humanList[humanCount] = selfId;
			end
		else
			if teamFollowFlag == 1 then
				--���Ƕӳ�������Ӹ���״̬������ᣬ�öӳ����������������
				return
			end
			humanCount = humanCount + 1;
			humanList[humanCount] = selfId;
		end
	else
		humanCount = humanCount + 1;
		humanList[humanCount] = selfId;
	end
	
	--����ɫ��˫�����
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
						x400900_NotifyFailTips(sceneId, selfId, "�������ĸ����������˫����˵ĶԷ���������״̬�У��޷����͡�")
						return
					end
					
					if drideTargetID ~= selfId and GetItemCount(sceneId, drideTargetID, x400900_g_Yinpiao) >=1 then
						x400900_NotifyFailTips(sceneId, selfId, "�������ĸ����������˫����˵ĶԷ���������״̬�У��޷����͡�")
						return
					end
					
					humanCount = humanCount + 1;
					humanList[humanCount] = drideTargetID;
				end
			else
				--ǰ��ļ�������
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
			local strText = "����������״̬�У�������ʹ�ô��͵Ĺ��ܡ�"
			AddText( sceneId, strText )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	elseif LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1 then
		BeginEvent( sceneId )
			local strText = "����������״̬�У�������ʹ�ô��͵Ĺ��ܡ�"
			AddText( sceneId, strText )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	else
		x400900_TransferFunc(sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel);
	end
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x400900_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- �������Ƶļ��
--**********************************
function x400900_CheckChangeScene(sceneId, selfId, newSceneId, posX, posY, minLevel, maxLevel)
	if not sceneId or not selfId or not newSceneId or not posX or not posY then
		return 0, "��Ч���������޷����͡�", "��Ч���������޷����͡�";
	end

	local selfLevel = LuaFnGetLevel(sceneId, selfId);
	if not selfLevel then
		return 0, "��Ч���������޷����͡�", "��Ч���������޷����͡�";
	end
	
	local livingFlag = LuaFnIsCharacterLiving(sceneId, selfId);
	if not livingFlag or livingFlag ~= 1 then
		return 0, "���Ѿ��������޷����͡�", GetName(sceneId, selfId).."�Ѿ��������޷����͡�";
	end
	
	if minLevel and selfLevel < minLevel then
		return 0, "��ļ�����"..tostring(minLevel).."���޷����͡�", GetName(sceneId, selfId).."�ļ�����"..tostring(minLevel).."���޷����͡�"; 
	end
	
	if maxLevel and selfLevel >= maxLevel then
		return 0, "��ļ������С��"..tostring(maxLevel).."�����ܴ��͡�", GetName(sceneId, selfId).."�ļ������С��"..tostring(maxLevel).."�����ܴ��͡�";
	end
	
	local changeSceneImpactCheck = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x400900_g_Impact_No_ChangeScene);
	if not changeSceneImpactCheck or changeSceneImpactCheck ~= 0 then
		return 0, "�����ڻ������뿪��", GetName(sceneId, selfId).."���ڻ������뿪��";
	end
	
	--if IsHaveMission(sceneId, selfId, 4021) > 0 then
	--	return 0,"������������״̬�У��޷����͡�", GetName(sceneId, selfId).."����������״̬�У��޷����͡�";
	--end
	
	--if GetItemCount(sceneId, selfId, x400900_g_Yinpiao) >=1 then
	--	return 0, "������������״̬�У��޷����͡�", GetName(sceneId, selfId).."����������״̬�У��޷����͡�";
	--end
	
	return 1, "", "";
end

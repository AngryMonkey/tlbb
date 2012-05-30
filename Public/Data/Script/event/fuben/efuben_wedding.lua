--婚庆副本

x401030_g_ScriptId = 401030;				-- 脚本号

x401030_g_CopySceneName = "婚庆典礼";		-- 副本名称
x401030_g_CopySceneType = FUBEN_WEDDING;	-- 副本类型，定义在ScriptGlobal.lua里面
x401030_g_TickElapse = 5;					-- 回调脚本的时钟时间（单位：秒/次）
x401030_g_LimitTickCount = 500;				-- 副本心跳次数限制（单位：次数）
x401030_g_CloseTick = 6;					-- 副本关闭前倒计时心跳次数（单位：次数）
x401030_g_NoUserTime = 300;					-- 副本中没有人后可以继续保存的时间（单位：秒）
x401030_g_Fuben_X = 40;						-- 进副本的位置X
x401030_g_Fuben_Z = 45;						-- 进副本的位置Z
x401030_g_Back_X = 175;						-- 出副本的位置X
x401030_g_Back_Z = 95;						-- 出副本的位置Z

x401030_g_closeEventNotifyText_minute = "场景将在%d分钟后关闭!";
x401030_g_closeEventNotifyText_second = "你将在%d秒后离开场景!";

x401030_g_invitationDataId_level1  = 30303100;		-- 普通请帖ID
x401030_g_invitationDataId_level2  = 30303101;		-- 高级请帖ID
x401030_g_invitationDataId_level3  = 30303102;		-- 豪华请帖ID

--**********************************
--创建函数
--**********************************
function x401030_Create(sceneId, selfId, marryTargetId, weddingLevel)

	local selfGUID, marryTargetGUID;
	selfGUID = -1;
	marryTargetGUID = -1;
	if selfId and selfId ~= -1 then
		selfGUID  = LuaFnObjId2Guid(sceneId, selfId);
	end
	
	if marryTargetId and marryTargetId ~= -1 then
		marryTargetGUID = LuaFnObjId2Guid(sceneId, marryTargetId);
	end
	
	if selfGUID and selfGUID ~= -1 and marryTargetGUID and marryTargetGUID ~= -1 then
	else
		return 0;
	end
	
	if weddingLevel == 1 then
		LuaFnSetSceneLoad_Map(sceneId, "wedding_2.nav");
		LuaFnSetSceneLoad_Monster(sceneId, "wedding_2_monster.ini");
	elseif weddingLevel == 2 then
		LuaFnSetSceneLoad_Map(sceneId, "wedding_3.nav");
		LuaFnSetSceneLoad_Monster(sceneId, "wedding_3_monster.ini");
	else
		LuaFnSetSceneLoad_Map(sceneId, "wedding_1.nav");
		LuaFnSetSceneLoad_Monster(sceneId, "wedding_1_monster.ini");
	end
	
	LuaFnSetCopySceneData_TeamLeader(sceneId, selfGUID);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401030_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401030_g_TickElapse * 1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401030_g_CopySceneType);				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401030_g_ScriptId);					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);										--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);									--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);										--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);										--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, selfGUID);								--设置男主人的GUID
	LuaFnSetCopySceneData_Param(sceneId, 7, marryTargetGUID);							--设置女主人的GUID
	LuaFnSetCopySceneData_Param(sceneId, 8, weddingLevel);							--婚庆典礼级别
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, 0);					--级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene(sceneId);								--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x401030_NotifyTips(sceneId, selfId, "副本创建成功！");
	else
		x401030_NotifyTips(sceneId, selfId, "副本数量已达上限，请稍候再试！");
	end
end

--**********************************
--创建函数
--**********************************
function x401030_Close(sceneId, selfId)
	local selfGUID = LuaFnGetGUID(sceneId, selfId);
	local marryCharGUID_A, marryCharGUID_B;
	marryCharGUID_A = LuaFnGetCopySceneData_Param(sceneId, 6);
	marryCharGUID_B = LuaFnGetCopySceneData_Param(sceneId, 7);
	local bSelfWedding = 0;
	if selfGUID and marryCharGUID_A and marryCharGUID_B then
		if marryCharGUID_A < 0 then
			marryCharGUID_A = marryCharGUID_A + 4294967296;
		end
		if marryCharGUID_B < 0 then
			marryCharGUID_B = marryCharGUID_B + 4294967296;
		end
		if selfGUID == marryCharGUID_A or selfGUID == marryCharGUID_B then
			bSelfWedding = 1;
		end
	end

	if bSelfWedding == 1 then
		local tempParam = LuaFnGetCopySceneData_Param(sceneId, 4);
		if tempParam == 0 then
			LuaFnSetCopySceneData_Param(sceneId, 4, 1);
			BroadMsgByChatPipe(sceneId, selfId, "婚礼已经举行完毕，场景即将关闭，请大家速度离开，谢谢大家的参与！", 2);
		end
	end
end

--**********************************************************
--玩家进入副本
--selfId		:	要进入副本的玩家ID
--targetGUID	:	进入谁的副本（男或女主角的GUID）
--**********************************************************
function x401030_PlayerEnter(sceneId, selfId, targetId, targetGUID)
	if targetGUID and selfId then
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		if targetGUID < 0 then
			targetGUID = targetGUID + 4294967296;
		end
		local checkRet = 0;
		if selfGUID and selfGUID == targetGUID then
			checkRet = 1;
		else
			local itemIdList = {x401030_g_invitationDataId_level3, x401030_g_invitationDataId_level2, x401030_g_invitationDataId_level1};
			local itemId;
			local itemPos;
			for _, itemId in itemIdList do
				local i, maxCount;
				maxCount = 100;
				itemPos = 0;
				for i = 0, maxCount - 1 do
					itemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, itemId, itemPos);
					if itemPos and itemPos > -1 then
						local creatorGUID = GetBagItemParam(sceneId, selfId, itemPos, 0, 2);
						if creatorGUID and creatorGUID == targetGUID then
							checkRet = 1;
							break;
						end
						itemPos = itemPos + 1;
					else
						break;
					end
				end
				if checkRet == 1 then
					break;
				end
			end
		end

		if checkRet == 1 then
			local destSceneId = FindCopySceneIDByCopySceneParams(sceneId, x401030_g_CopySceneType, 1, 6, targetGUID);
			if destSceneId and destSceneId >= 0 then
			else
				destSceneId = FindCopySceneIDByCopySceneParams(sceneId, x401030_g_CopySceneType, 1, 7, targetGUID);
			end
			
			if destSceneId and destSceneId >= 0 then
				local leaveFlag = LuaFnGetCopySceneData_Param(destSceneId, 4);
				if leaveFlag == 1 then
					x401030_MessageBox(sceneId, selfId, targetId, "对不起，您所请求进入的礼堂正在关闭之中。");
				else
					NewWorld(sceneId, selfId, destSceneId, x401030_g_Fuben_X, x401030_g_Fuben_Z);
					return 1;
				end
			else
				x401030_MessageBox(sceneId, selfId, targetId, "对不起，现在没有给您发贴的人的婚礼。");
			end
		else
			x401030_MessageBox(sceneId, selfId, targetId, "对不起，现在没有给您发贴的人的婚礼。");
		end
	end
	return 0;
end

--**********************************
--玩家退出副本
--**********************************
function x401030_PlayerExit(sceneId, selfId)
	if selfId then
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--取得副本入口场景号
		
		--将当前副本场景里的所有人传送回原来进入时候的场景
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if memId == selfId then
				NewWorld(sceneId, selfId, oldsceneId, x401030_g_Back_X, x401030_g_Back_Z);
				return 
			end
		end
	end
end

--**********************************
--副本事件
--**********************************
function x401030_OnCopySceneReady(sceneId, destSceneId)

	LuaFnSetCopySceneData_Param(destSceneId, 3, sceneId);			--设置副本入口场景号
	
	local selfGUID  = LuaFnGetCopySceneData_Param(destSceneId, 6);
	local marryTargetGUID  = LuaFnGetCopySceneData_Param(destSceneId, 7);
	
	if selfGUID and selfGUID ~= -1 and marryTargetGUID and marryTargetGUID ~= -1 then
	else
		return 0;
	end

	local selfId, marryTargetId;
	selfId = -1;
	marryTargetId = -1;
	if selfGUID and selfGUID ~= -1 then
		selfId = LuaFnGuid2ObjId(sceneId, selfGUID);
	end
	
	if marryTargetGUID and marryTargetGUID ~= -1 then
		marryTargetId = LuaFnGuid2ObjId(sceneId, marryTargetGUID);
	end

	if selfId and selfId ~= -1 then
		if LuaFnIsCanDoScriptLogic(sceneId, selfId) ~= 1 then
			return 
		end
	end

	if marryTargetId and marryTargetId ~= -1 then
		if LuaFnIsCanDoScriptLogic(sceneId, marryTargetId) ~= 1 then
			return 
		end
	end
	
	if selfId and selfId ~= -1 then
		NewWorld(sceneId, selfId, destSceneId, x401030_g_Fuben_X, x401030_g_Fuben_Z);
	end
	
	if marryTargetId and marryTargetId ~= -1 then
		NewWorld(sceneId, marryTargetId, destSceneId, x401030_g_Fuben_X, x401030_g_Fuben_Z);
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x401030_OnPlayerEnter(sceneId, selfId)
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x401030_OnHumanDie(sceneId, selfId, killerId)
end

--**********************************
--副本场景定时器事件
--**********************************
function x401030_OnCopySceneTimer(sceneId, nowTime)
	
	--副本时钟读取及设置
	local tickCount = LuaFnGetCopySceneData_Param(sceneId, 2);	--取得已经执行的定时次数
	tickCount = tickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, tickCount);		--设置新的定时器调用次数
		
	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4);
	
	if leaveFlag == 1 then --需要离开

		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5);
		leaveTickCount = leaveTickCount + 1;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount);
		
		if leaveTickCount > x401030_g_CloseTick or leaveTickCount == x401030_g_CloseTick then --倒计时间到，大家都出去吧
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);--取得副本入口场景号
			
			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			local mems = {};
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				NewWorld(sceneId, mems[i], oldsceneId, x401030_g_Back_X, x401030_g_Back_Z);
			end
			
		elseif leaveTickCount < x401030_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			local mems = {};
	  		local strText = format(x401030_g_closeEventNotifyText_second, (x401030_g_CloseTick-leaveTickCount)*x401030_g_TickElapse);
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				x401030_NotifyTips(sceneId, mems[i], strText);
			end
		end

	elseif tickCount > x401030_g_LimitTickCount or tickCount == x401030_g_LimitTickCount then
		LuaFnSetCopySceneData_Param(sceneId, 4, 1);
		return
	else
		local tempSecond = (x401030_g_LimitTickCount - tickCount) * x401030_g_TickElapse;
		local tempMinute = floor(tempSecond / 60);
		if tempMinute * 60 == tempSecond then
			local bNotify = 0;
			if tempMinute > 10 then
				local tempValue = floor(tempMinute / 10);
				if tempValue * 10 == tempMinute then
					bNotify = 1;
				end
			elseif tempMinute > 1 then
				bNotify = 1;
			end
			
			if bNotify == 1 then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
				local mems = {};
				local strText = format(x401030_g_closeEventNotifyText_minute, tempMinute);
				for	i=0,membercount-1 do
					mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					x401030_NotifyTips(sceneId, mems[i], strText);
				end
			end
		end
	end
end

function x401030_NotifyTips(sceneId, selfId, tipText)
	BeginEvent(sceneId);
		AddText(sceneId, tipText);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--对话窗口信息提示
--**********************************
function x401030_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

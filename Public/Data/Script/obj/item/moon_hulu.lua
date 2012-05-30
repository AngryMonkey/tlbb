--------------------------------------------
--月老葫芦道具脚本
--Created By 左春伟
--------------------------------------------

--脚本ID
x335908_g_scriptId = 335908
-- 收集情报任务号
x335908_g_MissionId = 1144;

--场景信息表
x335908_g_select_sceneId = 
{
	[1]=  {6, 	"无量山的白猿石阵", 	53,264, },
	[2]=  {7, 	"剑阁的剑门叠翠",   	130,135, },
	[3]=  {8, 	"敦煌的瀚海求佛",			260,260, },
	[4]=  {5, 	"镜湖的玉带临风",			39,261, },
	[5]=  {4, 	"太湖的舞榭歌台",			160,252, },
	[6]=  {3, 	"嵩山的江山多娇",			275,85, },
	[7]=  {30, 	"西湖的一望虎跑",     170,235, },
	[8]=  {24, 	"洱海的百舸争流",     260,270, },
	[9]=  {18, 	"雁南的枫桥夕照",     150,250, },
	[10]= {31, 	"龙泉的飞流直下",     270,280, },
	[11]= {25, 	"苍山的似水年华",     258,73, },
	[12]= {19, 	"雁北的壁立千仞",     283,179, },
	[13]= {32, 	"武夷的烟锁二乔",     54,182, },
	[14]= {26, 	"石林的峰峦入聚",     195,53, },
	[15]= {20, 	"草原的狼王石阵",     143,254, },
	[16]= {33, 	"梅岭的梅岭佛光",     284,82, },
	[17]= {27, 	"玉溪的青眉如豆",     268,116, },
	[18]= {21, 	"辽西的敖包相会",     277,117, },
	[19]= {34, 	"南海的天南一柱",     61,225, },
	[20]= {23,	"黄龙府的天池雪景",   289,66, },
}

--**********************************
--事件交互入口
--**********************************
function x335908_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335908_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335908_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if IsHaveMission(sceneId, selfId, x335908_g_MissionId) ==  1 then	
		if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
			return 0;
		end	
		local ret, msg = x335908_IsFitCondition(sceneId, selfId);
		if ret == 0 then
			x335908_MsgBox( sceneId, selfId, msg );
			return 0;
		end
		--pass
		return 1;
	end
	return 0;
end

--**********************************
--聚气技能开始回调接口：
--系统会在技能开始的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：处理通过，可以继续执行；返回0：失败，中断后续执行。
--**********************************
function x335908_OnStartCharging( sceneId, selfId )	
	x335908_MsgBox(sceneId, selfId, "#{JZSJ_081119}");
	return 1;
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335908_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x335908_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335908_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335908_g_MissionId);
		local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1) + 1;	
		SetMissionByIndex(sceneId, selfId, misIndex, 1, ringNum);  							--任务环数加1
		--只需要保存前2个打探过的场景号。任务第四位做特殊用途。 x808010_g_StrForePart = 4
		if ringNum < 3 then
			SetMissionByIndex(sceneId, selfId, misIndex, ringNum+1, sceneId); 		--该场景已打探过	
		end		
		local msg = format("#{YHJZ_081007_35}任务进度：%d/3", ringNum);
		x335908_MsgBox(sceneId, selfId, msg);	 --收集成功，您获得了一些仙灵之气。
		if ringNum >= 3 then 																										-- 设置任务完成
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			x335908_MsgBox(sceneId, selfId, "任务完成！");
		end
		return 1;
	end
	return 0;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335908_OnActivateEachTick( sceneId, selfId)
	return 1;
end

--**********************************
--信息提示
--**********************************
function x335908_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 条件检查 
-- 成功：1  失败：0
--**********************************
function x335908_IsFitCondition(sceneId, selfId)
 	--已收集3处仙气？
 	local misIndex = GetMissionIndexByID(sceneId, selfId, x335908_g_MissionId);
 	local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1)
 	if ringNum >= 3 then
		return 0, "#{YHJZ_081007_31}" 		
 	end
 	--场景正确？
 	local param = {}; 	
 	param[1] = GetMissionParam(sceneId, selfId, misIndex, 5);
 	param[2] = GetMissionParam(sceneId, selfId, misIndex, 6);
 	param[3] = GetMissionParam(sceneId, selfId, misIndex, 7);
 	local bFlag = 0;
 	local index = 0;
 	for i=1, 3 do
 		if x335908_g_select_sceneId[param[i]+1][1] == sceneId then
 			index = param[i]+1;
 			bFlag = 1;
 			break
 		end
 	end 
 	if bFlag == 0 then
 		return 0, "#{YHJZ_081007_32}";
 	end
 	--已收集过？
 	for i=2, 3 do
 		if sceneId == GetMissionParam(sceneId, selfId, misIndex, i) then
 			return 0, "#{YHJZ_081007_33}";
 		end
 	end
 	--位置正确？
 	local pos_x, pos_z = LuaFnGetWorldPos(sceneId, selfId);
 	local distance =
 	(x335908_g_select_sceneId[index][3]-pos_x) * (x335908_g_select_sceneId[index][3]-pos_x) + 
 	(x335908_g_select_sceneId[index][4]-pos_z) * (x335908_g_select_sceneId[index][4]-pos_z);	
 	if distance > 18 then
 		return 0, "你离收集地点太远！";
 	end
 	--夫妻组队？
 	--1.是否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--2.是否俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--3.是否在附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--4.是否是夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		return 0, "#{YHJZ_081007_34}";
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			return 0, "#{YHJZ_081007_34}";
		end
	end	
	-- OK
	return 1, "ok";
end

--刘健明

--脚本号
x311002_g_scriptId = 311002

--所拥有的事件ID列表
x311002_g_eventList={}--250036

x311002_g_eventDETime_1 = 0;
x311002_g_eventDETime_2 = 1;
x311002_g_eventDETime_4 = 2;
x311002_g_eventDETime_Lock = 3;
x311002_g_eventDETime_Unlock = 4;
x311002_g_eventDETime_Ask = 5;
x311002_g_Do_Unlock = 6;
x311002_g_Abandon_Unlock  = 7;

x311002_g_eventUpdateList = 100;
x311002_g_eventAddDETimeBegin = 200;

x311002_g_NpcSceneId = 0

-- 2000年1月3日凌晨0点的时间,双倍经验时间的基准
TIME_2000_01_03_	=		946828868


x311002_g_BuffPalyer_25 = 60
x311002_g_BuffAll_15 = 62
x311002_g_BuffPet_25 = 61
x311002_g_BuffPet_2 = 53

--**********************************
--事件列表
--**********************************
function x311002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

		AddText(sceneId,"  #{LS_20080303}");
		
		AddNumText(sceneId, x311002_g_scriptId, "我想领一小时双倍经验时间", 6,x311002_g_eventDETime_1 )
		AddNumText(sceneId, x311002_g_scriptId, "我想领二小时双倍经验时间", 6,x311002_g_eventDETime_2 )
		AddNumText(sceneId, x311002_g_scriptId, "我想领四小时双倍经验时间", 6,x311002_g_eventDETime_4 )
		AddNumText(sceneId, x311002_g_scriptId, "我想冻结双倍经验时间", 6,x311002_g_eventDETime_Lock )
		AddNumText(sceneId, x311002_g_scriptId, "我想解冻双倍经验时间", 6,x311002_g_eventDETime_Unlock )
		AddNumText(sceneId, x311002_g_scriptId, "我想查询我本周双倍经验时间", 6,x311002_g_eventDETime_Ask )
		AddNumText( sceneId, x311002_g_scriptId, "领双介绍", 11, 10 )
			
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end	

--**********************************
--事件交互入口
--**********************************
function x311002_OnDefaultEvent( sceneId, selfId, targetId )
	x311002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x311002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_079}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	-- 判断玩家的等级，小于10就返回
	if GetLevel(sceneId, selfId) < 10  then
		BeginEvent(sceneId)
			AddText(sceneId,"  你的等级还不到10级，还是再练练吧。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 
	end
	
	-- 检测是不是需要从新刷新数据
	-- 现在时间
	local nCurTime = LuaFnGetCurrentTime()
	-- 上次刷新数据的时间
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-TIME_2000_01_03_)/(3600*24*7)))   then
		DEResetWeeklyFreeTime(sceneId, selfId)
	end
	
	local nNowGetTime = 0
	
	if GetNumText() == x311002_g_eventDETime_1	then
		nNowGetTime	= 1
		x311002_AddDETime(sceneId, selfId, targetId, 1, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_2	then
		nNowGetTime	= 2
		x311002_AddDETime(sceneId, selfId, targetId, 2, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_4	then
		nNowGetTime	= 4
		x311002_AddDETime(sceneId, selfId, targetId, 4, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_Lock	then
		
		-- 先检测一下是不是冻结状态，如果是，就返回，并直接提示
		if DEIsLock(sceneId, selfId) > 0   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你的双倍经验时间已经处于冻结状态了。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return			
		end
	
		-- 冻结的时候，
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;
		
		if nTrueTime <= 0 then 
			BeginEvent(sceneId)
				AddText(sceneId,"  你现在没有已领取的双倍时间啊！？")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			nTrueTime = 0
			return
		end
		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x311002_g_scriptId);
			UICommand_AddInt(sceneId,targetId);
			UICommand_AddInt(sceneId,50)
			UICommand_AddString(sceneId,"LockTime");
			local str = format("你当前有%d分钟的双倍时间，你确定要冻结吗？",floor(nTrueTime/60) ) 
			UICommand_AddString(sceneId,str);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)		

	elseif GetNumText() == x311002_g_eventDETime_Unlock	then
		-- 解冻的时候，
		-- 先判断是不是有双倍经验时间可以解除
		local bLock = DEIsLock(sceneId, selfId)
		if bLock <= 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"  你没有在我这里冻结双倍经验时间啊！？")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 如果玩家身上有药水的BUFF，需要给玩家一个提示
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffPalyer_25) == 1   
				or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffAll_15) == 1
				then
			BeginEvent(sceneId)
				AddText(sceneId,"  您身上已经存在了多倍经验时间，是否确认解冻？")
				AddNumText(sceneId, x311002_g_scriptId, "确认解冻", 6,x311002_g_Do_Unlock )
				AddNumText(sceneId, x311002_g_scriptId, "放弃解冻", 6,x311002_g_eventUpdateList )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		DESetLock(sceneId, selfId, 0)
		--DESetBeginTime(sceneId, selfId, nCurTime)
		BeginEvent(sceneId)
			AddText(sceneId,"  你冻结的双倍经验时间已经解冻了。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		-- 同步数据到客户端
		SendDoubleExpToClient(sceneId,selfId)
	
	elseif GetNumText() == x311002_g_Do_Unlock	then
		DESetLock(sceneId, selfId, 0)
		--DESetBeginTime(sceneId, selfId, nCurTime)
		BeginEvent(sceneId)
			AddText(sceneId,"  你冻结的双倍经验时间已经解冻了。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		-- 同步数据到客户端
		SendDoubleExpToClient(sceneId,selfId)
	
	elseif GetNumText() == x311002_g_Abandon_Unlock	then
		return
		
	elseif GetNumText() == x311002_g_eventDETime_Ask	then
			
		local nCount = DEGetCount(sceneId, selfId)
	
		BeginEvent(sceneId)
			if nCount and nCount > 0 then
				AddText(sceneId,"可在我这里领取的你本周的双倍经验时间为#R"..tostring(floor(nCount)).."小时#W，快好好利用吧。")
			else
				AddText(sceneId,"真是遗憾，我能提供你本周的双倍经验时间为#R0小时#W了。")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == x311002_g_eventUpdateList	then
		x311002_UpdateEventList( sceneId, selfId,targetId )
	
	elseif GetNumText() >= x311002_g_eventAddDETimeBegin	then
		--验证并且增加
		local nPoint = GetNumText()-x311002_g_eventAddDETimeBegin;
		
		local nCount = DEGetCount(sceneId, selfId)
		if nCount < nPoint    then
			return
		end
		
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;
		
		if nTrueTime < 0 then 
			nTrueTime = 0
		end
		
		WithDrawFreeDoubleExpTime(sceneId, selfId, nPoint, 0, 0 )
		
		BeginEvent(sceneId)
			AddText(sceneId,"  你已成功领取了#R".. nPoint .."小时#W的双倍经验时间。现在你一共拥有#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "分钟#W的双倍经验时间")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		BeginEvent(sceneId)
			AddText(sceneId,"  你已成功领取了#R".. nPoint .."小时#W的双倍经验时间。现在你一共拥有#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "分钟#W的双倍经验时间")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		-- 同步数据到客户端
		SendDoubleExpToClient(sceneId,selfId)

	end

end

function x311002_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		
		local nFreeTime = DEGetFreeTime(sceneId, selfId)
		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;
		
		if nTrueTime < 0 then 
			nTrueTime = 0
		end
		
		-- 看还有没有时间可以领取
		local nCount = DEGetCount(sceneId, selfId)
		
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你本周从我这里可以领取的双倍经验时间，已经用完了。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 
		end
		
		if nCount < nPoint   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你没有这么多的时间可以领取了")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 
		end
		
		-- 看身上是不是已经有比较多的时间了，2小时
		if nFreeTime >= 120*60   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你在三大城市和自建城市中获得的双倍经验时间已经达到可领取的上限")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 
		end
		
		-- 检测玩家不能拥有超过4个小时的时间
		if nFreeTime + nPoint*3600 > 3600*4   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你在三大城市和自建城市中获得的双倍经验时间已经达到可领取的上限")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 
		end
		
		-- 看身上是不是有冻结了的时间
		if DEIsLock(sceneId,selfId)  > 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"  你还有冻结的双倍经验时间，还是先解冻再领取新的双倍经验时间吧。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 
		end
	
		BeginEvent(sceneId)
			if (nTrueTime/60) > 0 then
				AddText(sceneId,"你本周双倍经验时间剩余#R" .. tostring(floor(nCount)) .. "小时#W，当前已有双倍经验时间#Y" .. tostring(floor(nTrueTime/60)) .. "分钟#W，你确认要领取#Y" .. tostring(floor(nPoint*60)) .. "分钟#W双倍经验时间吗？");
			else
				AddText(sceneId,"你本周双倍经验时间剩余#R" .. tostring(floor(nCount)) .. "小时#W，你确认要领取#Y" .. tostring(floor(nPoint*60)) .. "分钟#W双倍经验时间吗？");
			end
			
			-- 如果这个时候玩家身上有双倍经验药水效果，需要给玩家提示
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffAll_15) == 1
					then
				AddText(sceneId,"  #r  #R请注意:您身上已经存在了多倍经验时间，是否确认领取？");
			end
			
			AddNumText(sceneId, x311002_g_scriptId, "是的，我要领取。", -1,x311002_g_eventAddDETimeBegin+nPoint )
			AddNumText(sceneId, x311002_g_scriptId, "不了，我点错了。", -1,x311002_g_eventUpdateList )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--接受此NPC的任务
--**********************************
function x311002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x311002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			x311002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x311002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x311002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x311002_OnDie( sceneId, selfId, killerId )

end

function x311002_LockTime( sceneId, selfId, targetId, nTime )
	if nTime < 0 then
		return 
	end
	
	-- 只有在 洛阳，苏州，大理，楼兰，束河古镇 这几个场景能够冻结双倍经验
	if sceneId~=0 and sceneId~=1 and sceneId~=2 and sceneId~=186 and sceneId~=420 
			and sceneId ~= 193 and sceneId ~= 418 and sceneId ~= 419 and sceneId ~= 518  then	 -- zchw
		return
	end

	-- 获得服务器记录的实际的真实时间
	local nCurTime = LuaFnGetCurrentTime()
	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
	-- 先计算下当前玩家身上剩下的时间
	local nTrueTime = nCurHave;
	
	if nTrueTime < 0 then 
		nTrueTime = 0
	end

	DESetLock(sceneId, selfId, 1)
	--DESetFreeTime(sceneId, selfId, nTrueTime)
	
	BeginEvent(sceneId)
		AddText(sceneId,"  已经冻结了" .. tostring(floor(nTrueTime/60)) .. "分钟双倍经验时间")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"  已经冻结了" .. tostring(floor(nTrueTime/60)) .. "分钟双倍经验时间")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	-- 同步数据到客户端
	SendDoubleExpToClient(sceneId,selfId)

end



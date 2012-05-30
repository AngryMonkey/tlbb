
--门派引导任务

--脚本号

----------------
--MisDescBegin
--脚本号
x600045_g_ScriptId	= 600045

--接受任务NPC属性
x600045_g_Position_X=133
x600045_g_Position_Z=50

x600045_g_AccomplishNPC_Name="武大威"

--任务号
x600045_g_MissionId			= 1121

--任务目标npc
x600045_g_Name 					= "武大威"
--任务归类
x600045_g_MissionKind			= 50 --玩家城市
--任务等级
x600045_g_MissionLevel		= 10000
--是否是精英任务
x600045_g_IfMissionElite	= 0
--任务是否已经完成
x600045_g_IsMissionOkFail	= 0		--任务参数的第0位

--任务文本描述
x600045_g_MissionName			= "打探消息"
--任务描述
x600045_g_MissionInfo			= "帮派任务，利用情报簿打探其他帮派城市资讯！"
--任务目标
x600045_g_MissionTarget		= "    需要和本帮成员组队收集3个不同帮派城市情报，然后到#G武大威#B[133,50]#W处领取奖励！"
--未完成任务的npc对话
x600045_g_ContinueInfo		= "看来你还没有完成啊！"
--完成任务npc说的话
x600045_g_MissionComplete	= "做的很好，感谢你为本帮派做出的贡献！"

--任务是否完成
--x600045_g_Mission_IsComplete = 0		--任务参数的第0位
--打探第几个城市
x600045_g_city 				 	= 1		 --任务参数的第1位

-- 任务完成情况,内容动态刷新,占用任务参数的第1位

x600045_g_Custom	= { {id="已打探城市",num=3} }
--MisDescEnd
----------------

x600045_g_SpyBook_id = 40004461;
x600045_g_ExpPrize = {}
x600045_g_ExpPrize[1] =
{
2510,2651,2789,2927,3070,3210,3351,3497,3640,3788,
7710,8050,8402,8756,9112,9461,9822,10184,10549,10906,
18165,18763,19364,19953,20560,21172,21786,22389,23010,23635,
35387,36307,37217,38147,39082,40007,40952,41902,42841,43801,
44766,45719,46694,47674,48659,49632,50627,51627,52615,53624,
54639,55641,56666,57695,58713,59752,60796,61828,62883,63942,
65006,66058,67132,68211,69277,70366,71460,72541,73644,74753,
75849,76968,78091,79220,80335,81474,82617,83747,84900,86059,
87204,88372,89545,90704,91887,93075,94250,95448,96650,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
}
x600045_g_ExpPrize[2] =
{
2510,2651,2789,2927,3070,3210,3351,3497,3640,3788,
7710,8050,8402,8756,9112,9461,9822,10184,10549,10906,
18165,18763,19364,19953,20560,21172,21786,22389,23010,23635,
35387,36307,37217,38147,39082,40007,40952,41902,42841,43801,
44766,45719,46694,47674,48659,49632,50627,51627,52615,53624,
54639,55641,56666,57695,58713,59752,60796,61828,62883,63942,
65006,66058,67132,68211,69277,70366,71460,72541,73644,74753,
75849,76968,78091,79220,80335,81474,82617,83747,84900,86059,
87204,88372,89545,90704,91887,93075,94250,95448,96650,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
}
x600045_g_ExpPrize[3] =
{
2510,2651,2789,2927,3070,3210,3351,3497,3640,3788,
7710,8050,8402,8756,9112,9461,9822,10184,10549,10906,
18165,18763,19364,19953,20560,21172,21786,22389,23010,23635,
35387,36307,37217,38147,39082,40007,40952,41902,42841,43801,
44766,45719,46694,47674,48659,49632,50627,51627,52615,53624,
54639,55641,56666,57695,58713,59752,60796,61828,62883,63942,
65006,66058,67132,68211,69277,70366,71460,72541,73644,74753,
75849,76968,78091,79220,80335,81474,82617,83747,84900,86059,
87204,88372,89545,90704,91887,93075,94250,95448,96650,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
}

x600045_g_ExpPrize[4] =
{
2510,2651,2789,2927,3070,3210,3351,3497,3640,3788,
7710,8050,8402,8756,9112,9461,9822,10184,10549,10906,
18165,18763,19364,19953,20560,21172,21786,22389,23010,23635,
35387,36307,37217,38147,39082,40007,40952,41902,42841,43801,
44766,45719,46694,47674,48659,49632,50627,51627,52615,53624,
54639,55641,56666,57695,58713,59752,60796,61828,62883,63942,
65006,66058,67132,68211,69277,70366,71460,72541,73644,74753,
75849,76968,78091,79220,80335,81474,82617,83747,84900,86059,
87204,88372,89545,90704,91887,93075,94250,95448,96650,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
}
x600045_g_ExpPrize[5] =
{
2510,2651,2789,2927,3070,3210,3351,3497,3640,3788,
7710,8050,8402,8756,9112,9461,9822,10184,10549,10906,
18165,18763,19364,19953,20560,21172,21786,22389,23010,23635,
35387,36307,37217,38147,39082,40007,40952,41902,42841,43801,
44766,45719,46694,47674,48659,49632,50627,51627,52615,53624,
54639,55641,56666,57695,58713,59752,60796,61828,62883,63942,
65006,66058,67132,68211,69277,70366,71460,72541,73644,74753,
75849,76968,78091,79220,80335,81474,82617,83747,84900,86059,
87204,88372,89545,90704,91887,93075,94250,95448,96650,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
97858,97858,97858,97858,97858,97858,97858,97858,97858,97858,
}

--**********************************
--任务入口函数
--**********************************
function x600045_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	local msg = "";
	if id == 1 then
		BeginEvent(sceneId)
			msg = "#{DTGX_080822_1}";
			AddText(sceneId, msg);
		EndEvent()
		AddNumText(sceneId, x600045_g_ScriptId, "领取打探任务", 6, 3);
		AddNumText(sceneId, x600045_g_ScriptId, "领取完成奖励", 6, 4);
		AddNumText(sceneId, x600045_g_ScriptId, "打探任务帮助", 11, 2);
		DispatchEventList(sceneId,selfId,targetId);		
	elseif id == 2 then  																									--打探任务帮助
		BeginEvent(sceneId)
			AddText(sceneId, "#{DTGX_080822_7}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 3 then																										--领取打探任务
		-- 达到30级？
		if GetLevel(sceneId, selfId) < 30 then
			x600045_MessageBox(sceneId, selfId, targetId, "对不起，必须等级达到30级才可以领取本任务。");
			return					
		end
		-- 完成了5次？
		local ymd = GetTime2Day();
		local dayCount = 0;			
		dayCount = GetMissionData(sceneId, selfId, MD_SPY_DAYCOUNT);
		if mod(dayCount, 10) >= 5 and ymd == floor(dayCount/10) then
			x600045_MessageBox(sceneId, selfId, targetId, "#{DTGX_080822_3}");
			return									
		end
		-- 已有任务？
		if IsHaveMission(sceneId, selfId, x600045_g_MissionId) > 0 then
			x600045_MessageBox(sceneId, selfId, targetId, "#{DTGX_080822_4}");
			return				
		end
		-- 道具栏满？	
		if LuaFnGetTaskItemBagSpace(sceneId, selfId) < 1 then
			x600045_MessageBox(sceneId, selfId, targetId, "#{DTGX_080822_5}");
			return				
		end
		-- 添加任务
		local ret = AddMission( sceneId, selfId, x600045_g_MissionId, x600045_g_ScriptId, 0, 0, 0 ); --添加任务
		if ret < 1 then
			return
		end
		-- 条件满足，给情报簿
		local ret = TryRecieveItem( sceneId, selfId, x600045_g_SpyBook_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			return  -- 给道具失败	
		end		
		--MD_SPY_DAYCOUNT 个位保存一天参与次数，其余位数保存日期，如：20080416代表2008年4月16日
		local dayCount = GetMissionData(sceneId, selfId, MD_SPY_DAYCOUNT); 
		if floor(dayCount/10) ~= ymd then
			dayCount = 10 * ymd;
		end
		SetMissionData(sceneId, selfId, MD_SPY_DAYCOUNT, dayCount+1);  -- 保存次数
		-- 日志
		AuditCitySpy(sceneId, selfId, 0);
		-- 给信息
		BeginEvent(sceneId)
			AddText(sceneId, " #{DTGX_080822_6}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
		
	elseif id == 4 then  								--领取完成奖励
		--领取任务了？
		if IsHaveMission(sceneId, selfId, x600045_g_MissionId) == 0 then
			x600045_MessageBox(sceneId, selfId, targetId, "#{DTGX_080825_01}");
			return			
		end
		--任务完成？
		local misIndex = GetMissionIndexByID(sceneId, selfId, x600045_g_MissionId);
		if misIndex > 10000 then			
			return
		end
		if GetMissionParam(sceneId, selfId, misIndex, 1) < 3 then
			x600045_MessageBox(sceneId, selfId, targetId, "#{DTGX_080822_17}");
			return
		end
		--扣除情报簿
		local ret = LuaFnDelAvailableItem(sceneId, selfId, x600045_g_SpyBook_id, 1);
		if ret == 0 then
			msg = "你不会把情报簿给锁了吧？";
			x600045_MessageBox(sceneId, selfId, targetId, msg);
			return		
		end		
		--给2点帮贡
		CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, 2 )
		local dayCount = GetMissionData(sceneId, selfId, MD_SPY_DAYCOUNT);
		local level = GetLevel(sceneId, selfId);
		local idx = mod(dayCount, 10);
		--给经验奖励
		local expPrize = x600045_g_ExpPrize[idx][level-9]
		LuaFnAddExp(sceneId, selfId, expPrize);
		--设置任务完成信息
		DelMission(sceneId, selfId, x600045_g_MissionId);
		-- 日志
		AuditCitySpy(sceneId, selfId, 1);
		--返回信息
		msg = format("您获得了2点帮贡！");
		x600045_Tips(sceneId, selfId, msg);	
		local playerName = GetName(sceneId, selfId);
		msg = format("#{DTGX_080822_20}#{_INFOUSR%s}#{DTGX_080822_21}", playerName);
		BroadMsgByChatPipe(sceneId, selfId, msg, 6); --帮派消息
	end
end

--**********************************
--列举事件
--**********************************
function x600045_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x600045_g_Name then
		return 0;
	end
	AddNumText( sceneId, x600045_g_ScriptId, "#G打探消息任务", 1, 1 );
	AddNumText( sceneId, x600045_g_ScriptId, "打探任务帮助", 11, 2 );
end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x600045_CheckAccept( sceneId, selfId, targetId )
end
--**********************************
--检测是否可以提交
--**********************************
function x600045_CheckSubmit( sceneId, selfId, targetId )
end

--**********************************
--继续
--**********************************
function x600045_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x600045_OnAccept( sceneId, selfId, targetId, scriptId )
end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x600045_OnAbandon( sceneId, selfId )
	local itemNum = LuaFnGetAvailableItemCount(sceneId, selfId, x600045_g_SpyBook_id);
	if itemNum >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x600045_g_SpyBook_id, itemNum );
	end
  if IsHaveMission( sceneId, selfId, x600045_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x600045_g_MissionId )
	end	
	return 0
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x600045_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--框显示
--**********************************
function x600045_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--Tip显示
--**********************************
function x600045_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId);
end

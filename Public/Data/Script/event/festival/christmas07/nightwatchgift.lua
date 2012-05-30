--2007圣诞元旦活动....
--圣诞守夜活动....

--活动脚本....

--本活动需要保证服务器重启后雪人仍然存在....并且是正确大小的雪人....
--ActivityNotice.txt中配置了在活动时间内服务器重启也会调用本脚本来启动活动....


--脚本号
x050023_g_ScriptId	= 050023

--雪人NPC脚本....
x050023_g_SnowManScriptId	= 050027

--雪人坐标....
x050023_g_SnowManX = 160
x050023_g_SnowManY = 114

x050023_g_SnowEndTime = 73100
--雪人资源表....
x050023_g_SnowMan = {
--begin modified by zhangguoxin 090207
	--[1]  = { ID = 3870, HourTime = 72348, BallCount = -1   },
	--[2]  = { ID = 3871, HourTime = 72352, BallCount = 100  },
	--[3]  = { ID = 3872, HourTime = 72356, BallCount = 160  },
	--[4]  = { ID = 3873, HourTime = 72360, BallCount = 250  },
	--[5]  = { ID = 3874, HourTime = 72364, BallCount = 350  },
	--[6]  = { ID = 3875, HourTime = 72368, BallCount = 500  },
	--[7]  = { ID = 3876, HourTime = 72372, BallCount = 700  },
	--[8]  = { ID = 3877, HourTime = 72376, BallCount = 900  },
	--[9]  = { ID = 3878, HourTime = 72380, BallCount = 1150 },
	--[10] = { ID = 3879, HourTime = 72384, BallCount = 1400 },
	--[11] = { ID = 3880, HourTime = 72388, BallCount = 1700 },
	--[12] = { ID = 3881, HourTime = 72392, BallCount = 2000 },
	--[13] = { ID = 3882, HourTime = 72400, BallCount = 2500 }
	[1]  = { ID = 3870, HourTime = 835848, BallCount = -1   },
	[2]  = { ID = 3871, HourTime = 835852, BallCount = 100  },
	[3]  = { ID = 3872, HourTime = 835856, BallCount = 160  },
	[4]  = { ID = 3873, HourTime = 835860, BallCount = 250  },
	[5]  = { ID = 3874, HourTime = 835864, BallCount = 350  },
	[6]  = { ID = 3875, HourTime = 835868, BallCount = 500  },
	[7]  = { ID = 3876, HourTime = 835872, BallCount = 700  },
	[8]  = { ID = 3877, HourTime = 835876, BallCount = 900  },
	[9]  = { ID = 3878, HourTime = 835880, BallCount = 1150 },
	[10] = { ID = 3879, HourTime = 835884, BallCount = 1400 },
	[11] = { ID = 3880, HourTime = 835888, BallCount = 1700 },
	[12] = { ID = 3881, HourTime = 835892, BallCount = 2000 },
	[13] = { ID = 3882, HourTime = 835900, BallCount = 2500 } 
--end modified by zhangguoxin 090207
} 
  
--散落宝箱坐标表....
x050023_g_ItemBoxPos = {
  
{162,114},{164,114},{166,114},{168,114},{169,111},
{166,110},{163,115},{160,109},{166,105},{167,107},
{172,110},{171,117},{169,118},{167,118},{166,117},
{163,117},{162,117},{160,119},{161,117},{163,116},
{161,107},{176,107},{179,112},{181,111},{174,102},
{158,111},{156,111},{154,112},{157,113},{154,113},
{152,116},{153,116},{156,117},{157,118},{158,119},
{153,113},{151,109},{153,110},{157,113},{150,109},
{148,110},{146,112},{144,114},{146,115},{147,117},
{149,118},{145,105},{148,99},{137,101},{135,110},

}

--散落宝箱物品掉落表....(odds总和为100000)
x050023_g_ItemBoxDrop = {

	--垃圾....
	{ itemId = 30002003, odds = 3000  },
	{ itemId = 30002004, odds = 3000  },
	{ itemId = 30002005, odds = 3000  },
	{ itemId = 30001003, odds = 3000  },
	{ itemId = 30001004, odds = 3000  },
	{ itemId = 30001005, odds = 3000  },
	{ itemId = 30003004, odds = 2000  },
	{ itemId = 30003005, odds = 2000  },
	{ itemId = 30003006, odds = 2000  },
	{ itemId = 20309010, odds = 4000  },
	{ itemId = 20309011, odds = 4000  },
	{ itemId = 20309012, odds = 4000  },
	{ itemId = 20309013, odds = 4000  },

	--低级帽子....
	{ itemId = 10410098, odds = 400   },
	{ itemId = 10410099, odds = 1000  },
	{ itemId = 10410100, odds = 1600  },
	{ itemId = 10410101, odds = 2000  },

	--高级万灵....
	{ itemId = 20309014, odds = 3000  },
	{ itemId = 20309015, odds = 3000  },
	{ itemId = 20309016, odds = 3000  },
	{ itemId = 20309017, odds = 4000  },

	--高级帽子....
	{ itemId = 10410102, odds = 3000  },
	{ itemId = 10410103, odds = 4000  },
	{ itemId = 10410104, odds = 5000  },
	{ itemId = 10410105, odds = 4000  },
	{ itemId = 10410106, odds = 4000  },
	{ itemId = 10410107, odds = 2050  },

	--宝石....
	{ itemId = 50101001, odds = 950   },
	{ itemId = 50101002, odds = 950   },
	{ itemId = 50102001, odds = 950   },
	{ itemId = 50102002, odds = 950   },
	{ itemId = 50102003, odds = 950   },
	{ itemId = 50102004, odds = 950   },
	{ itemId = 50103001, odds = 950   },
	{ itemId = 50104002, odds = 950   },
	{ itemId = 50111001, odds = 950   },
	{ itemId = 50111002, odds = 950   },	
	{ itemId = 50112001, odds = 950   },
	{ itemId = 50112002, odds = 950   },
	{ itemId = 50112003, odds = 950   },
	{ itemId = 50112004, odds = 950   },
	{ itemId = 50113001, odds = 950   },
	{ itemId = 50113002, odds = 950   },
	{ itemId = 50113003, odds = 950   },
	{ itemId = 50113004, odds = 950   },
	{ itemId = 50113005, odds = 950   },
	{ itemId = 50113006, odds = 950   },
	{ itemId = 50114001, odds = 950   },

}

x050023_g_IDXSnowManID			= 0	--当前雪人的场景ID....
x050023_g_IDXSnowManState		= 1	--雪人当前的状态....(0无效 1~12不同大小的雪人 13发奖品的雪人)
x050023_g_IDXBallCount			= 2	--雪人被雪球砸到的次数....
x050023_g_IDXLastSpeakTime	= 3	--雪人上次喊话时间....(活动期间雪人每到整点30min会喊话)


--**********************************
--脚本入口函数
--**********************************
function x050023_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	MissionLog(sceneId, "[07SHOUYE]: ActivityStart")

	--开启活动....
	StartOneActivity( sceneId, actId, 60000, iNoticeType )

	--重置活动状态....
	x050023_ResetActivityState( sceneId, actId )

end

--**********************************
--心跳函数
--**********************************
function x050023_OnTimer( sceneId, actId, uTime )

	--获取当前雪人状态....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )

	--错误处理....
	if CurState < 1 or CurState > 13 then
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Error1")
		return
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Error2")
		return
	end

	--检测活动是否过期....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		MonsterTalk(sceneId, -1, "洛阳", "#P[雪人]#W：亲爱的朋友们，我的礼物发放完了，咱们明年圣诞再见！")
		SetCharacterDieTime(sceneId, MstID, 6000 )
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Normal")
		return
	end

	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()
	
	--24日24点以前....雪人每个整点过30分钟在场景内喊一次话....
	local QTime = mod(CurHourTime,100)
	
	if CurHourTime < 835900 and mod(QTime,4) == 2 then --zchw
		local LastSpeakTime = GetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime )
		if CurHourTime > LastSpeakTime then
			MonsterTalk(sceneId, -1, "洛阳", "#P[雪人]#W：堆！堆！堆个大雪人！大家齐心协力来洛阳（160，114）堆雪人啊，听说午夜对着雪人许愿真的可以实现呢！")
			SetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime, CurHourTime )
		end
		return
	end

	--24日24点以前....雪人每个整点差5分钟在场景内喊一次话....
	if CurHourTime < 835900 and GetMinute() == 54 then	--zchw
			MonsterTalk(sceneId, -1, "洛阳", "#P[雪人]#W：我马上就要长大了，大家快赶来与我一同庆祝吧，很多礼品在等着你们哦！")
		return
	end
	
	--雪人变大的处理....
	if CurState < 13 then
		--如果时间到了则变大....
		if CurHourTime >= x050023_g_SnowMan[CurState+1].HourTime then
			x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState+1 )
		end
	end
	
	--end modified by zhangguoxin 090207
end

--**********************************
--检测当前是否是活动时间
--**********************************
function x050023_CheckActivityTime( sceneId )
	--2009年12月25日2时 以后为非活动时间....
	--非活动时间不允许刷出雪人....
	--begin modified by zhangguoxin 090207
	--if 2008 == LuaFnGetThisYear() and GetHourTime() < 72408 then
	if 2008 == LuaFnGetThisYear() and GetQuarterTime() < 835908 then
	--end modified by zhangguoxin 090207
		return 1
	end
	return 0
end

--**********************************
--重置活动状态
--**********************************
function x050023_ResetActivityState( sceneId, actId )

	MissionLog(sceneId, "[07SHOUYE]: ResetActivity")

	--当活动启动时会调用本函数来重置活动状态....
	--服务器重启时也会调用本函数来重置活动状态....

	--重置活动参数....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, -1 )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, 0 )
	SetActivityParam( sceneId, actId, x050023_g_IDXBallCount, 0 )
	SetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime, 0 )

	--非活动时间则不刷出雪人....
	if 0 == x050023_CheckActivityTime( sceneId ) then
		MissionLog(sceneId, "[07SHOUYE]: ResetActivity Failed WrongTime")
		StopOneActivity( sceneId, actId )
		return
	end

	--根据时间获得当前要创建的雪人数据....
	local CurState = 0
	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()
	--end modified by zhangguoxin 090207
	for i, v in x050023_g_SnowMan do
		if CurHourTime >= v.HourTime then
			CurState = i
		end
	end

	--重建雪人....
	local MstID = -1

	if 0 == CurState then
		--容错处理....Server的时间可能还没到活动时间....
		CurState = 1
	end

	--创建雪人....
	MstID = LuaFnCreateMonster(sceneId, x050023_g_SnowMan[CurState].ID, x050023_g_SnowManX, x050023_g_SnowManY, 3, 0, x050023_g_SnowManScriptId )
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10488, 0)
	AddGlobalCountNews(sceneId, "#{SDSY_081212_01}"); --zchw
	--设置活动参数....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, MstID )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, CurState )

	MissionLog(sceneId, "[07SHOUYE]: ResetActivity Succ CurState="..CurState.." ObjID="..MstID)

end

--**********************************
--将雪人变大
--**********************************
function x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState )

	MissionLog(sceneId, "[07SHOUYE]: x050023_MakeBigSnowMan CurState="..CurState)

	--删旧的....
	LuaFnDeleteMonster(sceneId, MstID)

	--建立新的....
	local MstID = -1
	MstID = LuaFnCreateMonster(sceneId, x050023_g_SnowMan[CurState].ID, x050023_g_SnowManX, x050023_g_SnowManY, 3, 0, x050023_g_SnowManScriptId )
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10488, 0)

	--变大特效....
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10487, 0)

	--散落宝箱....
	x050023_GiveItemBox( sceneId )

	--公告....
	MonsterTalk(sceneId, -1, "洛阳", "#P[雪人]#W：哈哈，瑞雪兆丰年啊。这50个宝箱尽管拿去吧，一会还有更好的东西送给大家，祝大家圣诞快乐！")

	--设置活动参数....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, MstID )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, CurState )

end

--**********************************
--散落宝箱
--**********************************
function x050023_GiveItemBox( sceneId )

	local BoxId = -1
	local DropItemId = -1
	local randValue = 0
	local index = 1
	for _, box in x050023_g_ItemBoxPos do
		--zchw 1/60几率珍兽蛋，欢乐猪
		local rdm = random(0, 6000);
		if rdm < 100 then
		
			local BoxId = ItemBoxEnterScene( box[1], box[2], 779, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30309683 ) --珍兽蛋：当扈（95级）
			SetItemBoxMaxGrowTime( sceneId, BoxId, 1200000 )	--20分钟生命期....		
			
		else
		
			--随机出第一个物品....
			randValue = random(0, 99999);
			for i, item in x050023_g_ItemBoxDrop do
				if item.odds >= randValue then
					DropItemId = item.itemId;
					index = i
					break
				end
				randValue = randValue - item.odds;
			end
			if DropItemId == -1 then
				break
			end
			BoxId = ItemBoxEnterScene( box[1], box[2], 779, sceneId, QUALITY_MUST_BE_CHANGE, 1, DropItemId )
			SetItemBoxMaxGrowTime( sceneId, BoxId, 1200000 )	--20分钟生命期....
	
			--之前没有随机出圣诞帽和宝石才会给第二个物品....
			if ( index < 13 ) or ( index >= 18 and index <= 21 )then
				randValue = random(0, 99999);
				for _, item in x050023_g_ItemBoxDrop do
					if item.odds >= randValue then
						DropItemId = item.itemId
						break
					end
					randValue = randValue - item.odds;
				end
				if DropItemId == -1 then
					break
				end
				AddItemToBox( sceneId, BoxId, QUALITY_MUST_BE_CHANGE, 1, DropItemId )
			end
			
		end
	end
end

--**********************************
--被雪球击中事件
--**********************************
function x050023_CanThrowSnowBall( sceneId, playerId, targetId )

	local actId = 88	--特例用法....其他人不要学....

	--活动是否已经无效....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return 0
	end

	--获取当前雪人状态....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--错误处理....
	if CurState < 1 or CurState > 13 then
		return 0
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return 0
	end

	--打的是否是雪人....
	if targetId ~= MstID then
		return 0
	end

	return 1

end

--**********************************
--被雪球击中事件
--**********************************
function x050023_OnHitBySnowBall( sceneId, playerId, targetId )

	local actId = 88	--特例用法....其他人不要学....

	--活动是否已经无效....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return 0
	end

	--获取当前雪人状态....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--错误处理....
	if CurState < 1 or CurState > 13 then
		return 0
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return 0
	end

	--打的是否是雪人....
	if targetId ~= MstID then
		return 0
	end

	if CurState >= 1 and CurState <= 12 then

		--增加计数....
		BallCount = BallCount + 1
		SetActivityParam( sceneId, actId, x050023_g_IDXBallCount, BallCount )

		--还差50,30,10个球的时候喊话....
		local NeedCount = x050023_g_SnowMan[CurState+1].BallCount - BallCount
		if NeedCount == 50 or NeedCount == 30 or NeedCount == 10 then
			MonsterTalk(sceneId, -1, "洛阳", "#P[雪人]#W：还差"..NeedCount.."个雪球堆到我身上我就可以长大了，大家努把力啊，奖品在向你们招手！")
		end

		--处理雪人变大....
		if BallCount >= x050023_g_SnowMan[CurState+1].BallCount then
			x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState+1 )
		end

	end

	return 1

end

--**********************************
--获得离下次变大还差多少个雪球....
--**********************************
function x050023_GetNeedBallCount( sceneId )

	local actId = 88	--特例用法....其他人不要学....

	--活动是否已经无效....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return -1
	end

	--获取当前雪人状态....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--错误处理....
	if CurState < 1 or CurState > 13 then
		return -1
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return -1
	end

	if CurState >= 1 and CurState <= 12 then
		local NeedCount = x050023_g_SnowMan[CurState+1].BallCount - BallCount
		return NeedCount
	end

	return -1

end

--**********************************
--玩家在洛阳拾取物品的回调函数....
--**********************************
function x050023_OnPlayerPickUpItemInLuoyang( sceneId, selfId, itemId, bagidx )

	--非活动时间则不公告....
	if 0 == x050023_CheckActivityTime( sceneId ) then
		return 0
	end

	local IsBoxItem = 0
	local ItemCount = getn(x050023_g_ItemBoxDrop)
	for i = 22, ItemCount do --万灵石不公告 zchw
		if x050023_g_ItemBoxDrop[i].itemId == itemId then
			IsBoxItem = 1
			break
		end
	end
	--珍兽蛋：当扈（95级） 公告 30309683 zchw
	if itemId == 30309683 then
		IsBoxItem = 1;
		--日志统计
		local guid = LuaFnObjId2Guid(sceneId, selfId)
		local log = format("itemId=%d", itemId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_SNOW, guid, log)
	end
	
	if IsBoxItem == 0 then
		return 0
	end

	--公告....
	local playerName = GetName(sceneId, selfId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local rand = random(3)
	local message
	if rand == 1 then
		message = format("#P天降瑞雪，喜事盈门。#{_INFOUSR%s}#P随便在洛阳大街上走路都能被#{_INFOMSG%s}#P砸中，真是鸿运当头，挡也挡不住啊。", playerName, transfer )
	elseif rand == 2 then
		message = format("#P北风吹，雪花飘，洛阳上空下财宝。#{_INFOUSR%s}#P当场惊醒过来，手脚快速的捡起一个#{_INFOMSG%s}#P后低调的转身而去。", playerName, transfer )
	else
		message = format("#P雪人好，雪人妙，雪人散落的宝贝呱呱叫！#{_INFOUSR%s}#P正捧着捡来的#{_INFOMSG%s}#P蹲在洛阳街边傻呵呵的笑。", playerName, transfer )
	end
	BroadMsgByChatPipe(sceneId, selfId, message, 4)

	return 1

end

--BOSS春晚主控脚本

--脚本号
x050030_g_scriptId = 050030

x050030_g_StartDayTime	= 09097		--活动开始(首播)时间 2009-4-8
x050030_g_EndDayTime		= 09131		--活动结束时间 2009-5-12


--放烟花的数量....
x050030_g_MaxFireCount = 18

--烟花表....
x050030_g_FireShowTbl = {

	[18] = { {x=160,y=105,id=4},{x=160,y=114,id=39} }, --zchw
	[17] = { {x=160,y=105,id=8} },
	[16] = { {x=150,y=114,id=17},{x=150,y=97,id=17},{x=169,y=97,id=17},{x=169,y=114,id=17} },
	[15] = { {x=160,y=105,id=15},{x=160,y=114,id=41} }, --zchw
	[14] = { {x=160,y=105,id=3},{x=160,y=105,id=6} },
	[13] = { {x=157,y=108,id=6},{x=162,y=108,id=6},{x=162,y=103,id=6},{x=157,y=103,id=6} },
	[12] = { {x=160,y=105,id=14},{x=160,y=114,id=39} },--zchw
	[11] = { {x=160,y=105,id=16} },
	[10] = { {x=160,y=105,id=7},{x=160,y=105,id=6} },
	[9]  = { {x=160,y=105,id=13},{x=160,y=114,id=41} }, --zchw
	[8]  = { {x=150,y=114,id=20},{x=150,y=97,id=20},{x=169,y=97,id=20},{x=169,y=114,id=20} },
	[7]  = { {x=160,y=105,id=11},{x=160,y=105,id=9} },
	[6]  = { {x=160,y=105,id=8},{x=160,y=105,id=17},{x=160,y=114,id=39} }, --zchw
	[5]  = { {x=160,y=105,id=1},{x=160,y=105,id=5} },
	[4]  = { {x=160,y=105,id=7},{x=160,y=105,id=13},{x=160,y=105,id=6},{x=160,y=105,id=7} },
	[3]  = { {x=150,y=114,id=9},{x=150,y=97,id=9},{x=169,y=97,id=9},{x=169,y=114,id=9},{x=160,y=105,id=15},{x=160,y=114,id=41} }, --zchw
	[2]  = { {x=160,y=105,id=14},{x=160,y=105,id=13} },
	[1]  = { {x=150,y=114,id=20},{x=150,y=97,id=20},{x=169,y=97,id=20},{x=169,y=114,id=20},{x=160,y=105,id=16},{x=160,y=105,id=9} }

}


--BOSS表....
x050030_g_BOSSTbl = {

	--孙美美....
	["SunMeiMei"] 		= { dateId = 3891, createMsg = "无" },

	--野猪王..恶霸..远古棋魂..贼兵头目..狂暴龙....
	["YeZhuWang"] 		= { dateId = 3917, createMsg = "#{SpringFestiva2007_BOSS_15}" },
	["EBa"]						= { dateId = 3887, createMsg = "#{SpringFestiva2007_BOSS_6}"  },
	["QiHun"]					= { dateId = 3890, createMsg = "#{SpringFestiva2007_BOSS_4}"  },
	["ZeiBingTouMu"]	= { dateId = 3888, createMsg = "#{SpringFestiva2007_BOSS_5}"  },
	["KuangBaoLong"]	= { dateId = 3918, createMsg = "#{SpringFestiva2007_BOSS_16}" },

	--余毒..红熊王..葛荣....
	["YuDu"]					= { dateId = 3901, createMsg = "#{SpringFestiva2007_BOSS_17}" },
	["HongXiongWang"]	= { dateId = 3902, createMsg = "#{SpringFestiva2007_BOSS_18}" },
	["GeRong"]				= { dateId = 3903, createMsg = "#{SpringFestiva2007_BOSS_19}" },

	--段誉..慕容复..王语嫣....
	["DuanYu"]				= { dateId = 3924, createMsg = "#{SpringFestiva2007_BOSS_22}" },
	["MuRongFu"]			= { dateId = 3922, createMsg = "#{SpringFestiva2007_BOSS_1}"  },
	["WangYuYan"]			= { dateId = 3920, createMsg = "#{SpringFestiva2007_BOSS_23}" },

	--小鹰鹰..小猪猪..飞天猫..小狗狗..小虎虎....
	["YingYing"] 			= { dateId = 3928, createMsg = "无" },
	["ZhuZhu"]				= { dateId = 3926, createMsg = "无" },
	["FeiTianMao"]		= { dateId = 3916, createMsg = "#{SpringFestiva2007_BOSS_13}" },
	["GouGou"]				= { dateId = 3927, createMsg = "无" },
	["HuHu"]					= { dateId = 3929, createMsg = "无" },

	--[孙美美]..木桶伯..白帝..混江龙..企鹅王....
	["MuTongBo"] 			= { dateId = 3894, createMsg = "#{SpringFestiva2007_BOSS_21}" },
	["BaiDi"]					= { dateId = 3910, createMsg = "#{SpringFestiva2007_BOSS_10}" },
	["HunJiangLong"]	= { dateId = 3898, createMsg = "#{SpringFestiva2007_BOSS_14}" },
	["QiEWang"]				= { dateId = 3897, createMsg = "#{SpringFestiva2007_BOSS_20}" },

	--[企鹅王]

	--[孙美美]..段延庆....
	["DuanYanQing"]		= { dateId = 3919, createMsg = "#{SpringFestiva2007_BOSS_2}"  },

	--护岛神兽....
	["HuDaoShenShou"]	= { dateId = 3893, createMsg = "#{SpringFestiva2007_BOSS_12}" },

	--[孙美美]..赤霄火魂..春三十娘..毒丝蜘蛛王..缠丝蜘蛛王....
	["ChiXiaoHuoHun"]	= { dateId = 3914, createMsg = "#{SpringFestiva2007_BOSS_11}" },
	["Chun30"]				= { dateId = 3908, createMsg = "#{SpringFestiva2007_BOSS_9}"  },
	["DuSiZhiZhu"]		= { dateId = 3906, createMsg = "#{SpringFestiva2007_BOSS_7}"  },
	["ChanSiZhiZhu"]	= { dateId = 3907, createMsg = "#{SpringFestiva2007_BOSS_8}"  },

}

--BOSS最大生存时间....(用于防止忘了删除此BOSS)
x050030_g_BOSSMaxLifeTime = 15*60*1000


--节目数量....
x050030_g_ChapterCount = 11

--节目脚本ID...
x050030_g_ChapterScriptIdTbl = {

	050031,
	050032,
	050033,
	050034,
	050035,
	050036,
	050037,
	050038,
	050039,
	050040,
	050041,

}


x050030_g_IDXFireCount = 0 --当前已经燃放的烟花的数量....

x050030_g_IsPlaying = 0 --当前是否正在播放节目....

--**********************************
--脚本入口函数....
--**********************************
function x050030_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--检测是否是活动时间....
	if -1 == x050030_CheckActivityTime() then
		return
	end

	StartOneActivity( sceneId, actId, floor(10*1000), iNoticeType )
	SetActivityParam( sceneId, actId, x050030_g_IDXFireCount, x050030_g_MaxFireCount )

end

--**********************************
--心跳函数....
--**********************************
function x050030_OnTimer( sceneId, actId, uTime )

	local CurFireCount = GetActivityParam( sceneId, actId, x050030_g_IDXFireCount )
	if CurFireCount > 0 then

		--烟花还没放够则继续放....
		x050030_PlayFire( sceneId, CurFireCount )
		SetActivityParam( sceneId, actId, x050030_g_IDXFireCount, CurFireCount-1 )

	elseif CurFireCount == 0 then

		--烟花放完了则激活第一个节目....
		x050030_PlayChapter( sceneId, 1 )
		StopOneActivity( sceneId, actId )

	end

end

--**********************************
--播放某个节目....
--**********************************
function x050030_PlayChapter( sceneId, chapterId )

	if chapterId <= x050030_g_ChapterCount then

		--首播和重播时才会在节目开始的时候发公告....
		if -1 ~= x050030_CheckActivityTime() then
			BroadMsgByChatPipe( sceneId, -1, "#{SpringFestiva2007_BOSS_3}", 4 )
		end

		x050030_g_IsPlaying = 1
		CallScriptFunction( x050030_g_ChapterScriptIdTbl[chapterId], "OnStartThisChapter", sceneId )

	end

end

--**********************************
--当某个节目结束时回调本接口....
--**********************************
function x050030_OnChapterEnd( sceneId, chapterId )

	x050030_g_IsPlaying = 0

	--首播和重播时自动播放下个节目....点播时不自动播放下个节目....
	if -1 ~= x050030_CheckActivityTime() then
		x050030_PlayChapter( sceneId, chapterId+1 )
	end

end

--**********************************
--创建某个BOSS....
--**********************************
function x050030_CreateBossActor( sceneId, strName, posX, posY, notify )

	local bossData = x050030_g_BOSSTbl[strName]
	if not bossData then
		return -1
	end

	local MstId = LuaFnCreateMonster( sceneId, bossData.dateId, posX, posY, 3, 0, -1 )
	SetCharacterDieTime( sceneId, MstId, x050030_g_BOSSMaxLifeTime )
	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--首播和重播时才会在创建BOSS的时候发公告....
	local notify2 = 1
	if -1 == x050030_CheckActivityTime() then
		notify2 = 0
	end

	if notify and notify == 1 and notify2 == 1 then
		local msg = "#P[春晚主持人-孙美美]：#W"..bossData.createMsg
		MonsterTalk(sceneId, -1, "洛阳", msg )
	end

	return MstId

end

--**********************************
--删除某个BOSS....
--**********************************
function x050030_DeleteBossActor( sceneId, strName, objId )

	LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 152, 0)
	SetCharacterDieTime( sceneId, objId, 1000 )

end

--**********************************
--检测是否是某个BOSS演员....
--**********************************
function x050030_IsSpecificBossActor( sceneId, strName, objId )

	local bossData = x050030_g_BOSSTbl[strName]
	if not bossData then
		return 0
	end

	local dateId = GetMonsterDataID( sceneId, objId )
	if dateId == bossData.dateId then
		return 1
	else
		return 0
	end

end

--**********************************
--检测当前是否是活动时间....
--首播返回1 重播返回2 其它返回-1
--**********************************
function x050030_CheckActivityTime()

	local curDayTime = GetDayTime()

	if curDayTime == x050030_g_StartDayTime then
		return 1
	end

	if curDayTime > x050030_g_StartDayTime and curDayTime <= x050030_g_EndDayTime then
		return 2
	end

	return -1

end

--**********************************
--检测当前是否正在播放节目....
--**********************************
function x050030_IsChapterPlaying( sceneId )

	return x050030_g_IsPlaying

end

--**********************************
--放烟花....
--**********************************
function x050030_PlayFire( sceneId, step )

	--特例写法....其它人不要学....
	--CreateSpecialObjByDataIndex(sceneId, objId, 6, posX, posZ, 0)
	--CreateSpecialObjByDataIndex(sceneId, 0(!!), 6, posX, posZ, 0)

	local FireData = x050030_g_FireShowTbl[step]
	if not FireData then
		return
	end

	local FireCount = getn( FireData )
	for i=1, FireCount do
		CreateSpecialObjByDataIndex(sceneId, 0, FireData[i].id, FireData[i].x, FireData[i].y, 0)
	end

end

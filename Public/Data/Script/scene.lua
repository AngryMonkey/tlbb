--场景的脚本文件

--脚本号
x888888_g_scriptId_scene = 888888

x888888_g_defaultRelive_SceneID_1=77;
x888888_g_defaultRelive_SceneID_2=2;

-- ==========华山论剑相关的一些常量定义===========
x888888_g_HS_PK_SceneId = 125   --hongyu

x888888_g_Jinghu_SceneId = 5   --hongyu
x888888_g_jingji_SceneId = 414 --hongyu 竞技场
x888888_g_HanYuBed_SceneId = 194 --寒玉床
x888888_g_NianShou_SceneId = 6 --年兽
x888888_g_XinShou_SceneId = 2 --泡点地图号

--下面定义玩家每个等级发送的邮件数量
--格式为{2,0},2为等级,0是该等级要发送的邮件数目，在客户端的strdictionary.txt里面有LevelMail_2_1代表2级第一封邮件,添加邮件内容时需同时修改客户端和该结构的内容
x888888_g_MailNum = {	{1,1},{2,1},{3,1},{4,1},{5,1},{6,1},{7,1},{8,1},{9,1},{10,1},{11,1},
						{12,1},{13,1},{14,1},{15,1},{16,1},{17,1},{18,1},{19,1},{20,1},{21,1},
						{22,1},{23,1},{24,1},{25,1},{26,1},{27,1},{28,1},{29,1},{30,1},{31,1},
						{32,1},{33,1},{34,1},{35,1},{36,1},{37,1},{38,1},{39,1},{40,1},{41,1},
						{42,1},{43,1},{44,1},{45,1},{46,1},{47,1},{48,1},{49,1},{50,1},{51,1},
						{52,1},{53,1},{54,1},{55,1},{56,1},{57,1},{58,1},{59,1},{60,1},{61,1},
						{62,1},{63,1},{64,1},{65,1},{66,1},{67,1},{68,1},{69,1},{70,1},{71,1},
						{72,1},{73,1},{74,1},{75,1},{76,1},{77,1},{78,1},{79,1},{80,1},{81,1},
						{82,1},{83,1},{84,1},{85,1},{86,1},{87,1},{88,1},{89,1},{90,1},{91,1},
						{92,1},{93,1},{94,1},{95,1},{96,1},{97,1},{98,1},{99,1},{100,1},{101,0},
						{102,1},{103,1},{104,1},{105,1},{106,1},{107,1},{108,1},{109,1},{110,1},
						{111,1},{112,1},{113,1},{114,1},{115,1},{116,1},{117,1},{118,1},{119,1},{120,1},
									   }

-- ===============================================

---------------------------------------------------------------
---当玩家获得35级心法秘籍及65级武功秘籍，会在世界公告
x888888_MenPaiBroadMsg = 
{
	[0]	= { mp = "少林门派", XinFa = 30308002, MiJi = 30308011 },	--少林
	[1]	= { mp = "明教门派", XinFa = 30308003, MiJi = 30308012 },	--明教
	[2]	= { mp = "丐帮门派", XinFa = 30308004, MiJi = 30308013 },	--丐帮
	[3]	= { mp = "武当门派", XinFa = 30308005, MiJi = 30308014 },	--武当
	[4]	= { mp = "峨嵋门派", XinFa = 30308006, MiJi = 30308015 },	--峨嵋
	[5]	= { mp = "星宿门派", XinFa = 30308007, MiJi = 30308016 },	--星宿
	[6]	= { mp = "天龙门派", XinFa = 30308008, MiJi = 30308017 },	--天龙
	[7]	= { mp = "天山门派", XinFa = 30308009, MiJi = 30308018 },	--天山
	[8] = { mp = "逍遥门派", XinFa = 30308010, MiJi = 30308019 },	--逍遥
}



-- 副本存玩家平均级别与怪物默认级别的级别差，差值用于场景初始化时对怪物级别进行调整，此编号固定不能改
CopyScene_LevelGap =31

-- 玩家升级时可以完成的任务
x888888_g_FullLevel_MissionList	=	{}	-- 任务ID,任务索引号,需求等级,任务完成标志在任务参数第几位,任务跟踪标志在任务参数第几位
x888888_g_FullLevel_MissionList[28] = { MissionId = 403, MissionIndex = 500606, LevelLimit = 28, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_188}" }
x888888_g_FullLevel_MissionList[30] = { MissionId = 409, MissionIndex = 500602, LevelLimit = 30, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_181}" }
x888888_g_FullLevel_MissionList[32] = { MissionId = 412, MissionIndex = 500603, LevelLimit = 32, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_183}" }
x888888_g_FullLevel_MissionList[35] = { MissionId = 415, MissionIndex = 500605, LevelLimit = 35, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_186}" }
x888888_g_FullLevel_MissionList[38] = { MissionId = 418, MissionIndex = 500608, LevelLimit = 38, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_191}" }
x888888_g_FullLevel_MissionList[40] = { MissionId = 428, MissionIndex = 500612, LevelLimit = 40, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_196}" }
x888888_g_FullLevel_MissionList[42] = { MissionId = 433, MissionIndex = 500613, LevelLimit = 42, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_198}" }
x888888_g_FullLevel_MissionList[45] = { MissionId = 437, MissionIndex = 500614, LevelLimit = 45, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_200}" }
x888888_g_FullLevel_MissionList[48] = { MissionId = 476, MissionIndex = 500615, LevelLimit = 48, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_202}" }
x888888_g_FullLevel_MissionList[50] = { MissionId = 480, MissionIndex = 500616, LevelLimit = 50, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_204}" }

-- 玩家升级时可以自动添加的任务
x888888_g_AutoAccept_MissionList = {}	-- 任务ID,任务索引号,前续任务ID,任务类型参数(3),脚本任务时MissionIndex为ScriptId
x888888_g_AutoAccept_MissionList[26] = { MissionId = 400, MissionIndex = 1018700, PreMissionId = 0,   pKill = 0, pArea = 0, pItem = 0, EventId = 4 }
x888888_g_AutoAccept_MissionList[28] = { MissionId = 403, MissionIndex = 500606, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }		
x888888_g_AutoAccept_MissionList[30] = { MissionId = 409, MissionIndex = 500602, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[32] = { MissionId = 412, MissionIndex = 500603, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[35] = { MissionId = 415, MissionIndex = 500605, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[38] = { MissionId = 418, MissionIndex = 500608, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[40] = { MissionId = 428, MissionIndex = 500612, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[42] = { MissionId = 433, MissionIndex = 500613, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[45] = { MissionId = 437, MissionIndex = 500614, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[48] = { MissionId = 476, MissionIndex = 500615, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[50] = { MissionId = 480, MissionIndex = 500616, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }

function x888888_OnSceneInit( sceneId )
--场景在初始化完成后调用
	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
	local monstercount = GetMonsterCount( sceneId )
	local monsterobjid = -1

	local i
	for i=0, monstercount-1 do
		monsterobjid = GetMonsterObjID( sceneId, i )
		SetLevel( sceneId, monsterobjid, GetLevel( sceneId, monsterobjid ) + LevelGap )
	end
end

function x888888_OnSceneTimer( sceneId, nowTime )
--场景计时器
--sceneId表示场景号，nowTime表示当前时间（程序启动后的时间，单位毫秒）

	sceneType = LuaFnGetSceneType(sceneId) ;

	if sceneType == 1 then --场景类型是副本
		copyscenetype = LuaFnGetCopySceneData_Param(sceneId,0) ;--取得副本号
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --取得脚本号
		if copyscenetype==FUBEN_EXAMPLE then --例子
			--例子不提供定时时间
			print("不能使用例子副本类型，例子副本类型不提供定时事件")
		elseif copyscenetype==FUBEN_EXAMPLE then --
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7级木人巷副本
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9级木人巷副本
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG then --标准木人巷副本
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_SHUILAO then --水牢副本
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_ZHENGLONG then --珍珑棋局副本
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_PVP_LEITAI then --擂台副本
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		else
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		end
	end
end

function x888888_OnSceneQuit( sceneId )
--场景在关闭前调用

end

function x888888_OnScenePlayerEnter( sceneId, playerId, isReconnect )
	--设置缺省的复活信息

	-- 清除临时阵营（例如挑战之类的，避免因为一些不能捕捉的移动事件——死亡等——导致一些未期望的阵营号被带出原场景）
	SetUnitCampID(sceneId, playerId, playerId, -1)

	--清除缥缈峰副本里加的降低毒抗的buff....
	LuaFnCancelSpecificImpact( sceneId, playerId, 10249 )
	LuaFnCancelSpecificImpact( sceneId, playerId, 19801 )

	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --场景类型是副本
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --取得脚本号
		CallScriptFunction( copyscenescript, "OnPlayerEnter", sceneId, playerId ) ;

		local copyscenetype = LuaFnGetCopySceneData_Param( sceneId, 0 )		--取得副本号
		if copyscenetype == FUBEN_MURENXIANG_7
		 or copyscenetype == FUBEN_MURENXIANG_9
		 or copyscenetype == FUBEN_MURENXIANG
		 or copyscenetype == FUBEN_SHUILAO
		 or copyscenetype == FUBEN_ZHENGLONG
		 or copyscenetype == FUBEN_PVP_LEITAI
		 or copyscenetype == FUBEN_BIANGUAN
		 or copyscenetype == FUBEN_SHIJI1
		 or copyscenetype == FUBEN_KAOCHANG
		 or copyscenetype == FUBEN_DATAOSHA
		 or copyscenetype == FUBEN_ZEIBINGRUQIN
		 or copyscenetype == FUBEN_JIAOFEI
		 or copyscenetype == FUBEN_CUJU
		 or copyscenetype == FUBEN_DAZHAN_YZW
		 or copyscenetype == FUBEN_GODFIRE
		 or copyscenetype == FUBEN_PROTECTGUILD
		 or copyscenetype == FUBEN_PIAOMIAOFENG
		 or copyscenetype == FUBEN_XINSHENGSHOUSHAN
		 or copyscenetype == FUBEN_SEEK_TREASURE -- zchw
		 or copyscenetype == FUBEN_TIANLONG1
		 or copyscenetype == FUBEN_SHAOLIN1
		 or copyscenetype == FUBEN_MINGJIAO1
		 or copyscenetype == FUBEN_GAIBANG1
		 or copyscenetype == FUBEN_EMEI1
		 or copyscenetype == FUBEN_XINGXIU1
		 or copyscenetype == FUBEN_XIAOYAO1
		 or copyscenetype == FUBEN_WUDANG1
		 or copyscenetype == FUBEN_TIANSHAN1
		 or copyscenetype == FUBEN_BANGZHAN
		 or copyscenetype == FUBEN_SONGLIAO
		 or copyscenetype == FUBEN_FEIZHAI
		 or copyscenetype == FUBEN_ZHULIN
		then		-- 以上副本有独立的死亡地点设置
			return
		end
	else
		--///////////////////////////////////////////////////////
		--如果他有师门的副本任务则删除，如少林的“塔林”
		local missionIdTable = {1061,1091,1066,1081,1101,1071,1096,1086,1076}
		for i, v in missionIdTable do
			if IsHaveMission(sceneId,playerId,v) > 0 then
				DelMission(sceneId, playerId, v)
				break
			end
		end
		--///////////////////////////////////////////////////////

		--如果他有漕运任务
		if IsHaveMission(sceneId,playerId,4021) > 0 then
			CallScriptFunction( 311010, "OnPlayerEnterCaoyunScene", sceneId, playerId )
		end
	end

	--PK值>4时，监狱中死亡则在监狱中复活
	if sceneId == SCENE_PRISON and LuaFnGetHumanPKValue( sceneId, playerId ) > 4 then
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%10", -1, "0", SCENE_PRISON, 48, 30 )
		return
	end

	if GetMenPai( sceneId, playerId) ~=9 then
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%10", -1, "0", x888888_g_defaultRelive_SceneID_1, 20, 38 );
	else
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", -1, "0", x888888_g_defaultRelive_SceneID_2, 165, 169 );
	end

	-- 如果进入了华山论剑的场景，就设置这个人物的阵营号  hongyu
	if sceneId == x888888_g_HS_PK_SceneId    then
		CallScriptFunction((001233), "OnScenePlayerEnter",sceneId, playerId)
		-- 在这里检测华山论剑的计时器是不是开着，如果没有开就打开，
		-- 场景计时器的Id = 0
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 1230, "OnHuashanSceneTimer", 10000)
		end
	end
	
	-- 如果进入竞技场,第一进入竞技场的人，打开计时器
	if sceneId == x888888_g_jingji_SceneId    then
		CallScriptFunction((125020), "OnScenePlayerEnter",sceneId, playerId)
		-- 在这里检测华山论剑的计时器是不是开着，如果没有开就打开，
		-- 场景计时器的Id = 0
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 125020, "OnSceneTimer", 10000)
			--InitSceneData(sceneId, playerId, 125020, "OnInitScene")
		end
	end
	
	-- 第一个进入镜湖场景的玩家，负责启动镜湖的计时器
	if sceneId == x888888_g_Jinghu_SceneId   then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 005116, "OnSceneTimer", 10000)
		end
	end

	--第一个进入泡点场景的玩家，负责启动新手集市的计时器
	if sceneId == x888888_g_XinShou_SceneId then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 898989, "OnSceneTimer",20000)
		end
	end

	--第一个进入寒玉床场景的玩家，负责启动寒玉床的计时器
	if sceneId == x888888_g_HanYuBed_SceneId then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 808072, "OnSceneTimer",30000)
		end
	end

	-- 玩家进入Pvp场景前，给个无敌
	if 0 == isReconnect then
		local nSafeLevel = LuaFnGetSceneSafeLevel(sceneId)
		-- 玩家进入非安全场景，给个无敌BUFF
		if nSafeLevel < 10000  then
			if nSafeLevel == 10 then
				LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 5927, 100 )
			else
				LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 54, 100 )
			end
		end
	end

	-- 更新打劫商人的数据
	CallScriptFunction( 311012, "UpdataDacoityData", sceneId, playerId )
end

--判断是否是帮会主力
function x888888_IsGuildVip( Guildpos  )
    if (   (Guildpos == GUILD_POSITION_CHIEFTAIN) 
	    or (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN)
	    or (Guildpos == GUILD_POSITION_HR)
	    or (Guildpos == GUILD_POSITION_INDUSTRY)
	    or (Guildpos == GUILD_POSITION_AGRI)
	    or (Guildpos == GUILD_POSITION_COM) 
	    or (Guildpos == GUILD_POSITION_ELITE_MEMBER) 
	   )then
        return 1;
		end
		return 0;
end


function x888888_OnSceneHumanDie( sceneId, selfId, killerId )
	--玩家死亡后脚本事件
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --场景类型是副本
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --取得脚本号
		CallScriptFunction( copyscenescript, "OnHumanDie", sceneId, selfId, killerId )
	end
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		--在此之前应该检测是否PVP死亡
		--如果在漕运时死亡
		CallScriptFunction( 311010, "OnHumanDie", sceneId, selfId, killerId )
		CallScriptFunction( 311012, "OnDacoity", sceneId, selfId, killerId )
	end
	
	-- 如果玩家现在是在华山论剑场景被杀，hongyu，
	if sceneId == x888888_g_HS_PK_SceneId    then
		CallScriptFunction((001233), "OnSceneHumanDie",sceneId, selfId, killerId)
	end
	
	-- 如果玩家是在 竞技场 被杀
	if sceneId == x888888_g_jingji_SceneId    then
		CallScriptFunction((125020), "OnSceneHumanDie",sceneId, selfId, killerId)
	end
	
	--帮会战争情况
	if IsInGuildWar(sceneId, selfId, killerId) == 1 then
	
		local Guildpos = GetGuildPos(sceneId, selfId)
		if ( x888888_IsGuildVip(Guildpos)==1 ) then
			local selfName = GetName(sceneId, selfId);
			local guildName_self = LuaFnGetGuildName(sceneId, selfId);
			
			local killerName = GetName(sceneId, killerId);
			local guildName_killer = LuaFnGetGuildName(sceneId, killerId);
			
			local sMessage = format("@*;SrvMsg;GLD:#W本帮主力#R%s#W在帮战中浴血奋战，不敌#G%s#W帮会的#R%s#W，为帮会英勇献身！", selfName, guildName_killer ,killerName);	
			BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
			
			sMessage = format("@*;SrvMsg;GLD:#R%s#W在帮战中大展身手，成功击杀#G%s#W帮会主力#R%s#W，捍卫了帮会的荣誉！", killerName, guildName_self, selfName);	
			BroadMsgByChatPipe(sceneId, killerId, sMessage, 6);
		end
		
	end

end

--可以升级的事件处理函数
function x888888_OnCanLevelup(sceneId, objId)
	local playerLevel = GetLevel(sceneId, objId)
	if playerLevel >= 10 and playerLevel <= 14 then
		LuaFnSendSystemMail(sceneId, GetName(sceneId, objId), "您可以打开#gfff0f0人物界面（按Alt+c）#g000000之后，点击#gfff0f0界面右下方的升级按钮#g000000即可提升您的人物等级，当然您也可以留着经验到#gfff0f0门派的师傅处学习技能#g000000。")
	end
end

function x888888_OnSceneHumanLevelUp( sceneId, objId, level )

	if	IsHaveMission(sceneId,objId,718) > 0	 then
			misIndex = GetMissionIndexByID(sceneId,objId,718)
			SetMissionByIndex( sceneId, objId, misIndex, 1, level)
			if level >= 10 then
				SetMissionByIndex( sceneId, objId, misIndex, 0, 1)
			end
	end

--相应等级发送邮件
	if level > 1 then
		local looptime = 1
		local mailnum = x888888_g_MailNum[level][2]
		if mailnum > 0 then
			while looptime <= mailnum do
				--PrintStr("#{LevelMail_"..level.."_"..looptime.."}")
				LuaFnSendSystemMail( sceneId, GetName(sceneId,objId), "#{LevelMail_"..level.."_"..looptime.."}" )
				looptime = looptime + 1
			end
		end
	end
	
	--徒弟升到45时候，出师设置出师标志
	if LuaFnHaveMaster( sceneId, objId ) ~= 0  and level == 45 then
			SetMissionFlag(sceneId, objId, MF_ShiTu_ChuShi_Flag, 1)
	end
	
	--徒弟升级给师父抽奖的机会
	if level == 40 or level == 50 then
		--local stbegin = 7285; --10.12
		local stbegin = 7304; --11.01
		local stend		= 7325; --11.22
		local stprize = {[40]=40004432,[50]=40004433}
		local strtip	= {[40]="名师",[50]="特级名师"}
		
		local curDayTime = GetDayTime()
		local MasterGUID = LuaFnGetMasterGUID( sceneId, objId )
		
		if curDayTime >= stbegin and curDayTime <= stend and MasterGUID ~= -1 then
			if LuaFnHaveMaster( sceneId, objId ) ~= 0 then
				local MasterName = LuaFnGetFriendName( sceneId, objId, MasterGUID )
				--发送一封普通邮件给师傅
				LuaFnSendSystemMail( sceneId, MasterName, "你的徒弟"..GetName(sceneId,objId).."已经成功的升到了"..tostring(level).."级。现在天龙八部正在“新兵夺宝”活动期间，你可以去洛阳城龚彩丽[110，162]那里参加一次"..strtip[level].."抽奖！" )
				--发送一封奖励执行邮件给师傅
				LuaFnSendScriptMail( sceneId, MasterName, MAIL_SHITUPRIZE, level, stprize[level], 1)
				--发送系统公告给全世界
				local uname = format("#{_INFOUSR%s}",GetName(sceneId,objId))
				local oname = format("#{_INFOUSR%s}",MasterName)
				local str = format("%s#P经历九九八十一难，终于顺利升到#Y%d级#P。现在天龙八部正在“新兵夺宝”活动期间，作为其师父的%s#P获得一次参加#Y%s#P抽奖的机会！",uname,level,oname,strtip[level])
				BroadMsgByChatPipe(sceneId, objId, str, 4)
			end
		end
	end

	--2007圣诞元旦活动....喜从天降活动....
	CallScriptFunction( 050022, "OnPlayerLevelUp", sceneId, objId )

	--师徒总动员
	CallScriptFunction( 806020, "OnPlayerLevelUp", sceneId, objId )
		
	-- 给达到等级要求的玩家添加任务
	-- [ QUFEI 2008-04-17 14:18 UPDATE BugID 33891 ]
	x888888_OnAutoAcceptMission( sceneId, objId, level )
	
	-- 给满足完成条件的任务设置任务完成标志
	x888888_OnSetCompleteMission( sceneId, objId, level )
	
end

--玩家更换门派
function x888888_OnSceneHumanChangeMenpai( sceneId, objId, Menpai )
	if	IsHaveMission(sceneId,objId,719) > 0	 then
			misIndex = GetMissionIndexByID(sceneId,objId,719)
			if( Menpai >= 0 and Menpai < 9 ) then
			    SetMissionByIndex( sceneId, objId, misIndex, 1, 1)
			    SetMissionByIndex( sceneId, objId, misIndex, 0, 1)
			end
	end
end

function x888888_OnSceneNotify( sceneId, destsceneId )
--sceneId 为副本入口所在场景ID, destsceneId为副本场景ID
--此函数响应调用表示副本场景已经初始化完成，可以传送玩家了

	destsceneType = LuaFnGetSceneType(destsceneId) ;

	if destsceneType == 1 then --场景类型是副本

		copyscenetype = LuaFnGetCopySceneData_Param(destsceneId,0) ;--取得副本号
		copyscenescript = LuaFnGetCopySceneData_Param(destsceneId,1) ; --取得脚本号

		if copyscenetype==FUBEN_EXAMPLE then --例子
			--例子不提供场景启动事件
			print("不能使用例子副本类型，例子副本类型不提供场景启动事件")
		elseif copyscenetype==FUBEN_EXAMPLE then --
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7级木人巷副本
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9级木人巷副本
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG then --标准木人巷副本
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_SHUILAO then --水牢副本
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_ZHENGLONG then --蒸笼棋局副本
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_PVP_LEITAI then --擂台副本
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		else
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		end
	end
end

-- 问路
function x888888_AskTheWay( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- 问路(坐标)
function x888888_AskThePos( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- 去掉问路标记
function x888888_DelSignpost( sceneId, selfId, sceneNum, npcName )
	Msg2Player( sceneId, selfId, "@*;flagNPCdel;" .. sceneNum .. ";" .. npcName, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPCdel;" .. sceneNum .. ";" .. npcName, MSG2PLAYER_PARA )
end

-- 播放音效，UICommandID = 1234
function x888888_PlaySoundEffect( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1234)
end

--任务接受检测
function x888888_OnAcceptMissionCheck( sceneId, selfId, missionScript )
	if GetMissionCount(sceneId, selfId)>=20 then
		BeginEvent(sceneId)
			strText = "任务已满！"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end

	return 1
end

--玩家角色时钟事件
function x888888_OnScenePlayerTimer( sceneId, selfId, nowtime )
	--如果有漕运任务
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		CallScriptFunction( 311010, "OnPlayerCaoyunTimer", sceneId, selfId )
	else
		SetCharacterTimer( sceneId, selfId, 0 )
	end
end

--玩家角色登陆游戏事件, 此事件会在玩家调用x888888_OnScenePlayerEnter事件之后调用
function x888888_OnScenePlayerLogin( sceneId, selfId, nowtime )
	CallScriptFunction( 888890, "OnDefaultEvent", sceneId, selfId )

	-- 设置初始的Npc关系值
	CallScriptFunction( 200099, "InitRelation", sceneId, selfId )
	
	--在五一期间发邮件:五一领取招牌活动	--add by xindefeng
	CallScriptFunction( 808090, "OnPlayerLogin", sceneId, selfId )
	-- 五一活动，发送邮件
	CallScriptFunction( 808091, "OnPlayerLogin", sceneId, selfId )
	
	-- 初始化客户端登陆期的界面操作
	CallScriptFunction( 870001, "UISystemOnLogin", sceneId, selfId )
	

	-- 师徒总动员，发送邮件
	CallScriptFunction( 806020, "OnPlayerLogin", sceneId, selfId )	
	
	--离线经验馈赠任务
	CallScriptFunction( 500619, "CheckUnlineGift", sceneId, selfId )
	
	--电话密保的邮件提示。策划要求暂时关闭邮件提示 by hukai #38665
	--CallScriptFunction( 210245, "SendMail", sceneId, selfId, nowtime )
	-- 设置玩家学会“帮派收集”技能
	if QueryHumanAbilityLevel(sceneId, selfId, 50) < 1 then
		SetHumanAbilityLevel(sceneId, selfId, 50, 1);
	end
	-- 设置玩家学会帮战中采矿技能
	if QueryHumanAbilityLevel(sceneId, selfId, 51) < 1 then
		SetHumanAbilityLevel(sceneId, selfId, 51, 1);
	end	
	
	--和谐光环
	CallScriptFunction( 808124, "OnPlayerLogin", sceneId, selfId )
	
	--暗器提示邮件
	CallScriptFunction( 332207, "NotifyMailOnLogin", sceneId, selfId )

	x888888_AskDeleteMinorPasswordTime(sceneId, selfId) 
	-- 愚人节活动，发通告
	CallScriptFunction( 808079, "OnPlayerLogin", sceneId, selfId )
	
	-- 天龙嘉年华
	-- CallScriptFunction( 889055, "OnPlayerLogin", sceneId, selfId )

	--天龙上线公告
	CallScriptFunction( 380002, "OnDefaultEvent", sceneId, selfId )
	
	--更新龙纹信息
	CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
end

--玩家创建角色后第一次登陆游戏事件, 此事件会在玩家调用x888888_OnScenePlayerEnter事
--件之后、x888888_OnScenePlayerLogin事件之前调用
function x888888_OnScenePlayerFirstLogin( sceneId, selfId, nowtime )
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{DLYJ_081009_01}"..PlayerName..PlayerSex.."#{DLYJ_081009_02}" )
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#e00f000小提示：#e000000#r#Y右上角的雷达窗口内有显示当前您所在的坐标。#Y鼠标左键点击便可行走。#Y鼠标右键按住左右移动，可以旋转显示视口。#Y鼠标中键滚轮前后转动，可以调节视口远近。#GALT+HOME/END#Y可以变换视角。" )
	
	CallScriptFunction( 808065, "SendMail", sceneId, selfId )

	--新手上线赠送一个新蓝光环
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 8000, 0)

	ItemID ={10100100,10101100,10102100,10103100,10104100,10105100}
	i=random(1,6)
	BeginAddItem(sceneId)

	--送给玩家一个江湖干坤袋
	local WorldReferenceID = 10155001
	local WorldReferenceID1 = 10141030
	local WorldReferenceID2 = 10141040
	local WorldReferenceID3 = 30501319
	local DenglongID = 30505162
	local UniverseBagID = 30008059
	AddItem( sceneId, WorldReferenceID, 1 )
	AddItem( sceneId, WorldReferenceID1, 1 )
	AddItem( sceneId, WorldReferenceID2, 1 )
	AddItem( sceneId, WorldReferenceID3, 1 )

	AddItem( sceneId, UniverseBagID, 1 )

	local nowYear = GetTodayYear();
	local nowMonth = GetTodayMonth();
	local nowDate = GetTodayDate();
	
	--PrintNum(nowYear);
	--PrintNum(nowMonth);
	--PrintNum(nowDate);
	
	if (nowYear == 2008) then
		if(nowMonth==0) then
			if(nowDate>=16 and nowDate<=27) then
				AddItem( sceneId, DenglongID, 1 )
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{TQLQ_20071218_01}" )
			end
		end
	end
	
	AddItem( sceneId,ItemID[i],1)

	EndAddItem(sceneId,selfId)
	AddItemListToHuman(sceneId,selfId)
	--增加领取干坤袋标志
	SetMissionFlag(sceneId, selfId, MF_GetQianKunDai, 1)

	AddMission( sceneId,selfId, 718, 210238, 0, 0, 0 )

	SetMissionData( sceneId, selfId, MD_RELATION_QIANHONGYU, 500 )	-- 设置和钱宏宇的初始关系

	--双响炮提示邮件....
	CallScriptFunction( 808075, "OnPlayerFirstLogin", sceneId, selfId )
	
end

-- 统一做一个检查
function x888888_CheckSubmit( sceneId, selfId, missionId )
	local bHave = IsHaveMission( sceneId, selfId, missionId )
	local bHaveDone = IsMissionHaveDone( sceneId, selfId, missionId )

	-- 没有接
	if bHave <= 0 then
		return 0
	end

	-- 已经完成过
	if bHaveDone >= 1 then
		return 0
	end

	return 1
end

-- 场景中的角色开启仇杀
function x888888_OnScenePlayerOpenRevenge(sceneId, openerGUID, targetGUID)
	LuaFnSendMailToGUID(sceneId, openerGUID, "你已经开启了对目标的仇杀")
	LuaFnSendMailToGUID(sceneId, targetGUID, "行走江湖，莫惹事端，有人申请仇杀你，已经生效，一小时内还是注意安全为妙。")
	return 1
end

-- 场景中的角色关闭仇杀
function x888888_OnScenePlayerCloseRevenge(sceneId, openerGUID, targetGUID)
	LuaFnSendMailToGUID(sceneId, openerGUID, "你已经关闭了对目标的仇杀")
	LuaFnSendMailToGUID(sceneId, targetGUID, "要仇杀你的人的怒意已经平息。")

	return 1
end

function x888888_PlayBackSound( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 124)
end

function x888888_StopBackSound( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 125)
end

-- 一下是开放给策划使用的用脚本影响玩家的HP、MP、Vigor、VigorRegenerate、Energy、EnergyRegenerate属性最大值
-- Hp最大值修正
function x888888_MaxHpRefix( sceneId, selfId )
  local nValue = 0
  local nAbilityID = 40 --影响HP最大值的生活技能的ID
  local nMulti = 1 --HP最大值得影响系数
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end

-- Mp最大值修正
function x888888_MaxMpRefix( sceneId, selfId)
  local nValue = 0
  local nAbilityID = 41 --影响MP最大值的生活技能的ID
  local nMulti = 1 --MP最大值得影响系数
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- Vigor最大值修正
function x888888_MaxVigorRefix( sceneId, selfId)
  local nValue = 0
  local nAbilityID = 42 --影响Vigor最大值的生活技能的ID
  local nMulti = 1 --HP最大值得影响系数
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- VigorRegenerate值修正
function x888888_VigorRegenerateRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 44 --影响VigorRegenerate值的生活技能的ID
  local nMulti = 1 --HP最大值得影响系数
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- Energy最大值修正
function x888888_MaxEnergyRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 43 --影响Energy最大值的生活技能的ID
  local nMulti = 1 --Energy最大值得影响系数
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- EnergyRegenerate值修正
function x888888_EnergyRegenerateRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 45 --影响EnergyRegenerate值的生活技能的ID
  local nMulti = 1 --HP最大值得影响系数
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end

function x888888_OnPlayerPickupItemFromDropBox(sceneId, selfId, itemId, bagidx, bGem)

	local playerName = GetName(sceneId, selfId)
	local itemName = GetItemName(sceneId, itemId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)

	-- 古墓 装备掉落的世界公告
--	if itemId == 10401002 or
--		 itemId == 10401003 or
--		 itemId == 10401004 or
--		 itemId == 10403002 or
--		 itemId == 10403003 or
--		 itemId == 10403004 or
--		 itemId == 10405001 or
--		 itemId == 10405002 or
--		 itemId == 10405003 or
		 
--		 itemId == 10404002 or
--		 itemId == 10404003 or
--		 itemId == 10404004    then
		
--		CallScriptFunction( 212220, "ItemBulletin", sceneId, selfId, itemId, bagidx, bGem ) ;
		
--	end
	
	-- 捡到龙珠的世界公告
	if itemId == 30505136 or
		 itemId == 30505137 or
		 itemId == 30505138 or
		 itemId == 30505139 or
		 itemId == 30505140 or
		 itemId == 30505141 or
		 itemId == 30505142    then
		
		CallScriptFunction( 808058, "PlayerPickUpLongZhu", sceneId, selfId, bagidx ) ;
		
	end
	
	--获得太阳碎片公告....
	if itemId == 30505120 then
		CallScriptFunction( 210242, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end
	
	--获得峨眉技能
	if itemId == 30308043 and sceneId == 25 then

		local TeammateCount = GetTeamMemberCount( sceneId, selfId );
		local sNameBroad = playerName;


		local randMessage = random(3);
		if randMessage == 1 then
	   		message = format("#{JinGang_00}#W#{_INFOUSR%s}#P#{JinGang_01}#W#{_INFOUSR%s}#P#{JinGang_02}#{_INFOMSG%s}。", sNameBroad, sNameBroad, transfer );
		elseif randMessage == 2 then
			message = format("#{JinGang_03}#W#{_INFOUSR%s}#P#{JinGang_04}#{_INFOMSG%s}#P#{JinGang_05}", sNameBroad, transfer );
		else
			message = format("#{JinGang_06}#W#{_INFOUSR%s}#P#{JinGang_07}#W#{_INFOUSR%s}#P#{JinGang_08}#{_INFOMSG%s}#P#{JinGang_09}", sNameBroad, sNameBroad, transfer );
		end
		BroadMsgByChatPipe(sceneId, selfId, message, 4);

		return 0;
	end
	--获得少林技能
	if itemId == 30308045 and sceneId == 32 then

		local TeammateCount = GetTeamMemberCount( sceneId, selfId );
		local sNameBroad = playerName;

		local randMessage = random(3);
		if randMessage == 1 then
	   		message = format("#{JinGang_10}#W#{_INFOUSR%s}#P#{JinGang_11}#W#{_INFOUSR%s}#P#{JinGang_12}#{_INFOMSG%s}#P#{JinGang_13}", sNameBroad, sNameBroad, transfer );
		elseif randMessage == 2 then
			message = format("#{JinGang_14}#W#{_INFOUSR%s}#P#{JinGang_15}#W#{_INFOUSR%s}#P#{JinGang_16}#{_INFOMSG%s}#P#{JinGang_17}", sNameBroad, sNameBroad, transfer );
		else
			message = format("#{JinGang_18}#W#{_INFOUSR%s}#P#{JinGang_19}#{_INFOMSG%s}#P#{JinGang_20}", sNameBroad, transfer );
		end
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end

	--镜湖千年草
	if itemId == 40004414 then
		local nCurTime = LuaFnGetCurrentTime()
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
		SetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2, nCurTime )
		return 0;
	end

	--07圣诞元旦活动....
	--圣诞守夜活动....洛阳雪人散落宝箱拾取公告....
	local bSend = 0
	if sceneId == 0 then
		bSend = CallScriptFunction( 050023, "OnPlayerPickUpItemInLuoyang", sceneId, selfId, itemId, bagidx )
	end
	if bSend == 1 then
		return
	end

	--生死夺宝拾取公告....
	local bSend = 0
	if sceneId == 410 then
		bSend = CallScriptFunction( 891000, "OnPlayerPickUpItemInLuoyang", sceneId, selfId, itemId, bagidx )
	end
	if bSend == 1 then
		return
	end


	--寒玉床宝箱拾取公告....
	if sceneId == x888888_g_HanYuBed_SceneId and bGem == 3 then
		CallScriptFunction( 808072, "OnPlayerPickUpItemInHanYuBed", sceneId, selfId, itemId, bagidx )
	end


	--年兽得物品公告....
	if sceneId == x888888_g_NianShou_SceneId then
		CallScriptFunction( 050052, "OnPlayerPickUpItemInNianShou", sceneId, selfId, itemId, bagidx )
	end
	
	--圣兽山获得野猪王踪迹公告....
	--[ QUFEI 2008-04-16 14:38 UPDATE BugID 31936 ]
	if itemId == 40004429 then
		CallScriptFunction( 808066, "OnPlayerPickUpItemInBoar", sceneId, selfId, itemId, bagidx ) ;
	end
	
	
	local str
	if bGem == 1 then
		local a = { "#W#{_INFOUSR%s}#I开启宝箱时获得一枚#W#{_INFOMSG%s}。",
								"#W#{_INFOUSR%s}#I准备关上宝箱时在角落里面发现了一枚#W#{_INFOMSG%s}。",
								"#W#{_INFOUSR%s}#I一脚踢在宝箱上，掉出来一枚#W#{_INFOMSG%s}。"
							}
		local index = random(getn(a))
		str = format(a[index], playerName, transfer)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)

	elseif  bGem == 2 then

		--当玩家获得35级心法秘籍及65级武功秘籍，会在世界公告
		local bFlag = 0;
		--for i = 0, 8 do
		--	if ( x888888_MenPaiBroadMsg[ i ].XinFa == itemId ) or ( x888888_MenPaiBroadMsg[ i ].MiJi == itemId ) then
		--		bFlag = 1;
		--		break;
		--	end
		--end

		if bFlag > 0 then

			local TeammateCount = GetTeamMemberCount( sceneId, selfId )
			local sTeamLeaderName = playerName;
			for i=0, TeammateCount-1 do
				TeammateID = GetNearTeamMember( sceneId, selfId, i )
				if LuaFnIsTeamLeader( sceneId, selfId ) then
					sTeamLeaderName = GetName(sceneId, selfId);
					break;
				end
			end

			local mp = LuaFnGetCopySceneData_Param(sceneId, 11);
			local mpName = x888888_MenPaiBroadMsg[mp].mp;

			local message;

			local randMessage = random(3);

			if randMessage == 1 then
	   			message = format("#W#{_INFOUSR%s}#P#{DropItem_00}#G%s#P#{DropItem_01}#Y%s#P#{DropItem_02}#{_INFOMSG%s}#P#{DropItem_03}", sTeamLeaderName, mpName, mpName, transfer );
			elseif randMessage == 2 then
				message = format("#{DropItem_04}#G%s#P#{DropItem_05}#W#{_INFOUSR%s}#P#{DropItem_06}#{_INFOMSG%s}#P#{DropItem_07}", mpName, sTeamLeaderName, transfer );
			else
				message = format("#{DropItem_08}#G%s#P#{DropItem_09}#W#{_INFOUSR%s}#P#{DropItem_10}#{_INFOUSR%s}#P#{DropItem_11}#{_INFOMSG%s}#P#{DropItem_12}", mpName, sTeamLeaderName,sTeamLeaderName, transfer );
			end
			BroadMsgByChatPipe(sceneId, selfId, message, 4);
		end

	elseif bGem == 0 then

		local a = { "#W#{_INFOUSR%s}#I在开启宝箱的时候获得#W#{_INFOMSG%s}。",
								"#W#{_INFOUSR%s}#I在宝箱的角落里面发现了一张破旧的#W#{_INFOMSG%s}。",
								"#W#{_INFOUSR%s}#I把宝箱翻了过来，发现一张#W#{_INFOMSG%s}#I贴在宝箱底部。"
							}
		local index = random(getn(a))
		str = format(a[index], playerName, transfer)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
	elseif bGem == 3 then
		
		--技能书宝箱公告
		local	rnd	= random( 3 )
		local	msg	= nil
		local	fnd	= 0
		local	lst	=
		{
			30402012, 30402014, 30402016, 30402018, 30402020, 
			30402025, 30402026, 30402029, 30402030, 30402033, 
			30402034, 30402035, 30402036, 30402037, 30402038, 
			30402039, 30402040, 30402041, 30402042, 30402043, 
			30402044, 30402045, 30402046, 30402047, 30402048, 
			30402049, 30402050, 30402051, 30402052, 30402053, 
			30402054, 30402055, 30402056, 30402059, 30402060, 
			30402061, 30402062, 30402063, 30402064, 30402065, 
			30402066, 30402067, 30402068, 30402069, 30402070, 
			30402072, 30402073, 30402074, 30402075, 30402076, 
			30402077, 30402078, 30402079, 30402080, 30402081, 
			30402082, 30402083, 30402084, 30402085, 30402086, 
			30402087, 30402088, 30402089, 30402090,	
		}
		for i = 1, getn( lst ) do
			if lst[ i ] == itemId then
				fnd		= 1
				break
			end
		end
		if fnd == 1 then
			if rnd == 1 then
		   	msg	= format( "#W#{_INFOUSR%s}#I在开启宝箱的时候获得#W#{_INFOMSG%s}。",
		   					playerName, transfer )
			elseif rnd == 2 then
				msg	= format( "#W#{_INFOUSR%s}#I在宝箱的角落里面发现了一本破旧的#W#{_INFOMSG%s}。",
								playerName, transfer )
			else
				msg	= format( "#W#{_INFOUSR%s}#I把宝箱翻了过来，发现一本#W#{_INFOMSG%s}#I贴在宝箱底部。",
								playerName, transfer )
			end
			BroadMsgByChatPipe( sceneId, selfId, msg, 4 )
			return
		end

	end
	
	-- 褚少微，2008.6.10。束河古镇420，消灭霜影BOSS统计...
	if sceneId == 420 then
		CallScriptFunction( 808040, "OnPlayerPickUpItemFromShangyingBoss", sceneId, selfId, itemId, bagidx )
	end
	
	--黄金之链
	if itemId == 40004453 then
		CallScriptFunction( 050220, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end
	
	--玄佛珠
	if itemId == 40004454 then
		CallScriptFunction( 050221, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end

end

--对任务可用性进行检测
function x888888_Check_MissionAvailable(sceneId, playerId, missionId)
	--//////////////////////////////////////////////////////////
	--任务链可用性检测
	local renwulianMissionId = 1202
	if missionId == renwulianMissionId then
	if IsHaveMission(sceneId, playerId, renwulianMissionId) > 0 then
		local MissionType = {wenhou=1, suoqu=2, fubenjiaoxun=3, fubenduowu=4, chongwu=5}
		local misIndex = GetMissionIndexByID(sceneId, playerId, renwulianMissionId)
		local missionType = GetMissionParam(sceneId, playerId, misIndex, 1)

		local bAvailable = 1
		if missionType == MissionType.wenhou then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 5)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..wenhou..npcId=" .. tostring(npcId))
				bAvailable = 0
			end
		elseif missionType == MissionType.suoqu then
			local itemId = GetMissionParam(sceneId, playerId, misIndex, 5)
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 6)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) or
				 0 == CheckItemAvailable(sceneId, playerId, itemId)	then
						 MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..suoqu..npcId=" .. tostring(npcId)
					 .. ",itemId=" .. tostring(itemId))
				 bAvailable = 0
			end
		elseif missionType == MissionType.chongwu then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 6)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
				bAvailable = 0
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..chongwu..npcId=" .. tostring(npcId))
			end
		elseif missionType == MissionType.fubenjiaoxun then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 5)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..fubenjiaoxun..npcId=" .. tostring(npcId))
				bAvailable = 0
			end
		end
		-- 如果不可用则删除
		if 0 == bAvailable then
			DelMission(sceneId, playerId, renwulianMissionId)
		end
	end
	end
	--//////////////////////////////////////////////////////////

	--Add other code ...
	local xingxiuMissionId = 1095
	if missionId == xingxiuMissionId then
		if IsHaveMission(sceneId, playerId, xingxiuMissionId) > 0 then
			local bAvailable = 1
			local MissionType = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8,  killMonster=9}
			local misIndex = GetMissionIndexByID(sceneId, playerId, xingxiuMissionId)
			local missionType = GetMissionParam(sceneId, playerId, misIndex, 1)
			if missionType == MissionType.XunWu then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 5)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.XunWu..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.XunWu..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			elseif missionType == MissionType.KaiGuang then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 6)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.KaiGuang..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.KaiGuang..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			elseif missionType == MissionType.ShouJi then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 6)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.ShouJi..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.ShouJi..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			end
			if bAvailable == 0 then
				DelMission(sceneId, playerId, xingxiuMissionId)
			end
		end
	end

end

function x888888_OnAcceptCheck( sceneId, objId, level )

	-- 任务是否已满
	if IsMissionFull( sceneId, objId ) == 1 then
		return 0
	end

	local missioninfo = x888888_g_AutoAccept_MissionList[level]
	--检测等级
	if not missioninfo then
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, objId, missioninfo.MissionId ) > 0 then
		return 0
	end

	--已经做过则不符合条件
	if IsMissionHaveDone(sceneId, objId, missioninfo.MissionId) > 0   then
		return 0
	end

	--检测前续任务
	if missioninfo.PreMissionId > 0 then
		if IsMissionHaveDone(sceneId, objId, missioninfo.PreMissionId) <= 0   then
			return 0
		end
	end
	
	return 1
end

function x888888_OnAutoAcceptMission( sceneId, objId, level )

	-- 检测任务接受条件
	if x888888_OnAcceptCheck( sceneId, objId, level ) > 0 then
		local missioninfo = x888888_g_AutoAccept_MissionList[level]

		if missioninfo ~= nil then
			local ret = AddMission( sceneId, objId, missioninfo.MissionId, missioninfo.MissionIndex, missioninfo.pKill, missioninfo.pArea, missioninfo.pItem )	-- kill、area、item
			if ret == 1 and missioninfo.EventId ~= 0 then
				SetMissionEvent( sceneId, objId, missioninfo.MissionId, missioninfo.EventId )
			end
		end
	end
end

function x888888_OnCompleteCheck( sceneId, objId, level )

	local missioninfo = x888888_g_FullLevel_MissionList[level]
	--检测等级
	if not missioninfo then
		return 0
	end

	if IsHaveMission( sceneId, objId, missioninfo.MissionId ) <= 0 then
		return 0
	end

	-- 是否达到需求等级
	local Playerlvl = LuaFnGetLevel( sceneId, objId )
	if Playerlvl < missioninfo.LevelLimit then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,objId,missioninfo.MissionId)

	-- 检测任务是否完成	
	if GetMissionParam(sceneId, objId, misIndex, missioninfo.CompleteIdx) <= 0 then
		return 1
	end
	
	return 0
	
end

function x888888_OnSetCompleteMission( sceneId, objId, level )

	-- 检测任务完成条件
	if x888888_OnCompleteCheck( sceneId, objId, level ) > 0 then
		local missioninfo = x888888_g_FullLevel_MissionList[level]
		
		if missioninfo ~= nil then

			local misIndex = GetMissionIndexByID(sceneId,objId,missioninfo.MissionId)
			SetMissionByIndex( sceneId, objId, misIndex, missioninfo.CompleteIdx, 1 )
			SetMissionByIndex( sceneId, objId, misIndex, missioninfo.RecordIdx, 1 )
			
			BeginEvent( sceneId )
				AddText( sceneId, missioninfo.MsgStr )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, objId )
		end
	end

end

-- 更新玩家的数据，用于在脚本里修改玩家数据，然后在Server程序里用的情况
function x888888_UpdatePlayerData(sceneId, playerId)
	-- 更新暗器（法宝）N倍经验状态
	CallScriptFunction( 332207, "CalcDarkMultiExpRate", sceneId, playerId ) ;
	
end


-- 当玩家的暗器升级时会调用的函数
function x888888_OnDarkLevelUp(sceneId, playerId, levelaftlevel)
	
	--显示暗器升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
	
	--后续功能添加
	
end

function x888888_AskDeleteMinorPasswordTime(sceneId, playerId)
	local lefttime = LuaFnGetPasswordDeleteRemainTime(sceneId, playerId)
	if lefttime >= 0 then	
		LuaFnSendSystemMail( sceneId, GetName(sceneId,playerId), "#{SMTX_090309_1}"..tostring(lefttime).."#{SMTX_090309_2}" )
	end
end


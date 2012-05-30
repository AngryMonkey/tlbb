--大逃杀
--活动进行中
--副本地图大小为256*256，共包含64*64的16个小房间

--脚本号
x808002_g_ScriptId			= 808002
x808002_g_ScriptId_Ctrl	= 808003		--回调脚本

x808002_g_PlyJoinMax		= 64				--最大报名人数
x808002_g_GoldMin				= 10000			--报名费
x808002_g_LevelMin			= 40				--最低等级限制
x808002_g_GodBuff				= 112				--无敌BUFF
x808002_g_CampA					= 10				--挑战A方阵营号
x808002_g_CampB					= 11				--挑战B方阵营号
x808002_g_BackCity			=						--回城坐标
{
	["scn"]	= 1,
	["px"]	= 183,
	["pz"]	= 140,
}

--副本相关
x808002_g_CopySceneName	= "比武会场"		--副本名称
x808002_g_CopySceneType	= FUBEN_DATAOSHA--副本类型，定义在ScriptGlobal.lua里面
x808002_g_CopySceneMap	= "dataosha.nav"
x808002_g_TickTime			= 5					--回调脚本的时钟时间（单位：秒/次）
x808002_g_CloseTick			= 6					--副本关闭前倒计时（单位：次数）
x808002_g_NoUserTime		= 600				--副本中没有人后可以继续保存的时间（单位：秒）
x808002_g_PvpRuler			= 5					--副本Pvp规则，可PK
x808002_g_JoinTick			= 3					--报名倒计时

--副本数据区索引
x808002_g_ScnParam			=
{
	["typ"]	= 0,	--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	["sid"]	= 1,	--将1号数据设置为副本场景事件脚本号
	["tim"]	= 2,	--设置定时器调用次数
	["ent"]	= 3,	--设置副本入口场景号, 初始化
	["cls"]	= 4,	--设置副本关闭标志, 0开放，1关闭
	["rnd"]	= 5,	--设置第几回合
	["jon"]	= 6,	--设置报名倒计时次数
	["chk"]	= 7,	--设置校验时间差
	["tab"]	= 8,	--设置表单ID
}

--排行榜表单数据区索引
x808002_g_TabParam			=
{
	["enn"]	= 0,	--进入副本的人数
	["fbn"]	= 1,	--使用副本数量
	["fb1"]	= 2,	--副本1的SceneId
	["fb2"]	= 3,	--副本2的SceneId
	["fbs"]	= 4,	--副本的创建状态：0(空闲)，1(创建中)
}

--消息提示
x808002_g_Msg						=
{
	["flw"]		= "对不起，组队跟随状态下不能报名。",
	["drd"]		= "对不起，双人骑乘状态下不能报名。",
	["ear"]		= "现在不是活动开始报名的时间，请在报名时间内再来找我。",
	["pop1"]	= "  比武大会现在正式开始，第一次参加比赛需要每人交纳#{_EXCHG"..x808002_g_GoldMin.."}的报名费，您是否愿意参加？",
	["gld"]		= "您身上的现金不足#{_EXCHG"..x808002_g_GoldMin.."}，请凑足现金之后再找我报名。",
	["itm"]		= "您的背包中最好有一个空位，武状元是有奖励的呦！",
	["ful"]		= "对不起，和您等级相符的组级的报名人数已经足够，请下次再来参加。",
	["lev"]		= "对不起，只有"..x808002_g_LevelMin.."级以上才能参加此比赛。",
	["grp"]		= "对不起，和您等级相符的组的比赛还没有开放。",
	["popn"]	= "  现在是下一轮比武大会的报名时间，只有上一轮的胜者才能参加下一轮的比赛。",
	["fal"]		= "对不起，只有上一轮比武大会的获胜者才能参加下一轮的比赛。",

	["n_son"]	= "比武大会%d级别组本次活动即将在%d分钟后结束，请各位选手尽快结束比赛。",
	["n_end"]	= "比武大会%d级别组本次活动已经结束，请进入下一轮的选手尽快准备报名。",
	["r_win"]	= "恭喜，比武获胜",
	["r_wnx"]	= "请到隋豹鸣处领取您的奖励，之后才能进入下一轮比武",
	["r_mal"]	= "恭喜您赢得比武！请到隋豹鸣（173，130）处领取您的奖励，稍事歇息后您将进入下一轮比武。#r注意：您只有领取过奖励才会进入下一轮，不要错失机会哦，赶快去领取吧。",
	["r_fal"]	= "遗憾，比武失败",
	["r_flx"]	= "请到隋豹鸣处领取您的奖励",
}

--失败者奖励
x808002_g_BountyRate		= 5	--奖励概率百分比
x808002_g_BountyItem	 	=		--奖励物品列表
{
	20500000,									--精铁碎片
	20501000,									--棉布碎片
	20502000,									--秘银碎片
}

--**********************************
--任务入口函数
--**********************************
function x808002_OnDefaultEvent( sceneId, selfId, targetId )

	--找不到该玩家
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end
	--判断组队跟随状态
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["flw"] )
		return
	end
	--判断双人骑乘状态
	if LuaFnGetDRideFlag( sceneId, selfId ) == 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["drd"] )
		return
	end

	--比武回合数
	local	rnd	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetRound", sceneId, selfId )

	--选择按钮
	local	key	= GetNumText()

	--我要报名
	if key == 0 then
		--查看比武结果，是否领取过奖励
		if x808002_OnPlyBounty( sceneId, selfId, targetId, rnd ) == 1 then
			if rnd > 0 then
				x808002_MsgBox( sceneId, selfId, "请不要离我太远，稍后将公布比武成绩" )
			end
			return
		end

		--活动是否处于报名中
		if CallScriptFunction( x808002_g_ScriptId_Ctrl, "IsJoinDoing", sceneId, selfId ) == 0 then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ear"] )
			return
		end
		
		--检测报名条件
		if x808002_CheckPlyJoin( sceneId, selfId ) ~= 1 then
			return
		end

		--第一次参赛
		if rnd == 1 then
			BeginEvent( sceneId )
			AddText( sceneId, x808002_g_Msg["pop1"] )
			AddNumText( sceneId, x808002_g_ScriptId, "我现在就要参加", 10, 1001 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		--循环赛
		else
			BeginEvent( sceneId )
			AddText( sceneId, x808002_g_Msg["popn"] )
			AddNumText( sceneId, x808002_g_ScriptId, "我现在就要参加", 10, 1002 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end

	--第一轮：我现在就要参加
	elseif key == 1001 then
		--关闭界面
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)
		
		--金钱检查
		if (nMoneyJZ + nMoney) < x808002_g_GoldMin then
			-- 钱不够
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["gld"] )
			return
		end

		x808002_MsgBox( sceneId, selfId, "恭喜您已经报名成功，希望您这次能够勇夺武状元!" )
		x808002_MsgBox( sceneId, selfId, "离开会场后，记得及时回来领取奖励哦!" )

		--玩家报名
		x808002_OnPlyJoin( sceneId, selfId, rnd )
	
	--循环：我现在就要参加
	elseif key == 1002 then
		--关闭界面
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

		--玩家报名
		x808002_OnPlyJoin( sceneId, selfId, rnd )
	end

end

--**********************************
--列举事件
--**********************************
function x808002_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x808002_g_ScriptId, "我要报名", 4, 0 )

end

--**********************************
--检测玩家报名条件
--**********************************
function x808002_CheckPlyJoin( sceneId, selfId )

	if GetLevel( sceneId, selfId ) < x808002_g_LevelMin then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["lev"] )
		return 0
	end
	
	--根据玩家等级获取组别信息
	local	ActID, _, _	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetGroupInfo", sceneId, selfId )
	if ActID == nil then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["grp"] )
		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["itm"] )
		return 0
	end
	return 1

end

--**********************************
--玩家报名
--**********************************
function x808002_OnPlyJoin( sceneId, selfId, rnd )

	--找不到该玩家
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--比武回合数
	rnd_self	= x808002_GetMyCurrentRound( sceneId, selfId )
	ret_self	= GetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT )
	if rnd > 1 then
		if rnd ~= (rnd_self+1) or ret_self <= 0 then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["fal"] )
			return
		end
	end

	--获取表单ID
	tabId			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetTableID", sceneId, selfId )
	--表单人数
	ply_num		= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["enn"] )
	if tabId == -1 or ply_num >= x808002_g_PlyJoinMax then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ful"] )
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808002_OnPlyJoin( sceneId=%d, GUID=%0X, rnd=%d ), tabId=%d, ply_num=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			rnd,
			tabId,
			ply_num )
		MissionLog( sceneId, LogInfo )
		return
	end

	--判断副本是否加载
	scn_num		= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	scn_fb		= { 0, 0 }
	scn_fb[1]	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fb1"] )
	scn_fb[2]	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fb2"] )
	if scn_num > 0 then
		--当报名人数为（x808002_g_PlyJoinMax/2）时，创建副本2
		if LuaFnGetSceneType( scn_fb[scn_num] ) == 1 and ply_num ~= floor(x808002_g_PlyJoinMax/2) then
			x808002_OnSelectRoom( sceneId, selfId, scn_fb[scn_num], tabId )
			return
		end
	end

	--一定要考虑“副本创建中”的状况
	if scn_num <= 2 then
		if HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"] ) == 0 then
			HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 1 )
			x808002_MakeCopyScene( sceneId, selfId, tabId, rnd, tabId )
		else
			x808002_MsgBox( sceneId, selfId, "副本创建中" )
			return
		end

	else
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ful"] )
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808002_OnPlyJoin( sceneId=%d, GUID=%0X, rnd=%d ), tabId=%d, scn_num=%d, fb1=%d, fb2=%d, ply_num=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			rnd,
			tabId,
			scn_num, scn_fb[1], scn_fb[2],
			ply_num )
		MissionLog( sceneId, LogInfo )
		return
	end

end

--**********************************
--玩家奖励
--**********************************
function x808002_OnPlyBounty( sceneId, selfId, targetId, rnd )

	--比赛结果，以其"符号位"标识胜负，以其"绝对值是否大于1"标识是否领取过奖励，0等同于没有过比赛
	ret_self	= GetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT )
	if abs( ret_self ) <= 1 then
		return 0
	end
	--是否获胜
	if ret_self > 0 then
		isWin		= 1
	else
		isWin		= 0
	end

	ret_self	= floor( ret_self / abs(ret_self) )
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, ret_self )

	--分出胜负的组，无论是胜利者还是失败者均可以获得经验
	BeginEvent( sceneId )
		AddText( sceneId, "  不错，阁下勇气可嘉，我这里准备了一些小小的礼物，还望笑纳。" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	--增加经验值
	exp				= GetLevel( sceneId, selfId ) * 44
	AddExp( sceneId, selfId, exp )

	--领取奖励再进行排名
	--理由：按照等级划分为多组，每组对应多副本，多线程
	--获取表单ID
	tabId			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetTableID", sceneId, selfId )
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnPlyBounty( sceneId=%d, GUID=%0X ), AddExp=%d, tabId=%d",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		exp, tabId )
	MissionLog( sceneId, LogInfo )

	rnd_self	= x808002_GetMyCurrentRound( sceneId, selfId )
	if tabId < 0 or rnd <= 0 or rnd_self <= 0 then
		return 0
	end
	guid			= LuaFnObjId2Guid( sceneId, selfId )
	--排行键值（降序，键值越大，排名越靠前）：环数 * 3 ，胜者加2，负者加1
	key				= rnd_self * 3
	if ret_self > 0 then
		key			= key + 2				--胜者
	elseif ret_self < 0 then
		key			= key + 1				--负者
	end
	HitParadePlayerJoin( sceneId, tabId, guid, key )
	
	--失败者额外奖励
	if isWin == 0 and
		random( 100 ) <= x808002_g_BountyRate and
		LuaFnGetPropertyBagSpace( sceneId, selfId ) >= 1
		then
		idLst		= random( getn( x808002_g_BountyItem ) )
		idBag		= LuaFnTryRecieveItem( sceneId, selfId, x808002_g_BountyItem[idLst], 1 )
		if idBag >= 0 then
			LuaFnItemBind( sceneId, selfId, idBag )
			szTran= GetBagItemTransfer( sceneId, selfId, idBag )
			szMsg	= format( "叮叮当当！比武场上，#{_INFOUSR%s}与对手激战正酣，冷不防场外飞来一物，竟是#{_INFOMSG%s}。",
				LuaFnGetName( sceneId, selfId ),
				szTran )
			x808002_MyGlobalNews( sceneId, szMsg )
		end
	end
	
	return 1

end

--**********************************
--创建副本
--**********************************
function x808002_MakeCopyScene( sceneId, selfId, tabId, rnd, tabId )

	--获取副本个数
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	--获取单轮执行时间
	unt_tim	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetCurrentUnitTime", sceneId, selfId, x808002_g_TickTime )

	--设置副本参数
	local	leaderguid	= LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x808002_g_CopySceneMap )							--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x808002_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_PvpRuler( sceneId, x808002_g_PvpRuler )
	LuaFnSetCopySceneData_Timer( sceneId, x808002_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["typ"], x808002_g_CopySceneType )			--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["sid"], x808002_g_ScriptId )						--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"], 0 )	--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["ent"], -1 )	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 0 )	--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["rnd"], rnd )--设置第几回合
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], 0 )	--设置报名倒计时次数

	LuaFnSetSceneLoad_Area( sceneId, "dataosha_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "dataosha_monster.ini" )

	--设置校验时间差
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["chk"], unt_tim )
	--设置表单ID
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tab"], tabId )

	--初始化完成后调用创建副本函数
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )
	if bRetSceneID > 0 then
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"], scn_num + 1 )
		x808002_MsgBox( sceneId, selfId, "副本创建成功" )
	else
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 0 )
		x808002_MsgBox( sceneId, selfId, "副本数量已达上限，请稍候再试" )
	end

end

--**********************************
--副本事件
--**********************************
function x808002_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x808002_g_ScnParam["ent"], sceneId )
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local	leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )

	--获取表单ID
	tabId		= LuaFnGetCopySceneData_Param( destsceneId, x808002_g_ScnParam["tab"] )

	--设置副本的场景号
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	if scn_num == 1 then
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fb1"], destsceneId )
	else
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fb2"], destsceneId )
	end
	--副本创建完成
	HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 0 )

	--选择房间
	x808002_OnSelectRoom( sceneId, leaderObjId, destsceneId, tabId )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnCopySceneReady( sceneId=%d, destsceneId=%d ), GUID=%0X, tabId=%d, scn_num=%d",
		sceneId, destsceneId, leaderguid, tabId, scn_num )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--为玩家选择房间，并传入副本
--**********************************
function x808002_OnSelectRoom( sceneId, selfId, destsceneId, tabId  )

	--找不到该玩家
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--设置副本关闭标志, 0开放，1关闭
--LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 0 )

	--比武回合数
	rnd			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetRound", sceneId, selfId )
	--玩家报名，取比武环数为排行键值
	guid		= LuaFnObjId2Guid( sceneId, selfId )
	--排行键值（降序，键值越大，排名越靠前）：环数 * 3 ，胜者加2，负者加1
	ply_id	= HitParadePlayerJoin( sceneId, tabId, guid, rnd*3 )
	if ply_id < 0 then
		return
	end
	--进入副本的人数
	ent_id	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["enn"] )
	HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["enn"], ( ent_id + 1 ) )

	--阵营号缓存，因为每次进入场景时，阵营会清空
	id_mod	= ent_id - floor( ent_id / 2 ) * 2
	if id_mod == 0 then
		SetMissionData( sceneId, selfId, MD_PREV_CAMP, x808002_g_CampA )
	else
		SetMissionData( sceneId, selfId, MD_PREV_CAMP, x808002_g_CampB )
	end

	--副本个数
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )

	--房间索引，房间大小64*64
	idRoom	= floor( ent_id / 2 ) - floor( (scn_num-1) * 16 )
	px_mod	= idRoom - floor( idRoom /4 ) * 4
	if px_mod < 0 or px_mod >= 4 then
		px_mod= 0
	end
	px			= floor( px_mod * 64 + 32 )
	pz_mul	= floor( idRoom / 4 )
	if pz_mul < 0 or pz_mul >= 4 then
		pz_mul= 0
	end
	pz			= floor( pz_mul * 64 + 32 )

	--传入副本
	NewWorld( sceneId, selfId, destsceneId, px, pz )
	
	--活动统计
	LuaFnAuditQuest( sceneId, selfId, "比武大会" )
	
	--扣除金钱（只在第一轮扣钱）
	if rnd <= 1 then

		-- 使用带优先级的金钱消耗函数
		-- 原来扣金币没有判断是否扣钱失败，所以扣交子也未加是否扣钱失败的处理！				
		LuaFnCostMoneyWithPriority (sceneId, selfId, x808002_g_GoldMin)
				
		--Add Log
		LogInfo	= format( "[TAOSHA]: LuaFnCostMoneyWithPriority( sceneId=%d, GUID=%0X, Money=%d )", sceneId, guid, x808002_g_GoldMin )
		MissionLog( sceneId, LogInfo )
	end
	
	--记录比武回合数（年+当年第几天+回合数：YY+DDD+RR）
	rnd_MD	= GetDayTime() * 100 + rnd
	SetMissionData( sceneId, selfId, MD_DATAOSHA_ROUND, rnd_MD )
	--记录比武结果
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, 0 )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnSelectRoom( sceneId=%d, destsceneId=%d ), GUID=%0X, tabId=%d, ent_id=%d, idRoom=%d, px=%d, pz=%d",
		sceneId, destsceneId, guid, tabId, ent_id, idRoom, px, pz )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--有玩家进入副本事件
--**********************************
function x808002_OnPlayerEnter( sceneId, selfId )
	
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnPlayerEnter( sceneId=%d, GUID=%0X )",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ) )
	MissionLog( sceneId, LogInfo )

	--设置复活信息
	--回城至苏州报名点附近
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", x808002_g_BackCity["scn"], x808002_g_BackCity["px"], x808002_g_BackCity["pz"] )

	--副本关闭标志
	local	LeaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"] )

	--报名中，传入会场
	if LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["typ"] ) == x808002_g_CopySceneType then
		--判断玩家是否已经报名该回合比赛
		rnd_self= x808002_GetMyCurrentRound( sceneId, selfId )
		rnd			= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["rnd"] )
		if rnd_self ~= rnd then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["fal"] )
			x808002_OnGoBack( sceneId, selfId )
			return
		end
		if LeaveFlag > 0 then
			x808002_MsgBox( sceneId, selfId, "比武大会本次活动已经结束" )
			x808002_OnGoBack( sceneId, selfId )
			return
		end

		--设置对立阵营
		idCamp	= GetMissionData( sceneId, selfId, MD_PREV_CAMP )
		SetUnitCampID( sceneId, selfId, selfId, idCamp )
		--设置玩家的指定Pvp授权位
		SetPvpAuthorizationFlagByID( sceneId, selfId, 2, 0 )			--2是竞技授权标记
		--设置无敌BUFF
		--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808002_g_GodBuff, 0 )
		--单回合获胜标记，胜利者传出
		SetMissionFlag( sceneId, selfId, MF_DATAOSHA_WIN, 0 )

	end

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x808002_OnHumanDie( sceneId, selfId, killerId )

	--失败者处理
	--记录比武结果
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, -10 )
	x808002_MsgBox( sceneId, selfId, x808002_g_Msg["r_fal"] )
	x808002_MsgBox( sceneId, selfId, x808002_g_Msg["r_flx"] )
	--设置玩家的指定Pvp授权位
	--SetPvpAuthorizationFlagByID( sceneId, selfId, 2, 0 )			--2是竞技授权标记

	--获胜者处理
	--记录比武结果
	if killerId == nil or LuaFnIsObjValid( sceneId, killerId ) ~= 1 then
		return
	end
	SetMissionData( sceneId, killerId, MD_DATAOSHA_RESULT, 10 )
	x808002_MsgBox( sceneId, killerId, x808002_g_Msg["r_win"] )
	x808002_MsgBox( sceneId, killerId, x808002_g_Msg["r_wnx"] )
	LuaFnSendSystemMail( sceneId, GetName( sceneId, killerId ), x808002_g_Msg["r_mal"] )
	--设置玩家的指定Pvp授权位
	--SetPvpAuthorizationFlagByID( sceneId, killerId, 2, 0 )		--2是竞技授权标记
	if LuaFnIsCharacterLiving( sceneId, killerId ) == 1 then
		--单回合获胜标记，胜利者传出
		SetMissionFlag( sceneId, killerId, MF_DATAOSHA_WIN, 1 )
		--x808002_OnGoBack( sceneId, killerId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x808002_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x808002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x808002_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取得已经执行的定时次数
	local	TickCount	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"] )
	TickCount				= TickCount + 1
	--设置新的定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"], TickCount )

	--副本关闭标志
	local	LeaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"] )
	--报名倒计时
	local	JoinFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"] )

	--获取场景中玩家人数
	local	mem_num		= LuaFnGetCopyScene_HumanCount( sceneId )
	local	mem_obj		= LuaFnGetCopyScene_HumanObjId( sceneId, 0 )
	--根据玩家等级获取组别信息
	local	ActID, ActMinLev, _	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetGroupInfo", sceneId, mem_obj )

	--获取一个回合中的报名时间长度
	local	JoinTime	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetJoinTime", sceneId, x808002_g_TickTime )
	--获取一个回合中的比武时间长度
	local	AttackTime= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetAttackTime", sceneId, x808002_g_TickTime )
	AttackTime			= JoinTime + AttackTime

	--时间校验
	local	CheckTime	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["chk"] )
	if JoinTime > CheckTime then
		JoinTime			= JoinTime - CheckTime
	else
		JoinTime			= 0
	end
	if AttackTime > CheckTime then
		AttackTime		= AttackTime - CheckTime
	else
		AttackTime		= 0
	end

	if LeaveFlag < 1 then
	--比武进行中

		if JoinFlag == 0 then
		--是否开始倒计时
			if TickCount == JoinTime then
				LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], x808002_g_JoinTick )
			elseif TickCount > JoinTime then
				LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], -1 )
				--比武开始
				for i = 0, mem_num - 1 do
					mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
					if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
						break
					end
					--设置玩家的指定Pvp授权位
					SetPvpAuthorizationFlagByID( sceneId, mem_obj, 2, 1 )			--2是竞技授权标记
				end
			end
		elseif JoinFlag > 0 then
		--报名倒计时
			LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], JoinFlag-1 )
			for i = 0, mem_num - 1 do
				mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
				if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
					break
				end
				str		= format( "比武将在 %d 秒后开始", JoinFlag * x808002_g_TickTime )
				x808002_MsgBox( sceneId, mem_obj, str )
			end
		end

		--比武是否到时
		if TickCount == (AttackTime-12) then
			--比武即将结束，提前一分钟全球公告
			if ActMinLev ~= nil then
				str		= format( x808002_g_Msg["n_son"], ActMinLev, 1 )
				x808002_MyGlobalNews( sceneId, str )
			end
		elseif TickCount >= AttackTime then
			--比武结束
			LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 1 )
		end
		--扫描会场
		x808002_OnScanScene( sceneId )

	elseif LeaveFlag == 1 then
	--比武已结束
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )
		x808002_OnScanRoom( sceneId, mem_num )
	elseif LeaveFlag < x808002_g_CloseTick then
	--倒计时
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )
		for i = 0, mem_num - 1 do
			mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
				break
			end
			str			= format( "你将在 %d 秒后离开场景", ( x808002_g_CloseTick - LeaveFlag ) * x808002_g_TickTime )
			x808002_MsgBox( sceneId, mem_obj, str )
		end
	elseif LeaveFlag == x808002_g_CloseTick then
	--回城
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )	--设置副本关闭标志
		for i = 0, mem_num - 1 do
			mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
				break
			end
			--设置玩家的指定Pvp授权位
			--SetPvpAuthorizationFlagByID( sceneId, mem_obj, 2, 0 )			--2是竞技授权标记
			if LuaFnIsCharacterLiving( sceneId, mem_obj ) == 1 then
				x808002_OnGoBack( sceneId, mem_obj )
			end
		end
		
		--全球公告
		if ActMinLev ~= nil then
			str			= format( x808002_g_Msg["n_end"], ActMinLev )
			x808002_MyGlobalNews( sceneId, str )
		end
	end

end

--**********************************
--比武结束扫描会场
--规则：活动结束的时候对地图所有房间
--扫描一次，房间人数>1的任务失败，传
--送至苏州报名地点旁边的位置。
--**********************************
function x808002_OnScanRoom( sceneId, mem_num )

	--扫描会场玩家
	local mem_lst		= {}
	local mem_px		= {}
	local mem_pz		= {}
	for i = 0, mem_num - 1 do
		mem_lst[i]						= LuaFnGetCopyScene_HumanObjId( sceneId, i )
		mem_px[i], mem_pz[i]	= GetWorldPos( sceneId, mem_lst[i] )
	end

	--扫描32个房间，决定胜负
	local	rom_px, rom_pz		--每个房间的左上角坐标
	local	num, id
	for i = 0, 31 do
		px_mod	= i - floor( i /4 ) * 4
		pz_mul	= floor( i / 4 )
		rom_px	= floor( px_mod * 64 )
		rom_pz	= floor( pz_mul * 64 )
		
		num			= 0
		id			= -1
		for j = 0, mem_num - 1 do
			if num >= 2 then
				break
			end
			if mem_px[j] > rom_px and mem_px[j] < (rom_px+64) and
				mem_pz[j] > rom_pz and mem_pz[j] < (rom_pz+64) and
				LuaFnIsObjValid( sceneId, mem_lst[j] ) == 1 and
				LuaFnIsCharacterLiving( sceneId, mem_lst[j] ) == 1 then
				num	= num + 1
				id	= j
			end
		end

		--判断玩家胜负
		if num == 1 then
			--是否已经在本轮失败过，以防范复活技能
			if GetMissionData( sceneId, mem_lst[id], MD_DATAOSHA_RESULT ) == -10 then
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_fal"] )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_flx"] )
			else
				--记录比武结果
				SetMissionData( sceneId, mem_lst[id], MD_DATAOSHA_RESULT, 10 )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_win"] )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_wnx"] )
				LuaFnSendSystemMail( sceneId, GetName( sceneId, mem_lst[id] ), x808002_g_Msg["r_mal"] )
			end
		end
	end

end

--**********************************
--扫描会场
--获胜者传出副本
--**********************************
function x808002_OnScanScene( sceneId )

	--获取场景中玩家人数
	local	mem_num		= LuaFnGetCopyScene_HumanCount( sceneId )
	for i = 0, mem_num - 1 do
		mem_obj				= LuaFnGetCopyScene_HumanObjId( sceneId, i )
		if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
			break
		end
		--单回合获胜标记，胜利者传出
		if GetMissionFlag( sceneId, mem_obj, MF_DATAOSHA_WIN ) == 1 and
			LuaFnIsCharacterLiving( sceneId, mem_obj ) == 1
		then
			x808002_OnGoBack( sceneId, mem_obj )
		end
	end

end

--**********************************
--回城
--**********************************
function x808002_OnGoBack( sceneId, selfId )

	NewWorld( sceneId, selfId, x808002_g_BackCity["scn"], x808002_g_BackCity["px"], x808002_g_BackCity["pz"] )
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnGoBack( sceneId=%d, GUID=%0X ), BackScn=%d, BackX=%d, BackY=%d",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		x808002_g_BackCity["scn"],
		x808002_g_BackCity["px"],
		x808002_g_BackCity["pz"] )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--获取某玩家此次比武的当前回合数
--**********************************
function x808002_GetMyCurrentRound( sceneId, selfId )

	rnd_MD		= GetMissionData( sceneId, selfId, MD_DATAOSHA_ROUND )
	rnd_dat		= floor( rnd_MD / 100 )
	rnd_rnd		= mod( rnd_MD, 100 )
	if rnd_dat ~= GetDayTime() then
		return 0
	end
	return rnd_rnd

end

--**********************************
--醒目提示
--**********************************
function x808002_MsgBox( sceneId, selfId, Msg )

	if Msg == nil then
		return
	end
	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_MsgBox( sceneId=%d, GUID=%0X ), %s",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		Msg )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--全球公告
--**********************************
function x808002_MyGlobalNews( sceneId, Msg )

	if Msg == nil then
		return
	end

	AddGlobalCountNews( sceneId, Msg )
	--Add Log
	MissionLog( sceneId, "[TAOSHA]: "..Msg )

end

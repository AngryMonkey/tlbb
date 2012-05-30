--大逃杀
--回调脚本

--脚本号
x808003_g_ScriptId			= 808003

x808003_g_TickTime			= 60		--回调脚本的时钟时间（单位：秒/次）
x808003_g_NotifyTime		= 29		--公告时间长度（单位：时钟点数）
x808003_g_JoinTime			= 3			--报名时间长度（单位：时钟点数）
x808003_g_AttackTime		= 10		--比武时间长度（单位：时钟点数）
x808003_g_IdleTime			= 2			--每轮之间的空闲时间长度（单位：时钟点数）
x808003_g_RoundMax			= 5			--最大回合数，即满员64人的情形下
x808003_g_TParamNum			= 8			--表单参数数量
x808003_g_CareResultMax	= 5			--状元排名时所关心的最大人数

--活动数据区索引
x808003_g_ActParam	=
{
	["tim"]	= 0,	--时钟总点数
	["pha"]	= 1,	--活动阶段，回合数*10(1-6回合) + 回合标记(1，报名；2，开始；0，空闲)
	["tab"]	= 2,	--表单ID
	["unt"]	= 3,	--单轮执行时间点数
	["minl"]= 4,	--级别下限
	["maxl"]= 5,	--级别上限
}

--消息提示
x808003_g_Msg				=
{
	["n_pre"]	= "#P比武大会#Y%d级别#P组#Y第%d次#P活动报名将于#Y%d分钟#P后开始，请各位做好准备。",
	["n_bgn"]	= "#P比武大会#Y%d级别#P组#Y第%d次#P活动报名已经开始，请各位尽快报名。",
	["n_end"]	= "#P比武大会#Y%d级别#P组活动到此结束！",
	["n_bny"]	= "#P比武大会#Y%d级别#P组的冠亚军已经产生，分别为：#Y",
}

--活动组别信息
--活动ID，定义在《ActivityNotice》表中
x808003_g_Act				=
{
	--需要配置公告
	[1]	= { id=22, minLev=40, maxLev=49 },	--周六40级别组
	[2]	= { id=23, minLev=40, maxLev=49 },	--周三40级别组
	--不需要配置公告
	[3]	= { id=30, minLev=50, maxLev=59 },
	[4]	= { id=31, minLev=50, maxLev=59 },
	[5]	= { id=32, minLev=60, maxLev=69 },
	[6]	= { id=33, minLev=60, maxLev=69 },
	[7]	= { id=34, minLev=70, maxLev=79 },
	[8]	= { id=35, minLev=70, maxLev=79 },
	[9]	= { id=44, minLev=80, maxLev=89 },
	[10]= { id=45, minLev=80, maxLev=89 },
	[11]= { id=46, minLev=90, maxLev=99 },
	[12]= { id=47, minLev=90, maxLev=99 },
	[13]= { id=124, minLev=100, maxLev=109 },
	[14]= { id=125, minLev=100, maxLev=109 },
	[15]= { id=126, minLev=110, maxLev=119 },
	[16]= { id=127, minLev=110, maxLev=119 },
}

--**********************************
--脚本入口函数
--C++回调函数
--**********************************
function x808003_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--一个活动对应一个组别
	local	ActInfo	= nil
	for i = 1, getn( x808003_g_Act ) do
		ActInfo			= x808003_g_Act[i]
		if ActInfo.id == actId then
			break
		else
			ActInfo		= nil
		end
	end
	if ActInfo == nil then	--没有找到这个组别的活动
		return
	end

	--参数说明：场景ID，活动ID，时间间隔（毫秒）
	StartOneActivity( sceneId, ActInfo.id, floor(x808003_g_TickTime*1000), iNoticeType )
	--注册排行榜表单，请注意在活动结束时释放
	tabId	= HitParadeRegisterTab( sceneId )

	--活动数据区
	SetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["tim"], 0 )			--保存时钟总点数
	SetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["pha"], 0 )			--保存活动阶段
	SetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["tab"], tabId )	--保存表单ID
	SetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["minl"], ActInfo.minLev )
	SetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["maxl"], ActInfo.maxLev )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808003_OnDefaultEvent( sceneId=%d, actId=%d, iNoticeType=%d ), tabId=%d, minLev=%d, maxLev=%d",
		sceneId, actId, iNoticeType, tabId, ActInfo.minLev, ActInfo.maxLev )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--心跳函数
--C++回调函数
--**********************************
function x808003_OnTimer( sceneId, actId, uTime )

	--一个活动对应一个组别
	local	ActInfo	= nil
	for i = 1, getn( x808003_g_Act ) do
		ActInfo			= x808003_g_Act[i]
		if ActInfo.id == actId then
			break
		else
			ActInfo		= nil
		end
	end
	if ActInfo == nil then	--没有找到这个组别的活动
		return
	end

	local	m_actId	= actId

	--表单ID
	tabId	= GetActivityParam( sceneId, m_actId, x808003_g_ActParam["tab"] )
	if tabId < 0 then
		return
	end

	--活动数据区
	tim		= GetActivityParam( sceneId, m_actId, x808003_g_ActParam["tim"] )
	SetActivityParam( sceneId, m_actId, x808003_g_ActParam["tim"], tim+1 )	--保存时钟总点数

	--保存活动阶段，由时间划分：
	--7：00公告
	--第一次活动报名7：30，活动开始7：35，活动结束7：45。
	--第二次开始报名7：50，活动开始7：55，活动结束8：05。
	--以后每次活动报名空闲时间5分钟，报名5分钟，活动时间10分钟。
	local	tim_0		= x808003_g_NotifyTime	--参照时间点，即第一回合的报名时间
	local	tim_pnt	=
	{
		["jon"]	= 0,									--本回合的第0个时间点开始报名
		["bgn"]	= x808003_g_JoinTime,	--本回合的第5个时间点开始比武
		["end"]	= x808003_g_JoinTime + x808003_g_AttackTime,											--本回合的第15个时间点结束
		["idl"]	= x808003_g_JoinTime + x808003_g_AttackTime + x808003_g_IdleTime,	--空闲至第20个时间点开始下一回合
	}
	local	tim_all	= tim_pnt["idl"]
	pha			= GetActivityParam( sceneId, m_actId, x808003_g_ActParam["pha"] )
	tmp_mul	= floor( (tim-tim_0) / tim_all )
	tmp_mod	=	(tim-tim_0) - tmp_mul * tim_all
	local	str
	
	if tmp_mul > x808003_g_RoundMax then
		x808003_OnActivityEnd( sceneId, m_actId, tabId )
		--全球公告
		str		= format( x808003_g_Msg["n_end"], ActInfo.minLev )
		x808003_MyGlobalNews( sceneId, str )
		return
	end
	
	--单轮执行时间点数
	if tmp_mod < 0 or tmp_mod >= tim_all then
		SetActivityParam( sceneId, m_actId, x808003_g_ActParam["unt"], 0 )
	else
		SetActivityParam( sceneId, m_actId, x808003_g_ActParam["unt"], tmp_mod )
	end

	--活动进度
	if pha == 0 then	--第一回合
	
		--活动预报
		if tim == floor(tim_0-x808003_g_IdleTime) then
			str	= format( x808003_g_Msg["n_pre"], ActInfo.minLev, 1, x808003_g_IdleTime )
			--全球公告
			x808003_MyGlobalNews( sceneId, str )
		end

		--开始报名
		if tim >= tim_0 then
			SetActivityParam( sceneId, m_actId, x808003_g_ActParam["pha"], (tmp_mul+1)*10+1 )
			str	= format( x808003_g_Msg["n_bgn"], ActInfo.minLev, (tmp_mul+1) )
			--全球公告
			x808003_MyGlobalNews( sceneId, str )
			--表单初始化
			for i = 0, x808003_g_TParamNum do
				HitParadeSetTabParam( sceneId, tabId, i, 0 )
			end
		end

	else
		if tmp_mod == tim_pnt["jon"] then					--报名中
			SetActivityParam( sceneId, m_actId, x808003_g_ActParam["pha"], (tmp_mul+1)*10+1 )
			
			if tmp_mul >= 1 then
				--活动排名，返回胜出人数，等于1时冠军产生
				if x808003_OnActivitySort( sceneId, m_actId, tabId ) > 1 then
					--继续下轮比武
					str	= format( x808003_g_Msg["n_bgn"], ActInfo.minLev, (tmp_mul+1) )
					--全球公告
					x808003_MyGlobalNews( sceneId, str )
					--表单初始化
					for i = 0, x808003_g_TParamNum do
						HitParadeSetTabParam( sceneId, tabId, i, 0 )
					end
				end
			end

		elseif tmp_mod == tim_pnt["bgn"] then			--比武中
			SetActivityParam( sceneId, m_actId, x808003_g_ActParam["pha"], (tmp_mul+1)*10+2 )
		elseif tmp_mod == tim_pnt["end"] then			--空闲中
			SetActivityParam( sceneId, m_actId, x808003_g_ActParam["pha"], (tmp_mul+1)*10 )
		elseif tmp_mod == (tim_pnt["end"]+2) then	--空闲中
			str		= format( x808003_g_Msg["n_pre"], ActInfo.minLev, (tmp_mul+2), (x808003_g_IdleTime-2) )
			--全球公告
			x808003_MyGlobalNews( sceneId, str )
		end

	end

end

--**********************************
--活动排名，返回胜出人数，等于1时冠军产生
--**********************************
function x808003_OnActivitySort( sceneId, actId, tabId )

	--一个活动对应一个组别
	local	ActInfo	= nil
	for i = 1, getn( x808003_g_Act ) do
		ActInfo			= x808003_g_Act[i]
		if ActInfo.id == actId then
			break
		else
			ActInfo		= nil
		end
	end
	if ActInfo == nil then	--没有找到这个组别的活动
		return 0
	end

	local	m_actId	= actId

	--参照排行键值，降序排序（键值越大，排名越靠前）
	HitParadeSort( sceneId, tabId )
	--获取当前报名人数
	local	jon_num	= HitParadeGetTabInfo( sceneId, tabId )
	if jon_num == nil then
		return 0
	else
		--Add Log
		LogInfo	= format( "[TAOSHA]: HitParadeGetTabInfo( sceneId=%d, tabId=%d ), JoinNum=%d",
			sceneId, tabId, jon_num )
		MissionLog( sceneId, LogInfo )
		--最多检查前5名就足够
		if jon_num > x808003_g_CareResultMax then
			jon_num		= x808003_g_CareResultMax
		end
	end
	--获取参赛成绩
	local	no1_num	= 0
	local	guid		= {}
	local	key			= {}
	for i = 0, jon_num do
		guid[i], key[i]	= HitParadeGetPlyInfo( sceneId, tabId, i )
		--Add Log
		if guid[i] ~= nil and key[i] ~= nil then
			LogInfo	= format( "[TAOSHA]: HitParadeGetPlyInfo( sceneId=%d, tabId=%d, i=%d ), GUID=%0X, key=%d",
				sceneId, tabId, i, guid[i], key[i] )
		else
			LogInfo	= format( "[TAOSHA]: HitParadeGetPlyInfo( sceneId=%d, tabId=%d, i=%d ), GUID=NIL, key=NIL",
				sceneId, tabId, i )
		end
		MissionLog( sceneId, LogInfo )
	end

	--获取冠军人数，决定四强赛
	for i = 0, jon_num do
		if guid[i] == nil then
			break
		end
		if key[i] ~= nil and key[i] == key[0] and mod( key[i], 3 ) > 0 then
			no1_num		= no1_num + 1
		else
			break
		end
	end

	--暂时未能选出四强，继续进行下一轮
	if no1_num > 4 then
		return no1_num
	end

	--冠军胜出，活动结束
	local	name1, name2
	if no1_num <= 1 then
		--奖励三甲
		if key[0] ~= nil and mod( key[0], 3 ) > 0 then
			x808003_OnPlyBounty( sceneId, guid[0], 1, tabId )
		else
			guid[0]	= nil
		end
		if key[1] ~= nil and mod( key[1], 3 ) > 0 then
			x808003_OnPlyBounty( sceneId, guid[1], 2, tabId )
		else
			guid[1]	= nil
		end
		if key[2] ~= nil and mod( key[2], 3 ) > 0 then
			x808003_OnPlyBounty( sceneId, guid[2], 3, tabId )
		else
			guid[2]	= nil
		end
		--活动结束
		x808003_OnActivityEnd( sceneId, m_actId, tabId )
		--全球公告
		name1	= x808003_GetPlyName( sceneId, guid[0] )
		name2	= x808003_GetPlyName( sceneId, guid[1] )
		str		= format( x808003_g_Msg["n_bny"], ActInfo.minLev )
		x808003_MyGlobalNews( sceneId, str.."状元"..name1.."，榜眼"..name2.."。" )

	--即将开始决赛
	elseif no1_num == 2 then

	--即将开始四强赛，当然也许只有三强
	elseif no1_num <= 4 then

	end
	return no1_num

end

--**********************************
--活动结束
--**********************************
function x808003_OnActivityEnd( sceneId, actId, tabId )

	local	m_actId	= actId

	SetActivityParam( sceneId, m_actId, x808003_g_ActParam["pha"], 0 )			--保存活动阶段
	SetActivityParam( sceneId, m_actId, x808003_g_ActParam["tab"], -1 )			--保存表单ID
	StopOneActivity( sceneId, m_actId )
	HitParadeReleaseTab( sceneId, tabId )
	
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808003_OnActivityEnd( sceneId=%d, actId=%d, tabId=%d )",
		sceneId, actId, tabId )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--根据玩家等级获取组别信息
--**********************************
function x808003_GetGroupInfo( sceneId, selfId )

	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return nil
	end

	local	lev			= GetLevel( sceneId, selfId )
	local	ActInfo	= nil
	local	minl		= 0
	local	maxl		= 0
	for i = 1, getn( x808003_g_Act ) do
		ActInfo			= x808003_g_Act[i]
		minl				= GetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["minl"] )
		maxl				= GetActivityParam( sceneId, ActInfo.id, x808003_g_ActParam["maxl"] )
		if lev >= ActInfo.minLev and	--适合等级
			lev <= ActInfo.maxLev and
			minl > 0 and								--此活动已开启
			maxl > 0 then
			break
		else
			ActInfo		= nil
		end
	end
	if ActInfo == nil then	--没有找到这个组别的活动
		return nil
	end
	return ActInfo.id, ActInfo.minLev, ActInfo.maxLev

end

--**********************************
--是否处在报名阶段
--**********************************
function x808003_IsJoinDoing( sceneId, selfId )

	local	ActID, _, _	= x808003_GetGroupInfo( sceneId, selfId )
	if ActID == nil then
		return 0
	end

	ret	= GetActivityParam( sceneId, ActID, x808003_g_ActParam["pha"] )
	ret	= ret - floor(ret/10) * 10
	if ret == 1 then
		return 1
	end
	return 0

end

--**********************************
--获取表单ID
--**********************************
function x808003_GetTableID( sceneId, selfId )

	local	ActID, _, _	= x808003_GetGroupInfo( sceneId, selfId )
	if ActID == nil then
		return 0
	end

  return GetActivityParam( sceneId, ActID, x808003_g_ActParam["tab"] )

end

--**********************************
--获取比武回合数
--**********************************
function x808003_GetRound( sceneId, selfId )

	local	ActID, _, _	= x808003_GetGroupInfo( sceneId, selfId )
	if ActID == nil then
		return 0
	end

	ret	= GetActivityParam( sceneId, ActID, x808003_g_ActParam["pha"] )
	return floor(ret/10)

end

--**********************************
--获取单轮执行时间
--**********************************
function x808003_GetCurrentUnitTime( sceneId, selfId, TickTime )

	local	ActID, _, _	= x808003_GetGroupInfo( sceneId, selfId )
	if ActID == nil then
		return 0
	end

	tim	= GetActivityParam( sceneId, ActID, x808003_g_ActParam["unt"] )
	ret	= floor( tim * x808003_g_TickTime / TickTime )
	return ret

end

--**********************************
--获取一个回合中的报名时间长度
--**********************************
function x808003_GetJoinTime( sceneId, TickTime )

	--该函数只能使用全局变量与函数传参
	--原因：报名场景（苏州）、比武场景（副本）在不同线程，该函数会在不同场景所挂起的脚本中调用
	ret	= floor( x808003_g_JoinTime * x808003_g_TickTime / TickTime )
	return ret

end

--**********************************
--获取一个回合中的比武时间长度
--**********************************
function x808003_GetAttackTime( sceneId, TickTime )

	--该函数只能使用全局变量与函数传参
	--原因：报名场景（苏州）、比武场景（副本）在不同线程，该函数会在不同场景所挂起的脚本中调用
	ret	= floor( x808003_g_AttackTime * x808003_g_TickTime / TickTime )
	return ret

end

--**********************************
--根据GUID获取玩家名称
--**********************************
function x808003_GetPlyName( sceneId, guid )

	--玩家是否在该场景
	if guid == nil then
		return "[空]"
	end
	ObjId		= LuaFnGuid2ObjId( sceneId, guid )
	if LuaFnIsObjValid( sceneId, ObjId ) ~= 1 then
		str		= format( "[%0X]", guid )
		return str
	end

	objNam	= GetName( sceneId, ObjId )
	if objNam ~= nil then
		str		= "#{_INFOUSR"..objNam.."}"
	else
		str		= "[空]"
	end
	return str

end

--**********************************
--三甲奖励
--**********************************
function x808003_OnPlyBounty( sceneId, guid, place, tabId )

	--只关心前三甲
	if place < 1 or place > 3 then
		return
	end
	--玩家是否在该场景
	if guid == nil then
		return
	end

	--检查参赛成绩
	local	guid_tmp
	local	key_tmp
	local	isFind				= 0
	for i = 0, x808003_g_CareResultMax do
		guid_tmp, key_tmp	= HitParadeGetPlyInfo( sceneId, tabId, i )
		if guid_tmp ~= nil and key_tmp ~= nil and guid_tmp == guid then
			isFind					= 1
		end
	end
	if isFind == 0 then
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808003_OnPlyBounty( sceneId=%d, GUID=%0X ), Not Find",
			sceneId,
			guid )
		MissionLog( sceneId, LogInfo )
		return
	end

	ObjId		= LuaFnGuid2ObjId( sceneId, guid )
	if LuaFnIsObjValid( sceneId, ObjId ) ~= 1 then
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808003_OnPlyBounty( sceneId=%d, GUID=%0X ), Not OnScene",
			sceneId,
			guid )
		MissionLog( sceneId, LogInfo )
		return
	end

	local	lev		= GetLevel( sceneId, ObjId )
	local	gold	= 0
	--状元
	if place == 1 then
		gold	= lev * 1000
	
	--榜眼
	elseif place == 2 then
		gold	= lev * 500
	
	--探花
	elseif place == 3 then
		gold	= lev * 200

	end

	--金钱奖励
	AddMoney( sceneId, ObjId, gold )

	--物品奖励
	local	item_lst	=
	{
		--状元，二级宝石
		{ 50201001, 50201002, 50211001, 50211002 },
		--榜眼，二级宝石
		{ 50201001, 50201002, 50211001, 50211002 },
		--探花，一级宝石
		{ 50101001, 50101002, 50111001, 50111002 },
	}
	local	item_unt	= item_lst[place]
	local	item_rnd	= random( getn( item_unt ) )
	local	item_nam	= GetItemName( sceneId, item_unt[item_rnd] )
	if item_nam ~= nil then
		x808003_MsgBox( sceneId, ObjId, "得到"..item_nam )
	end

	local nBagIndex	= LuaFnTryRecieveItem( sceneId, ObjId, item_unt[item_rnd], 1 )
	local	szTranEqp	= nil
	if  nBagIndex == -1 then
		x808003_MsgBox( sceneId, ObjId, "很遗憾，背包空间不足" )
	else
		szTranEqp			= GetBagItemTransfer( sceneId, ObjId, nBagIndex )
	end

	--称号奖励
	local	title_lst	=
	{
		{ 136,	"#P比武大会状元" },		--状元
		{ 137,	"#P比武大会榜眼" },		--榜眼
		{ 138,	"#P比武大会探花" },		--探花
	}
	local	title			= title_lst[place]
	x808003_MsgBox( sceneId, ObjId, "得到"..title[2].."称号" )
	LuaFnAwardTitle( sceneId, ObjId, 7, title[1], 7*24 )	--称号的有效期一周，UsefulLife单位小时
	LuaFnDispatchAllTitle( sceneId, ObjId )								--更新所有称号到CLIENT
	
	local	strMsg
	local	rndMsg		= random( 3 )
	if szTranEqp ~= nil then
		if rndMsg == 1 then	
		  strMsg	= format( "#W#{_INFOUSR%s}#P在比武大会上技压群雄，令天下英雄折服不已，获得了#Y%s#P称号，颁奖仪式上热情的支持者们送上了#W#{_INFOMSG%s}#P和#W#{_MONEY%d}#P以示对其的喜爱。",
		  	LuaFnGetName( sceneId, ObjId ),
		  	title[2],
		  	szTranEqp, gold )
		elseif rndMsg == 2 then
			strMsg	= format( "#W#{_INFOUSR%s}#P在比武大会表现出众，惊动了朝廷，特赐#W%s#P称号及#W#{_INFOMSG%s}#P与#W#{_MONEY%d}#P以示皇恩浩荡。",
				LuaFnGetName( sceneId, ObjId ),
				title[2],
				szTranEqp, gold )
		else
			strMsg	= format( "#W#{_INFOUSR%s}#P为夺取#W%s#P称号，在比武大会上使其门派扬名江湖，该门派掌门人甚是心喜，额外又赐其#W#{_INFOMSG%s}#P和#W#{_MONEY%d}#P以彰其功。",
				LuaFnGetName( sceneId, ObjId ),
				title[2],
				szTranEqp, gold )
		end
		x808003_MyGlobalNews( sceneId, strMsg )
	end

end

--**********************************
--醒目提示
--**********************************
function x808003_MsgBox( sceneId, selfId, Msg )

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
	LogInfo	= format( "[TAOSHA]: x808003_MsgBox( sceneId=%d, GUID=%0X ), %s",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		Msg )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--全球公告
--**********************************
function x808003_MyGlobalNews( sceneId, Msg )

	if Msg == nil then
		return
	end

	AddGlobalCountNews( sceneId, Msg )
	--Add Log
	MissionLog( sceneId, "[TAOSHA]: "..Msg )

end

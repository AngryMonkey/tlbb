--副本任务
--送还失窃配方

--************************************************************************
--MisDescBegin
--脚本号
x600042_g_ScriptId	= 600042
--任务号
x600042_g_MissionId	= 1113
--目标NPC
x600042_g_Name			= "郑无名"
--任务等级
x600042_g_MissionLevel		= 10000
--任务归类
x600042_g_MissionKind			= 50
--是否是精英任务
x600042_g_IfMissionElite	= 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明
x600042_g_IsMissionOkFail					= 0	--0 任务完成标记
x600042_g_MissionParam_SubId			= 1	--1 子任务脚本号存放位置
x600042_g_MissionParam_Phase			= 2	--2 阶段号，此号用于区分当前任务UI的描述信息
x600042_g_MissionParam_NpcId			= 3	--3 任务NPC的NPCId号
x600042_g_MissionParam_ItemId			= 4	--4 任务物品的编号
x600042_g_Param_sceneid						= 5	--5 当前副本任务的场景号
x600042_g_Param_StateId						= 6	--6 状态
x600042_g_Param_RandomPos					= 7	--7 帮会场景中的随机坐标，前三位为X坐标，后三位为Y坐标( XXX YYY )
--循环任务的数据索引，里面存着已做的环数
x600042_g_MissionRound						= 61
--**********************************以上是动态****************************

--任务文本描述
x600042_g_MissionName			= "研究任务"
x600042_g_MissionInfo			= "城市内政－研究任务"									--任务描述
x600042_g_MissionTarget		= "%f"																	--任务目标
x600042_g_ContinueInfo		= "    你的任务还没有完成么？"					--未完成任务的npc对话
x600042_g_SubmitInfo			= "    事情进展得如何？"								--完成未提交时的npc对话
x600042_g_MissionComplete	= "    甚好甚好，研究进度又加快了不少。"--完成任务npc说话的话

x600042_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600042_g_StrForePart			= 2

--用来保存字符串格式化的数据
x600042_g_FormatList			= {
	"",
	"    根据线索找出内鬼并取到%2i，送交给%1n。",			--1 副本中打出配方
	"    将取到的%2i，送交给%1n。",										--2 找到NPC
	"    任务完成，可以到帮会大总管那儿领取奖励了。"	--3 送还
}

--通用城市任务脚本
x600042_g_CityMissionScript	= 600001
x600042_g_ConstructionScript= 600040
x600042_g_TransScript				= 400900

--任务奖励

--MisDescEnd
--************************************************************************

x600042_g_NPCOffset				= 44	--表里第几列 NPC 的偏移量
x600042_g_NPCOffsetEx			= 261	--表里第几列 NPC 的偏移量 modi:lby20071126

--阶段任务
x600042_g_PhaseKey				= {}
x600042_g_PhaseKey["cpd"]	= 1		--副本中打出配方
x600042_g_PhaseKey["npc"]	= 2		--找到NPC
x600042_g_PhaseKey["end"]	= 3		--送还

--名器配方
x600042_g_itmNeed					= { 40004291 }
--失窃线索
x600042_g_itmDirect				= 40004290

--************************************************************************
--副本相关
x600042_g_CopySceneName	= "市集"				--副本名称
x600042_g_CopySceneType	= FUBEN_SHIJI1	--副本类型，定义在ScriptGlobal.lua里面
x600042_g_CopySceneMap	= "shiji_1.nav"
x600042_g_Exit					= "shiji_1_area.ini"
x600042_g_TickTime			= 5					--回调脚本的时钟时间（单位：秒/次）
x600042_g_LimitTotalHoldTime	= 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x600042_g_LimitTimeSuccess		= 500	--副本时间限制（单位：次数），如果此时间到了，任务完成
x600042_g_CloseTick			= 6					--副本关闭前倒计时（单位：次数）
x600042_g_NoUserTime		= 300				--副本中没有人后可以继续保存的时间（单位：秒）
x600042_g_DeadTrans			= 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x600042_g_MonsterCount	= 10				--大小怪总数量
x600042_g_Fuben_X				= 43				--进入副本的位置X
x600042_g_Fuben_Z				= 45				--进入副本的位置Z
x600042_g_MonsterGroupId= 0					--小怪
x600042_g_BossGroupId		= 1					--Boss

--副本数据区索引
x600042_g_keyParam			=
{
	["typ"]	= 0,	--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	["sid"]	= 1,	--将1号数据设置为副本场景事件脚本号
	["tim"]	= 2,	--设置定时器调用次数
	["ent"]	= 3,	--设置副本入口场景号, 初始化
	["cls"]	= 4,	--设置副本关闭标志, 0开放，1关闭
	["dwn"]	= 5,	--设置离开倒计时次数
	["tem"]	= 6,	--保存队伍编号
	["px"]	= 7,	--玩家出来时的X坐标
	["pz"]	= 8,	--玩家出来时的Z坐标
}

--命名表格
x600042_g_lstBossName		=
{
	["fst"]	=
	{
		"诸葛", "司马", "欧阳", "西门", "皇甫",
		"司徒", "尉迟", "呼延", "长官", "长孙",
		"公孙", "陆菲",	"南宫"
	},
	["mid"]	=
	{	
		"安", "林", "平", "青", "金",
		"真", "成", "风", "恩", "生",
		"庚", "温", "龙"
	},
	["lst"]	=
	{
		"厉", "暴", "放", "虎", "豹",
		"禄", "道", "烈", "夜", "灭",
		"霸", "剧", "索"
	}
}

--帮会场景中的随机坐标
x600042_g_posRandom			=
{
	{ 50, 51 }, { 54, 92 }, { 85, 99 }, {110, 100}, {152, 84 },
	{140, 54 }, { 99, 50 }, { 84, 43 }, { 66, 56 }, { 99, 83 },
	{ 39, 129}, { 60, 130}, { 60, 150}, { 80, 150}, {100, 150},
	{ 80, 130}, {120, 130}, {120, 150}, {140, 130}, {140, 150},
	{155, 140}, { 45, 64 }
}

--**********************************
--任务入口函数
--**********************************
function x600042_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600042_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) > 0 then
		local bDone = x600042_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600042_g_SubmitInfo
		else
			strText = x600042_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600042_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600042_g_ScriptId, x600042_g_MissionId, bDone )

	--未接此任务，且满足任务接收条件
	elseif x600042_CheckAccept( sceneId, selfId ) > 0 then
		x600042_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x600042_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600042_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) > 0 then
		AddNumText( sceneId, x600042_g_ScriptId, x600042_g_MissionName,3,-1 )
	end

end

--**********************************
--检测接受条件
--**********************************
function x600042_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600042_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--根据玩家等级得到对应MissionNPC_HashTable.txt中的选择信息
--**********************************
function x600042_GetMissionNPCKey( sceneId, selfId )

	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos
	if nPlayerLevel < 30 then				-- 10 ~ 29 Level
		nPos = 0
	elseif nPlayerLevel < 50 then		-- 30 ~ 49 Level
		nPos = 1
	elseif nPlayerLevel < 70 then		-- 50 ~ 69 Level
		nPos = 2
	--else														-- 70 ~ 100 Level
	--	nPos = 3
	--end
	--return nPos + x600042_g_NPCOffset
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 120 then		-- 100 ~ 120 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600042_g_NPCOffset
	else
		return nPos + x600042_g_NPCOffsetEx
	end

end

--**********************************
--接受
--**********************************
function x600042_OnAccept( sceneId, selfId, targetId )

	--没有任务才可以走这里
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600042_NotifyFailTips( sceneId, selfId, "等级不够" )
			return
		end
		
		if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
			x600042_NotifyFailTips( sceneId, selfId, "此任务需要至少一格任务物品空间" )
			return
		end

		--加入任务到玩家列表
		--LuaFnAddMission参数说明：
		--sceneId, selfId, misId(任务编号), scriptId, k(是否回调x600042_OnKillObject), e(是否回调OnEnterArea), i(是否回调OnItemChange)
		--功能说明：在玩家身上添加misId编号的任务，成功返回1
		AddMission( sceneId, selfId, x600042_g_MissionId, x600042_g_ScriptId, 1, 0, 1 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) <= 0 then
			return
		end

		--修改玩家身上misId编号的任务相应事件
		--eventId：调用脚本编号，0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--注册 x600042_OnLockedTarget 事件
		SetMissionEvent( sceneId, selfId, x600042_g_MissionId, 4 )
		CallScriptFunction( x600042_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600042_g_ScriptId )
		local misIndex	= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )

		--随机挑出一个适用的物品
		local	nItemId					= x600042_g_itmNeed[ random( getn(x600042_g_itmNeed) ) ]
		local _, strItemName	= GetItemInfoByItemId( nItemId )

		--选择送信NPC
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600042_GetMissionNPCKey( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_Phase, x600042_g_PhaseKey["cpd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId, nItemId )

		--显示内容告诉玩家已经接受了任务
		local	sex
		if nGender == 0 then
			sex	= "她"
		else
			sex	= "他"
		end
		local	missionInfo	= format( "    %s，又有任务交给你了！本帮为%s的%s（%d，%d）研究出的%s，正准备送交给%s时失窃，根据智囊团的推测，应该是内鬼所为，命你根据线索找出内鬼并取到%s，如约送交给我们的客户，速去速回。",
				GetName( sceneId, selfId), strNpcSceneDesc, strNpcName, nPosX, nPosZ, strItemName, sex, strItemName )
		BeginEvent( sceneId )
			AddText( sceneId, x600042_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x600042_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--提供任务物品：失窃线索
		if GetItemCount( sceneId, selfId, x600042_g_itmDirect ) <= 0 then
			local pos = LuaFnTryRecieveItem( sceneId, selfId, x600042_g_itmDirect, QUALITY_MUST_BE_CHANGE)
			if pos == -1 then
				x600042_NotifyFailTips( sceneId, selfId, "背包空间不足" )
				return
			end
		end
		
		--设置进入副本的随机坐标
		local	pos		= x600042_g_posRandom[ random( getn(x600042_g_posRandom) ) ]
		local	tmp		= pos[1] * 1000 + pos[2]
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_Param_RandomPos, tmp )

	end

end

--**********************************
--当锁定一个对象
--**********************************
function x600042_OnLockedTarget( sceneId, selfId, objId )

	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) < 1 then
		return		--没有该任务
	end

	local misIndex			= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )
	local nNpcId				= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_NpcId )
	local _, strNpcName	= GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then
		return		--找错人了
	end

	local itemId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )
	local _, strDemandItemName	= GetItemInfoByItemId( itemId )

	local Phase		= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_Phase )
	if Phase == x600042_g_PhaseKey["npc"] then
		if GetItemCount( sceneId, selfId, itemId ) < 1 then
			return
		end

		local	missionInfo	= format( "    太好了，感谢，贵帮的信用甚佳，期待下次合作。" )
		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600042_g_MissionId, 4 )
		DelItem( sceneId, selfId, itemId, 1 )

		--任务完成
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_Phase, x600042_g_PhaseKey["end"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_IsMissionOkFail, 1 )
		x600042_NotifyFailTips( sceneId, selfId, "任务完成" )

	-- 意外情况
	else
		return
	end

end

--**********************************
--放弃
--**********************************
function x600042_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) <= 0 then
		return
	end

	--删除物品
	local misIndex		= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )
	local demandItemId= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end
	if GetItemCount( sceneId, selfId, x600042_g_itmDirect ) > 0 then
		DelItem( sceneId, selfId, x600042_g_itmDirect, 1 )
	end

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600042_g_ConstructionScript, "OnAbandon", sceneId, selfId )

	--如果在副本里删除任务，则直接传送回
	if sceneId == GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid ) then
		x600042_NotifyFailTips( sceneId, selfId, "任务失败！" )
		x600042_BackToCity( sceneId, selfId )
	end

end

--**********************************
--继续
--**********************************
function x600042_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600042_g_MissionName )
		AddText( sceneId, x600042_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600042_g_ScriptId, x600042_g_MissionId )

end

--**********************************
--检测是否可以提交
--**********************************
function x600042_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务是否已经完成
	local ret = CallScriptFunction( x600042_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--提交
--**********************************
function x600042_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600042_g_Name then
		return
	end

	if x600042_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600042_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x600042_OnKillObject( sceneId, selfId, objdataId, objId )

	--是否是所需要的副本
	local	fubentype = LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["typ"] )
	if fubentype ~= x600042_g_CopySceneType then
		return
	end

	--只关心Boss
	if GetMonsterGroupID( sceneId, objId ) ~= x600042_g_BossGroupId then
		return
	end
	
	--取得这个怪物死后拥有分配权的人数
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )
	local curOwner
	local misIndex, demandItemId

	--只分配队长
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( sceneId )
	for i = 0, allOwnersCount - 1 do
		--取得拥有分配权的人的objId
		curOwner = GetMonsterOwnerID( sceneId, objId, i )
		--如果这个人拥有任务
		if IsHaveMission( sceneId, curOwner, x600042_g_MissionId ) > 0 and leaderguid == LuaFnGetGUID( sceneId, curOwner ) then
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600042_g_MissionId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600042_g_MissionParam_ItemId )

			AddMonsterDropItem( sceneId, objId, curOwner, demandItemId )
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x600042_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600042_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex			= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )
	local _, strItemName= GetItemInfoByItemId( itemdataId )
	local demandItemId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )
	local _, strDemandItemName	= GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if nItemNum > 0 then
		strText = format( "得到 %s", strItemName )
		
		--删除线索
		if GetItemCount( sceneId, selfId, x600042_g_itmDirect ) > 0 then
			DelItem( sceneId, selfId, x600042_g_itmDirect, 1 )
		end
		
		--如果在副本里删除任务，则直接传送回
		if sceneId == GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid ) then
			x600042_OnFinished( sceneId )
		end
	else
--	strText = format( "失去 %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_IsMissionOkFail, 0 )
	end
	
	if strText ~= nil then
		x600042_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--使用失窃线索
--进入副本，寻找名器配方
--**********************************
function x600042_OnItemUse( sceneId, selfId )

	--有任务才可以走这里
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) <= 0 then
		return
	end
	
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )

	--如果在副本里则不向下进行
	if sceneId == GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid ) then
		return
	end
	
	--副本关闭标志
	local	leaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"] )
	--如果副本已经被置成关闭状态，则杀怪无效
	if leaveFlag == 1 then
		x600042_NotifyFailTips( sceneId, selfId, "任务失败，请放弃重新接取" )
		return
	end

	--帮会场景中的随机坐标
	local	idCity= CityGetSelfCityID( sceneId, selfId )
	local	tmp		= GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_RandomPos )
	local	ranX	= floor( tmp / 1000 )
	local	ranZ	= floor( tmp ) - floor( tmp / 1000 ) * 1000
	local	curX	= GetHumanWorldX( sceneId, selfId )
	local	curZ	= GetHumanWorldZ( sceneId, selfId )
	local	str		= format( "帮会的（%d，%d）处，似乎有人在议论着什么", ranX, ranZ )
	if idCity ~= sceneId or curX < (ranX-5) or curX > (ranX+5) or curZ < (ranZ-5) or curZ > (ranZ+5) then
		x600042_NotifyFailTips( sceneId, selfId, str )
		return
	end

	local	copysceneid	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid )

	--进过副本
	if copysceneid > 0 then
		--将自己传送到副本场景
		if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
			NewWorld( sceneId, selfId, copysceneid, x600042_g_Fuben_X, x600042_g_Fuben_Z )
		-- 只要在里面没有完成，就算失败，需要重做
		else
			x600042_NotifyFailTips( sceneId, selfId, "任务失败，请放弃重新接取" )
		end
		return
	end

	--加入任务到玩家列表
	local	nNpcId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_NpcId )
	local	nItemId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )

	local	StateId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_StateId )
	if StateId == 1 then
		x600042_NotifyFailTips( sceneId, selfId, "副本创建中！" )
	else
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_Param_StateId, 1 )
		x600042_MakeCopyScene( sceneId, selfId )
	end

end

--**********************************
--创建副本
--**********************************
function x600042_MakeCopyScene( sceneId, selfId )

	--取队伍最高等级
	local	mylevel	= GetLevel( sceneId, selfId )
	local	iniLevel= 0
	if mylevel < 10 then
		iniLevel	= 10
	elseif mylevel < 100 then
		iniLevel	= floor( mylevel/10 ) * 10
	else
		iniLevel	= 100
	end

	local	leaderguid	= LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600042_g_CopySceneMap )							--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600042_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600042_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["typ"], x600042_g_CopySceneType )			--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["sid"], x600042_g_ScriptId )						--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["tim"], 0 )	--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["ent"], -1 )	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 0 )	--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"], 0 )	--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["tem"], GetTeamId( sceneId, selfId ) )	--保存队伍号

	local	x, z				= LuaFnGetWorldPos( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["px"], x )		--玩家出来时候的位置
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["pz"], z )		--玩家出来时候的位置

	LuaFnSetSceneLoad_Area( sceneId, x600042_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "shiji_1_monster_" .. iniLevel .. ".ini" )
	--级别差，CopyScene_LevelGap 在 scene.lua 中赋值
	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel - 10 )

	--初始化完成后调用创建副本函数
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )
	if bRetSceneID > 0 then
		x600042_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x600042_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end

end

--**********************************
--副本事件
--**********************************
function x600042_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x600042_g_keyParam["ent"], sceneId )
	local leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	--处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	misIndex	= GetMissionIndexByID( sceneId, leaderObjId, x600042_g_MissionId )
	--设置副本的场景号
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x600042_g_Param_sceneid, destsceneId )
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x600042_g_Param_StateId, 0 )

	NewWorld( sceneId, leaderObjId, destsceneId, x600042_g_Fuben_X, x600042_g_Fuben_Z )

end

--**********************************
--有玩家进入副本事件
--**********************************
function x600042_OnPlayerEnter( sceneId, selfId )

	--如果进入副本前删除任务，则直接传送回
--if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) == 0 then
--	x600042_NotifyFailTips( sceneId, selfId, "你当前未接此任务" )
--	x600042_BackToCity( sceneId, selfId )
--	return
--end

	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 77, 20, 38 )

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x600042_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--回城，只有城市任务副本可以调用此接口
--**********************************
function x600042_BackToCity( sceneId, selfId )

	--取得副本入口场景号
	local oldsceneId	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["ent"] )
	local x	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["px"] )
	local z	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["pz"] )
	CallScriptFunction( x600042_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x, z )

end

--**********************************
--副本场景定时器事件
--**********************************
function x600042_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取得已经执行的定时次数
	local	TickCount	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["tim"] )
	TickCount				= TickCount + 1
	--设置新的定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["tim"], TickCount )

	--Boss更名
	local	namFst		= x600042_g_lstBossName[ "fst" ]
	local	namMid		= x600042_g_lstBossName[ "mid" ]
	local	namLst		= x600042_g_lstBossName[ "lst" ]
	if TickCount == 1 then
		local	BossName= format( "%s%s%s",
			namFst[ random( getn(namFst) ) ], namMid[ random( getn(namMid) ) ], namLst[ random( getn(namLst) ) ] )
		local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			--找到Boss
			monsterId		= GetMonsterObjID( sceneId, i )
			if GetMonsterGroupID( sceneId, monsterId ) == x600042_g_BossGroupId then
				SetCharacterName( sceneId, monsterId, BossName )
			end
		end
		
		--刷新怪物等级
--	x600042_RefreshMonster( sceneId )
	end

	local membercount	= LuaFnGetCopyScene_HumanCount( sceneId )
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( sceneId )
	local mems	= {}
	for i = 0, membercount - 1 do
		mems[i]		= LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--副本关闭标志
	local	leaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"] )
	local	Back_X		= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["px"] )	--玩家出来时候的位置
	local	Back_Z		= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["pz"] )	--玩家出来时候的位置
	local	leaveTickCount
	local	oldsceneId= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["ent"] )
	local	strText

	--没有人的时候关闭副本
	--需要离开
	if leaveFlag == 1 then

		--离开倒计时间的读取和设置
		leaveTickCount	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"] )
		leaveTickCount	= leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"], leaveTickCount )

		--倒计时间到，大家都出去吧
		if leaveTickCount >= x600042_g_CloseTick then
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, Back_X, Back_Z )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			strText	= format( "你将在 %d 秒后离开场景", ( x600042_g_CloseTick - leaveTickCount ) * x600042_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600042_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end

	--副本总时间限制到了
	elseif TickCount >= x600042_g_LimitTotalHoldTime then

		--此处设置副本任务有时间限制的情况，当时间到后处理...
		leaveTickCount	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"] )
		strText	= format( "你将在 %d 秒后离开场景", ( x600042_g_CloseTick - leaveTickCount ) * x600042_g_TickTime )

		for i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				if leaderguid == LuaFnGetGUID( sceneId, mems[i] ) then
					x600042_NotifyFailTips( sceneId, mems[i], "时限已到，任务失败" )
				end

				x600042_NotifyFailTips( sceneId, mems[i], strText )
			end
		end
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 1 )

	else
		--没人就关闭
		if membercount < 1 and TickCount > x600042_g_NoUserTime then
			LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 1 )
			return
		end

	end

end

--**********************************
--刷新怪物等级
--**********************************
function x600042_RefreshMonster( sceneId )

	--------------------------------------------------------------
	--计算队伍中的最高等级
	local	maxLev		= 0
	--找到队长
	local	GuidLeader= LuaFnGetCopySceneData_TeamLeader( sceneId )
	local	idLeader	= LuaFnGuid2ObjId( sceneId, GuidLeader )
	--队长在场景里
	if idLeader ~= -1 then
		maxLev			= GetLevel( sceneId, idLeader )
	else
		return
	end
	--------------------------------------------------------------

	--取得此场景中的怪物数量
	local	numMon= GetMonsterCount( sceneId )
	--怪物的ObjId
	local idMon, idGrp
	for i=0, numMon-1 do
		idMon	= GetMonsterObjID( sceneId, i )
		idGrp	= GetMonsterGroupID( sceneId, idMon )
		if idGrp == x600042_g_BossGroupId or idGrp == x600042_g_MonsterGroupId then
			--设置怪物等级为队伍中最高人物等级+1
			SetLevel( sceneId, idMon, maxLev+1 )
		end
	end

end

--**********************************
--副本任务完成
--**********************************
function x600042_OnFinished( sceneId )

	--是否是所需要的副本
	local	fubentype	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["typ"] )
	if fubentype ~= x600042_g_CopySceneType then
		return
	end

	--副本关闭标志
	local	leaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"] )
	--如果副本已经被置成关闭状态，则杀怪无效
	if leaveFlag == 1 then
		return
	end

	local memCount= LuaFnGetCopyScene_HumanCount( sceneId )
	local mems		= {}
	for i = 0, memCount - 1 do
		mems[i]			= LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	local	leaderguid= LuaFnGetCopySceneData_TeamLeader( sceneId )
	--所有队员都要出去
	for i = 0, memCount - 1 do
		x600042_NotifyFailTips( sceneId, mems[i], "阶段任务完成，返回帮会" )

		if leaderguid == LuaFnGetGUID( sceneId, mems[i] ) then
			local	misIndex	= GetMissionIndexByID( sceneId, mems[i], x600042_g_MissionId )
			--设置下一阶段任务
			SetMissionByIndex( sceneId, mems[i], misIndex, x600042_g_MissionParam_Phase, x600042_g_PhaseKey["npc"] )
		end
	end

	--设置副本关闭标志
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 1 )
	local	strText		= format( "%d 秒后将传送到入口位置", x600042_g_CloseTick * x600042_g_TickTime )
	for i = 0, memCount - 1 do
		x600042_NotifyFailTips( sceneId, mems[i], strText )
	end

end

--**********************************
--醒目提示
--**********************************
function x600042_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

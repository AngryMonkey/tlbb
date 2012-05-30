
-- 国防任务，捉拿奸细
--MisDescBegin
-- 脚本号
x600031_g_ScriptId = 600031

--任务号
x600031_g_MissionId = 1109

--任务目标npc
x600031_g_Name = "武大威"

--任务归类
x600031_g_MissionKind = 50

--任务等级
x600031_g_MissionLevel = 10000

--是否是精英任务
x600031_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600031_g_IsMissionOkFail = 0							-- 任务完成标记

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号
--任务文本描述
x600031_g_MissionName = "国防任务"
x600031_g_MissionInfo = ""													--任务描述
x600031_g_MissionTarget = "    使用巡逻令，拿下可疑的人。"	--任务目标
x600031_g_ContinueInfo = "    事情进展得如何？"						--未完成任务的npc对话
x600031_g_MissionComplete = "    干得不错，甚好甚好。"						--完成任务npc说话的话

x600031_g_MissionRound = 79

-- 通用城市任务脚本
x600031_g_CityMissionScript = 600001
x600031_g_MilitaryScript = 600030

--MisDescEnd

x600031_g_MonsterId = {
{n=100,id=3550},{n=101,id=3551},{n=102,id=3552},{n=103,id=3553},{n=104,id=3554},{n=105,id=3555},{n=106,id=3556},{n=107,id=3557},{n=108,id=3558},{n=109,id=3559},
{n=110,id=3560},{n=111,id=3561},{n=112,id=3562},{n=113,id=3563},{n=114,id=3564},{n=115,id=3565},{n=116,id=3566},{n=117,id=3567},{n=118,id=3568},{n=119,id=3569},
{n=120,id=3570},{n=121,id=3571},{n=122,id=3572},{n=123,id=3573},{n=124,id=3574},{n=125,id=3575},{n=126,id=3576},{n=127,id=3577},{n=128,id=3578},{n=129,id=3579},
{n=130,id=3580},{n=131,id=3581},{n=132,id=3582},{n=133,id=3583},{n=134,id=3584},{n=135,id=3585},{n=136,id=3586},{n=137,id=3587},{n=138,id=3588},{n=139,id=3589},
{n=140,id=3590},{n=141,id=3591},{n=142,id=3592},{n=143,id=3593},{n=144,id=3594},{n=145,id=3595},{n=146,id=3596},{n=147,id=3597},{n=148,id=3598},{n=149,id=3599},
{n=150,id=3600},{n=151,id=3601},{n=152,id=3602},{n=153,id=3603},{n=154,id=3604},{n=155,id=3605},{n=156,id=3606},{n=157,id=3607},{n=158,id=3608},{n=159,id=3609},
{n=160,id=3610},{n=161,id=3611},{n=162,id=3612},{n=163,id=3613},{n=164,id=3614},{n=165,id=3615},{n=166,id=3616},{n=167,id=3617},{n=168,id=3618},{n=169,id=3619},
{n=170,id=3620},{n=171,id=3621},{n=172,id=3622},{n=173,id=3623},{n=174,id=3624},{n=175,id=3625},{n=176,id=3626},{n=177,id=3627},{n=178,id=3628},{n=179,id=3629},
{n=180,id=3630},{n=181,id=3631},{n=182,id=3632},{n=183,id=3633},{n=184,id=3634},{n=185,id=3635},{n=186,id=3636},{n=187,id=3637},{n=188,id=3638},{n=189,id=3639},
}

x600031_g_MonsterName = {
"穆",
"邓",
"关",
"宋",
"于",
"甲儿",
"小甲",
"乙儿",
"小乙",
"丙儿",
}

--**********************************
--任务入口函数
--**********************************
function x600031_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600031_g_MissionId ) > 0 then
		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600031_g_MissionName )
			AddText( sceneId, x600031_g_ContinueInfo )
		EndEvent( )
		local bDone = x600031_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600031_g_ScriptId, x600031_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600031_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600031_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600031_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--列举事件
--**********************************
function x600031_OnEnumerate( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600031_g_MissionId ) > 0 then
		AddNumText( sceneId, x600031_g_ScriptId, x600031_g_MissionName, 2 )
	end
	
end

--**********************************
--接受
--**********************************
function x600031_OnAccept( sceneId, selfId, targetId )
	
	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600031_g_MissionId, x600031_g_ScriptId, 1, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600031_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600031_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600031_g_ScriptId )

	-- 给玩家添加相关的任务物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40004413, 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	
	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    最近城里总有人鬼鬼祟祟，你拿这个巡逻令，在城中四处转转。" )
		else
			missionInfo = format( "    维持城市安全是我们的责任，这个巡逻令交给你，做出些成绩来。" )
		end

		AddText( sceneId, "你接受了任务：" .. x600031_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	-- 给这个任务分配一些怪物向观的必要数据
	-- 具体是根据完家的等级＋随机一个门派来获得
	local randMenpai = random( 9 ) - 1
	local nLevel = GetLevel(sceneId, selfId)
	local nIndex = 100 + randMenpai*10 + floor(nLevel/10)-1
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600031_g_MissionId)
	if nIndex>=100 and nIndex<189   then
		SetMissionByIndex(sceneId, selfId, misIndex, 5, nIndex)
	else
		SetMissionByIndex(sceneId, selfId, misIndex, 5, 189)
	end
	
	-- 随机怪物的名字
	local nXin = random(4)
	local nMing = random(4) + 4
	SetMissionByIndex(sceneId, selfId, misIndex, 6, nXin)
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nMing)

end

--**********************************
--检测接受条件
--**********************************
function x600031_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600031_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--检测是否可以提交
--**********************************
function x600031_CheckSubmit( sceneId, selfId )
	--查询人物身上是不是有这个获得的物品了
	if GetItemCount( sceneId, selfId, 40004254 ) < 1   then
		return 0
	end
	return 1
end

--**********************************
--放弃任务
--**********************************
function x600031_OnAbandon( sceneId, selfId )

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600031_g_MilitaryScript, "OnAbandon", sceneId, selfId )
	
	--删除任务物品
	DelItem( sceneId, selfId, 40004254, 1 )
	DelItem( sceneId, selfId, 40004413, 1 )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600031_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600031_g_MissionId )		--得到任务在20个任务中的序列号

	local monsterName = GetName(sceneId, objId)
	
	local nXin = GetMissionParam(sceneId, selfId, misIndex, 6)
	local nMing = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local nMingzi = x600031_g_MonsterName[nXin] .. x600031_g_MonsterName[nMing]
	
	if monsterName == nMingzi   then
		-- 给玩家添加相关的任务物品
		BeginAddItem( sceneId )
			AddItem( sceneId, 40004254, 1 )
		local ret = EndAddItem( sceneId, selfId )
		if ret <= 0 then 
			return
		end
		AddItemListToHuman(sceneId,selfId)
		SetMissionByIndex( sceneId, selfId, misIndex, x600031_g_IsMissionOkFail, 1 )
	end
end

--**********************************
--继续
--**********************************
function x600031_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600031_g_MissionName )
		AddText( sceneId, x600031_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600031_g_ScriptId, x600031_g_MissionId )
end

--**********************************
--提交
--**********************************
function x600031_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if GetName( sceneId, targetId ) ~= x600031_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	if x600031_CheckSubmit( sceneId, selfId ) == 1 then
		-- 删除任务相关需要删除的物品
		CallScriptFunction( x600031_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )

		DelItem( sceneId, selfId, 40004254, 1 )
		
		-- 清除随机的位置信息
		SetMissionData( sceneId, selfId, MD_MILITARY_ROND_POSITION, 0)
	end
end


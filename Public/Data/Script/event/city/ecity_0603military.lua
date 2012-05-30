
-- 国防任务，送交情报
--MisDescBegin
-- 脚本号
x600033_g_ScriptId = 600033

--任务号
x600033_g_MissionId = 1109

--任务目标npc
x600033_g_Name = "武大威"

--任务归类
x600033_g_MissionKind = 50

--任务等级
x600033_g_MissionLevel = 10000

--是否是精英任务
x600033_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况
x600033_g_IsMissionOkFail = 0							-- 任务完成标记

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号
--任务文本描述
x600033_g_MissionName = "送交情报"
x600033_g_MissionInfo = ""													--任务描述
x600033_g_MissionTarget = "    这份关键的情报，需要你火速送到%n，加急加急。"	--任务目标
x600033_g_ContinueInfo = "    你的任务还没有完成么？"				--未完成任务的npc对话
x600033_g_MissionComplete = "    干得不错，甚好甚好。"			--完成任务npc说话的话

x600033_g_MissionRound = 79

-- 通用城市任务脚本
x600033_g_CityMissionScript = 600001
x600033_g_MilitaryScript = 600030

x600033_g_StrForePart=7

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x600033_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	if IsHaveMission( sceneId, selfId, x600033_g_MissionId ) > 0 then
		-- 获得当前选中的Npc的名字
		local szCurNpc = GetName(sceneId,targetId)
		
		-- 任务中记录的Npc的名字
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600033_g_MissionId)
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
		
		local szNpcName = ""
		if nNpcId > 0  then
			_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
			
			if szCurNpc == szNpcName   then  -- 找对人了
				BeginEvent( sceneId )
					AddText( sceneId, "#Y送交情报" )
					AddText( sceneId, "  来的真是及时，我这就安排行动。" )
				EndEvent()
				DispatchEventList( sceneId, selfId, targetId )
				
				-- 设置任务完成标记
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
				
				-- 在这里删除情报
				DelItem(sceneId, selfId, 40004255, 1)
				
				return
			end
		end
	end
	
	if GetName( sceneId, targetId ) ~= x600033_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600033_g_MissionId ) > 0 then
		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600033_g_MissionName )
			AddText( sceneId, x600033_g_ContinueInfo )
		EndEvent()
		local bDone = x600033_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600033_g_ScriptId, x600033_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600033_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600033_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600033_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--列举事件
--**********************************
function x600033_OnEnumerate( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x600033_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600033_g_MissionId ) > 0 then
		AddNumText( sceneId, x600033_g_ScriptId, x600033_g_MissionName, 2 )
	end
	
end

--**********************************
--接受
--**********************************
function x600033_OnAccept( sceneId, selfId, targetId )
	
	if GetName( sceneId, targetId ) ~= x600033_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	-- 判断玩家等级，然后根据等级选择使用表中的哪一列
	local nLevel = GetLevel(sceneId, selfId)
	local nNpcId = 0
	local szNpcName = ""
	local szScene = ""
	local nScene = 0
	local nPosX = 0
	local nPosZ = 0
	local szNpcDesc =""
	local nSex = 0

	if nLevel >= 40 and nLevel <=54   then
		nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex 
				= GetOneMissionNpc(26)
	elseif nLevel >= 55 and nLevel <= 69   then
		nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex 
				= GetOneMissionNpc(27)
	elseif nLevel >= 70 and nLevel <= 84   then
		nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex 
				= GetOneMissionNpc(28)
	elseif nLevel >= 85 and nLevel <= 99   then			--modi:lby20071126为了保持一样风格
		nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex 
				= GetOneMissionNpc(29)
		
	elseif nLevel >= 100 and nLevel <= 114   then
		nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex 
				= GetOneMissionNpc(253)
	elseif nLevel >= 115 and nLevel <= 150   then
		nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex 
				= GetOneMissionNpc(254)	
				
	end
	
	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600033_g_MissionId, x600033_g_ScriptId, 0, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600033_g_MissionId ) <= 0 then
		return
	end

	-- 设置这个任务需要关注NPC
	SetMissionEvent( sceneId,selfId, x600033_g_MissionId, 4)
	
	-- 记录下随机选中的NpcId
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600033_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nNpcId)

	CallScriptFunction( x600033_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600033_g_ScriptId )

	-- 给玩家添加相关的任务物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40004255, 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	
	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
	local missionInfo = "#r    你快将这份情报送给".. szScene.. szNpcName
		AddText( sceneId, "    你接受了任务：" .. x600033_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检测接受条件
--**********************************
function x600033_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600033_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--检测是否可以提交
--**********************************
function x600033_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600033_g_MissionId )
	if  GetMissionParam(sceneId, selfId, misIndex, 0) >0  then
		return 1
	end 
	return 0
end

--**********************************
--放弃任务
--**********************************
function x600033_OnAbandon( sceneId, selfId )

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600033_g_MilitaryScript, "OnAbandon", sceneId, selfId )
	
	-- 删除任务道具
	DelItem(sceneId, selfId, 40004255, 1)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600033_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--继续
--**********************************
function x600033_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600033_g_MissionName )
		AddText( sceneId, x600033_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600033_g_ScriptId, x600033_g_MissionId )
end

--**********************************
--提交
--**********************************
function x600033_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600033_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	if x600033_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600033_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		-- 删除任务物品
		-- DelItem(sceneId, selfId, 40004255, 1)
	end
end

--**********************************
-- 
--**********************************
function x600033_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

	-- 获得当前选中的Npc的名字
	local szCurNpc = GetName(sceneId,targetId)
	
	-- 任务中记录的Npc的名字
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600033_g_MissionId)
	local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local szNpcName = ""
	_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
	
	if szCurNpc == szNpcName   then  -- 找对人了
		TAddNumText(sceneId, x600033_g_ScriptId, x600033_g_MissionName, 2, -1,x600033_g_ScriptId);
		TDispatchEventList(sceneId, selfId, targetId)
		return 1
	end
	return 0
end

--**********************************
-- x600033_OnEventRequest
--**********************************
function x600033_OnEventRequest( sceneId, selfId, targetId, eventId )
	--PrintStr("x600033_OnEventRequest")
end


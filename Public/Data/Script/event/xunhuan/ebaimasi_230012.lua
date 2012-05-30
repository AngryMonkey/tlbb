--白马寺任务
--找人
--MisDescBegin
--脚本号
x230012_g_ScriptId = 230012

--前提任务
--g_MissionIdPre =

--任务号
x230012_g_MissionId = 4011

--任务目标npc
x230012_g_Name	="智清大师"

--任务归类
x230012_g_MissionKind = 1

--任务等级
x230012_g_MissionLevel = 10000

--是否是精英任务
x230012_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x230012_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x230012_g_MissionName="白马寺修行"
x230012_g_MissionInfo="#{event_xunhuan_0003}"  --任务描述
x230012_g_MissionTarget="#{event_xunhuan_0004}"		--任务目标
x230012_g_ContinueInfo="阿弥陀佛...#r少侠可否打通了珍珑棋局？"		--未完成任务的npc对话
x230012_g_MissionComplete="善哉善哉，少侠为人豪爽，关爱百姓，日后必有一番作为。"					--完成任务npc说话的话

--控制脚本
x230012_g_ControlScript=230000

--任务奖励


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x230012_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x230012_g_MissionId ) > 0 then
		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x230012_g_MissionName )
			AddText( sceneId, x230012_g_ContinueInfo )
		EndEvent( )
		bDone = x230012_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x230012_g_ScriptId, x230012_g_MissionId, bDone )
	--满足任务接收条件
	elseif x230012_CheckAccept( sceneId, selfId ) > 0 then
		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, x230012_g_MissionName )
			AddText( sceneId, x230012_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x230012_g_MissionTarget )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x230012_g_ScriptId, x230012_g_MissionId )
	end
end

--**********************************
--列举事件
--**********************************
function x230012_OnEnumerate( sceneId, selfId, targetId )
 	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x230012_g_MissionId ) > 0 or x230012_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x230012_g_ScriptId, x230012_g_MissionName,3,-1 )
    end
end

--**********************************
--检测接受条件
--**********************************
function x230012_CheckAccept( sceneId, selfId )
	if CallScriptFunction( x230012_g_ControlScript, "CheckAccept", sceneId, selfId ) == 1 then
		--检测玩家是否符合接受任务的条件
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x230012_OnAccept( sceneId, selfId, targetId )
 	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--加入任务到玩家列表
	CallScriptFunction( x230012_g_ControlScript, "OnAccept", sceneId, selfId, targetId, x230012_g_ScriptId )

	if IsHaveMission( sceneId, selfId, x230012_g_MissionId ) <= 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x230012_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, 7, 1 )						--根据序列号把任务变量的第7位置1 (任务完成情况)

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		AddText( sceneId, x230012_g_MissionInfo )
		AddText( sceneId,"#r        你接受了任务：白马寺修行" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x230012_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	CallScriptFunction( x230012_g_ControlScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x230012_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent( sceneId )
	AddText( sceneId, x230012_g_MissionName )
	AddText( sceneId, x230012_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x230012_g_ScriptId, x230012_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x230012_CheckSubmit( sceneId, selfId )
	return CallScriptFunction( x230012_g_ControlScript, "CheckSubmit", sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x230012_OnSubmit( sceneId, selfId, targetId, selectRadioId )
 	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	CallScriptFunction( x230012_g_ControlScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x230012_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x230012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x230012_OnItemChanged( sceneId, selfId, itemdataId )
end

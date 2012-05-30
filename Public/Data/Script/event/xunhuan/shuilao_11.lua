--水牢任务
--找人

--MisDescBegin
--脚本号
x232001_g_ScriptId	= 232001

--接受任务NPC属性
x232001_g_Position_X=66.5252
x232001_g_Position_Z=76.7254
x232001_g_SceneID=4
x232001_g_AccomplishNPC_Name="呼延庆"

--任务号
x232001_g_MissionId	= 1212
--任务目标npc
x232001_g_Name			= "呼延豹"
--任务归类
x232001_g_MissionKind			= 1
--任务等级
x232001_g_MissionLevel		= 10000
--是否是精英任务
x232001_g_IfMissionElite	= 0
--任务是否已经完成
x232001_g_IsMissionOkFail	= 0		--变量的第0位
--任务文本描述
x232001_g_MissionName			= "帮助平定水牢叛乱"
--任务描述
x232001_g_MissionInfo			= "#{event_xunhuan_0005}"
--任务目标
x232001_g_MissionTarget		= "  去太湖的水寨中处找呼延庆#{_INFOAIM67,77,4,呼延庆}。"
--未完成任务的npc对话
x232001_g_ContinueInfo		= "  少侠是否完成了水牢任务？"
--完成任务npc说话的话
x232001_g_MissionComplete	= "  非常感谢您的帮忙，水牢里面犯人的暴动已经平息了。"
--控制脚本
x232001_g_ControlScript		= 232000
--MisDescEnd


--**********************************
--任务入口函数
--**********************************
function x232001_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) > 0 then

		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x232001_g_MissionName )
			AddText( sceneId, x232001_g_ContinueInfo )
		EndEvent( )
		local	bDone	= x232001_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId, bDone )

	--未接，且满足任务接收条件
	elseif x232001_CheckAccept( sceneId, selfId ) > 0 then

		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, x232001_g_MissionName )
			AddText( sceneId, x232001_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x232001_g_MissionTarget )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId )

	end

end

--**********************************
--列举事件
--**********************************
function x232001_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) > 0 or x232001_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x232001_g_ScriptId, x232001_g_MissionName,3,-1 )
	end

end

--**********************************
--检测接受条件
--**********************************
function x232001_CheckAccept( sceneId, selfId )

	if CallScriptFunction( x232001_g_ControlScript, "CheckAccept", sceneId, selfId ) == 1 then
		--检测玩家是否符合接受任务的条件
		return 1
	else
		return 0
	end

end

--**********************************
--接受
--**********************************
function x232001_OnAccept( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

	--加入任务到玩家列表
	CallScriptFunction( x232001_g_ControlScript, "OnAccept", sceneId, selfId, targetId, x232001_g_ScriptId )

	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) <= 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x232001_g_MissionId )
	--根据序列号把任务变量的第6位置1 (任务完成情况)
	SetMissionByIndex( sceneId, selfId, misIndex, 6, 1 )

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		AddText( sceneId, x232001_g_MissionInfo )
		AddText( sceneId, "#r你接受了任务：#r  "..x232001_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--放弃
--**********************************
function x232001_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	CallScriptFunction( x232001_g_ControlScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x232001_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent( sceneId )
	AddText( sceneId, x232001_g_MissionName )
	AddText( sceneId, x232001_g_MissionComplete )
	EndEvent()
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x232001_CheckSubmit( sceneId, selfId )
	return CallScriptFunction( x232001_g_ControlScript, "CheckSubmit", sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x232001_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end
	CallScriptFunction( x232001_g_ControlScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
function x232001_OnKillObject( sceneId, selfId, objdataId , objId )
end

--**********************************
--进入区域事件
--**********************************
function x232001_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x232001_OnItemChanged( sceneId, selfId, itemdataId )
end

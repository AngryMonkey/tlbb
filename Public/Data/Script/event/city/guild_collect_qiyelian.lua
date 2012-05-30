----------------
--MisDescBegin
--脚本号
x600049_g_ScriptId	= 600049

--接受任务NPC属性
x600049_g_Position_X=147
x600049_g_Position_Z=96
--任务交付npc
x600049_g_AccomplishNPC_Name="佟芙蓉"
--任务号
x600049_g_MissionId			  = 1142
--任务目标npc
x600049_g_Name 					  = "佟芙蓉"
--任务归类
x600049_g_MissionKind			= 50 --玩家城市
--任务等级
x600049_g_MissionLevel		= 10000
--是否是精英任务
x600049_g_IfMissionElite	= 0
--任务是否已经完成
x600049_g_IsMissionOkFail	= 0		--任务参数的第0位
--任务文本描述
x600049_g_MissionName			= "支援朝廷：七叶莲任务"
--任务描述
x600049_g_MissionInfo			= ""
--任务目标
x600049_g_MissionTarget		= "    收集一批#Y七叶莲#W。你可到#G剑阁白茅岭#W或#G无量山桃花潭#W那找到。请于接受任务当日20:00前完成并交付。"
--未完成任务的npc对话
x600049_g_ContinueInfo		= ""
--完成任务npc说的话
x600049_g_MissionComplete	= ""

-- 任务完成情况,内容动态刷新,占用任务参数的第1位
x600049_g_Custom	= { {id="已找到：七叶莲",num=1} }
--MisDescEnd
----------------

--**********************************
--放弃
--**********************************
function x600049_OnAbandon( sceneId, selfId )
	CallScriptFunction( 600046, "OnAbandon", sceneId, selfId, 2 )
end

--**********************************
--提交
--**********************************
function x600049_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	CallScriptFunction( 600046, "OnSubmit", sceneId, selfId, targetId, 2 )
end

--**********************************
--接受
--**********************************
function x600049_OnAccept( sceneId, selfId, targetId )
	CallScriptFunction( 600046, "OnAcceptSupportState", sceneId, selfId, targetId, 2 )	
end

----------------
--MisDescBegin
--脚本号
x600048_g_ScriptId	= 600048

--接受任务NPC属性
x600048_g_Position_X=147
x600048_g_Position_Z=96
--任务交付npc
x600048_g_AccomplishNPC_Name="佟芙蓉"
--任务号
x600048_g_MissionId			  = 1141
--任务目标npc
x600048_g_Name 					  = "佟芙蓉"
--任务归类
x600048_g_MissionKind			= 50 --玩家城市
--任务等级
x600048_g_MissionLevel		= 10000
--是否是精英任务
x600048_g_IfMissionElite	= 0
--任务是否已经完成
x600048_g_IsMissionOkFail	= 0		--任务参数的第0位
--任务文本描述
x600048_g_MissionName			= "支援朝廷：雁翎任务"
--任务描述
x600048_g_MissionInfo			= ""
--任务目标
x600048_g_MissionTarget		= "    收集一批#Y雁翎#W。你可到#G太湖鼋头绪#W或#G镜湖胭脂岛与画眉岛#W那找到。请于接受任务当日20:00前完成并交付。"
--未完成任务的npc对话
x600048_g_ContinueInfo		= ""
--完成任务npc说的话
x600048_g_MissionComplete	= ""

-- 任务完成情况,内容动态刷新,占用任务参数的第1位
x600048_g_Custom	= { {id="已找到：雁翎",num=1} }
--MisDescEnd
----------------

--**********************************
--放弃
--**********************************
function x600048_OnAbandon( sceneId, selfId )
	CallScriptFunction( 600046, "OnAbandon", sceneId, selfId, 1 )
end

--**********************************
--提交
--**********************************
function x600048_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	CallScriptFunction( 600046, "OnSubmit", sceneId, selfId, targetId, 1 )	
end

--**********************************
--接受
--**********************************
function x600048_OnAccept( sceneId, selfId, targetId )
	CallScriptFunction( 600046, "OnAcceptSupportState", sceneId, selfId, targetId, 1 )	
end

--同门相助
--花费一些门派贡献来直接完成一环师门任务....

x229011_g_scriptId = 229011



--**********************************
--任务入口函数
--**********************************
function x229011_OnDefaultEvent( sceneId, selfId, targetId, menpaiId, numTextId )

	if numTextId == 1 then

		BeginEvent( sceneId )

			if IsHaveMission(sceneId,selfId,MENPAI_SHIMEN_MISID[menpaiId+1]) <= 0 then
				AddText( sceneId, "你好像没有接受师门任务啊。")
			else
				local strText = "  光耀师门，人人有责！每日辛勤做师门任务的弟子我们会给予丰厚的奖励的，当然，对做师门任务碰到困难的弟子我们也会倾力协助的。#r  你确定要消耗#G%d点#W师门贡献度，让其他同门师兄和师姐帮你完成当前师门任务吗？"
				strText = format( strText, x229011_GetHelpFinishNeed( sceneId, selfId ) )
				AddText( sceneId, strText )
				AddNumText( sceneId, x229011_g_scriptId, "确定", 6, 2 )
				AddNumText( sceneId, x229011_g_scriptId, "离开", 8, 3 )
			end

		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif numTextId == 2 then

		CallScriptFunction( MENPAI_SHIMEN_SCRIPTID[menpaiId+1], "HelpFinishOneHuan", sceneId, selfId, targetId )

	elseif numTextId == 3 then

		--关闭对话窗口....
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
	end

end

--**********************************
--列举事件
--**********************************
function x229011_OnEnumerate( sceneId, selfId, targetId, menpaiId )

	--如果玩家不是该本门派的就不显示....
	if menpaiId == GetMenPai( sceneId, selfId ) then
		AddNumText( sceneId, x229011_g_scriptId, "同门相助", 6, 1 );
	end

end

--**********************************
--计算同门相助所需的门派贡献....
--**********************************
function x229011_GetHelpFinishNeed( sceneId, selfId )

	--同门相助所需贡献度=完成20环的贡献度 * 80%
	
	--每环实际奖励贡献度=（玩家等级-基础等级）* 等级影响参数 + 基础贡献度
	--完成20环的贡献度=（玩家等级-基础等级）* 等级影响参数 * 20 + 20环基础贡献度总和(=40)
	
	local level = GetLevel(sceneId, selfId)
	local need = (level - 10) * 0.05 * 20 + 40
	need = need * 0.8
	need = floor( need )

	return need

end

--**********************************
--检测并扣除同门相助所需的门派贡献....
--**********************************
function x229011_CheckAndDepleteHelpFinishMenPaiPoint( sceneId, selfId, targetId )

	local needPoint = x229011_GetHelpFinishNeed( sceneId, selfId )
	local menpaiPoint = GetHumanMenpaiPoint( sceneId, selfId )

	if menpaiPoint < needPoint then
		BeginEvent(sceneId)
			AddText( sceneId, "  你好像没有足够的师门贡献度，多为师门做些贡献，这样其他同门也会全力帮助你的。" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0
	else
		SetHumanMenpaiPoint( sceneId, selfId, menpaiPoint-needPoint )
		return 1
	end

end

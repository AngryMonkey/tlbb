--001231
--从华山论剑回到各自的门派场景，就依靠我了。

x001231_g_ScriptId = 001231


--**********************************
--任务入口函数
--**********************************
function x001231_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText() == 0   then
		-- 执行传送回自己门派的操作
		local nMenpaiScene
		local nPos_X
		local nPos_Z
		local nMempai = LuaFnGetMenPai(sceneId, selfId)
		if 		 nMempai == 0    then
			nMenpaiScene = 9
			nPos_X			 = 62
			nPos_Z			 = 63
		elseif nMempai == 1    then
			nMenpaiScene = 11
			nPos_X			 = 82
			nPos_Z			 = 57
		elseif nMempai == 2    then
			nMenpaiScene = 10
			nPos_X			 = 42
			nPos_Z			 = 145
		elseif nMempai == 3    then
			nMenpaiScene = 12
			nPos_X			 = 99
			nPos_Z			 = 69
		elseif nMempai == 4    then
			nMenpaiScene = 15
			nPos_X			 = 97
			nPos_Z			 = 74
		elseif nMempai == 5    then
			nMenpaiScene = 16
			nPos_X			 = 126
			nPos_Z			 = 77
		elseif nMempai == 6    then
			nMenpaiScene = 13
			nPos_X			 = 37
			nPos_Z			 = 86
		elseif nMempai == 7    then
			nMenpaiScene = 17
			nPos_X			 = 100
			nPos_Z			 = 46
		elseif nMempai == 8    then
			nMenpaiScene = 14
			nPos_X			 = 61
			nPos_Z			 = 69
		elseif nMempai == 9    then
			--没有门派的人应该是不出现的，避免错误出现，设置个位置
			nMenpaiScene = 1
			nPos_X			 = 191
			nPos_Z			 = 138
			--PrintStr("你这个家伙，被人K的都不知道自己门派了？？？")
		end
		
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nMenpaiScene, nPos_X, nPos_Z)
		
		-- 当这里有人离开，如果时间还在可以报名的时间，那么通知报名管理员
		

	end
end

--**********************************
--列举事件
--**********************************
function x001231_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x001231_g_ScriptId, "被杀的郁闷了，跑人", 0, 0);
end

--**********************************
--检测触发条件
--**********************************
function x001231_CheckAccept( sceneId, selfId )

end

--**********************************
--接受
--**********************************
function x001231_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x001231_OnAbandon( sceneId, selfId )

end

--**********************************
--已经接了任务再给出的提示
--**********************************
function x001231_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x001231_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交（完成）
--**********************************
function x001231_OnSubmit( sceneId, selfId,targetId,selectRadioID )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x001231_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x001231_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x001231_OnItemChanged( sceneId, selfId, itemdataId )
end


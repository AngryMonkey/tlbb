--001232
--从华山论剑回到各自的门派场景，就依靠我了。

x001232_g_ScriptId = 001232


--**********************************
--任务入口函数
--**********************************
function x001232_OnDefaultEvent( sceneId, selfId, targetId )

	--战场开始后，才能把所有人传送到作战区，最好在活动数据区有标志，
	-- 1，时间到达
	

	-- 2，人满

	if GetNumText() == 0   then
		-- 执行传送回自己门派的操作
		local nPos_X
		local nPos_Z
		local nMempai = LuaFnGetMenPai(sceneId, selfId)
		if 		 nMempai == 0    then
			nPos_X			 = 135
			nPos_Z			 = 54
		elseif nMempai == 1    then
			nPos_X			 = 68
			nPos_Z			 = 107
		elseif nMempai == 2    then
			nPos_X			 = 200
			nPos_Z			 = 115
		elseif nMempai == 3    then
			nPos_X			 = 170
			nPos_Z			 = 189
		elseif nMempai == 4    then
			nPos_X			 = 108
			nPos_Z			 = 189
		elseif nMempai == 5    then
			nPos_X			 = 199
			nPos_Z			 = 162
		elseif nMempai == 6    then
			nPos_X			 = 72
			nPos_Z			 = 150
		elseif nMempai == 7    then
			nPos_X			 = 92
			nPos_Z			 = 61
		elseif nMempai == 8    then
			nPos_X			 = 188
			nPos_Z			 = 78
		elseif nMempai == 9    then
			--没有门派的人应该是不出现的，避免错误出现，设置个位置
			nPos_X			 = 191
			nPos_Z			 = 138
		end
		SetPos(sceneId, selfId, nPos_X, nPos_Z)	

	end
end

--**********************************
--列举事件
--**********************************
function x001232_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x001232_g_ScriptId, "请让我入场为师门出力吧！！！", 0, 0);
end

--**********************************
--检测触发条件
--**********************************
function x001232_CheckAccept( sceneId, selfId )

end

--**********************************
--接受
--**********************************
function x001232_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x001232_OnAbandon( sceneId, selfId )

end

--**********************************
--已经接了任务再给出的提示
--**********************************
function x001232_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x001232_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交（完成）
--**********************************
function x001232_OnSubmit( sceneId, selfId,targetId,selectRadioID )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x001232_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x001232_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x001232_OnItemChanged( sceneId, selfId, itemdataId )
end

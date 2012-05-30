-- 200017
-- 创建出来的 李延宗 身上的脚本

x200017_g_ScriptId = 200017
--**********************************
--任务入口函数
--**********************************
function x200017_OnDefaultEvent( sceneId, selfId, targetId )
	if LuaFnGetCopySceneData_Param(sceneId, 15) == 1  then
		BeginEvent(sceneId)
			AddText( sceneId, "  好吧，既然王姑娘不懊悔，我就放你们一条生路。我这里就有悲酥清风的解药，快快拿去，免得我又变了主意。" )
			if IsHaveMission( sceneId, selfId, 15 ) > 0 then
					AddNumText( sceneId, x200017_g_ScriptId, "得到悲酥清风的解药", 6 ,-1  )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x200017_OnEventRequest( sceneId, selfId, targetId )

	--判断玩家是不是有这个任务，
	if IsHaveMission( sceneId, selfId, 15 ) > 0 then
		--看玩家身上有这个物品了没有
		if GetItemCount(sceneId, selfId, 40001005) < 1  then
			-- 给玩家物品
	  	BeginAddItem(sceneId)
				AddItem( sceneId, 40001005, 1 )
			local ret = EndAddItem(sceneId,selfId)
			if ret < 1  then
				BeginEvent(sceneId)
					AddText( sceneId, "你的背包已满", 0 )
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				AddItemListToHuman(sceneId,selfId)
				BeginEvent(sceneId)
					AddText( sceneId, "你得到了悲酥清风的解药", 0 )
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		else
			BeginEvent(sceneId)
				AddText( sceneId, "你身上已经有悲酥清风的解药了。", 0 )
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	
	-- 关闭对话筐
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
end

--**********************************
--列举事件
--**********************************
function x200017_OnEnumerate( sceneId, selfId, targetId )

end

--**********************************
--检测接受条件
--**********************************
function x200017_CheckAccept( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200017_OnAccept( sceneId, selfId, targetId )

end

--**********************************
--放弃
--**********************************
function x200017_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x200017_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x200017_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x200017_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200017_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200017_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200017_OnItemChanged( sceneId, selfId, itemdataId )
end

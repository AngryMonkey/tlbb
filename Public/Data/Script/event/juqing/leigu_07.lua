-- 丁春秋身上的脚本，玩家点击就挑战

x200046_g_MissionId = 37
x200046_g_ScriptId = 200046

--**********************************
--任务入口函数
--**********************************
function x200046_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if GetNumText() == 1  then
		-- 设置玩家阵营，可以开始作战
		if GetName(sceneId, targetId) == "丁春秋"  then
			SetUnitReputationID(sceneId, selfId, targetId, 29)
			SetMonsterFightWithNpcFlag(sceneId, targetId, 1)
			SetNPCAIType(sceneId, targetId, 16)
			
			BeginEvent(sceneId)
				AddText(sceneId, "你真是活的不耐烦了!")
			EndEvent()
			DispatchEventList(sceneId,selfId,targetId,x200046_g_ScriptId,x200046_g_MissionId)
	
			-- 改变虚竹和苏星河的阵营和AI
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "虚竹"  then
					SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
				end
				if GetName(sceneId, nMonsterId)  == "苏星河"  then
					SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
				end
			end
			
			-- 关闭界面
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
			
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200046_OnEnumerate( sceneId, selfId, targetId )
	
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200046_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200046_g_MissionId) > 0 then
		--需要在副本才可以
		AddNumText(sceneId, x200046_g_ScriptId,"挑战丁春秋",10,1)
	end

end

--**********************************
--检测接受条件
--**********************************
function x200046_CheckAccept( sceneId, selfId )
	--判定条件
end


--**********************************
--接受
--**********************************
function x200046_OnAccept( sceneId, selfId, targetId )

end

--**********************************
--放弃
--**********************************
function x200046_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x200046_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200046_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200046_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200046_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200046_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200046_OnItemChanged( sceneId, selfId, itemdataId )
	
end






-- 125024 宝箱
-- 获取buff的宝箱

x125024_g_scriptId = 125024

--**********************************
--特殊交互:条件判断
--**********************************
function x125024_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- 限制身上的buff
	local bOk = CallScriptFunction((125022), "IsCanOpenBox",sceneId,activatorId )

	if bOk == 0  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"你现在不能开启这个宝箱。");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,activatorId,selfId)
		
	end
	
	if GetUnitCampID(sceneId, activatorId, activatorId) < 10   then
    BeginEvent(sceneId)
      AddText(sceneId,"你现在的战斗阵营不正确，不能开启宝箱。");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
		bOk = 0
	end
	
	return bOk
end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x125024_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x125024_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- 按照这个Npc的姓名给玩家+buff，
	-- selfId == 宝箱Id
	-- activatorId == 开启人Id
	
	local x
	local z
	x,z = GetWorldPos(sceneId, selfId)
	LuaFnDeleteMonster(sceneId, selfId)
	
	-- 给开启成功的玩家一个掉落包
	local nItemId = 40004434

	local nBoxId = DropBoxEnterScene(	x,z,sceneId )
	if nBoxId > -1  then
		AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,nItemId)

		-- 把这个掉落绑定给制定玩家
		SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,activatorId))
	end
	
	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x125024_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时的特殊处理
--**********************************
function x125024_OnActivateActionStart( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互撤消时的特殊处理
--**********************************
function x125024_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--特殊交互:交互中断时的特殊处理
--**********************************
function x125024_OnActivateInterrupt( sceneId, selfId, activatorId )
	return 0
end

function x125024_OnActivateInterrupt( sceneId, selfId, activatorId )

end


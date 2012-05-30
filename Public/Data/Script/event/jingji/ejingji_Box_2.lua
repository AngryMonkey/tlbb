-- 125023 宝箱
-- 获取buff的宝箱

x125023_g_scriptId = 125023

x125023_g_SmallBoxBuff = {
				{id=1,name="紫色秘笈",buff=8053},
				{id=2,name="黄色秘笈",buff=8052},
				{id=3,name="绿色秘笈",buff=8051},
				{id=4,name="白色秘笈",buff=8050},
				{id=5,name="黑色秘笈",buff=8049},
				{id=6,name="蓝色秘笈",buff=8048},
				{id=7,name="红色秘笈",buff=8047},
}

--**********************************
--特殊交互:条件判断
--**********************************
function x125023_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- 限制身上的buff
	return 1
end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x125023_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x125023_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- 按照这个Npc的姓名给玩家+buff，
	local szName = GetName(sceneId, selfId)
	for i=1, getn(x125023_g_SmallBoxBuff)  do
		if szName == x125023_g_SmallBoxBuff[i].name  then
			LuaFnDeleteMonster(sceneId, selfId)
			LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x125023_g_SmallBoxBuff[i].buff, 100 )
		end
	end	
	
	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x125023_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时的特殊处理
--**********************************
function x125023_OnActivateActionStart( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互撤消时的特殊处理
--**********************************
function x125023_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--特殊交互:交互中断时的特殊处理
--**********************************
function x125023_OnActivateInterrupt( sceneId, selfId, activatorId )
	return 0
end

function x125023_OnActivateInterrupt( sceneId, selfId, activatorId )

end


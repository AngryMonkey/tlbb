--圣兽山宝箱争夺
--大宝箱NPC交互脚本

--脚本号
x808067_g_ScriptId	= 808067

--圣兽山宝箱争夺活动脚本
x808067_g_ActivityScriptId	= 808066

--受限buff....
x808067_g_LimitiBuff = {

			50,
			112,
			1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,
			1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,
			7084,
			7085,

}


--**********************************
--特殊交互:条件判断
--**********************************
function x808067_OnActivateConditionCheck( sceneId, selfId, activatorId )

	local strText = "当前状态无法开启"
	--无敌状态无法开启宝箱....
	if LuaFnIsUnbreakable(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,strText)
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--隐身状态无法开启宝箱....
	if LuaFnIsConceal(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,strText)
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--受限buff无法开启....
	for i, impactId in x808067_g_LimitiBuff do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, activatorId, impactId) == 1 then
			BeginEvent(sceneId)
			 		AddText(sceneId,strText)
			 	EndEvent(sceneId)
			DispatchMissionTips(sceneId,activatorId)
			return 0
		end
	end

	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, activatorId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "背包空间不足" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--检测是否可以开大宝箱....
	local bRet, PlayerName = CallScriptFunction( x808067_g_ActivityScriptId, "CheckOpenBigBox", sceneId, activatorId )

	if bRet == 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,"宝物已经被人抢走了");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	if bRet == -1 then
		BeginEvent(sceneId)
		 		AddText(sceneId, PlayerName.."正在打开宝箱，您暂时无法操作");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	return 1

end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x808067_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x808067_OnActivateEffectOnce( sceneId, selfId, activatorId )
	CallScriptFunction( x808067_g_ActivityScriptId, "OnBigBoxOpen", sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x808067_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时的特殊处理
--**********************************
function x808067_OnActivateActionStart( sceneId, selfId, activatorId )
		return 1
end

--**********************************
--特殊交互:交互撤消时的特殊处理
--**********************************
function x808067_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--特殊交互:交互中断时的特殊处理
--**********************************
function x808067_OnActivateInterrupt( sceneId, selfId, activatorId )
	CallScriptFunction( x808067_g_ActivityScriptId, "OnCancelOpen", sceneId )
	return 0
end

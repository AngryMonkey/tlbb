--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:

------------------------------------------------------------------------------------------
--校服礼包的默认脚本

--脚本号
x889034_g_scriptId = 889034

x009034_SchoolBags = {{ID = 30504059, BagsSpaces =3,FailNotify ="#{TSJH_090224_12}",SucessNotify ="#{TSJH_090224_13}"},
											{ID = 30504060, BagsSpaces =5,FailNotify ="#{TSJH_090224_14}",SucessNotify ="#{TSJH_090224_15}"},
											{ID = 30504061, BagsSpaces =4,FailNotify ="#{TSJH_090224_16}",SucessNotify ="#{TSJH_090224_17}"},
											{ID = 30504062, BagsSpaces =4,FailNotify ="#{TSJH_090224_18}",SucessNotify ="#{TSJH_090224_19}"},
											{ID = 30504063, BagsSpaces =2,FailNotify ="#{TSJH_090224_20}",SucessNotify ="#{TSJH_090224_22}"},
											{ID = 30504064, BagsSpaces =4,FailNotify ="#{TSJH_090224_23}",SucessNotify ="#{TSJH_090224_24}"},
											{ID = 30504065, BagsSpaces =5,FailNotify ="#{TSJH_090224_25}",SucessNotify ="#{TSJH_090224_26}"},
									}


--奖励物品列表
x889034_Gift ={}
x889034_Gift[1] ={30504060,10124141,10141805,30308035}
x889034_Gift[2] ={30504061,30505215,30504068,30309748,30504066,30504067}
x889034_Gift[3] ={30504062,31000005,30008027,30607000,30504055}
x889034_Gift[4] ={30504063,30008027,30504038,30504038,30505217,30504056}
x889034_Gift[5] ={30504064,30008044,20307002,20109004,20109004,20109004,30504057}
x889034_Gift[6] ={30509500,31000001,30504040,30504041,30504058}
x889034_Gift[7] ={30509500,30008044,30504040,30504041,30505076,10124141}
--**********************************
--事件交互入口
--**********************************
function x889034_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889034_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889034_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889034_OnConditionCheck( sceneId, selfId )
	
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--获得物品ID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x009034_SchoolBags) do
		if (x009034_SchoolBags[i].ID == Item) then
			iIndex = i
		end
	end
	
	if (iIndex ==-1) then
		return 0
	end

	--检测背包空间是否足够
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x009034_SchoolBags[iIndex].BagsSpaces ) then
	   local strNotice = x009034_SchoolBags[iIndex].FailNotify
		 x889034_MsgBox( sceneId, selfId, strNotice)
	   return 0
	end
	
	--40级礼包有材料栏的物品
	if (iIndex ==5 ) then
		FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 4 ) then
	   local strNotice = "#{TSJH_090224_21}"
		 x889034_MsgBox( sceneId, selfId, strNotice)
	   return 0
	end
	end
	
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x889034_OnDeplete( sceneId, selfId )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x889034_OnActivateOnce( sceneId, selfId )

	--获得物品ID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x009034_SchoolBags) do
		if (x009034_SchoolBags[i].ID == Item) then
			iIndex = i
		end
	end
	
	if (iIndex ==-1) then
		return 0
	end
	
		--给玩家每个礼包的礼物
	BeginAddItem( sceneId )
	for i, v in x889034_Gift[iIndex] do
			local bagpos01 = TryRecieveItem( sceneId, selfId, v, 9 )								-- 放不下就没有了
			LuaFnItemBind( sceneId, selfId, bagpos01 )
	end
	x889034_MsgBox( sceneId, selfId, x009034_SchoolBags[iIndex].SucessNotify)
	
	AuditUseSChoolBags(sceneId, selfId,iIndex,LuaFnGetSex(sceneId,selfId))
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x889034_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
--醒目信息提示
--**********************************
function x889034_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--------------------------------------------
--愚人宝珠道具脚本
--Created By 信德峰
--------------------------------------------

--脚本ID
x335136_g_scriptId = 335136

--愚人宝珠ID
x335136_g_YuRenBaoZhuID = 30501161

--最大使用次数
x335136_g_CanUseMaxCount = 5

x335136_g_CanUseCity = {[1] = SCENE_LUOYANG,[2] = SCENE_SUZHOU,[3] = SCENE_DALI,
	                      [4] = SCENE_LOULAN,[5] = 71,[6] = 72}
--效果数量
x335136_g_ImpactCount = 10

--效果ID表
x335136_g_ImpactTable = { 
	[1] = 
	{													
		[1] = 5000,
		[2] = 5001,
		[3] = 5002,
		[4] = 5003,
		[5] = 5004,
		[6] = 5005,
		[7] = 5006,
		[8] = 5007,
		[9] = 5008,
		[10] = 5009
	},
	[2] =
	{
		[1] = 5014,
		[2] = 5015,
		[3] = 5016,
		[4] = 5017,
		[5] = 5018,
		[6] = 5019,
		[7] = 5020,
		[8] = 5021,
		[9] = 5022,
		[10] = 5023
	}
	

												}

--落马箭效果ID
x335136_g_LuoMaJianImpactID = 154


--**********************************
--事件交互入口
--**********************************
function x335136_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335136_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335136_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335136_OnConditionCheck( sceneId, selfId )
	--检测Item是否有效
	if(LuaFnVerifyUsedItem(sceneId, selfId) == 0) then
		return 0;	--Item无效直接返回
	end
	-- zchw
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	--不能给自己使用
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)--对象ID
	if((targetId == selfId) or (targetId < 0))then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_SelfUseTip}")	--不能给自己使用
			return 0;
	end
	
	--只能给玩家使用
	local objType = GetCharacterType( sceneId, targetId )--对象类型
	if(objType ~= 1)then	--对象不是Human
		x335136_MsgBox( sceneId, selfId, "#{ResultText_8}")	--无效目标
		return 0
	end
	
	--检测物品是否加锁
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	--背包中的位置
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x335136_MsgBox( sceneId, selfId, "#{Item_Locked}" )	--物品已加锁
		return 0
	end
	
	--检测玩家是不是处于摆摊状态
	if LuaFnIsStalling(sceneId, selfId) == 1  then
	  if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_LimitStallageTip}")	--无法对摆摊状态的玩家使用愚人宝珠
		else
			x335136_MsgBox( sceneId, selfId, "无法对摆摊状态的玩家使用师徒宝珠");
		end
		return 0
	end
	
	--检测对方是否在BUS上
	if(LuaFnIsInBus(sceneId, selfId, targetId) == 1)then
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_TargetInBusTip}")	--无法对BUS状态的玩家使用愚人宝珠
		else
			x335136_MsgBox( sceneId, selfId, "无法对BUFF状态的玩家使用师徒宝珠");
		end
		return 0
	end
	
	--检测对方是否在双人骑乘上
	if(LuaFnGetDRide(sceneId, selfId, targetId) == 1)then
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_DoubleRideTip}")	--无法对双人骑乘的玩家使用愚人宝珠。
		else
			x335136_MsgBox( sceneId, selfId, "无法对双人骑乘的玩家使用师徒宝珠");
		end
		return 0
	end
	
	--检测玩家是否在四大主城中(包括楼兰),玩家在,对象玩家也就在喽
  local flag = 0 
  for i,_ in x335136_g_CanUseCity do
  	if sceneId == x335136_g_CanUseCity[i] then
  		 flag = 1
  	end
  end
  if flag == 0 then --0表示玩家不在四大主城中
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_LimitCityTip}")	--只能在城市内使用愚人宝珠
		else
			x335136_MsgBox( sceneId, selfId, "#{STBZ_090324_1}")
		end
		return 0
	end
	
	return 1
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335136_OnDeplete( sceneId, selfId )	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x335136_OnActivateOnce( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(targetId < 0) then	--目标不合法
		return 0
	end
	
	--获取"宝珠"所在背包中的位置
	local	bagId = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	--zchw
  local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	--获取记录在物品身上的定位数据
	local	CurUseCount		= GetBagItemParam( sceneId, selfId, bagId, 8, 2 )	--获取剩余使用次数	
	if(CurUseCount == 0)then	--第一次使用
		CurUseCount = x335136_g_CanUseMaxCount		
	end
  
	--减少可使用次数
	CurUseCount = CurUseCount - 1
	if(CurUseCount <= 0) then
		local ret = EraseItem( sceneId, selfId, bagId )		
		if ret ~= 1 then
			return 0--删除失败
		end
	end
	
	--保存一下数据
	SetBagItemParam( sceneId, selfId, bagId, 4, 2, x335136_g_CanUseMaxCount )--保存最大使用次数
	SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurUseCount )--保存还可以使用次数
	
	--刷新Client端的背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	
	--加效果
	local bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x335136_g_LuoMaJianImpactID, 0)	--先使用落马箭效果
	
	if (bRet == 1) then	--落马箭成功
	  -- zchw
	  if (itemIndex == x335136_g_YuRenBaoZhuID) then
			local ImpactIndex = x335136_g_ImpactTable[1][random(x335136_g_ImpactCount)]	--随机选择效果
			bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, ImpactIndex, 0)		--再添加变身效果
		elseif (itemIndex == 30501162) then --师徒宝珠
			local ImpactIndex = x335136_g_ImpactTable[2][random(x335136_g_ImpactCount)]	--随机选择效果
			bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, ImpactIndex, 0)		--再添加变身效果
		end
	end
	
	if(bRet == 1) then --变身成功
		--zchw
		if (itemIndex == x335136_g_YuRenBaoZhuID) then
			 szMsg = format("你被%s使用了愚人宝珠", GetName(sceneId,selfId))
		elseif (itemIndex == 30501162) then --师徒宝珠
			 szMsg = format("你被%s使用了师徒宝珠", GetName(sceneId,selfId))
		end	
		x335136_MsgBox( sceneId, targetId, szMsg )	--给对方发一个消息:你被XXX使用了愚人宝珠
	end
	
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335136_OnActivateEachTick( sceneId, selfId)
	return 1
end

--**********************************
--信息提示
--**********************************
function x335136_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

-- 创建人[ QUFEI 2007-09-30 21:53 UPDATE BugID 25759 ]
-- 修改人[ 褚少微 2008.5.20 添加102级神器的合成配方 ]

-- 血浴神兵完整主材的合成机制实现 （改成正确名字）
-- ItemID = 30505800~30505805(新莽神符)			30505806 102级神器
-- 335135
-- 提高神符完成度及完整神符的合成
-- 物品可以使用1次
-- 使用完就删除物品


--******************************************************************************
-- 以下部分需要是需要修改的部分
--******************************************************************************

--脚本号 （改成正确脚本号）
x335135_g_scriptId = 335135

-- 增加值 （根据要求改写具体数值）
x335135_g_CompleteValue = 5			-- 神材增加完成度			-- 褚少微，102神器。方便测试调成了50，测试完毕调回5即可。
--x335135_g_MaxCompleteValue = 100-- 最大神材完成度上限
x335135_g_MaxUseCount = 1				-- 最大使用次数1次

--标准效果ID （改成神材合成的特效）
--g_ImpactID = 0

--神材合成对应表
x335135_g_ShenCaiTable = {{sjid=30505700,sfid=30505800,lrid=30505900},
													{sjid=30505701,sfid=30505801,lrid=30505901},
													{sjid=30505702,sfid=30505802,lrid=30505902},
													{sjid=30505703,sfid=30505803,lrid=30505903},
													{sjid=30505704,sfid=30505804,lrid=30505904},
													{sjid=30505705,sfid=30505805,lrid=30505905},
													{sjid=30505706,sfid=30505806,lrid=30505906},}		-- -- 褚少微 2008.5.20。 102级神器铸造图样。残缺的神节7级，新莽神符7级，连戎神节7级。
x335135_g_MaxCompleteValue = {25,50,75,100,100,100,100}
-- 当前可以合成的神材索引号
x335135_g_ShenCaiIndex = 0

-- 使用新莽神符增加完整度时的特效ID
x335135_g_Impact_LevelUP = 47

-- 合成出连戎神节时的特效ID
x335135_g_Impact_Complete = 48

-- 褚少微，102神器
x335135_g_XinMang7JiInfo = "新莽神符7级"

--******************************************************************************
-- 以上部分需要是需要修改的部分
--******************************************************************************

--脚本

--**********************************
--事件交互入口
--**********************************
function x335135_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335135_IsSkillLikeScript( sceneId, selfId)
	return 1	--这个脚本需要动作支持
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335135_OnConditionCheck( sceneId, selfId )
	-- PrintStr("OnConditionCheck...")
	
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	-- 得到当前正在使用的物品的背包位置
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	-- 得到当前正在使用的物品的ID
	local Item01 = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nIndex)
	
	-- PrintStr("Item01 ="..Item01)
	
	-- 褚少微 2008.5.20。 102级神器铸造图样。七个新莽神符。
	for i=1, 7 do				--for i=1, 6 do
		if Item01 == x335135_g_ShenCaiTable[i].sfid then
			x335135_g_ShenCaiIndex = i
			-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
			break
		end
		-- PrintStr("sfid ="..x335135_g_ShenCaiTable[i].sfid)
	end
	
	-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
		
	-- 褚少微 2008.5.20。 102级神器铸造图样。添加新的新莽神符
	if Item01 < 30505800 or Item01 > 30505806 then			-- if Item01 < 30505800 or Item01 > 30505805 then
		local strNotice = "只能用新莽神符才能合成" -- 新莽神符
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid)
	
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	if ItemCount < 1 then
		local strNotice = "你需要".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺的神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	-- 获得当前可以合成的第一个神节在背包中的位置	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "你需要".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺的神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
	
	-- PrintStr("CheckParam ="..CheckParam)
	
	if CheckParam < x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] and CheckParam + x335135_g_CompleteValue >= x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] then		-- 当完整度达到100时是否还有空间
		local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
		if( FreeSpace < 1 ) then
	     local strNotice = "您的物品栏没有空间，需要整理。"
		   x335135_ShowMsg( sceneId, selfId, strNotice)
	     return 0
		end
	end
	
	
	-- 褚少微，102神器。如果使用的是新莽神符7级
	if Item01 == 30505806 then
		x335135_g_XinMang7JiInfo = GetBagItemTransfer( sceneId, selfId, nIndex )
		--PrintStr(x335135_g_XinMang7JiInfo)
	end
	
	
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335135_OnDeplete( sceneId, selfId )
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
function x335135_OnActivateOnce( sceneId, selfId )

	-- PrintStr("OnActivateOnce...")
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	
	if ItemCount < 1 then
		local strNotice = "你需要".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺的神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- 得到当前正在使用的物品的背包位置
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	-- PrintStr("nIndex ="..nIndex)
	
	-- 得到当前正在使用的物品的ID
	local Item01 = x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sfid
	
	-- PrintStr("Item01 ="..Item01)
	
	--消耗选中的新莽神符
  -- ret = LuaFnDelAvailableItem(sceneId, selfId, Item01, 1)
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	-- 获得当前可以合成的第一个神节在背包中的位置	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "你需要".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- 残缺的神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- 获得当前合成的神节完整度	
	local CompleteValue = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )
	-- PrintStr("CompleteValue ="..CompleteValue)

	if nIndex >= 0 then		
		
		-- 记录统计信息
		LuaFnAuditShenCai(sceneId, selfId, Item01)
		
		CompleteValue = CompleteValue + x335135_g_CompleteValue
		
		-- PrintStr("CompleteValue ="..CompleteValue)
		
		SetBagItemParam( sceneId, selfId, sjbagpos, 8, 2, CompleteValue ) --设置完成度
		
		-- 褚少微，2008.5.22 添加世界系统公告	#I使用了一个新莽神符#G7级#I，离铸成绝世神器又近了一步。
		if Item01 == 30505806 then
			local playername = GetName(sceneId, selfId)	
			local strText = format("#{_INFOUSR%s}#{DQSJ_20080512_12}#{_INFOMSG%s}#{DQSJ_20080512_13}", playername, x335135_g_XinMang7JiInfo)						
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end
		
		--------------参数设置安全性检测,虽然理论上参数设置不会失败
		local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
				
		-- PrintStr("CheckParam ="..CheckParam)
				
		if CheckParam ~= CompleteValue then
		    return 0
		end		
		--------------参数设置安全性检测,虽然理论上参数设置不会失败
		
		local strNotice = "你的".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}".."完整度增加了1" -- 残缺的神节
		x335135_ShowMsg( sceneId, selfId, strNotice)
		
		LuaFnRefreshItemInfo( sceneId, selfId, sjbagpos )	--刷新背包信息
		
		if CompleteValue >= x335135_g_MaxCompleteValue[x335135_g_ShenCaiIndex] then		-- 当完整度达到100时
					
			local EraseRet = EraseItem( sceneId, selfId, sjbagpos )
			
			if EraseRet < 0 then      --如果删除失败,将不会产生任何效果			  
					return 0
			end
			
			-- PrintStr("lrid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid)
			
			BeginAddItem( sceneId )
			AddItem( sceneId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, 1 )
			ret = EndAddItem( sceneId, selfId )
											
			if ret > 0 then
				TryRecieveItem( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了							
				
			else
					BeginEvent(sceneId)
					strText = "物品栏或材料栏没有足够的空间，请整理后再来领取。"
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end		
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_Complete, 0 )
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_LevelUP, 0 )
		end
		
	else
		local strMsg = "主材合成失败"
		x335135_ShowMsg( sceneId, selfId, strMsg)
		return 0
	end
  
	-- 主材合成完毕

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335135_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
function x335135_CancelImpacts( sceneId, selfId )
	return 0		--不需要这个接口，但要保留空函数,并且始终返回0。
end

function x335135_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

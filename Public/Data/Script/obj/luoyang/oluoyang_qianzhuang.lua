--钱庄脚本

--脚本号
x000076_g_scriptId = 000076

--所拥有的事件ID列表
--g_eventList={211105,211106,211108}	

--购买4个存储箱花费的钱
--默认有20个格子，此时购买下一个需要花费50000（交子+金币）
x000076_g_Box	 = {{Capacity=20,Cost=50000},
			{Capacity=40,Cost=100000},
			--{Capacity=60,Cost=200000},
			--{Capacity=80,Cost=400000}
	    }

-- 玩家身上默认的交子和金币数目    
x000076_g_MoneyJZ = 0
x000076_g_Money = 0

--npc点击默认函数，这里用来显示对话文字和功能按钮
function x000076_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

		--添加打开银行界面的按钮
		AddNumText(sceneId, 7, "打开银行",5,-1)
		--得到当前银行的存储格数
		local CurrentRentIndex = GetBankRentIndex(sceneId, selfId)
		--查找存储箱序号
		local	BoxNum = x000076_FindBoxNum( sceneId, selfId,targetId,CurrentRentIndex )
		if BoxNum ~= 0 then
			AddNumText(sceneId, x000076_g_Box[BoxNum].Capacity, "购买新的储物箱", 5, -1)
		end

		--打开保险箱
		AddNumText(sceneId, 101, "打开保险箱",5,-1)
		AddNumText(sceneId, 102, "关于保险箱",11,3)
		AddNumText( sceneId, x000076_g_scriptId, "#{JZBZ_081031_02}", 11, 4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x000076_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == -1 then
			if LuaFnGetLevel( sceneId, selfId ) < 11 then
				x000076_MsgBox( sceneId, selfId, "使用仓库等级需要11级，你还是达到后再来找我吧!" )
				return
			end
	elseif GetNumText() == 4 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{JZBZ_081031_01}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--打开银行
	if eventId == 7 then
		BankBegin(sceneId, selfId, targetId)	
	--购买新的储物箱
	elseif eventId == 8 then
		--得到当前银行的存储格数
		local CurrentRentIndex = GetBankRentIndex(sceneId, selfId)
		--查找存储箱序号
		local	BoxNum = x000076_FindBoxNum( sceneId, selfId, targetId, CurrentRentIndex )
         
    -- 得到金币和交子的数目
    x000076_g_MoneyJZ = GetMoneyJZ ( sceneId, selfId )
    x000076_g_Money = GetMoney ( sceneId, selfId )
		
		-- 如果金钱数目充足
		if (x000076_g_MoneyJZ + x000076_g_Money) >= x000076_g_Box[BoxNum].Cost then
			-- 使用带优先级的金钱消耗函数
			LuaFnCostMoneyWithPriority (sceneId,selfId,x000076_g_Box[BoxNum].Cost)
			
			-- 增加存储箱并提示
			x000076_EnableBankBox( sceneId, selfId, targetId, BoxNum )
			-- 打开银行界面
  		BankBegin(sceneId, selfId, targetId)
  	
		else
			x000076_MsgBox( sceneId, selfId, "你携带的金钱不足。"  )
		end

	elseif eventId == 101 then
		BankOpt(sceneId, selfId, targetId, "opensafebox")

	elseif eventId == 102 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{YHBXX_20071220_17}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	else
		--得到当前银行的存储格数
		local CurrentRentIndex = GetBankRentIndex(sceneId, selfId)
		--查找存储箱序号
		local	BoxNum = x000076_FindBoxNum( sceneId, selfId,targetId,CurrentRentIndex )
		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x000076_g_scriptId)
			UICommand_AddInt(sceneId,targetId)
			UICommand_AddInt(sceneId,8)
			UICommand_AddString(sceneId,"OnEventRequest")
			UICommand_AddString(sceneId,"如果要购买新的储物箱，需要花费#{_EXCHG"..x000076_g_Box[BoxNum].Cost.."}。#r你确定要购买吗？")			
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)		--银行这里的询问窗口这里必须填写24
	end

end

--自定义函数，给出序号，打开第 Num+1 序号个存储箱
function x000076_EnableBankBox( sceneId, selfId, targetId, Num )
	
	-- 需要花费金钱的显示
	x000076_MoneyChange ( sceneId, selfId, targetId, x000076_g_Box[Num].Cost, x000076_g_Money, x000076_g_MoneyJZ )

	-- 激活储物箱
	EnableBankRentIndex(sceneId, selfId, Num+1)

end

--自定义函数，给出容量,返回序号
function x000076_FindBoxNum( sceneId, selfId,targetId,Capacity )
	--得到储物柜序号
	for i, findBox in x000076_g_Box do
		if findBox.Capacity == Capacity then
			return i
		end
	end

	return 0
end

-- 打印购买储物箱后的屏幕提示信息
-- 这里的前提条件是：Money + MoneyJZ >= Cost
-- 入口参数：	Cost		--	购买储物箱的价格
--						Money		--	购买储物箱前玩家拥有的金钱数目
--						MoneyJZ	--	购买储物箱前玩家拥有的交子数目
function x000076_MoneyChange ( sceneId, selfId, targetId, Cost, Money, MoneyJZ )

	-- 购买储物箱的花费   
  local nCost = Cost
  local nMoney = 0
  local nMoneyJZ = 0
  
	-- 交子数目充足
	if (MoneyJZ >= Cost) then
		nMoneyJZ = Cost
		nMoney = 0
		
		x000076_MsgBox( sceneId, selfId, "你花费了 #{_EXCHG"..nMoneyJZ.."}，得到了一个新的储物箱。" )
		
	-- 交子不足，但是 交子+金币 数目充足
	elseif (MoneyJZ > 0) and (Money > 0) and (MoneyJZ + Money) >= Cost then
		nMoneyJZ = MoneyJZ
		nMoney = Cost - MoneyJZ
		
		x000076_MsgBox ( sceneId, selfId, "你花费了 #{_EXCHG"..nMoneyJZ.."}" )
		x000076_MsgBox ( sceneId, selfId, "你花费了 #{_MONEY"..nMoney.."}"  )
		x000076_MsgBox ( sceneId, selfId, "你得到了一个新的储物箱。" )
		
	-- 没有交子，只有金币
	elseif (MoneyJZ == 0) and (Money >= Cost) then
		nMoneyJZ = 0
		nMoney = Cost
		
		x000076_MsgBox ( sceneId, selfId, "你花费了 #{_MONEY"..nMoney.."}，得到了一个新的储物箱。" )
		
	else
		nMoneyJZ = 0
		nMoney = 0
		
		-- 图标转义符：
		-- 金交子：	#-14
		-- 银交子：	#-15
		-- 铜交子：	#-16
		-- 金币：		#-02
		-- 银币：		#-03
		-- 铜币：		#-04
		x000076_MsgBox ( sceneId, selfId, nMoneyJZ.."#-16，"..nMoney.."#-04" )
 
	end
		
	return
end

--自定义函数，屏幕消息提示（只能显示一行，不能用#r换行，如需显示多行需分次调用。）
function x000076_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

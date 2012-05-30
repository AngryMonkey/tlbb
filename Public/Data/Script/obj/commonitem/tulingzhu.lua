--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--tulingzhu.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本
--土灵珠

--土灵珠有3种操作：
--1.直接使用时打开土灵珠使用界面
--2.使用界面上点击“定位”进行定位
--3.使用界面上点击“传送”进行传送
--使用土灵珠时弹出的界面是在客户端直接硬编码实现，实际上并没有“使用物品”，因此不会调用到本脚本内。
--本脚本为土灵珠的使用逻辑，正常使用土灵珠的逻辑为“传送”。
--土灵珠的定位是通过客户端直接call本脚本的x330001_SetPosition函数实现，并不属于土灵珠的使用逻辑。

--脚本号
x330001_g_ScriptId	= 330001

--物品ID
x330001_g_ItemId = 30008007
x330001_g_ItemId01 = 30505216

--效果的ID
x330001_g_Impact		= -1	--传送时要使用的特效的编号


x330001_g_UseTim		= 10				--使用次数
x330001_g_Yinpiao		= 40002000	--银票

--普通场景限制，这些场景内无法传送
x330001_g_UselessScn=
{
	125		-- 华山
}

--普通场景限制，这些场景内无法定位
x330001_g_SetPosLimitScn=
{
	125,	-- 华山
	414		-- 竞技场	
}

--禁止传送到某些场景的等级限制....
x330001_g_LimitTransScene =
{
	{423,90},	--火焰山
	{519,90},	--火焰谷
	{424,90},	--高昌
	{520,90},	--高昌迷宫
	{425,90},	--塔里木
	{427,90},	--塔克拉玛干
	{186,75},	--楼兰
	{431,90}, --大宛
	{432,90}  --汗血岭
}



x330001_g_StrCannotUse = "您处于无法使用传送的情况下，无法使用传送道具。"

x330001_g_Impact_NotTransportList = { 5929 } -- 禁止传送的Impact
x330001_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- 禁止传送的Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x330001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end


--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x330001_IsSkillLikeScript( sceneId, selfId )
	return 1	 --这个脚本需要动作支持
end


--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x330001_CancelImpacts( sceneId, selfId )
	return 0	 --不需要这个接口，但要保留空函数,并且始终返回0。
end


--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x330001_OnConditionCheck( sceneId, selfId )

	--
	--正常使用土灵珠的逻辑为传送，此处只需要进行传送前的检测就可以了。
	--

	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--校验使用的物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330001_MsgBox( sceneId, selfId, "此物品已被锁定！" )
		return 0
	end

	-- 处于组队跟随状态下，不能传送
	if IsTeamFollow(sceneId, selfId) == 1  then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	-- 检测玩家是不是处于摆摊状态，
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	--判断当前状态是否可使用(漕运)
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	--检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x330001_g_Yinpiao) >= 1  then
		x330001_MsgBox(sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x330001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--配置的指定场景不能往定位点传送
	for _, tmp in x330001_g_UselessScn do
		if tmp == sceneId then
			x330001_MsgBox( sceneId, selfId, "此场景内无法使用！" )
			return 0
		end
	end
	
	--检测目标场景是否是90级以内不能传送的场景	--add by xindefeng
	--获取记录在物品身上的数据结构
	local	otim			--剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	if opx > 0 and opy > 0 then	--已经定过位了		

		for _, tmp in x330001_g_LimitTransScene do
			if ( (tmp[1] == osid) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
				local szMsg = format("此场景需要%d级以上方可入内", tmp[2] )
				x330001_MsgBox( sceneId, selfId, szMsg)
				return 0
			end
		end

	end
	
	return 1

end


--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x330001_OnDeplete( sceneId, selfId )

	--使用土遁珠进行传送之前会调用本函数来消耗物品....

	--
	--在此还要再次检测一下....
	--
	local ret
	ret = x330001_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )

	--获取记录在物品身上的数据结构
	local	otim			--剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--已经定过位了....
	if opx > 0 and opy > 0 then

		--不同场景传送....如果目标场景不可用....则消耗失败....
		if sceneId ~= osid then
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				x330001_MsgBox( sceneId, selfId, "不能传送到目标场景。" )
				return 0
			end
		end

		--可以传送....则消耗物品....
		--但是在此处不直接消耗....因为在x330001_OnActivateOnce()中还需要访问物品身上的定位信息....
		--因此此处的消耗挪到x330001_OnActivateOnce()中....

		return 1

	else

		--还没定位....则消耗失败....
		x330001_MsgBox( sceneId, selfId, "请选择合适的地点定位后再使用传送功能。" )
		return 0

	end

	return 1

end


--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x330001_OnActivateOnce( sceneId, selfId )

	--
	--正常使用土灵珠的逻辑为传送，此处只需要进行传送就可以了。
	--

	--背包中的位置
	local	bagId			= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )


	--获取记录在物品身上的定位数据....
	local	otim			--剩余使用次数....
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--得到定位数据后就可以消耗物品了....

	--减少可使用次数
	otim = otim - 1
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, otim )
	--记录统计信息
	LuaFnAuditGPS( sceneId, selfId, 0 )
	--刷新Client端的背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	--如果可使用次数用完则删除物品....删除失败则不传送....
	local ret
	if otim <= 0 then
		ret = EraseItem( sceneId, selfId, bagId )
		if 1 ~= ret then
			return
		end
	end

	--如果配置了使用的特效则加到玩家身上....
	if( -1 ~= x330001_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330001_g_Impact, 0 )
	end

	--若已记录过定位信息则传送....
	if opx > 0 and opy > 0 then

		if sceneId == osid then
			--同一场景传送
			SetPos( sceneId, selfId, opx, opy )
		else
			--不同场景传送
			NewWorld( sceneId, selfId, osid, opx, opy )
		end

	end

	return 1

end


--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x330001_OnActivateEachTick( sceneId, selfId )
	return 1	 --不是引导性脚本, 只保留空函数。
end


--**********************************
--信息提示
--**********************************
function x330001_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
-- 玩家使用物品 定位
--**********************************
function x330001_SetPosition( sceneId, selfId, nItemIndex )

	--
	--定位前的检测
	--
	
	--定位是客户端直接call这个函数实现的....所以没有经过使用物品的检测....
	--因此这里要进行等级限制等检测....
	if GetLevel(sceneId, selfId)<10  then
		x330001_MsgBox( sceneId, selfId, "等级不够" )
		return
	end

	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x330001_MsgBox( sceneId, selfId, "此物品已被锁定！" )
		return 0
	end

	--检测是不是土灵珠
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330001_g_ItemId 
		 and GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330001_g_ItemId01  then
		x330001_MsgBox( sceneId, selfId, "背包内部错误" )
		return
	end

	--副本或帮会城市内无法定位
	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x330001_MsgBox( sceneId, selfId, "副本或帮会城市内无法定位！" )
		return
	end

	--配置的指定场景不能定位
	for _, tmp in x330001_g_SetPosLimitScn do
		if tmp == sceneId then
			x330001_MsgBox( sceneId, selfId, "此场景内无法使用！" )
			return
		end
	end

	--
	--开始定位
	--

	--获取记录在物品身上的数据结构
	local	otim			--剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, nItemIndex, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, nItemIndex, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, nItemIndex, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, nItemIndex, 8, 1 )

	--如果还未曾定位过则重置物品信息....
	if otim == 0 and osid == 0 and opx == 0 and opy == 0 then
		otim = x330001_g_UseTim
	end

	--获取玩家的当前坐标和场景ID....
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	--将信息设置到物品中(定位)....
	SetBagItemParam( sceneId, selfId, nItemIndex, 0, 1, 10 )								--Key，这位标识操作集合，也是Client修正Tooltips的依据
	SetBagItemParam( sceneId, selfId, nItemIndex, 2, 0, x330001_g_UseTim )	--最大使用次数
	SetBagItemParam( sceneId, selfId, nItemIndex, 3, 0, otim )							--剩余使用次数
	SetBagItemParam( sceneId, selfId, nItemIndex, 4, 1, osid )							--场景编号
	SetBagItemParam( sceneId, selfId, nItemIndex, 6, 1, opx )								--X坐标
	SetBagItemParam( sceneId, selfId, nItemIndex, 8, 1, opy )								--Y坐标
	
	--记录统计信息
	LuaFnAuditGPS( sceneId, selfId, 1 )

	--刷新Client端的背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )

	x330001_MsgBox( sceneId, selfId, "你的土灵珠定位成功。" )

end

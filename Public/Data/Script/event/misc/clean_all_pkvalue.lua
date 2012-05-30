--洗杀气

--脚本号 
x800112_g_scriptId = 800112

-- *****************************
-- 检查是否有足够的善恶值和金钱
-- ******************************
-- nValue : 当前杀气值
function x800112_CheckCost( sceneId, selfId, targetId ,nValue )

	-- 善恶值扣除前的判断
	local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )
	if not gb_value or gb_value < nValue * 2000 then
		x800112_NotifyFail( sceneId, selfId, "消除您的杀气需要" .. nValue * 2000 .. "点善恶值，目前您身上的善恶点数不足。" ,targetId)
--		Msg2Player( sceneId, selfId, "你的善恶值不足" .. nValue * 1000 .. "。", MSG2PLAYER_PARA )
--		x800112_NotifyFailTips(sceneId, selfId, "消除您的杀气需要" .. nValue * 2000 .. "点善恶值，目前您身上的善恶点数不足。");
		return 0
	end

	-- 金钱扣除前的判断
	local money = GetMoney( sceneId, selfId )
	if not money or money < nValue * 50000 then
		x800112_NotifyFail( sceneId, selfId, "消除您的杀气需要金钱#{_MONEY" .. nValue * 50000 .. "}，您的金钱不足。", targetId )
--		Msg2Player( sceneId, selfId, "你的金钱不足#{_MONEY" .. nValue * 50000 .. "}。", MSG2PLAYER_PARA )
--		x800112_NotifyFailTips(sceneId, selfId, "消除您的杀气需要金钱#{_MONEY" .. nValue * 20000 .. "}，您的金钱不足。");
		return 0
	end

	return 1

end

-- *****************
-- 扣除善恶值和金币
-- *****************
-- nValue : 当前杀气值
function x800112_PayForClean( sceneId, selfId, nValue )
	local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )

	-- 每一点杀气扣除2000点善恶值
	LuaFnSetHumanGoodBadValue( sceneId, selfId, gb_value - ( nValue * 2000 ) )
	
	-- 每一点杀气扣除5个金币
	CostMoney( sceneId, selfId, nValue * 50000 )
end

-- *************
-- 事件处理函数
-- *************
function x800112_OnDefaultEvent( sceneId, selfId, targetId )

	-- 得到当前杀气值
	local pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- 判断是否有杀气
	if pk_value < 1 then
		x800112_NotifyFail( sceneId, selfId,"你并没有杀气",targetId)
--		Msg2Player(sceneId, selfId, "你并没有杀气", MSG2PLAYER_PARA);
		return 0;
	end

	-- 检查是否有足够的善恶值和金钱来扣除所有杀气
	if x800112_CheckCost( sceneId, selfId, targetId, pk_value ) ~= 1 then
		return 0
	end

	-- 根据当前杀气值来扣除善恶值和金币
	x800112_PayForClean( sceneId, selfId, pk_value )

	-- 重新设置玩家当前的杀气值为0
	LuaFnSetHumanPKValue(sceneId, selfId, 0)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 0 ); --记录用善恶值减少杀气的统计信息....(0代表清除所有杀气)
	
	x800112_NotifyFail( sceneId, selfId,"你成功消除了所有杀气。",targetId)
--	x800112_NotifyFailTips(sceneId, selfId, "你成功消除了所有杀气。");
	
	-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
	local LogInfo	= format( "[ChangePKValue]:ClearPKValue sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),			
			pk_value,
			LuaFnGetHumanPKValue(sceneId, selfId) )
	WriteCheckLog( sceneId, selfId, LogInfo )

end

-- ************************
-- NPC对话窗口中调用的函数
-- ************************
function x800112_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800112_g_scriptId, "清除所有杀气", 6, x800112_g_scriptId)

end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x800112_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--对话框提示
function x800112_NotifyFail( sceneId, selfId, Tip ,targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end

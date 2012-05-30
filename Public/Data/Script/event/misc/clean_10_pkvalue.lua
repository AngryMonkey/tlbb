--洗杀气

--脚本号
x800111_g_scriptId = 800111

x800111_g_ModScript = 800112


function x800111_OnDefaultEvent( sceneId, selfId, targetId )

	-- 得到当前杀气值
	pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- 判断是否有10点杀气
	if pk_value < 10 then
		x800111_NotifyFail(sceneId, selfId, "你的杀气不足10点",targetId)
--		Msg2Player(sceneId, selfId, "你的杀气不足10点", MSG2PLAYER_PARA);
		return 0;
	end

	-- 检查是否有足够的善恶值和金钱来扣除10点杀气
	if CallScriptFunction( x800111_g_ModScript, "CheckCost", sceneId, selfId, targetId ,10 ) ~= 1 then
		return 0
	end

	-- 根据10点杀气值来扣除善恶值和金币
	CallScriptFunction( x800111_g_ModScript, "PayForClean", sceneId, selfId, 10 )
	
	-- 扣除10点杀气值
	LuaFnSetHumanPKValue(sceneId, selfId, pk_value - 10)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 10 ); --记录用善恶值减少杀气的统计信息....

	x800111_NotifyFail( sceneId, selfId,"你成功消除了10点杀气。" ,targetId)
--	x800111_NotifyFailTips(sceneId, selfId, "你成功消除了10点杀气。");

	-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
	local LogInfo	= format( "[ChangePKValue]:ClearPKValue sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),			
			pk_value,
			LuaFnGetHumanPKValue(sceneId, selfId) )
	WriteCheckLog( sceneId, selfId, LogInfo )

	return 1;

end


-- ************************
-- NPC对话窗口中调用的函数
-- ************************
function x800111_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800111_g_scriptId, "清除10点杀气", 6, x800111_g_scriptId)

end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x800111_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--对话框提示
function x800111_NotifyFail( sceneId, selfId, Tip, targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end

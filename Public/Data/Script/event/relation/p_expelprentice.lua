--逐出师门任务

--脚本号
x806009_g_ScriptId	= 806009

--逐出师们
x806009_g_ExpelPrentice					= {}
x806009_g_ExpelPrentice["Id"]		= 1006
x806009_g_ExpelPrentice["Name"]	= "我要把徒弟逐出师门"

--提示信息
x806009_g_msg				=
{
	["gld"]= "  逐出徒弟需要交纳#{_EXCHG%d}。",
	["con"]= "  开除徒弟将会被扣除#{_EXCHG%d}，是否真的要开除玩家：%s。",
}

--开除徒弟，扣除金钱
x806009_g_Gold			= 25000

--**********************************
--任务入口函数
--**********************************
function x806009_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local guid
	local PrenticeName
	local	log	= 0
	local	str

	if key == -1 then
		BeginEvent( sceneId )
		for i=0, 7 do
			guid = LuaFnGetPrenticeGUID( sceneId, selfId, i )
			if guid ~= -1 then
				log	= 1
				PrenticeName	= LuaFnGetFriendName( sceneId, selfId, guid )
				AddNumText( sceneId, x806009_g_ScriptId, "将"..PrenticeName.."逐出师门", 6, i )
			end
		end

		if log == 0 then
			AddText( sceneId, "  你还没有徒弟！" )
		end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
	if key >= 0 and key <=7 then
		guid	= LuaFnGetPrenticeGUID( sceneId, selfId, key )
		if guid ~= -1 then
			PrenticeName	= LuaFnGetFriendName( sceneId, selfId, guid )
		end
		str	= format( x806009_g_msg["con"], x806009_g_Gold, PrenticeName )
		BeginEvent( sceneId )
			AddText( sceneId, str )
			AddNumText( sceneId, x806009_g_ScriptId, "是", 6, (key+1)*100 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if key >= 100 then
		if x806009_CheckAccept( sceneId, selfId, targetId ) > 0 then
			x806009_OnAccept( sceneId, selfId, targetId, floor(key/100)-1 )
		end
	end

end

--**********************************
--列举事件
--**********************************
function x806009_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806009_g_ScriptId, x806009_g_ExpelPrentice["Name"], 6, -1 )
end

--**********************************
--检测接受条件
--**********************************
function x806009_CheckAccept( sceneId, selfId, targetId )
	--检查师傅身上金钱
	--if LuaFnGetMoney( sceneId, selfId ) < x806009_g_Gold then
	--hzp 2008-12-9
	local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
	local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
	local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < x806009_g_Gold then
		str	= format( x806009_g_msg["gld"], x806009_g_Gold )
		x806009_MsgBox( sceneId, selfId, targetId, str )
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x806009_OnAccept( sceneId, selfId, targetId, nIndex )
	
	-- [ QUFEI 2007-08-16 16:53 UPDATE BugID 23624 ]
	local PrenticeGUID = LuaFnGetPrenticeGUID( sceneId, selfId, nIndex )
	if PrenticeGUID == -1 then
		BeginEvent( sceneId )
		AddText( sceneId, "  你还没有徒弟！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		
	local PrenticeName	= LuaFnGetFriendName( sceneId, selfId, PrenticeGUID )
	local selfName	= LuaFnGetName( sceneId, selfId )

	--扣除身上金钱
	--LuaFnCostMoney( sceneId, selfId, x806009_g_Gold )
	--str	= format( "解除师徒关系，扣除#{_MONEY%d}。", x806009_g_Gold )
	--Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	
	--hzp 2008-12-9
	local nMoneyJZ, nMoneyJB = LuaFnCostMoneyWithPriority( sceneId, selfId, x806009_g_Gold )
	--如果只扣除金币
	if nMoneyJZ == 0 then
		str	= format( "解除师徒关系，扣除#{_MONEY%d}。", x806009_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--如果只扣除交子
	if nMoneyJB == 0 then
		str	= format( "解除师徒关系，扣除#{_EXCHG%d}。", x806009_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--如果既有交子又有金币
	if nMoneyJB ~= 0 and nMoneyJZ ~= 0 then
		str	= format( "解除师徒关系，扣除#{_EXCHG%d}和#{_MONEY%d}。", nMoneyJZ, nMoneyJB )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	x806009_MsgBox( sceneId, selfId, targetId, "  你解除了和"..PrenticeName.."的师徒关系。" )

	--发普通邮件给徒弟
	LuaFnSendSystemMail( sceneId, PrenticeName, "你的师父" .. selfName .. "无意于继续教导你，已与你脱离了师徒关系。" )
	--LuaFnSendNormalMail( sceneId, selfId, PrenticeName, "你的师父" .. selfName .. "无意于继续教导你，已与你脱离了师徒关系。" )
	--发可执行邮件给徒弟
	LuaFnSendScriptMail( sceneId, PrenticeName, MAIL_EXPELPRENTICE, 0, 0, 0 )

	--最终清理门户
	LuaFnExpelPrentice( sceneId, selfId, PrenticeGUID )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806009_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

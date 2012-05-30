--叛师任务

--脚本号
x806006_g_ScriptId	= 806006

--叛师
x806006_g_BetrayMaster				= {}
x806006_g_BetrayMaster["Id"]	= 1005
x806006_g_BetrayMaster["Name"]= "我想与师傅解除关系"	--modify by xindefeng

--提示信息
x806006_g_msg				=
{
	["gld"]= "  解除师徒关系需要交纳#{_EXCHG%d}。",
	["con"]= "  叛师将会被扣除#{_EXCHG%d}，您是否真的要叛师？",
}

--叛师，扣除金钱
x806006_g_Gold			= 25000

--**********************************
--任务入口函数
--**********************************
function x806006_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local	str

	if key == -1 then
		str	= format( x806006_g_msg["con"], x806006_g_Gold )
		BeginEvent( sceneId )
			if LuaFnHaveMaster( sceneId, selfId ) == 0 then
				--检查是否已经出过师
				if GetMissionFlag(sceneId, selfId, MF_ShiTu_ChuShi_Flag) == 1 then --表示已经出师
					AddText( sceneId, "  您已经出师了，不能再有叛师行为。" )
				else
					AddText( sceneId, "  你还没有拜师！" )
				end
			else
				AddText( sceneId, str )
				AddNumText( sceneId, x806006_g_ScriptId, "是", 6, 1 )
				AddNumText( sceneId, x806006_g_ScriptId, "否", 6, 2 )	--add by xindefeng
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif key == 1 then	--确定与师傅解除关系
		if x806006_CheckAccept( sceneId, selfId, targetId ) > 0 then
			x806006_OnAccept( sceneId, selfId, targetId )
		end
	elseif key == 2 then	--取消与师傅解除关系--add by xindefeng
		--关闭界面
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
--列举事件
--**********************************
function x806006_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806006_g_ScriptId, x806006_g_BetrayMaster["Name"], 6, -1 )
end

--**********************************
--检测接受条件
--**********************************
function x806006_CheckAccept( sceneId, selfId, targetId )
	--检查徒弟身上金钱
	--if LuaFnGetMoney( sceneId, selfId ) < x806006_g_Gold then
	--hzp 2008-12-9
	local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
	local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
	local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < x806006_g_Gold then
		str	= format( x806006_g_msg["gld"], x806006_g_Gold )
		x806006_MsgBox( sceneId, selfId, targetId, str )
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x806006_OnAccept( sceneId, selfId, targetId )
	local MasterGUID = LuaFnGetMasterGUID( sceneId, selfId )
	if MasterGUID == -1 then
		return
	end
	
	-- [ QUFEI 2007-08-16 16:53 UPDATE BugID 23624 ]
	if LuaFnHaveMaster( sceneId, selfId ) == 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "  你还没有拜师！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		
	local MasterName = LuaFnGetFriendName( sceneId, selfId, MasterGUID )
	local selfName = LuaFnGetName( sceneId, selfId )

	--扣除身上金钱
	--LuaFnCostMoney( sceneId, selfId, x806006_g_Gold )
	
	--hzp 2008-12-9
	local nMoneyJZ, nMoneyJB = LuaFnCostMoneyWithPriority( sceneId, selfId, x806006_g_Gold )
	--如果只扣除金币
	if nMoneyJZ == 0 then
		str	= format( "解除师徒关系，扣除#{_MONEY%d}。", x806006_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--如果只扣除交子
	if nMoneyJB == 0 then
		str	= format( "解除师徒关系，扣除#{_EXCHG%d}。", x806006_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--如果既有交子又有金币
	if nMoneyJB ~= 0 and nMoneyJZ ~= 0 then
		str	= format( "解除师徒关系，扣除#{_EXCHG%d}和".."#{_MONEY%d}。", nMoneyJZ, nMoneyJB )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	x806006_MsgBox( sceneId, selfId, targetId, "  你解除了和"..MasterName.."的师徒关系。" )

	--发普通邮件给师傅
	LuaFnSendSystemMail( sceneId, MasterName, "你的徒弟" .. selfName .. "无意于继续在你门下，已与你脱离了师徒关系。" )
	--LuaFnSendNormalMail( sceneId, selfId, MasterName, "你的徒弟" .. selfName .. "无意于继续在你门下，已与你脱离了师徒关系。" )
	local MyGUID = LuaFnGetGUID( sceneId, selfId )
	--发可执行邮件给师傅
	LuaFnSendScriptMail( sceneId, MasterName, MAIL_BETRAYMASTER, MyGUID, 0, 0 )

	--删除徒弟称号
	AwardShiTuTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--最终执行叛师
	LuaFnBetrayMaster( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806006_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

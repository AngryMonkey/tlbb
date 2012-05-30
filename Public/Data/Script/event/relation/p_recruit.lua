--收徒任务

--脚本号
x806008_g_ScriptId = 806008

--收徒
x806008_g_Recruit					= {}
x806008_g_Recruit["Id"]		= 1003
x806008_g_Recruit["Name"]	= "我的徒弟要向我拜师"

--提示信息
x806008_g_msg					= {}
x806008_g_msg["tem"]	= "  拜师的时候必须和徒弟为好友关系，并且需要两个人组队单独前来找我。"
x806008_g_msg["ner"]	= "  只有2人都走到我身边才可以拜师。"
x806008_g_msg["mlv"]	= "  师傅的等级必须大于等于徒弟10级。"
x806008_g_msg["slv"]	= "  徒弟10级开始才可拜师。"
x806008_g_msg["sib"]	= "  有结拜关系不能拜师。"
x806008_g_msg["mar"]	= "  夫妻关系不能拜师。"
x806008_g_msg["frp"]	= "  相互加为好友才能拜师。"
x806008_g_msg["msl"]	= "  请提升您的师德等级、只有师德等级大于等于1的人才有资格收徒。"
x806008_g_msg["rec_3"]	= "  强行解除师徒关系3天后才能再次拜师。"
x806008_g_msg["rec_2"]	= "  收徒数量已达最大。"
x806008_g_msg["rec_1"]	= "  已经有师傅的玩家无法拜师。"
x806008_g_msg["ts"]	= "  已经是师徒关系了，不能拜师。"

--**********************************
--任务入口函数 请求收徒
--**********************************
function x806008_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	if key == -1 then
		local	tId	= x806008_CheckAccept( sceneId, selfId, targetId )
		if tId == 0 then
			return
		end

		local	MasterName		= LuaFnGetName( sceneId, selfId )
		local	ApprenticeName= LuaFnGetName( sceneId, tId )

		--请对方确认是否愿意拜师
		BeginEvent( sceneId )
				AddText( sceneId, "  拜师之后，杀怪可以获得10％的额外经验加成，如果和师傅在一起组队，那么将会获得20％的经验加成。" )
				AddText( sceneId, "  徒弟拜师之后将会获得“"..MasterName.."的弟子”的称号。" )
				AddText( sceneId, "  你是否愿意拜"..MasterName.."为师？" )
				AddNumText( sceneId, x806008_g_ScriptId, "是", 6, 1 )
				AddNumText( sceneId, x806008_g_ScriptId, "否", 8, 0 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, tId, targetId )

		BeginEvent( sceneId )
			AddText( sceneId, "  等待"..ApprenticeName.."答复。。。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--BeginEvent( sceneId )
		--	AddText( sceneId, "你是否愿意拜"..MasterName.."为师？" )
		--EndEvent( sceneId )
		--DispatchMissionInfo( sceneId, tId, targetId, x806008_g_ScriptId, x806008_g_Recruit["Id"] )

	elseif key == 0 then
		x806008_OnCancel( sceneId, selfId, targetId )

	elseif key == 1 then
		x806008_OnConfirm( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x806008_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806008_g_ScriptId, x806008_g_Recruit["Name"], 6, -1 )
end

--**********************************
--检测接受条件
--**********************************
function x806008_CheckAccept( sceneId, selfId, targetId )
	--(1)组队中只有师徒两个人
	if LuaFnHasTeam( sceneId, selfId ) == 0 or LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["tem"] )
		return 0
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["ner"] )
		return 0
	end

	local tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 or LuaFnIsCanDoScriptLogic( sceneId, tId ) ~= 1 then
		return 0
	end

	--(2)徒弟等级≥10级
	if LuaFnGetLevel( sceneId, tId ) < 10 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["slv"] )
		return 0
	end

	--当玩家到45后不能再拜师了
	if LuaFnGetLevel( sceneId, tId ) > 44 then
		x806008_MsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_7}" )
		return 0
	end


	--(3)师傅等级必须≥徒弟10级
	if LuaFnGetLevel( sceneId, selfId ) < ( LuaFnGetLevel( sceneId, tId ) + 10 ) then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["mlv"] )
		return 0
	end

	--(4)师德等级>0
	local MasterLevel = LuaFnGetmasterLevel( sceneId, selfId )
	if MasterLevel <= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["msl"] )
		return 0
	end

	--(5)是否是结拜
	if LuaFnIsBrother( sceneId, selfId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["sib"] )
		return 0
	end

	--(6)是否是夫妻
	if LuaFnIsSpouses( sceneId, selfId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["mar"] )
		return 0
	end

	--06.10.24，最新的策划文档已经把此部分内容去掉了
	--(7)是否强行解除师徒关系不满3天
	--if LuaFnGetPrenticeBetrayTime( sceneId, selfId ) < (86400 * 3) then
	--	x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_3"] )
	--	return 0
	--end

	--(8)看看当前徒弟数是否已经最大了
	--计算可以收到的徒弟数
	local PrenticeNum = 2
	if MasterLevel == 1 then
		PrenticeNum = 2
	elseif MasterLevel == 2 then
		PrenticeNum = 3
	elseif MasterLevel == 3 then
		PrenticeNum = 5
	elseif MasterLevel == 4 then
		PrenticeNum = 8
	end
	if LuaFnGetPrenticeCount( sceneId, selfId ) >= PrenticeNum then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_2"] )
		return 0
	end
	
	--(9)是否现在有师傅
	if LuaFnHaveMaster( sceneId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_1"] )
		return 0
	end

	--(10)必须是好友
	if LuaFnIsFriend( sceneId, selfId, tId ) ~= 1 or LuaFnIsFriend( sceneId, tId, selfId ) ~= 1 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["frp"] )
		return 0
	end
	
	--(11)是否已经是师徒关系了
	if LuaFnIsMaster( sceneId, selfId, tId ) ~= 0 or LuaFnIsMaster( sceneId, tId, selfId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["ts"] )
		return 0 
	end

	return tId
end

--**********************************
--接受
--**********************************
function x806008_OnAccept( sceneId, selfId, targetId )
	x806008_OnConfirm( sceneId, selfId, targetId )
end

--**********************************
--提交
--**********************************
function x806008_OnSubmit( sceneId, selfId, targetId, tId )
	--徒弟增加一个称号
	local	MasterName	= LuaFnGetName( sceneId, tId )
	local	SelfName		= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, MasterName.."的弟子" )
	DispatchAllTitle( sceneId, selfId )
	LuaFnAprentice( sceneId, selfId, tId )

	--师傅
	x806008_MsgBox( sceneId, tId, targetId, "  恭喜收徒成功！" )
	Msg2Player( sceneId, tId, "恭喜收徒成功！", MSG2PLAYER_PARA )
	Msg2Player( sceneId, tId, "师傅要努力教好你的徒儿。", MSG2PLAYER_PARA )
	str		= format( "恭喜您收%s为徒，收徒之后杀怪获得的经验将会额外增加5％。和徒弟一起组队，能够获得的善恶值将会增加为原来的160％。徒弟达到一定等级后，还会根据你们之间的友好度给与您额外的经验奖励，此经验需用善恶值兑换。", SelfName )
	LuaFnSendSystemMail( sceneId, MasterName, str )
	--LuaFnSendNormalMail( sceneId, tId, MasterName, str )
	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, tId, 66 )
	LuaFnSendSpecificImpactToUnit( sceneId, tId, tId, tId, 18, 1000 )

	--徒弟
	x806008_MsgBox( sceneId, selfId, targetId, "  恭喜拜师成功！" )
	Msg2Player( sceneId, selfId, "恭喜拜师成功！", MSG2PLAYER_PARA )
	str		= format( "恭喜您拜%s为师，拜师之后杀怪获得的经验值将会额外增加10％，如果和师傅一起组队杀怪将会额外增加20％。40级以后经验额外奖励将会取消。", MasterName )
	LuaFnSendSystemMail( sceneId, SelfName, str )
	--LuaFnSendNormalMail( sceneId, selfId, SelfName, str )
	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
end

--**********************************
--同意拜师
--**********************************
function x806008_OnConfirm( sceneId, selfId, targetId )
	--tId 是即将成为师傅的玩家
	local tId
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end
	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	--徒弟
	x806008_MsgBox( sceneId, selfId, targetId, "  你同意了拜对方为师。" )
	Msg2Player( sceneId, selfId, "你同意了拜对方为师。", MSG2PLAYER_PARA )
	--师傅
	x806008_MsgBox( sceneId, tId, targetId, "  对方同意拜你为师。" )
	Msg2Player( sceneId, tId, "对方同意拜你为师。", MSG2PLAYER_PARA )

	if x806008_CheckAccept( sceneId, tId, targetId ) > 0 then
		x806008_OnSubmit( sceneId, selfId, targetId, tId )
	end
end

--**********************************
--拒绝拜师
--**********************************
function x806008_OnCancel( sceneId, selfId, targetId )
	--tId 是即将成为师傅的玩家
	local tId
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end
	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	--徒弟
	x806008_MsgBox( sceneId, selfId, targetId, "  你拒绝了拜对方为师。" )
	Msg2Player( sceneId, selfId, "你拒绝了拜对方为师。", MSG2PLAYER_PARA )
	--师傅
	x806008_MsgBox( sceneId, tId, targetId, "  对方拒绝拜你为师。" )
	Msg2Player( sceneId, tId, "对方拒绝拜你为师。", MSG2PLAYER_PARA )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806008_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x806008_MsgTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

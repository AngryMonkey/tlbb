-- 结拜任务

--脚本号
x806001_g_ScriptId = 806001

--结拜需要的金钱
x806001_g_NeedMoney = 100000
x806001_g_DrawTitleNeedMoney = 50000
x806001_g_ChangeTitleNeedMoney = 10000

--提示信息
x806001_g_msg_swear					= {}
x806001_g_msg_swear["swr"]	= "结拜"
x806001_g_msg_swear["tit"]	= "领取称号"
x806001_g_msg_swear["chr"]	= "修改个人称号"
x806001_g_msg_swear["tem"]	= " 你需要和你要结拜之人组队前来找我，我才能给你们主持结拜仪式。"
x806001_g_msg_swear["ten"]	= " 你的队伍中有人不在洛阳城中，所以我无法为你们主持结拜仪式。"
x806001_g_msg_swear["cap"]	= " 只有队长才能完成结拜的操作。"
x806001_g_msg_swear["mar"]	= " 夫妻之间是不能结拜的。你们还是先回去吧。"
x806001_g_msg_swear["mat"]	= " 师徒之间是不能结拜的。你们还是先回去吧。"
x806001_g_msg_swear["fri"]	= " 只有好友之间才能结拜。你们还需要进一步提高友谊才行。"
x806001_g_msg_swear["all"]	= " 所有的结拜兄弟必须同时在队伍中，才能加入新的结拜兄弟。"
x806001_g_msg_swear["one"]	= " 你们已经是结拜兄弟了，不需要再结拜一次来加深友谊了。"
x806001_g_msg_swear["alr"]	= " 您的队伍中A已经结拜过，所以我无法为你们结拜。"
x806001_g_msg_swear["frd"]	= " 如果你们想结拜的话，我可以为你们主持结拜仪式，撰写金兰谱。不过在这之前我要确认你们之间的友好度已经达到1000点。"
x806001_g_msg_swear["mon"]	= " 进行结拜仪式需要花费#{_EXCHG%d}，你确定要结拜吗？"
x806001_g_msg_swear["nom"]	= " 您身上的现金不足#{_EXCHG%d}。"
x806001_g_msg_swear["con"]	= " 兄弟结拜，今后有福同享，有难同当。你真的确定要结拜吗？"
x806001_g_msg_swear["chn"]	= " 你的队伍发生了变化，所以我无法为你们主持结拜仪式。"
x806001_g_msg_swear["bul"]	= " 皇天在上，后土在下！你们今日结拜为兄弟，以后有福同享，有难同当！不求同年同月同日生，但求同年同月同日死！天下英雄们，祝贺他们吧！"
x806001_g_msg_swear["pro"]	= " 恭喜诸位，你们已经成为结拜兄弟，请你们的队长来领取结拜称号吧。"
x806001_g_msg_swear["caa"]	= " 必须和你的所有结拜兄弟组队，才能领取结拜称号。"
x806001_g_msg_swear["cac"]	= " 只有队长才能为结拜兄弟们领取称号。"
x806001_g_msg_swear["cas"]	= " 你还没有结拜过，不能领取结拜称号。"
x806001_g_msg_swear["cab"]	= " 你的队伍中有人不是你的结拜兄弟。"
x806001_g_msg_swear["cat"]	= " 你已经领取过结拜称号了。"
x806001_g_msg_swear["can"]	= " 你还没有领取过结拜称号，还不能修改结拜称号。"
x806001_g_msg_swear["ccs"]	= " 你还没有结拜过，不能修改结拜称号。"
x806001_g_msg_swear["nmm"]	= " 修改结拜称号需要#{_EXCHG%d}，你身上的现金不足。"
x806001_g_msg_swear["ner"]	= " 你距离我太远了，我无法为你们主持结拜仪式。"
x806001_g_msg_swear["nel"]	= " 你的队伍正在结拜，而你距离我太远，我无法为你们主持结拜仪式。"
x806001_g_msg_swear["wait"]	= " 等待其他人回复。"

--Key for AddNumText
x806001_g_key					= {}
x806001_g_key["swear"]	= 10000	--结拜流程
x806001_g_key["allow"]	= 10001	--确定结拜花费界面
x806001_g_key["unall"]	= 10002	--取消结拜花费界面
x806001_g_key["confi"]	= 10003	--确定结拜同意界面
x806001_g_key["uncon"]	= 10004	--取消结拜同意界面
x806001_g_key["title"]	= 20000	--领取称号
x806001_g_key["chrti"]	= 30000	--修改称号

--**********************************
--任务入口函数
--**********************************
function x806001_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	-- 检查是否符合条件
	if key == x806001_g_key["swear"] then
		if x806001_CheckAccept( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		x806001_LogTeamInfo( sceneId, selfId, targetId )
		x806001_OnSubmit( sceneId, selfId, targetId )
		return 1
	end
	
	--确认花费
	if key == x806001_g_key["allow"] then
		--local money
		--money = LuaFnGetMoney( sceneId, selfId )
		--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		if nMoneySelf < x806001_g_NeedMoney then	
			local msg	= format( x806001_g_msg_swear["nom"], x806001_g_NeedMoney )
			x806001_MessageBox( sceneId, selfId, targetId, msg )
			return 0
		end
		x806001_OnConfirm( sceneId, selfId, targetId )
		return 1
	end
	
	--取消花费
	if key == x806001_g_key["unall"] then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	--同意结拜
	if key == x806001_g_key["confi"] then
		--记录信息
		x806001_AgreeSwear( sceneId, selfId, targetId )
		
		--关闭窗口
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		
		--查看是否所有的队员都同意了
		if x806001_CheckIfAllAgreeSwear( sceneId, selfId, targetId ) == 1 then
			x806001_DoSwear( sceneId, selfId, targetId )
		else
			x806001_WaitSwear( sceneId, selfId, targetId )
		end
		return 1
	end

	--不同意结拜
	if key == x806001_g_key["uncon"] then
		x806001_QuitSwear( sceneId, selfId, targetId )
		return 1
	end
	
	--领取称号
	if key == x806001_g_key["title"] then
		local TeamSize = x806001_CheckDrawTitle( sceneId, selfId, targetId )
		if TeamSize == 0 then
			return 0
		end
		
		--记录队伍信息
		x806001_LogTeamInfo( sceneId, selfId, targetId )
		
		--领取结拜称号
		LuaFnDrawJieBaiName( sceneId, selfId, TeamSize )
		return 1
	end
	
	--修改个人称号
	if key == x806001_g_key["chrti"] then
		if x806001_CheckChangeTitle( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		
		--修改结拜称号
		LuaFnChangeJieBaiName( sceneId, selfId, TeamSize )
		return 1
	end

	return 0
end

--**********************************
--列举事件
--**********************************
function x806001_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806001_g_ScriptId, x806001_g_msg_swear["swr"], 6, x806001_g_key["swear"] )
	AddNumText( sceneId, x806001_g_ScriptId, x806001_g_msg_swear["tit"], 6, x806001_g_key["title"] )
	AddNumText( sceneId, x806001_g_ScriptId, x806001_g_msg_swear["chr"], 6, x806001_g_key["chrti"] )
end

--**********************************
--检测接受条件
--**********************************
function x806001_CheckAccept( sceneId, selfId, targetId )

	--(1)是否组队
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["tem"] )
		return 0
	end
	
	--取队伍人数，人数不能是1个
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	TotalTeamNum = TeamSize
	if TeamSize == 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["tem"] )
		return 0
	end

	--取同场景队伍人数
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	if TeamSizeSameScene+1 ~= TeamSize then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["ten"] )
		return 0
	end

	--(2)是否队长
	if LuaFnIsTeamLeader( sceneId, selfId ) ~= 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cap"] )
		return 0
	end
	
	--(3)距离是否合适
	if IsInDist( sceneId, selfId, targetId, 6 ) ~= 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["ner"] )
		return 0
	end
	
	--(4)队员中是否存在夫妻、师徒、结拜、非好友关系
	local i = 0
	local j = 0
	local theID = 0
	local otherID = 0
	local Friend1 = 0
	local Friend2 = 0
	local Brothers = 0
	local BrotherNum = LuaFnIsSweared(sceneId, selfId) --队长是否结拜过
	while i < TeamSizeSameScene do
		theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )

		--是否夫妻
		if LuaFnIsSpouses(sceneId, selfId, theID) == 1 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mar"] )
			return 0
		end

		--是否师父
		if LuaFnIsMaster(sceneId, selfId, theID) == 1 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
			return 0
		end

		--是否徒弟
		if LuaFnIsPrentice(sceneId, theID, selfId) == 1 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
			return 0
		end

		--是否好友
		if LuaFnIsFriend(sceneId, selfId, theID) == 0 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
			return 0
		end
		if LuaFnIsFriend(sceneId, theID, selfId) == 0 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
			return 0
		end

		--友好度是否>=1000
		Friend1 = LuaFnGetFriendPoint( sceneId, selfId, theID )
		Friend2 = LuaFnGetFriendPoint( sceneId, theID, selfId )
		if Friend1 < 1000 or Friend2 < 1000 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["frd"] )
			return 0
		end
		
		--距离是否合适
		if IsInDist( sceneId, theID, targetId, 6 ) ~= 1 then
			local	theName	= LuaFnGetName( sceneId, theID )
			x806001_MessageBox( sceneId, selfId, targetId, " 您的队伍中#R" .. theName .. "#W距离我太远，所以我无法为你们结拜。" )
			x806001_MessageBox( sceneId, theID, targetId, x806001_g_msg_swear["nel"] )
			return 0
		end

		--是否已经有结拜关系
		local theSwear = LuaFnIsSweared(sceneId, theID)
		if theSwear > 0 then --队员有结拜关系
			if BrotherNum > 0 then --队长有结拜关系
				if LuaFnIsBrother(sceneId, selfId, theID) == 0 then
					local	theName	= LuaFnGetName( sceneId, theID )
					x806001_MessageBox( sceneId, selfId, targetId, " 您的队伍中" .. theName .. "已经是别人的结拜兄弟，我无法再给你们主持结拜仪式了。" )
					return 0
				end
			else
				local	theName	= LuaFnGetName( sceneId, theID )
				x806001_MessageBox( sceneId, selfId, targetId, " 您的队伍中" .. theName .. "已经是别人的结拜兄弟，我无法再给你们主持结拜仪式了。" )
			end
		end
		
		--如果队长已经有结拜关系，将队伍中所有的与队长是兄弟的人放到DIC里面去
		if theSwear > 0 and BrotherNum > 0 then
			Brothers = Brothers + 1
		end

		--遍历队员
		j = i
		while j < TeamSizeSameScene do
			otherID = LuaFnGetTeamSceneMember( sceneId, theID, j )
			if LuaFnIsSpouses(sceneId, theID, otherID) == 1 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mar"] )
				return 0
			end
			if LuaFnIsMaster(sceneId, theID, otherID) == 1 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
				return 0
			end
			if LuaFnIsPrentice(sceneId, otherID, theID) == 1 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["mat"] )
				return 0
			end
			if LuaFnIsFriend(sceneId, theID, otherID) == 0 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
				return 0
			end
			if LuaFnIsFriend(sceneId, otherID, theID) == 0 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["fri"] )
				return 0
			end
			Friend1 = LuaFnGetFriendPoint( sceneId, theID, otherID )
			Friend2 = LuaFnGetFriendPoint( sceneId, otherID, theID )
			if Friend1 < 1000 or Friend2 < 1000 then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["frd"] )
				return 0
			end
			j = j + 1
		end
		i = i + 1
	end
		
	--(5)如果队长有结拜关系，看看所有的兄弟是否都在这个队伍里面
	if BrotherNum > 0 then
		-- 兄弟数等于同场景的队员数
		if BrotherNum == Brothers then
			if BrotherNum == TeamSizeSameScene then
				x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["one"] )
				return 0
			end
		else
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["all"] )
			return 0
		end
	end
	
	return 1

end

--**********************************
--对话窗口信息提示
--**********************************
function x806001_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806001_ConfirmSwear( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x806001_g_msg_swear["con"] )
		AddNumText( sceneId, x806001_g_ScriptId, "确认结拜", 6, x806001_g_key["confi"] )
		AddNumText( sceneId, x806001_g_ScriptId, "我不想结拜了", 8, x806001_g_key["uncon"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--确认花费对话窗口
--**********************************
function x806001_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local msg	= format( x806001_g_msg_swear["mon"], x806001_g_NeedMoney )
		AddText( sceneId, msg )
		AddNumText( sceneId, x806001_g_ScriptId, "确定", 6, x806001_g_key["allow"] )
		AddNumText( sceneId, x806001_g_ScriptId, "取消", 8, x806001_g_key["unall"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--确认同意对话窗口
--**********************************
function x806001_OnConfirm( sceneId, selfId, targetId )
	x806001_ConfirmSwear( sceneId, selfId, targetId )

	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		x806001_ConfirmSwear( sceneId, LuaFnGetTeamSceneMember( sceneId, selfId, i ), targetId )
		i = i + 1
	end
end

--**********************************
--记录队伍信息
--**********************************
function x806001_LogTeamInfo( sceneId, selfId, targetId )
	LuaFnTeamSnapshort( sceneId, selfId )
	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		LuaFnTeamSnapshort( sceneId, LuaFnGetTeamSceneMember( sceneId, selfId, i ) )
		i = i + 1
	end
end

--**********************************
--放弃结拜
--**********************************
function x806001_QuitSwear( sceneId, selfId, targetId )

	--关闭自己的窗口
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
	--给其他人发消息
	local TeamLeaderID = GetTeamLeader( sceneId, selfId )
	if TeamLeaderID ~= nil then
		local i = 0
		local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, TeamLeaderID )
		local	msg = LuaFnGetName( sceneId, selfId ) .. "思虑再三，退出了结拜仪式。"
		if TeamLeaderID ~= selfId then
			x806001_MessageBox( sceneId, selfId, targetId, msg )
			x806001_MessageBox( sceneId, TeamLeaderID, targetId, msg )
		end
		while i < TeamSizeSameScene do
			local theID = LuaFnGetTeamSceneMember( sceneId, TeamLeaderID, i )
			if theID ~= selfId then
				x806001_MessageBox( sceneId, selfId, targetId, msg )
				x806001_MessageBox( sceneId, theID, targetId, msg )
			end
			i = i + 1
		end
	end
end

--**********************************
--记录同意结拜信息
--**********************************
function x806001_AgreeSwear( sceneId, selfId, targetId )
	LuaFnAgreeSwear( sceneId, selfId, selfId )
	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )
		LuaFnAgreeSwear( sceneId, theID, selfId )
		i = i + 1
	end
end

--**********************************
--查看是否所有人都同意结拜
--**********************************
function x806001_CheckIfAllAgreeSwear( sceneId, selfId, targetId )
	--检查是否所有人都同意了
	if LuaFnIfAllTeamAgreeSwear(sceneId, selfId) == 0 then
		return 0
	end
	local i = 0
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )
		if LuaFnIfAllTeamAgreeSwear(sceneId, theID) == 0 then
			return 0
		end
		i = i + 1
	end
	return 1
end

--**********************************
--真实的结拜操作
--**********************************
function x806001_DoSwear( sceneId, selfId, targetId )
	local TeamLeaderID = GetTeamLeader( sceneId, selfId )
	
	--队长没了:(
	if TeamLeaderID == nil then
		return 0
	end
	
	local BrotherNum = LuaFnIsSweared(sceneId, TeamLeaderID)
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, TeamLeaderID )
	
	--检查是否已经组队了
	if BrotherNum == TeamSizeSameScene then
		return 0
	end

	--检查队伍是否有变化
	if LuaFnVerifyTeamWithSnapshort( sceneId, TeamLeaderID ) == 0 then
		x806001_MessageBox( sceneId, TeamLeaderID, targetId, x806001_g_msg_swear["chn"] )
		return 0
	end
	
	--查看队员间关系是否有变化
	if x806001_CheckAccept( sceneId, TeamLeaderID, targetId ) == 0 then
		x806001_MessageBox( sceneId, TeamLeaderID, targetId, x806001_g_msg_swear["chn"] )
		return 0
	end
	
	--检查成功了，赶紧扣丫10个金子
	--local Cost = LuaFnCostMoney( sceneId, TeamLeaderID, 100000 )
	--hzp 2008-12-9
	local jzCost, jbCost = LuaFnCostMoneyWithPriority( sceneId, TeamLeaderID, 100000 );	
	
	--没扣成功？？
	--if Cost == nil or Cost <= 0 then
	if jzCost == -1 then
		local msg	= format( x806001_g_msg_swear["nom"], x806001_g_NeedMoney )
		x806001_MessageBox( sceneId, TeamLeaderID, targetId, msg )
		return 0
	end
	
	local Names = LuaFnGetName( sceneId, TeamLeaderID )
	
	--修改队长好友列表
	LuaFnAllTeamSwear( sceneId, TeamLeaderID )
	
	--修改其他人好友列表
	local i = 0
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, TeamLeaderID, i )
		LuaFnAllTeamSwear( sceneId, theID )
		Names = Names .. "," .. LuaFnGetName( sceneId, theID )
		i = i + 1
	end
	
	--让队长领称号
	x806001_MessageBox( sceneId, TeamLeaderID, targetId, x806001_g_msg_swear["pro"] )
	i = 0
	while i < TeamSizeSameScene do
		local theID = LuaFnGetTeamSceneMember( sceneId, TeamLeaderID, i )
		x806001_MessageBox( sceneId, theID, targetId, x806001_g_msg_swear["pro"] )
		i = i + 1
	end
	
 		--系统广播消息
	local leaderObjId = selfId;
	local sAllUserName="";
		
	local TeammateCount = GetTeamMemberCount( sceneId, selfId );	
	local sUserName;

	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	for	i=0,nearteammembercount-1 do
		local idMem = GetNearTeamMember(sceneId, selfId, i)
		sUserName = GetName(sceneId, idMem);				
		local sUserName2 = format("#B#{_INFOUSR%s}#Y", sUserName);		
		sAllUserName = sAllUserName..sUserName2;		
		if i ~= nearteammembercount-1 then
			sAllUserName = sAllUserName.."、"
		end			
	end
			
	local sMessage = format("#{JieBai_00}%s#{JieBai_01}",  sAllUserName);	
	BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
	
end

--**********************************
--检测领取称号
--**********************************
function x806001_CheckDrawTitle( sceneId, selfId, targetId )

	--(1)是否组队
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end
	
	--取队伍人数，人数不能是1个
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	TotalTeamNum = TeamSize
	if TeamSize == 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end

	--取同场景队伍人数
	local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
	if TeamSizeSameScene+1 ~= TeamSize then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end

	--(2)是否队长
	if LuaFnIsTeamLeader( sceneId, selfId ) ~= 1 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cac"] )
		return 0
	end
	
	--(3)是否结拜过
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	if BrotherNum == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cas"] )
		return 0
	end

	--(4)是否队伍中有不是结拜兄弟的队员
	local i = 0
	local theID = 0
	local Brothers = 0
	while i < TeamSizeSameScene do
		theID = LuaFnGetTeamSceneMember( sceneId, selfId, i )
		if LuaFnIsBrother(sceneId, selfId, theID) == 0 then
			x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cab"] )
			return 0
		end
		Brothers = Brothers + 1
		i = i + 1
	end

	--(5)是否所有队员都来了
	if BrotherNum ~= Brothers then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["caa"] )
		return 0
	end

	--(6)是否有足够的金钱
	--hzp 2008-12-26
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	--if LuaFnGetMoney( sceneId, selfId ) < x806001_g_DrawTitleNeedMoney then	
	if nMoneySelf < x806001_g_DrawTitleNeedMoney then	
		local msg	= format( x806001_g_msg_swear["nom"], x806001_g_DrawTitleNeedMoney )
		x806001_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	--(7)是否已经领过称号了
	--领取过称号后，仍然可以领取称号，用于当结拜人数发生变化时，修改结拜兄弟的称号
	
	--local title = LuaFnGetJieBaiName( sceneId, selfId )
	--if title ~= nil then
		--x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["cat"] )
		--return 0
	--end
	
	--返回队伍中总人数
	return TeamSize
end

--**********************************
--检测修改称号
--**********************************
function x806001_CheckChangeTitle( sceneId, selfId, targetId )

	--(1)是否结拜过
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	if BrotherNum == 0 then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["ccs"] )
		return 0
	end
	
	--(2)是否领取过称号
	local title = LuaFnGetJieBaiName( sceneId, selfId )
	if title == nil then
		x806001_MessageBox( sceneId, selfId, targetId, x806001_g_msg_swear["can"] )
		return 0
	end
	
	--(3)是否有足够的金钱
	--hzp 2008-12-26
	local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
	local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
	local nMoneySelf = nMoneyJZ + nMoneyJB;
	--if LuaFnGetMoney( sceneId, selfId ) < x806001_g_ChangeTitleNeedMoney then	
	if nMoneySelf < x806001_g_ChangeTitleNeedMoney then	
		local msg	= format( x806001_g_msg_swear["nmm"], x806001_g_ChangeTitleNeedMoney )
		x806001_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	return 1

end

--**********************************
--等待其他人确定的对话窗口信息提示
--**********************************
function x806001_WaitSwear( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x806001_g_msg_swear["wait"] )		
		AddNumText( sceneId, x806001_g_ScriptId, "我不想结拜了", 8, x806001_g_key["uncon"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--离婚任务

--脚本号
x806005_g_ScriptId		= 806005

--离婚
x806005_g_Unmarry						= {}
x806005_g_Unmarry["Id"]			= 1001
x806005_g_Unmarry["Name"]		= "离婚"
x806005_g_Unmarry["Skills"]	= { {260,"一级夫妻技能"}, {261,"二级夫妻技能"}, {262,"三级夫妻技能"},
												{263,"四级夫妻技能"}, {264,"五级夫妻技能"}, {265,"六级夫妻技能"},
												{266,"七级夫妻技能"}, {267,"八级夫妻技能"}, {268,"九级夫妻技能"} }

--提示信息
x806005_g_msg_unm					= {}
x806005_g_msg_unm["tem"]	= "  如果想离婚，请男女双方2人组成一队再来找我。"
x806005_g_msg_unm["mar"]	= "  你们还没结婚呢？为啥要离婚捏？"
x806005_g_msg_unm["gld"]	= "  男方需要携带#{_EXCHG55555}才能离婚。"
x806005_g_msg_unm["ner"]	= "  只有2人都走到我身边才可以离婚。"

--**********************************
--任务入口函数 请求离婚
--**********************************
function x806005_OnDefaultEvent( sceneId, selfId, targetId )
	local	tId, male, female	= x806005_CheckAccept( sceneId, selfId, targetId )
	if tId == 0 or male == 0 or female == 0 then
		return 0
	end
	
	--同意离婚
	if GetNumText() == 1 then
		x806005_OnAccept( sceneId, male, female )
		x806005_MessageBox( sceneId, tId, targetId, "  对方已经接受了你的离婚请求。" )
		
		--关闭界面		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	--不同意离婚
	if GetNumText() == 2 then
		x806005_MessageBox( sceneId, tId, targetId, "  很遗憾，对方没有同意你的请求。" )
		
		--关闭界面		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	x806005_OnSubmit( sceneId, selfId, targetId, tId )
	return 1
end

--**********************************
--列举事件
--**********************************
function x806005_OnEnumerate( sceneId, selfId, targetId )
	if LuaFnIsMarried( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x806005_g_ScriptId, x806005_g_Unmarry["Name"] , 6, -1)
	end
end

--**********************************
--检测接受条件
--**********************************
function x806005_CheckAccept( sceneId, selfId, targetId )
	--(1)点击者组队，并且队伍只有2个人
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["tem"] )
		return 0, 0, 0
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["tem"] )
		return 0, 0, 0
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["tem"] )
		return 0, 0, 0
	end

	--(2)队伍中是否A是B的夫君，B是A的妻子
	local	selfSex	= LuaFnGetSex( sceneId, selfId )
	local tId			= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )
	local tSex		= LuaFnGetSex( sceneId, tId )
	if selfSex == tSex then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["mar"] )
		return 0, 0, 0
	end
	local	male, female
	if selfSex == 1 then
		male 		= selfId
		female	= tId
	else
		male		= tId
		female	= selfId
	end
	
	--俩人是夫妻
	if LuaFnIsSpouses( sceneId, male, female ) == 0 then
		x806005_MessageBox( sceneId,selfId, targetId, x806005_g_msg_unm["mar"] )
		return 0, 0, 0
	end
	
	--脚本是否可以正常执行
	if LuaFnIsCanDoScriptLogic( sceneId, male ) ~= 1 then
		return 0, 0, 0
	end
	if LuaFnIsCanDoScriptLogic( sceneId, female ) ~= 1 then
		return 0, 0, 0
	end

	--(3)男方身上携带金钱是否大于等于N=55555
	--hzp 2008-12-10
		local nMoneyJZ = GetMoneyJZ(sceneId, male);
		local nMoneyJB = LuaFnGetMoney(sceneId, male);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < 55555 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["gld"] )
		return 0, 0, 0
	end
	
	--(4)A和B距离是否不大于10米
	if IsInDist( sceneId, selfId, tId, 10 ) ~= 1 then
		x806005_MessageBox( sceneId, selfId, targetId, x806005_g_msg_unm["ner"] )
		return 0, 0, 0
	end

	return tId, male, female
end

--**********************************
--确保双方自愿离婚
--**********************************
function x806005_OnSubmit( sceneId, selfId, targetId, tId )
	local	selfName	= LuaFnGetName( sceneId, selfId )
	BeginEvent( sceneId )
		AddText( sceneId, "  等待对方答覆。。。#r  离婚后，夫妻双方的友好度将降至10，同时所学的夫妻技能将会全部清空。#r注意，离婚需要男方花费#{_EXCHG55555}" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  你同意与"..selfName.."离婚吗？离婚后，夫妻双方的友好度将降至10，同时所学的夫妻技能将会全部清空。#r注意，离婚需要男方花费#{_EXCHG55555}" )
		AddNumText( sceneId, x806005_g_ScriptId, "是", 6, 1 )		-- 9 + i 制定客户端特定的图标 (选项图标为数字项)
		AddNumText( sceneId, x806005_g_ScriptId, "否", 8, 2 )		-- 9 + i 制定客户端特定的图标 (选项图标为数字项)
	EndEvent( sceneId )
	DispatchEventList( sceneId, tId, targetId )
end

--**********************************
--接受
--**********************************
function x806005_OnAccept( sceneId, male, female )
	--(1)扣除男方身上金钱55555
	--LuaFnCostMoney( sceneId, male, 55555 )
	LuaFnCostMoneyWithPriority(sceneId, male, 55555);	
	
	--(2)把双方的好友度都设置成N=X（10），X为能够看到对方在线的最低值
	LuaFnSetFriendPoint( sceneId, male, female, 10 )
	LuaFnSetFriendPoint( sceneId, female, male, 10 )
	
	--(3)删除称号
	LuaFnAwardSpouseTitle( sceneId, female, "" )
	DispatchAllTitle( sceneId, female )
	LuaFnAwardSpouseTitle( sceneId, male, "" )
	DispatchAllTitle( sceneId, male )

	--(4)聊天窗口给男方提示
	Msg2Player( sceneId, male, "你恢复单身了。", MSG2PLAYER_PARA )
--Msg2Player( sceneId, male, "已经归还了结婚戒指。", MSG2PLAYER_PARA )
	Msg2Player( sceneId, male, "失去夫妻称号。", MSG2PLAYER_PARA )
	Msg2Player( sceneId, male, "失去所有夫妻技能。", MSG2PLAYER_PARA )

	--(5)聊天窗口给女方提示
	Msg2Player( sceneId, female, "你恢复单身了。", MSG2PLAYER_PARA )
--Msg2Player( sceneId, female, "已经归还了结婚戒指。", MSG2PLAYER_PARA )
	Msg2Player( sceneId, female, "失去夫妻称号。", MSG2PLAYER_PARA )
	Msg2Player( sceneId, female, "失去所有夫妻技能。", MSG2PLAYER_PARA )
	
	--(6)删除夫妻技能
	local skillId
	for _, skillId in x806005_g_Unmarry["Skills"] do
		DelSkill( sceneId, male, skillId[1] )
		DelSkill( sceneId, female, skillId[1] )
	end
	
	NewSkill = { 250, 251, 252, 253, 254, 255, 256, 257, 258, 259 }
	for _, skillId in NewSkill do
		DelSkill( sceneId, male, skillId )
		DelSkill( sceneId, female, skillId )
	end
	
	--删除形影不离技能
	for _, skillId in { 269,270,271,272,273 } do
		DelSkill( sceneId, male, skillId )
		DelSkill( sceneId, female, skillId )
	end
	
	--(7)删除对应结婚时的任务
	CallScriptFunction(250036, "OnAbandon", sceneId, male);
	CallScriptFunction(250037, "OnAbandon", sceneId, male);
	
	CallScriptFunction(250036, "OnAbandon", sceneId, female);
	CallScriptFunction(250037, "OnAbandon", sceneId, female);
	
	--重温婚礼计数清0
	SetMissionData( sceneId, male, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	SetMissionData( sceneId, female, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )

	LuaFnUnMarry( sceneId, male, female )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806005_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

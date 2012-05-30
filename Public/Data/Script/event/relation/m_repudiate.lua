--强制离婚任务

--脚本号
x806004_g_ScriptId		= 806004

--强制离婚
x806004_g_Repudiate						= {}
x806004_g_Repudiate["Id"]			= 1002
x806004_g_Repudiate["Name"]		= "强制离婚"
x806004_g_Repudiate["Skills"]	= { {260,"一级夫妻技能"}, {261,"二级夫妻技能"}, {262,"三级夫妻技能"},
													{263,"四级夫妻技能"}, {264,"五级夫妻技能"}, {265,"六级夫妻技能"},
													{266,"七级夫妻技能"}, {267,"八级夫妻技能"}, {268,"九级夫妻技能"} }

--提示信息
x806004_g_msg_rep					= {}
x806004_g_msg_rep["mar"]	= "  你没有结婚，就想离婚么？"
x806004_g_msg_rep["gld"]	= "  需要携带#{_EXCHG200000}才能离婚。"

--**********************************
--任务入口函数 请求离婚
--**********************************
function x806004_OnDefaultEvent( sceneId, selfId, targetId )
	if x806004_CheckAccept( sceneId, selfId, targetId ) == 0 then
		return 0
	end
	
	--同意离婚
	if GetNumText() == 1 then
		x806004_OnAccept( sceneId, selfId )
		
		--关闭界面		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	--不同意离婚
	if GetNumText() == 2 then
		--关闭界面		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	x806004_OnSubmit( sceneId, selfId, targetId )
	return 1
end

--**********************************
--列举事件
--**********************************
function x806004_OnEnumerate( sceneId, selfId, targetId )
	if LuaFnIsMarried( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x806004_g_ScriptId, x806004_g_Repudiate["Name"] , 6, -1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x806004_CheckAccept( sceneId, selfId, targetId )
	--(1)已婚
	if LuaFnIsMarried( sceneId, selfId ) == 0 then
		x806004_MessageBox( sceneId, selfId, targetId, x806004_g_msg_rep["mar"] )
		return 0
	end
	
	--(2)离婚的人身上携带金钱大于等于N=200000
	--if LuaFnGetMoney( sceneId, selfId ) < 200000 then
	--hzp 2008-12-10
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < 200000 then
		x806004_MessageBox( sceneId, selfId, targetId, x806004_g_msg_rep["gld"] )
		return 0
	end

	return 1
end

--**********************************
--确保双方自愿离婚
--**********************************
function x806004_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  你确定要强制离婚吗？离婚后，夫妻双方的友好度将降至10，同时所学的夫妻技能将会全部清空。#r要求强制离婚的一方需要花费#{_EXCHG200000}" )
		AddNumText( sceneId, x806004_g_ScriptId, "是", 6, 1 )		-- 9 + i 制定客户端特定的图标 (选项图标为数字项)
		AddNumText( sceneId, x806004_g_ScriptId, "否", 8, 2 )		-- 9 + i 制定客户端特定的图标 (选项图标为数字项)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--接受
--**********************************
function x806004_OnAccept( sceneId, selfId )
	--需要二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	
	--(1)扣除申请人身上金钱200000
	--LuaFnCostMoney( sceneId, selfId, 200000 )
	LuaFnCostMoneyWithPriority(sceneId, selfId, 200000);	
	--(2)好友度设置成N=X（10），X为能够看到对方在线的最低值
	local SpouseGUID = LuaFnGetSpouseGUID( sceneId, selfId )
	LuaFnSetFriendPointByGUID( sceneId, selfId, SpouseGUID, 10 )

	--(3)删除称号
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--(4)删除夫妻技能
	local skillId
	for _, skillId in x806004_g_Repudiate["Skills"] do
		DelSkill( sceneId, selfId, skillId[1] )
	end
	
	NewSkill = { 250, 251, 252, 253, 254, 255, 256, 257, 258, 259 }
	for _, skillId in NewSkill do
		DelSkill( sceneId, selfId, skillId )
	end
	
	--删除形影不离技能
	for _, skillId in { 269,270,271,272,273 } do
		DelSkill( sceneId, selfId, skillId )
	end
	
	local SpouseName	= LuaFnGetFriendName( sceneId, selfId, SpouseGUID )
	local selfName		= LuaFnGetName( sceneId, selfId )

	--发普通邮件给配偶通知离婚
	LuaFnSendSystemMail( sceneId, SpouseName, selfName .. "已选择了与你强制离婚了，唉，随缘吧。由于婚姻破裂，你所学夫妻技能已全部清空。" )
	--LuaFnSendNormalMail( sceneId, selfId, SpouseName, selfName .. "已选择了与你强制离婚了，唉，随缘吧。由于婚姻破裂，你所学夫妻技能已全部清空。" )
	
	--删除对应结婚时的任务
	CallScriptFunction(250036, "OnAbandon", sceneId, selfId);
	CallScriptFunction(250037, "OnAbandon", sceneId, selfId);

	--发可执行邮件给配偶来执行离婚
	LuaFnSendScriptMail( sceneId, SpouseName, MAIL_REPUDIATE, LuaFnGetGUID( sceneId, selfId ), 0, 0 )

	LuaFnDivorce( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806004_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

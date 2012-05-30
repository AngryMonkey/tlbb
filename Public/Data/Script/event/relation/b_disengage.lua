-- 强制解除结拜任务

--脚本号
x806000_g_scriptId = 806000

--提示信息
x806000_g_msg_swear					= {}
x806000_g_msg_swear["uns"]	= "解除结拜"
x806000_g_msg_swear["cas"]	= " 没有结拜过，因此无法解除结拜关系。"
x806000_g_msg_swear["unc"]	= " 解除结拜关系后，将会与结拜的玩家好友度降低到500，请问是否要解除结拜关系。"

--Key for AddNumText
x806000_g_key					= {}
x806000_g_key["uns"]	= 10000	--解除结拜
x806000_g_key["all"]	= 20000	--同意解除结拜
x806000_g_key["una"]	= 30000	--取消解除结拜

--**********************************
--列举事件
--**********************************
function x806000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806000_g_scriptId, x806000_g_msg_swear["uns"], 6, x806000_g_key["uns"] )
end


--**********************************
--任务入口函数
--**********************************
function x806000_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()

	--解除结拜
	if key == x806000_g_key["uns"] then
		if x806000_CheckAccept( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		x806000_OnSubmit( sceneId, selfId, targetId )
		return 1
	end

	--同意解除
	if key == x806000_g_key["all"] then
		x806000_DoUnswear( sceneId, selfId, targetId )

		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end

	--取消解除
	if key == x806000_g_key["una"] then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
end

--**********************************
--检测接受条件
--**********************************
function x806000_CheckAccept( sceneId, selfId, targetId )
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	if BrotherNum == 0 then
		x806000_MessageBox( sceneId, selfId, targetId, x806000_g_msg_swear["cas"] )
		return 0
	end
end

--**********************************
--确认窗口
--**********************************
function x806000_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x806000_g_msg_swear["unc"] )
		AddNumText( sceneId, x806000_g_scriptId, "确定", 6, x806000_g_key["all"] )
		AddNumText( sceneId, x806000_g_scriptId, "取消", 8, x806000_g_key["una"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806000_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end


--**********************************
--强制解除结拜
--**********************************
function x806000_DoUnswear( sceneId, selfId, targetId )
	local BrotherNum = LuaFnIsSweared(sceneId, selfId)
	local selfName = LuaFnGetName( sceneId, selfId )
	local selfGuid = LuaFnGetGUID( sceneId, selfId )
	local AllDismiss = 0
	
	--如果团体中只有两个人，则全部解散
	if BrotherNum == 1 then
		AllDismiss = 1
	end
	
	--删除称号
	AwardJieBaiTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )
	
	--储存好友的GUID
	local i = 0
	local BrotherGuid = {}
	while i < BrotherNum do
		BrotherGuid[i] = LuaFnGetBrotherGuid(sceneId, selfId, i)
		i = i + 1
	end

	--逐一的解除结拜关系	
	i = 0
	while i < BrotherNum do
		local theGUID = BrotherGuid[i]
		if theGUID ~= nil then

			--降低友好度到500
			local FriendPoint = LuaFnGetFriendPointByGUID( sceneId, selfId, theGUID )
			if FriendPoint > 500 then
				LuaFnSetFriendPointByGUID( sceneId, selfId, theGUID, 500 )
			end

			--取消结拜
			LuaFnUnswear( sceneId, selfId, theGUID )

			--发送普通邮件
			local FriendName = LuaFnGetFriendName( sceneId, selfId, theGUID )
			LuaFnSendSystemMail( sceneId, FriendName, selfName .. "已经与您解除了结拜关系。" )
			--LuaFnSendNormalMail( sceneId, selfId, FriendName, selfName .. "已经与您解除了结拜关系。" )

			--发送可执行邮件
			LuaFnSendScriptMail( sceneId, FriendName, MAIL_UNSWEAR, selfGuid, AllDismiss, 0 )

		end
		i = i + 1
	end
	
end

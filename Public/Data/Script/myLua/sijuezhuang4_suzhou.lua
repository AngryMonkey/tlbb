--地图传送点NPC
--传送
--如意小子完善

x002943_g_ScriptId	= 002943
x002943_g_Yinpiao = 40002000
--**********************************
--事件交互入口
--**********************************
function x002943_OnDefaultEvent( sceneId, selfId, targetId )

	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x002943_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddText( sceneId, "#W四个恶人已经被你们打败了？小女子对各位的大恩大德无以为报。" )
			AddNumText( sceneId, x002943_g_ScriptId, "#G离开四绝庄", 9, 101 )
			--AddNumText( sceneId, x002943_g_ScriptId, "#G传送至四绝殿", 9, 200 )
			--AddNumText( sceneId, x002943_g_ScriptId, "大理", 9, 300 )
			--AddNumText( sceneId, x002943_g_ScriptId, "楼兰", 9, 400 )
			--AddNumText( sceneId, x002943_g_ScriptId, "南海", 9, 500 )
			--AddNumText( sceneId, x002943_g_ScriptId, "南诏", 9, 600 )
			--AddNumText( sceneId, x002943_g_ScriptId, "长白山", 9, 700 )
						for i, mp in x002026_g_mpInfo do
			end
		else
			AddText( sceneId, "  你需要等级到达10级以上，才能去别的城市。" )
			AddNumText( sceneId, x002943_g_ScriptId, "城市 - 大理",  9, 1003 )
			AddNumText( sceneId, x002943_g_ScriptId, "城市 - 大理2", 9, 1004 )
			AddNumText( sceneId, x002943_g_ScriptId, "城市 - 大理3", 9, 1005 )
		end


	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002943_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 100 then
		BeginEvent( sceneId )
					AddText( sceneId, "本次传送将花费您50银！确定传送吗?" )
			AddNumText( sceneId, x002943_g_scriptId, "确定", -1, 101)
			AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 100, 122, 10 )
	end

	if GetNumText() == 200 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 96, 81, 10 )
	end

	if GetNumText() == 300 then
		BeginEvent( sceneId )
					AddText( sceneId, "本次传送将花费您50银！确定传送吗?" )
			AddNumText( sceneId, x002943_g_scriptId, "确定", -1, 301)
			AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 301 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  对不起您的金钱不足！无法传送" )
		AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 246, 106, 10 )
	end

	if GetNumText() == 400 then
		BeginEvent( sceneId )
					AddText( sceneId, "本次传送将花费您50银！确定传送吗?" )
			AddNumText( sceneId, x002943_g_scriptId, "确定", -1, 401)
			AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 401 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  对不起您的金钱不足！无法传送" )
		AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 294, 90, 10 )
	end

	if GetNumText() == 500 then
		BeginEvent( sceneId )
					AddText( sceneId, "本次传送将花费您50银！确定传送吗?" )
			AddNumText( sceneId, x002943_g_scriptId, "确定", -1, 501)
			AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 501 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  对不起您的金钱不足！无法传送" )
		AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 34, 206, 266, 10 )
	end

	if GetNumText() == 600 then
		BeginEvent( sceneId )
					AddText( sceneId, "本次传送将花费您50银！确定传送吗?" )
			AddNumText( sceneId, x002943_g_scriptId, "确定", -1, 601)
			AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 601 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  对不起您的金钱不足！无法传送" )
		AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 28, 186, 43, 10 )
	end

	if GetNumText() == 700 then
		BeginEvent( sceneId )
					AddText( sceneId, "本次传送将花费您50银！确定传送吗?" )
			AddNumText( sceneId, x002943_g_scriptId, "确定", -1, 701)
			AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 701 then
	local PlayerMoney = GetMoney(sceneId,selfId)
	if PlayerMoney < 5000 then
		BeginEvent( sceneId )
		AddText( sceneId, "  对不起您的金钱不足！无法传送" )
		AddNumText( sceneId, x002943_g_scriptId, "取消", -1, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		CostMoney(sceneId,selfId,5000)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 22, 158, 113, 10 )
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x002943_MsgBox( sceneId, selfId, targetId, "  你队伍成员中有人有漕运\货舱在身，我们驿站不能为你提供传送服务。" )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002943_MsgBox( sceneId, selfId, targetId, "  你有漕运\货舱在身，我们驿站不能为你提供传送服务。" )
		return
	end

	--顺利传送
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--返回门派
		if id < 0 or id >= 9 then
			x002943_MsgBox( sceneId, selfId, targetId, "  你还没有加入任何门派！" )
		else
			mp	= x002943_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--洛阳
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183, 10 )
		return
	end
	if arg == 1002 then		--苏州
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162, 10 )
		return
	end
	if arg == 1006 then		--洛阳商会
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 234, 132, 10 )
		return
	end
	if arg == 1003 then		--大理1
		--如果玩家就在大理1则不传送
		if sceneId == 2 then
			x002943_MsgBox( sceneId, selfId, targetId, "  你已经在大理了。" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 138 )
		end
		return
	end
	if arg == 1004 then		--大理2
		--如果玩家就在大理2则不传送
		if sceneId == 71 then
			x002943_MsgBox( sceneId, selfId, targetId, "  你已经在大理2了。" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 71, 241, 138 )
		end
		return
	end
	if arg == 1005 then		--大理3
		--如果玩家就在大理3则不传送
		if sceneId == 72 then
			x002943_MsgBox( sceneId, selfId, targetId, "  你已经在大理3了。" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 72, 241, 138 )
		end
		return
	end
	for i, mp in x002943_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			return
		end
	end

	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		return
	end

end

--**********************************
--根据门派ID获取门派信息
--**********************************
function x002943_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002943_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x002943_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

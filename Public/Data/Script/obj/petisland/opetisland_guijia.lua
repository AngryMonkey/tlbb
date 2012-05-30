--玄武岛
--归佳
--普通

x112001_g_ScriptId	= 112001

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x112001_g_mpInfo		= {}
x112001_g_mpInfo[0]	= { "星宿", 16,  96, 152, MP_XINGSU }
x112001_g_mpInfo[1]	= { "逍遥", 14,  67, 145, MP_XIAOYAO }
x112001_g_mpInfo[2]	= { "少林",  9,  96, 127, MP_SHAOLIN }
x112001_g_mpInfo[3]	= { "天山", 17,  95, 120, MP_TIANSHAN }
x112001_g_mpInfo[4]	= { "天龙", 13,  96, 120, MP_DALI }
x112001_g_mpInfo[5]	= { "峨嵋", 15,  89, 139, MP_EMEI }
x112001_g_mpInfo[6]	= { "武当", 12, 103, 140, MP_WUDANG }
x112001_g_mpInfo[7]	= { "明教", 11,  98, 167, MP_MINGJIAO }
x112001_g_mpInfo[8]	= { "丐帮", 10,  91, 116, MP_GAIBANG }

x112001_g_Yinpiao = 40002000 
--**********************************
--事件交互入口
--**********************************
function x112001_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x112001_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		AddText( sceneId, "    欢迎来到玄武岛!")
		AddNumText( sceneId, x112001_g_ScriptId, "返回门派", 9, 1000 )
		AddNumText( sceneId, x112001_g_ScriptId, "城市 - 洛阳", 9, 1003 )
		AddNumText( sceneId, x112001_g_ScriptId, "城市 - 苏州", 9, 1001 )
		AddNumText( sceneId, x112001_g_ScriptId, "城市 - 大理", 9, 1002 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x112001_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x112001_MsgBox( sceneId, selfId, targetId, "  你队伍成员中有人有漕运货舱在身，我们驿站不能为你提供传送服务。" )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x112001_MsgBox( sceneId, selfId, targetId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。" )
		return
	end

	--顺利传送
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--返回门派
		if id < 0 or id >= 9 then
			x112001_MsgBox( sceneId, selfId, targetId, "  你还没有加入任何门派！" )
		else
			mp	= x112001_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end
	if arg == 1001 then		--苏州
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 89,143 )
		return
	end
	if arg == 1002 then		--大理
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 263, 129 )
		return
	end
	if arg == 1003 then		--洛阳
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 183, 156 )
		return
	end
	for i, mp in x112001_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
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
function x112001_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x112001_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x112001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

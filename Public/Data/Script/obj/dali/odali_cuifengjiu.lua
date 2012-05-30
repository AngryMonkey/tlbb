--大理NPC
--崔逢九
--普通

x002026_g_ScriptId	= 002026

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x002026_g_mpInfo		= {}
x002026_g_mpInfo[0]	= { "星宿", 16,  96, 152, MP_XINGSU }
x002026_g_mpInfo[1]	= { "逍遥", 14,  67, 145, MP_XIAOYAO }
x002026_g_mpInfo[2]	= { "少林",  9,  96, 127, MP_SHAOLIN }
x002026_g_mpInfo[3]	= { "天山", 17,  95, 120, MP_TIANSHAN }
x002026_g_mpInfo[4]	= { "天龙", 13,  96, 120, MP_DALI }
x002026_g_mpInfo[5]	= { "峨嵋", 15,  89, 139, MP_EMEI }
x002026_g_mpInfo[6]	= { "武当", 12, 103, 140, MP_WUDANG }
x002026_g_mpInfo[7]	= { "明教", 11,  98, 167, MP_MINGJIAO }
x002026_g_mpInfo[8]	= { "丐帮", 10,  91, 116, MP_GAIBANG }

x002026_g_Yinpiao = 40002000

x002026_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送的Impact
x002026_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送的Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x002026_OnDefaultEvent( sceneId, selfId, targetId )

	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x002026_g_Yinpiao)>=1  then
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
			AddText( sceneId, "#{XIYU_20071228_01}" )
			AddNumText( sceneId, x002026_g_ScriptId, "返回门派", 9, 1000 )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 洛阳", 9, 1001 )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 苏州", 9, 1002 )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 洛阳 - 九州商会", 9, 1006 )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 苏州 - 铁匠铺", 9, 1007 )
			if GetLevel( sceneId, selfId ) >= 75 then
				AddNumText( sceneId, x002026_g_ScriptId, "城市 - 楼兰", 9, 1011 )
			end
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 束河古镇", 9, 1010 )
			AddNumText( sceneId, x002026_g_ScriptId, "#G城市 - 凤凰古镇", 9, 1014 )
			--AddNumText( sceneId, x002026_g_ScriptId, "#G六合童子 - 昆仑福地", 9, 1013 )		
			--AddNumText( sceneId, x002026_g_ScriptId, "#G五行神力 - 圣火宫", 9, 1015 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G潮京城", 9, 1020 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G罗浮城", 9, 1021 )
			AddNumText( sceneId, x000180_g_ScriptId, "#G钧天城", 9, 1022 )	
			AddNumText( sceneId, x002026_g_ScriptId, "带我去其它门派", 9, 1012 )

			--for i, mp in x002026_g_mpInfo do
			--	AddNumText( sceneId, x002026_g_ScriptId, "门派 - "..mp[1], 9, i )
			--end
		else
			AddText( sceneId, "  你需要等级到达10级以上，才能去别的城市。" )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 大理",  9, 1003 )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 大理2", 9, 1004 )
			AddNumText( sceneId, x002026_g_ScriptId, "城市 - 大理3", 9, 1005 )
		end
		
		
		
		-- 我怎样才能去敦煌和嵩山
		AddNumText( sceneId, x002026_g_ScriptId, "我怎样才能去敦煌和嵩山", 11, 2000 )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--传送检查，解决低等级玩家带高等级玩家到大理2，3的问题
--**********************************
function x002026_EnterConditionCheck(sceneId, selfId)
	local teamSize = GetNearTeamCount(sceneId, selfId); 
	if teamSize > 1 then
		for i=0, teamSize-1 do
	  	local objId = GetNearTeamMember(sceneId, selfId, i);
	  	if GetLevel(sceneId, objId) > 9 and IsTeamFollow(sceneId, objId) == 1 then
	  		local name = GetName(sceneId, objId);
	  		local msg = format("  队员%s等级过高，不能进入！", name);
	  		return 0, msg;
	  	end  	
	  end
  end
	return 1, "ok";
end

--**********************************
--事件列表选中一项
--**********************************
function x002026_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x002026_MsgBox( sceneId, selfId, targetId, "  你队伍成员中有人有漕运货舱在身，我们驿站不能为你提供传送服务。" )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x002026_MsgBox( sceneId, selfId, targetId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。" )
		return
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x002026_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x002026_MsgBox( sceneId, selfId, targetId, x002026_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--顺利传送
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--返回门派
		if id < 0 or id >= 9 then
			x002026_MsgBox( sceneId, selfId, targetId, "  你还没有加入任何门派！" )
		else
			mp	= x002026_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	if arg == 1001 then		--洛阳
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 229, 322, 10 )
		return
	end
	if arg == 1002 then		--苏州
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 203,258, 10 )
		return
	end
	if arg == 1006 then		--洛阳商会
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 330, 272, 10 )
		return
	end
	if arg == 1007 then		--苏州铁匠铺
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 330, 224, 10 )
		return
	end
	if arg == 1020 then		--潮京城
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 562, 195, 192, 10 )
		return
	end
	if arg == 1021 then		--罗浮城
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 561, 80, 200, 10 )
		return
	end
	if arg == 1022 then		--钧天城
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 560, 56, 74, 10 )
		return
	end

	if arg == 1003 then		--大理1
		--如果玩家就在大理1则不传送
		if sceneId == 2 then
			x002026_MsgBox( sceneId, selfId, targetId, "  你已经在大理了。" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227 )
		end
		return
	end
	if arg == 1004 then		--大理2
		--如果玩家就在大理2则不传送
		if sceneId == 71 then
			x002026_MsgBox( sceneId, selfId, targetId, "  你已经在大理2了。" )
		else
			local ret, msg = x002026_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x002026_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227 )
		end
		return
	end
	if arg == 1005 then		--大理3
		--如果玩家就在大理3则不传送
		if sceneId == 72 then
			x002026_MsgBox( sceneId, selfId, targetId, "  你已经在大理3了。" )
		else
			local ret, msg = x002026_EnterConditionCheck(sceneId, selfId);
			if ret == 0 then
				x002026_MsgBox(sceneId, selfId, targetId, msg);
				return
			end
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227 )
		end
		return
	end
	for i, mp in x002026_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			return
		end
	end
	
	if arg == 1010 then		--束河古镇
		-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x002026_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "束河古镇为不加杀气场景，请注意安全。你确认要进入吗？");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1011 then		--楼兰
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end
	if arg == 1014 then		--凤凰古镇
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 180, 49, 32, 75 )
		return
	end
	if arg == 1013 then		--昆仑福地
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 421, 89, 41, 75 )
		return
	end
	if arg == 1015 then		--圣火宫
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 537, 89, 41, 75 )
		return
	end


	if arg == 1012 then		
		BeginEvent( sceneId )
			for i, mp in x002026_g_mpInfo do
				AddNumText( sceneId, x002026_g_ScriptId, "门派 - "..mp[1], 9, i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end


	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
	
end
--  add by zchw
function x002026_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--根据门派ID获取门派信息
--**********************************
function x002026_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x002026_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x002026_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

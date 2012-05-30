--束河古镇NPC
--徐霞客
--普通

x001171_g_ScriptId	= 001171

x001171_g_Yinpiao = 40002000

x001171_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送的Impact
x001171_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送的Impact提示信息

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x001171_g_mpInfo		= {}
x001171_g_mpInfo[0]	= { "星宿", 16,  96, 152, MP_XINGSU }
x001171_g_mpInfo[1]	= { "逍遥", 14,  67, 145, MP_XIAOYAO }
x001171_g_mpInfo[2]	= { "少林",  9,  96, 127, MP_SHAOLIN }
x001171_g_mpInfo[3]	= { "天山", 17,  95, 120, MP_TIANSHAN }
x001171_g_mpInfo[4]	= { "天龙", 13,  96, 120, MP_DALI }
x001171_g_mpInfo[5]	= { "峨嵋", 15,  89, 139, MP_EMEI }
x001171_g_mpInfo[6]	= { "武当", 12, 103, 140, MP_WUDANG }
x001171_g_mpInfo[7]	= { "明教", 11,  98, 167, MP_MINGJIAO }
x001171_g_mpInfo[8]	= { "丐帮", 10,  91, 116, MP_GAIBANG }

x001171_g_MsgInfo = { "#{SHGZ_001}",
											"#{SHGZ_0620_01}",
											"#{SHGZ_0620_02}",
											"#{SHGZ_0620_03}",
										}

--**********************************
--事件交互入口
--**********************************
function x001171_OnDefaultEvent( sceneId, selfId, targetId )

	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x001171_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	BeginEvent( sceneId )
	
		local msgidx = random(getn(x001171_g_MsgInfo))
		AddText( sceneId, x001171_g_MsgInfo[msgidx] )
		AddNumText( sceneId, x001171_g_ScriptId, "返回门派", 9, 1000 )
		AddNumText( sceneId, x001171_g_ScriptId, "城市 - 洛阳", 9, 1001 )
		AddNumText( sceneId, x001171_g_ScriptId, "城市 - 苏州", 9, 1002 )
		AddNumText( sceneId, x001171_g_ScriptId, "城市 - 大理", 9, 1003 )
		AddNumText( sceneId, x001171_g_ScriptId, "城市 - 洛阳 - 九州商会", 9, 1006 )
		AddNumText( sceneId, x001171_g_ScriptId, "城市 - 苏州 - 铁匠铺", 9, 1007 )
		AddNumText( sceneId, x001171_g_ScriptId, "城市 - 楼兰", 9, 1008 )
		
		AddNumText( sceneId, x001171_g_ScriptId, "带我去其它门派", 9, 1011 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001171_OnEventRequest( sceneId, selfId, targetId, eventId )
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
				x001171_MsgBox( sceneId, selfId, targetId, "  你队伍成员中有人有漕运货舱在身，我们驿站不能为你提供传送服务。" )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x001171_MsgBox( sceneId, selfId, targetId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。" )
		return
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x001171_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x001171_MsgBox( sceneId, selfId, targetId, x001171_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end
	
	--顺利传送
	local	arg	= GetNumText()

	local	mp
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--返回门派
		if id < 0 or id >= 9 then
			x001171_MsgBox( sceneId, selfId, targetId, "  你还没有加入任何门派！" )
		else
			mp	= x001171_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4], 10 )
			end
		end
		return
	end
	
	if arg == 1001 then		--洛阳
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 229, 322, 20 )
		return
	end
	if arg == 1002 then		--苏州
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 203, 258, 20 )
		return
	end
	
	if arg == 1003 then		--大理
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 375, 227, 20 )
		return
	end
	
	if arg == 1006 then		--洛阳商会
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 330, 272, 20 )
		return
	end
	if arg == 1007 then		--苏州铁匠铺
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 330, 224, 20 )
		return
	end
	
	if arg == 1008 then		--楼兰
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end

	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x001171_g_mpInfo do
				AddNumText( sceneId, x001171_g_ScriptId, "门派 - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	
	--门派....
	for i, mp in x001171_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x001171_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--根据门派ID获取门派信息
--**********************************
function x001171_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x001171_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

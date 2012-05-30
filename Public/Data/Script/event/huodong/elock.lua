--全部加锁

--脚本号
x808007_g_ScriptId	= 808007

--操作集
x808007_g_Key	=
{
	["hlp"]			= 1,		--帮助
	["lck_s"]		= 11,		--全部加锁
	["lck_sY"]	= 111,	--全部加锁，确定
	["lck_1"]		= 10,		--单个加锁
	["unl_s"]		= 21,		--我想临时解锁
	["unl_1"]		= 20,		--我想单个解锁

	["lck_set"]	= 31,		--设置二级密码
	["lck_res"]	= 30,		--修改二级密码
}

x808007_g_Msg	=
{
	["lck"]		= "#{JSJS_090206_01}",
	["ask_l"]	= "    #{PBSD_20080103_01}",
	["unl"]		= "    临时解锁后您可以进行相应的操作，下线后会自动置为上锁状态；单独解锁可打开对已上锁的物品开锁，您想解锁吗？",
	["ask_2"]   = "#r    因近期推出#G新功能：物品或宠物加锁3天后才能正式解锁#W，为防止某些玩家因误操作将全部物品加锁而影响正常游戏的情况，暂时遮罩全部加锁功能，稍后将再次开放。"
}
--帐号  to  账号

--**********************************
--脚本入口函数
--**********************************
function x808007_OnDefaultEvent( sceneId, selfId, op )

	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) == 0 then
		return
	end
	if GetLevel( sceneId, selfId ) <= 15 then
		x808007_MyNotifyTip( sceneId, selfId, "15级之后打开此功能" )
		return
	end
	if LuaFnIsStalling( sceneId, selfId ) == 1 then
		x808007_MyNotifyTip( sceneId, selfId, "摆摊状态下不可进行此操作" )
		return
	end

	--客户端开启
	if op == x808007_g_ScriptId then
		--是否已设置二级密码
		if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
			x808007_OnLockUI( sceneId, selfId )
		else
			--是否解锁二级密码
			if LuaFnIsPasswordUnlocked( sceneId, selfId, 0 ) == 1 then
				x808007_OnLockUI( sceneId, selfId )
			else
				x808007_OnUnlockUI( sceneId, selfId )
			end
		end
		return
	end
	
	local	key	= GetNumText()

	if key == x808007_g_Key["hlp"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_090}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
		return
	elseif key == x808007_g_Key["lck_s"] then
		BeginEvent( sceneId )
			AddText( sceneId, x808007_g_Msg["ask_l"] )
			AddNumText( sceneId, x808007_g_ScriptId, "确认", 2, x808007_g_Key["lck_sY"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
		return
	elseif key == x808007_g_Key["lck_1"] then
		BeginUICommand( sceneId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 5421 )
	elseif key == x808007_g_Key["unl_s"] then
		LuaFnSendOpResult( sceneId, selfId, OR_NEED_UNLOCKMINORPASSWORD )
	elseif key == x808007_g_Key["unl_1"] then
		BeginUICommand( sceneId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 5421 )
	elseif key == x808007_g_Key["lck_sY"] then
		x808007_OnLockAllObj( sceneId, selfId )
		return
	elseif key == x808007_g_Key["lck_set"] then
		--设置二级密码
		LuaFnSendOpResult( sceneId, selfId, OR_EXE_SETPASSWORD )
	elseif key == x808007_g_Key["lck_res"] then
		--修改二级密码
		LuaFnSendOpResult( sceneId, selfId, OR_EXE_CHANGEPASSWORD )
	end
	
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

end

--**********************************
--加锁界面
--**********************************
function x808007_OnLockUI( sceneId, selfId )

	BeginEvent( sceneId )
		AddText( sceneId, x808007_g_Msg["lck"] )
		AddNumText( sceneId, x808007_g_ScriptId, "全部加锁", 2, x808007_g_Key["lck_s"] )
		AddNumText( sceneId, x808007_g_ScriptId, "单个加锁", 2, x808007_g_Key["lck_1"] )
		if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
			AddNumText( sceneId, x808007_g_ScriptId, "设置二级密码", 2, x808007_g_Key["lck_set"] )
		else
			AddNumText( sceneId, x808007_g_ScriptId, "修改二级密码", 2, x808007_g_Key["lck_res"] )
		end
		AddNumText( sceneId, x808007_g_ScriptId, "关于全部加锁", 11, x808007_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )

end

--**********************************
--解锁界面
--**********************************
function x808007_OnUnlockUI( sceneId, selfId )

	BeginEvent( sceneId )
		AddText( sceneId, x808007_g_Msg["unl"] )
		AddNumText( sceneId, x808007_g_ScriptId, "我想对操作临时解锁", 2, x808007_g_Key["unl_s"] )
		AddNumText( sceneId, x808007_g_ScriptId, "我想单独对某物品解锁", 2, x808007_g_Key["unl_1"] )
		if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
			AddNumText( sceneId, x808007_g_ScriptId, "设置二级密码", 2, x808007_g_Key["lck_set"] )
		else
			AddNumText( sceneId, x808007_g_ScriptId, "修改二级密码", 2, x808007_g_Key["lck_res"] )
		end
		AddNumText( sceneId, x808007_g_ScriptId, "关于全部加锁", 11, x808007_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )

end

--**********************************
--二级密码锁定所有物品、宠物
--**********************************
function x808007_OnLockAllObj( sceneId, selfId )

	--是否已设置二级密码
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) ~= 1 then
		LuaFnSendOpResult( sceneId, selfId, OR_NEED_SETMINORPASSWORD )
	else
		SetAllItemPWLock( sceneId, selfId, 1 )
		SetAllPetPWLock( sceneId, selfId, 1 )
		x808007_MyNotifyTip( sceneId, selfId, "成功加锁" )
		BeginUICommand( sceneId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end

end

--**********************************
--醒目提示
--**********************************
function x808007_MyNotifyTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--帮会更名

--脚本号
x808009_g_ScriptId	= 808009

x808009_g_Key				=
{
	["ChgG"]					= 200,	--我要改帮会名字
	["ChgG_Y"]				= 201,	--我要改帮会名字，确认
}

--**********************************
--事件交互入口
--**********************************
function x808009_OnDefaultEvent( sceneId, selfId, targetId )

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end
	
	local	key	= GetNumText()
	if key == x808009_g_Key["ChgG"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{ChangeName_ChgG}" )
			AddNumText( sceneId, x808009_g_ScriptId, "确定", 6, x808009_g_Key["ChgG_Y"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif key == x808009_g_Key["ChgG_Y"] then
		if x808009_IsCanChangeGuildName( sceneId, selfId ) == 1 then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 5424 )
		end
	end
	
end

--**********************************
--事件列表
--**********************************
function x808009_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText( sceneId, x808009_g_ScriptId, "我要改帮会名字", 6, x808009_g_Key["ChgG"] )

end

--**********************************
--是否有资格申请帮会更名
--**********************************
function x808009_IsCanChangeGuildName( sceneId, selfId )

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end

	if GetGuildLevel( sceneId, selfId ) < 0 then
		x808009_MsgBox( sceneId, selfId, "您还没有申请帮会" )
		return 0
	end
	if GetGuildPos( sceneId, selfId ) ~= GUILD_POSITION_CHIEFTAIN then
		x808009_MsgBox( sceneId, selfId, "需要帮主才可以修改帮会名字" )
		return 0
	end
	local	GuildName	= LuaFnGetGuildName( sceneId, selfId )
	local	i, _			= strfind( GuildName, "*" )
	if i == nil then
		x808009_MsgBox( sceneId, selfId, "您不是移民玩家，或者您已经修改过名字了" )
		return 0
	end
	
	return 1

end

--**********************************
--帮会申请更名前条件检查
--**********************************
function x808009_CallBackChangeGuildNameBefore( sceneId, selfId )

	if x808009_IsCanChangeGuildName( sceneId, selfId ) == 0 then
		return 0
	end

	return 1

end

--**********************************
--帮会申请更名后结果返回
--**********************************
function x808009_CallBackChangeGuildNameAfter( sceneId, selfId, nRetType )

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end

	--更名消息返回类型
	--enum	CHANGE_NAME_RESULT
	--{
	--	CHGNAME_RE_OK					= 0 ,	// 更名成功
	--	CHGNAME_RE_ERROR ,					// 更名失败
	--	CHGNAME_RE_DBBUSY ,					// DB压力过大，请重新尝试
	--	CHGNAME_RE_NAMEERROR ,			// 不可接受的新名称
	--	CHGNAME_RE_REPEATED ,				// 名称重复
	--};
	if nRetType == 1 then
		x808009_MsgBox( sceneId, selfId, "更名失败" )
	elseif nRetType == 2 then
		x808009_MsgBox( sceneId, selfId, "DB压力过大，请重新尝试" )
	elseif nRetType == 3 then
		x808009_MsgBox( sceneId, selfId, "不可接受的新名称" )
	elseif nRetType == 4 then
		x808009_MsgBox( sceneId, selfId, "名称重复" )
	else
		x808009_MsgBox( sceneId, selfId, "恭喜您，您的帮会名字修改成功！" )
	end
	return 1

end

--**********************************
--醒目提示
--**********************************
function x808009_MsgBox( sceneId, selfId, str )

	if str == nil then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--角色更名

--脚本号
x808008_g_ScriptId	= 808008

--操作集
x808008_g_Key				=
{
	["ChgU"]					= 100,	--我要改名字
	["ChgU_Y"]				= 101,	--我要改名字，确认
	["TitP"]					= 110,	--我要更新师徒称号
	["TitP_Y"]				= 111,	--我要更新师徒称号，确认
	["TitS"]					= 120,	--我要更新夫妻称号
	["TitS_Y"]				= 121,	--我要更新夫妻称号，确认
	["TitG"]					= 130,	--我要更新帮会称号
	["TitG_Y"]				= 131,	--我要更新帮会称号，确认
}

--**********************************
--事件交互入口
--**********************************
function x808008_OnDefaultEvent( sceneId, selfId, targetId )

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end
	
	local	key	= GetNumText()
	if key == x808008_g_Key["ChgU"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{ChangeName_ChgU}" )
			AddNumText( sceneId, x808008_g_ScriptId, "确定", 6, x808008_g_Key["ChgU_Y"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif key == x808008_g_Key["TitP"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{ChangeName_TitP}" )
			AddNumText( sceneId, x808008_g_ScriptId, "确定", 6, x808008_g_Key["TitP_Y"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif key == x808008_g_Key["TitS"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{ChangeName_TitS}" )
			AddNumText( sceneId, x808008_g_ScriptId, "确定", 6, x808008_g_Key["TitS_Y"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	--dengxx
	elseif key == x808008_g_Key["TitG"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{BHJW_090217_1}" )
			AddNumText( sceneId, x808008_g_ScriptId, "确定", 6, x808008_g_Key["TitG_Y"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	------	
	elseif key == x808008_g_Key["ChgU_Y"] then
		if x808008_IsCanChangeUserName( sceneId, selfId ) == 1 then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 5423 )
		end
	elseif key == x808008_g_Key["TitP_Y"] then
		x808008_OnRefreshPrenticeTitle( sceneId, selfId, targetId )
	elseif key == x808008_g_Key["TitS_Y"] then
		x808008_OnRefreshSpouseTitle( sceneId, selfId, targetId )
 --dengxx
  elseif key == x808008_g_Key["TitG_Y"] then
		x808008_OnRefreshGuildContriTitle( sceneId, selfId, targetId )	
	------
	end
	
end

--**********************************
--事件列表
--**********************************
function x808008_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText( sceneId, x808008_g_ScriptId, "我要改名字", 6, x808008_g_Key["ChgU"] )
	AddNumText( sceneId, x808008_g_ScriptId, "我要更新师徒称号", 6, x808008_g_Key["TitP"] )
	AddNumText( sceneId, x808008_g_ScriptId, "我要更新夫妻称号", 6, x808008_g_Key["TitS"] )
  AddNumText( sceneId, x808008_g_ScriptId, "#{CHANGENAME_JW}", 6, x808008_g_Key["TitG"] )
end

--**********************************
--更新配偶称号
--**********************************
function x808008_OnRefreshSpouseTitle( sceneId, selfId, targetId )

	if LuaFnIsMarried( sceneId, selfId ) == 0 then
		x808008_MsgBox( sceneId, selfId, "您还没有结婚" )
		return
	end
	
--local	UserTitle	= LuaFnGetSpouseTitle( sceneId, selfId )
--local	i, _			= strfind( UserTitle, "*" )
--if i == nil then
--	x808008_MsgBox( sceneId, selfId, "您不符合称号更新条件" )
--	return
--end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808008_MsgBox( sceneId, selfId, "您需要与伴侣一起组队前来" )
		return
	end
	
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x808008_MsgBox( sceneId, selfId, "该队伍应该由你们夫妻二人组成" )
		return
	end
	
	if GetNearTeamCount( sceneId, selfId ) ~= 2 then
		x808008_MsgBox( sceneId, selfId, "您的伴侣不在附近" )
		return
	end

	local	ObjID0		= GetNearTeamMember( sceneId, selfId, 0 )
	local	ObjID1		= GetNearTeamMember( sceneId, selfId, 1 )
	local	SelfGUID	= LuaFnObjId2Guid( sceneId, ObjID0 )
	local	SpouGUID	= LuaFnGetSpouseGUID( sceneId, ObjID1 )
	if LuaFnIsMarried( sceneId, ObjID0 ) == 0 or
		LuaFnIsMarried( sceneId, ObjID1 ) == 0 or
		SelfGUID ~= SpouGUID then
		x808008_MsgBox( sceneId, selfId, "您的伴侣不在队伍中" )
		return
	end

	local	Name0			= GetName( sceneId, ObjID0 )
	local	Name1			= GetName( sceneId, ObjID1 )
	if LuaFnGetSex( sceneId, ObjID0 ) == 0 then
		LuaFnAwardSpouseTitle( sceneId, ObjID1, Name0 .. "的夫君" )
	else
		LuaFnAwardSpouseTitle( sceneId, ObjID1, Name0 .. "的娘子" )
	end
	DispatchAllTitle( sceneId, ObjID1 )

	if LuaFnGetSex( sceneId, ObjID1 ) == 0 then
		LuaFnAwardSpouseTitle( sceneId, ObjID0, Name1 .. "的夫君" )
	else
		LuaFnAwardSpouseTitle( sceneId, ObjID0, Name1 .. "的娘子" )
	end
	DispatchAllTitle( sceneId, ObjID0 )
	
	BeginEvent( sceneId )
		AddText( sceneId, "  恭喜您，您的夫妻称号已经更新了！" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--更新徒弟称号
--**********************************
function x808008_OnRefreshPrenticeTitle( sceneId, selfId, targetId )

	if LuaFnHaveMaster( sceneId, selfId ) == 0 then
		x808008_MsgBox( sceneId, selfId, "您还没有师傅" )
		return
	end
	
--local	UserTitle	= LuaFnGetShiTuTitle( sceneId, selfId )
--local	i, _			= strfind( UserTitle, "*" )
--if i == nil then
--	x808008_MsgBox( sceneId, selfId, "您不符合称号更新条件" )
--	return
--end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808008_MsgBox( sceneId, selfId, "您需要与师傅一起组队前来" )
		return
	end
	
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x808008_MsgBox( sceneId, selfId, "该队伍应该由你们师徒二人组成" )
		return
	end
	
	if GetNearTeamCount( sceneId, selfId ) ~= 2 then
		x808008_MsgBox( sceneId, selfId, "您的师傅不在附近" )
		return
	end

	local	ObjID0		= GetNearTeamMember( sceneId, selfId, 0 )
	local	ObjID1		= GetNearTeamMember( sceneId, selfId, 1 )
	local	ObjIDM
	if LuaFnIsMaster( sceneId, selfId, ObjID0 ) == 1 then
		ObjIDM				= ObjID0
	elseif LuaFnIsMaster( sceneId, selfId, ObjID1 ) == 1 then
		ObjIDM				= ObjID1
	else
		x808008_MsgBox( sceneId, selfId, "您的师傅不在队伍中" )
		return
	end
	
	local	NameM			= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "的弟子" )
	DispatchAllTitle( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, "  恭喜您，您的师徒称号已经更新了！" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--*********************************
--更新帮会爵位称号 dengxx
--*********************************
function x808008_OnRefreshGuildContriTitle( sceneId, selfId, targetId )
  
  --是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end
  
  --是否加入了帮会
  if GetGuildLevel( sceneId, selfId ) < 0 then
		x808008_MsgBox( sceneId, selfId, "#{BHJW_090217_2}" )
		return 0
	end
	
	--移民帮会没改名，不能更新爵位称号
	local	GuildName	= LuaFnGetGuildName( sceneId, selfId )
	local	i, _ = strfind( GuildName, "*" )
	if i ~= nil then
		x808008_MsgBox( sceneId, selfId, "#{BHJW_090217_3}" )
		return 0
	end
	
	--是否有帮会爵位称号
	local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
	if currGuildContriTitle == "" then
		x808008_MsgBox( sceneId, selfId, "#{BHJW_090217_4}" )
		return 0
	end
	
	local i,_ = strfind(currGuildContriTitle,GuildName)
	
	--爵位称号是否正确：不用改或者已经改过了
	if i ~= nil then 
	  x808008_MsgBox( sceneId, selfId, "#{BHJW_090217_5}" )
		return 0
	else
	--更新帮会爵位称号
	  local i,_ = strfind(currGuildContriTitle,"★")
	  local str = strsub(currGuildContriTitle,i)
	  local newGuildContriTitle = GuildName..str
	  AwardGuildContriTitle( sceneId, selfId, newGuildContriTitle)
		DispatchAllTitle( sceneId, selfId )
		
		BeginEvent( sceneId )
		  AddText( sceneId, "#{BHJW_090217_6}" )
	  EndEvent( sceneId )
	  DispatchEventList( sceneId, selfId, targetId )		
	end
	
end

--**********************************
--是否有资格申请角色更名
--**********************************
function x808008_IsCanChangeUserName( sceneId, selfId )

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end
	
	local	UserName	= GetName( sceneId, selfId )
	local	i, _			= strfind( UserName, "*" )
	if i == nil then
		x808008_MsgBox( sceneId, selfId, "您不是移民玩家，或者您已经修改过名字了" )
		return 0
	end
	
	return 1

end

--**********************************
--角色申请更名前条件检查
--**********************************
function x808008_CallBackChangeUserNameBefore( sceneId, selfId )

	if x808008_IsCanChangeUserName( sceneId, selfId ) == 0 then
		return 0
	end
	
	return 1

end

--**********************************
--角色申请更名后结果返回
--**********************************
function x808008_CallBackChangeUserNameAfter( sceneId, selfId, nRetType )

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
		x808008_MsgBox( sceneId, selfId, "更名失败" )
	elseif nRetType == 2 then
		x808008_MsgBox( sceneId, selfId, "DB压力过大，请重新尝试" )
	elseif nRetType == 3 then
		x808008_MsgBox( sceneId, selfId, "不可接受的新名称" )
	elseif nRetType == 4 then
		x808008_MsgBox( sceneId, selfId, "名称重复" )
	else
		x808008_MsgBox( sceneId, selfId, "恭喜您，您的名字修改成功！" )
	end
	
	return 1

end

--**********************************
--醒目提示
--**********************************
function x808008_MsgBox( sceneId, selfId, str )

	if str == nil then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

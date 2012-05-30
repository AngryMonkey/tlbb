--出师任务

--脚本号
x806007_g_ScriptId	= 806007

--出师
x806007_g_FinishAppr				= {}
x806007_g_FinishAppr["Id"]	= 1004
x806007_g_FinishAppr["Name"]= "我带着徒弟来出师了"

--提示信息
x806007_g_msg					= {}
x806007_g_msg["tem"]	= "  需要师徒2人组队来找我才能出师。"
x806007_g_msg["ner"]	= "  只有2人都走到我身边才可以出师。"
x806007_g_msg["lev"]	= "  徒弟等级达到40级才能出师。"
x806007_g_msg["dad"]	= "  你还没有收徒。"
x806007_g_msg["itm"]	= "  师徒2人的背包中，分别至少要有一个普通物品的空格。"

--出师奖励
x806007_g_itm		= { 30008001, "出师糖豆" }

--**********************************
--任务入口函数
--**********************************
function x806007_OnDefaultEvent( sceneId, selfId, targetId )
	local	tId	= x806007_CheckAccept( sceneId, selfId, targetId )
	if tId == 0 then
		return
	end

	x806007_OnAccept( sceneId, selfId, targetId, tId )
end

--**********************************
--列举事件
--**********************************
function x806007_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806007_g_ScriptId, x806007_g_FinishAppr["Name"] , 6, -1 )
end

--**********************************
--检测接受条件
--**********************************
function x806007_CheckAccept( sceneId, selfId, targetId )
	--(1)组队中只有师徒两个人
	if LuaFnHasTeam( sceneId, selfId ) == 0 or LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x806007_MsgBox( sceneId, selfId, targetId, x806007_g_msg["tem"] )
		return 0
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		x806007_MsgBox( sceneId, selfId, targetId, x806007_g_msg["ner"] )
		return 0
	end

	local	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 or LuaFnIsCanDoScriptLogic( sceneId, tId ) ~= 1 then
		return 0
	end

	--(2)徒弟是否达到40级
	if LuaFnGetLevel( sceneId, tId ) < 40 then
		x806007_MsgBox( sceneId, selfId, targetId, x806007_g_msg["lev"] )
		return 0
	end

	--(3)是否是师傅关系
	if LuaFnIsPrentice( sceneId, selfId, tId ) ~= 1 then
		x806007_MsgBox( sceneId, selfId, targetId, x806007_g_msg["dad"] )
		return 0
	end

	--(4)双方背包中必须有一个空间
	LuaFnBeginAddItem( sceneId )
	LuaFnAddItem( sceneId, x806007_g_itm[1], 1 )
	if LuaFnEndAddItem( sceneId, selfId ) ~= 1 or LuaFnEndAddItem( sceneId, tId ) ~= 1 then
		x806007_MsgBox( sceneId, selfId, targetId, x806007_g_msg["itm"] )
		return 0
	end

	return tId
end

--**********************************
--接受
--**********************************
function x806007_OnAccept( sceneId, selfId, targetId, tId )
	--师傅, 师傅对徒弟的友好度
	local	fp_st	= LuaFnGetFriendPoint( sceneId, selfId, tId )
	--徒弟，徒弟对师傅的友好度
	local	fp_ts	= LuaFnGetFriendPoint( sceneId, tId, selfId )
	local	lv_t	= LuaFnGetLevel( sceneId, tId )

	--(1)如果徒弟等级是[40，45]，并且双方友好度>=300
	if lv_t >= 40 and lv_t <= 45 and fp_st >= 300 and fp_ts >=300 then
		--LuaFnAddItemListToHuman( sceneId, selfId )
		--LuaFnAddItemListToHuman( sceneId, tId )

		--师德点相关
		--给师傅增加师德（X=0-1000000） N=M＋MIN(X=500, 师父对徒弟的友好度*T)
		--local	_M	= 10		--基数
		--local	_T	= 5			--加权指数
		--local	MoralPoint	--师德点数
		--if fp_st * _T < 500 then
		--	MoralPoint= _M + fp_st * _T
		--else
		--	MoralPoint= _M + 500
		--end

		--师傅
		x806007_MsgBox( sceneId, selfId, targetId, "  出师成功！" )
		Msg2Player( sceneId, selfId, "出师成功！", MSG2PLAYER_PARA )
		Msg2Player( sceneId, selfId, "你得到"..x806007_g_itm[2].."一个。", MSG2PLAYER_PARA )
		--Msg2Player( sceneId, selfId, "得到师德点数"..MoralPoint.."。", MSG2PLAYER_PARA )

		--徒弟
		x806007_MsgBox( sceneId, tId, targetId, "  出师成功！" )
		Msg2Player( sceneId, tId, "出师成功！", MSG2PLAYER_PARA )
		Msg2Player( sceneId, tId, "你得到"..x806007_g_itm[2].."一个。", MSG2PLAYER_PARA )

		--累积师德点数
		--MoralPoint	= MoralPoint + LuaFnGetMasterMoralPoint( sceneId, selfId )
		--if MoralPoint > 1000000 then
		--	MoralPoint= 1000000
		--end
		--LuaFnSetMasterMoralPoint( sceneId, selfId, MoralPoint )
		
		local	title
		local MasterName	= LuaFnGetName( sceneId, selfId )
		--师傅称号
		--title	= x806007_GetTitle( MoralPoint )
		--if title ~= "" then
		--	AwardShiTuTitle( sceneId, selfId, title )
		--	DispatchAllTitle( sceneId, selfId )
		--	Msg2Player( sceneId, selfId, "获得称号："..title.."。", MSG2PLAYER_PARA )
		--end

		--徒弟称号
		title	= MasterName.."之徒"
		AwardShiTuTitle( sceneId, tId, title )
		DispatchAllTitle( sceneId, tId )
		Msg2Player( sceneId, tId, "获得称号："..title.."。", MSG2PLAYER_PARA )

	--(2)如果徒弟等级大于45，或者双方友好度小于300
	else
		local	msg	= "由于友好度不到300或者徒弟等级大于45级，没有奖励。"
		--师傅
		x806007_MsgBox( sceneId, selfId, targetId, "  出师成功！"..msg )
		Msg2Player( sceneId, selfId, "出师成功！", MSG2PLAYER_PARA )
		Msg2Player( sceneId, selfId, msg, MSG2PLAYER_PARA )
	
		--徒弟
		x806007_MsgBox( sceneId, tId, targetId, "  出师成功！"..msg )
		Msg2Player( sceneId, tId, "出师成功！", MSG2PLAYER_PARA )
		Msg2Player( sceneId, tId, msg, MSG2PLAYER_PARA )
	end

	--取消师徒关系
	LuaFnFinishAprentice( sceneId, tId, selfId )
end

--**********************************
--根据师德点，获取称号
--**********************************
function x806007_GetTitle( MoralPoint )
	--local	mp	= MoralPoint
	--if mp >= 100000 then
	--	return "桃李满天下"
	--elseif mp >= 50000 then
	--	return "诲人不倦"
	--elseif mp >= 10000 then
	--	return "一代名师"
	--elseif mp >= 5000 then
	--	return "麻辣教师"
	--elseif mp >= 2000 then
	--	return "为人师表"
	--elseif mp >= 100 then
	--	return "初为人师"
	--end

	return ""
end

--**********************************
--对话窗口信息提示
--**********************************
function x806007_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--师德等级升级任务

--脚本号
x806015_g_ScriptId = 806015

--事件
x806015_g_Update					= {}
x806015_g_Update["id"]		= 1000
x806015_g_Update["wu"]		= 1001
x806015_g_Update["uw"]		= 1002

--提示信息
x806015_g_msg					= {}
x806015_g_msg["up"]	= "我要提升我的师德等级"
x806015_g_msg["un"]	= "  你的师德等级已达最高，无法提升。"
x806015_g_msg["nv"]	= "  你的善恶值不足，无法提升。"
x806015_g_msg["uc"]	= "  提升到A要用B点善恶值。"
x806015_g_msg["wu"]	= "我要提升我的师德等级"
x806015_g_msg["uw"]	= "我还是不想提升了"
x806015_g_msg["ul"]	= "  只有等级大于20级才有资格申请师傅称号。"

x806015_g_Title		={}
x806015_g_Title[1] = "初级师傅"
x806015_g_Title[2] = "中级师傅"
x806015_g_Title[3] = "高级师傅"
x806015_g_Title[4] = "一代名师"


--**********************************
--任务入口函数 请求收徒
--**********************************
function x806015_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	--升级确认
	if key == x806015_g_Update["id"] then
		x806015_Upgrade( sceneId, selfId, targetId )
		return 0
	end
	

	--同意升级
	if key == x806015_g_Update["wu"] then
		if x806015_DoUpgrade( sceneId, selfId, targetId ) == 0 then
			return 0
		end
		
		--BeginUICommand( sceneId )
		--UICommand_AddInt( sceneId, targetId )
		--EndUICommand( sceneId )
		--DispatchUICommand( sceneId, selfId, 1000 )

		local msg = "您的师德等级提升到" .. tostring( LuaFnGetmasterLevel( sceneId, selfId ) .. "级。" )
		x806015_MessageBox( sceneId, selfId, targetId, "  "..msg )
		Msg2Player( sceneId, selfId, msg, MSG2PLAYER_PARA )
		return 0
	end
	
	--不同意升级
	if key == x806015_g_Update["uw"] then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
--列举事件
--**********************************
function x806015_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x806015_g_ScriptId, x806015_g_msg["up"], 6, x806015_g_Update["id"] )
end

--**********************************
--检测接受条件
--**********************************
function x806015_CheckAccept( sceneId, selfId, targetId )
end

--**********************************
--接受
--**********************************
function x806015_OnAccept( sceneId, selfId, targetId )
	x806015_OnConfirm( sceneId, selfId, targetId )
end

--**********************************
--提交
--**********************************
function x806015_OnSubmit( sceneId, selfId, targetId, tId )
end

--**********************************
--拒绝
--**********************************
function x806015_OnCancel( sceneId, selfId, targetId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806015_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--提升师德等级确认对话框
--**********************************
function x806015_Upgrade( sceneId, selfId, targetId )
	local HumanLevel = LuaFnGetLevel( sceneId, selfId )
	local level = LuaFnGetmasterLevel( sceneId, selfId )
	
	if HumanLevel < 20 then
		x806015_MessageBox( sceneId, selfId, targetId, x806015_g_msg["ul"] )
		return 0
	end
	
	--检查是否已经升级到最大了
	if level >= 4 then
		x806015_MessageBox( sceneId, selfId, targetId, x806015_g_msg["un"] )
		return 0
	end
	
	--计算需要的善恶值
	local exp = 0
	
	if level == 0 and HumanLevel < 60 then
		exp = 500
	elseif level == 1 then
		exp = 5000
	elseif level == 2 then
		exp = 25000
	elseif level == 3 then
		exp = 50000
	end
	
	local text = "  将师德等级提升到" .. tostring( level + 1 ) .. "级，会消耗善恶值" .. tostring( exp ) .. "点。"
	BeginEvent( sceneId )
		AddText( sceneId, text )
		AddNumText( sceneId, x806015_g_ScriptId, x806015_g_msg["wu"], 6, x806015_g_Update["wu"] )
		AddNumText( sceneId, x806015_g_ScriptId, x806015_g_msg["uw"], 8, x806015_g_Update["uw"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	return 1
end

function x806015_DoUpgrade( sceneId, selfId, targetId )

	local HumanLevel = LuaFnGetLevel( sceneId, selfId )
	local level = LuaFnGetmasterLevel( sceneId, selfId )
	if level >= 4 then
--	x806015_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	--计算需要的善恶值
	local exp = 0
	if level == 0 and HumanLevel < 60 then
		exp = 500
	elseif level == 1 then
		exp = 5000
	elseif level == 2 then
		exp = 25000
	elseif level == 3 then
		exp = 50000
	end
	
	--检查善恶值
	local gbvalue = LuaFnGetHumanGoodBadValue( sceneId, selfId )
	if gbvalue < exp then
		local msg = "  您的善恶值不足，您目前的善恶值为" .. tostring( gbvalue ) .. "。"
		x806015_MessageBox( sceneId, selfId, targetId, msg )
		return 0
	end
	
	--提升师德等级
	level = level + 1
	LuaFnSetmasterLevel( sceneId, selfId, level )
	
	--扣除善恶值
	gbvalue = gbvalue - exp
	LuaFnSetHumanGoodBadValue( sceneId, selfId, gbvalue )
	
	--修改师德等级相关称号
	AwardMasterTitle( sceneId, selfId, x806015_g_Title[level] )
	DispatchAllTitle( sceneId, selfId )
	SetCurTitle( sceneId, selfId, 27, 0 )

	--全球公告
	local	nam	= GetName( sceneId, selfId )
	local	str	= format( "#I恭喜#W#{_INFOUSR%s}#I成功获得#G%s#I的称号，现在可以收其他玩家为徒了。", nam, x806015_g_Title[level] )
	AddGlobalCountNews( sceneId, str )
	
	--特效与音效
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )

	return level
end

--苏州NPC
--云霏霏
--一般

--脚本号
x001050_g_ScriptId	= 001050

x001050_g_shoptableindex	= 27

x001050_g_eventList	= { 800103, 800104 , 800106, 800101, 800102, 800108}
x001050_g_miscEventId = 311111;

x001050_g_key				= {}
x001050_g_key["buy"]= 0		--购买珍兽用品
x001050_g_key["ask"]= 1		--查询珍兽成长率
x001050_g_key["rep"]= 2		--确认查询
x001050_g_key["i_pc"]= 5		--发布征友信息 必需=5
x001050_g_key["ask_pc"]= 6		--征友 必需=6
x001050_g_key["ask_prcr"]= 7		--查询繁殖的珍兽
x001050_g_key["pet_help"]= 10		--珍兽相关介绍
x001050_g_key["pet_help_savvy"]= 11		--提升珍兽悟性介绍
x001050_g_key["pet_help_prcr"]= 12		--珍兽繁殖介绍

--**********************************
--事件交互入口
--**********************************
function x001050_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{OBJ_suzhou_0019}" )
		
		AddNumText( sceneId, x001050_g_ScriptId, "珍兽相关介绍", 11, x001050_g_key["pet_help"] )
		
		AddNumText( sceneId, x001050_g_ScriptId, "购买珍兽用品", 7, x001050_g_key["buy"] )
		AddNumText( sceneId, x001050_g_ScriptId, "查询珍兽成长率", 6, x001050_g_key["ask"] )
		AddNumText(sceneId,x001050_g_ScriptId,"发布征友信息",6,x001050_g_key["i_pc"])
		AddNumText(sceneId,x001050_g_ScriptId,"征友",6,x001050_g_key["ask_pc"])
		
		CallScriptFunction( 800101, "OnEnumerate", sceneId, selfId, targetId )
		CallScriptFunction( 800102, "OnEnumerate", sceneId, selfId, targetId )
		
		AddNumText(sceneId,x001050_g_ScriptId,"查询繁殖的珍兽",6,x001050_g_key["ask_prcr"])

		CallScriptFunction( 800103, "OnEnumerate", sceneId, selfId, targetId )
		CallScriptFunction( 800104, "OnEnumerate", sceneId, selfId, targetId )
		CallScriptFunction( 800106, "OnEnumerate", sceneId, selfId, targetId )
		--CallScriptFunction( 800108, "OnEnumerate", sceneId, selfId, targetId )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001050_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == x001050_g_ScriptId then
		local key	= GetNumText()
		if key == x001050_g_key["pet_help"] then
			BeginEvent(sceneId)	
				AddNumText( sceneId, x001050_g_ScriptId, "提升珍兽悟性介绍", 11, x001050_g_key["pet_help_savvy"] )
				AddNumText(sceneId, x001050_g_ScriptId,"珍兽繁殖介绍",11,x001050_g_key["pet_help_prcr"]);
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		elseif key == x001050_g_key["pet_help_savvy"] then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_059}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		elseif key == x001050_g_key["pet_help_prcr"] then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_057}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		--购买珍兽用品
		elseif key == x001050_g_key["buy"] then
			DispatchShopItem( sceneId, selfId,targetId, x001050_g_shoptableindex )

		--查询珍兽成长率
		elseif key == x001050_g_key["ask"] then
--			BeginEvent( sceneId )
--			AddText( sceneId, " 查询一次需要收取#{_MONEY100}的费用。" ) -- zchw
--			AddNumText( sceneId, x001050_g_ScriptId, "确定", -1, x001050_g_key["rep"] )
--			EndEvent( sceneId )
--			DispatchEventList( sceneId, selfId, targetId )

		--确认查询
--		elseif key == x001050_g_key["rep"] then
			x001050_OnConfirm( sceneId, selfId, targetId )
		--发布征友信息/征友
		elseif key == x001050_g_key["i_pc"] or key == x001050_g_key["ask_pc"] then
			local sel = GetNumText();
			CallScriptFunction( x001050_g_miscEventId, "OnEnumerate",sceneId, selfId, targetId, sel)
		--确认查询
		elseif key == x001050_g_key["ask_prcr"] then
			LuaFnGetPetProcreateInfo(sceneId, selfId);
		else
		end

	--其他事件
	else
		for i, findId in x001050_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
				return
			end
		end
	end
end

--**********************************
--确认查询
--**********************************
function x001050_OnConfirm( sceneId, selfId, targetId )
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, 6 )				--珍兽查询分支
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 3 )	--调用珍兽界面
end

--**********************************
--查询珍兽成长率
--**********************************
function x001050_OnInquiryForGrowRate( sceneId, selfId, petHid, petLid )
--local	num		= LuaFnGetPetCount( sceneId, selfId )
--if num <= 0 or index < 0 or index >= num then
--	x001050_MsgTip( sceneId, selfId, "  对不起，您没有选择珍兽！" )
--	return 0
--end

	-- 如果这个珍兽已经查询过生长率，就给玩家一个提示，然后不在扣东西了
	if LuaFnIsPetGrowRateByGUID(sceneId, selfId, petHid, petLid) > 0   then
		BeginEvent( sceneId )
			AddText( sceneId, "这只宠物已经查询过成长率了。" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		
		return
	end
	
	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --交子普及 Vega
	if PlayerMoney < 100 then
		x001050_MsgTip( sceneId, selfId, "  对不起，您身上的金钱不足#{_EXCHG100}！" )
		return 0
	end

	local	lev		= LuaFnGetPetLevelByGUID( sceneId, selfId, petHid, petLid )
	if lev < 1 then -- zchw 
		x001050_MsgTip( sceneId, selfId, "  对不起，只能查询10级以上珍兽的成长率！" )
		return 0
	end

	--扣除金钱
	local costJ , costM = LuaFnCostMoneyWithPriority( sceneId, selfId, 100 )		--交子普及 Vega
	if costM ~= nil and costJ ~= nil then
		if costJ > 0 then
			local str = format("你花费了#{_EXCHG%d}",costJ ) 
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
		end
		if costM > 0 then
			local str = format("你花费了#{_MONEY%d}",costM ) 
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
		end
		Msg2Player( sceneId, selfId, "用于查询珍兽的成长率。", MSG2PLAYER_PARA )
	else
		return
	end

	local	nGrowLevel	= LuaFnGetPetGrowRateByGUID( sceneId, selfId, petHid, petLid )
	local	strTbl			= { "普通", "优秀", "杰出", "卓越", "完美" }
	if( nGrowLevel < 1 or nGrowLevel > getn( strTbl ) ) then
		nGrowLevel				= 1
	end
	local	strLevel		= strTbl[nGrowLevel]

	--将获取数据传给Client
	BeginUICommand( sceneId )
		UICommand_AddString( sceneId, "key="..1 )						--关键字，1表示成功执行
		UICommand_AddString( sceneId, "rat="..nGrowLevel )	--成长率
		UICommand_AddString( sceneId, "gld="..100 )					--花费金钱
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 4 )
	
	--当查询的珍兽为宝宝、变异，并且成长率查询结果是3、4或5时，发布世界公告
	local	rnd			= random( 4 )
	local	msg			= {}
	local	typ			= LuaFnGetPetTypeByGUID( sceneId, selfId, petHid, petLid )
	if( nGrowLevel >= 4 and nGrowLevel <= 5 and typ ~= 2 ) then -- zchw
		if ( sceneId == 1 ) then		--苏州NPC
			msg[1]	= format( "#W#{_INFOUSR%s}#{GLBB_1_A}#Y%s#I的#{_INFOMSG%s}！",
				GetName( sceneId, selfId ),
				strLevel,
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ) )
			msg[2]	= format( "#W#{_INFOUSR%s}#{GLBB_2_A}#{_INFOMSG%s}#{GLBB_2_B}#Y%s#I#{GLBB_2_C}",
				GetName( sceneId, selfId ),
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				strLevel )
			msg[3]	= format( "#I一只#{_INFOMSG%s}#{GLBB_3_A}#Y%s#I#{GLBB_3_B}#{_INFOUSR%s}#{GLBB_3_C}",
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				strLevel,
				GetName( sceneId, selfId ) )
			msg[4]	= format( "#W#{_INFOUSR%s}#{GLBB_4_A}#{_INFOMSG%s}#{GLBB_4_B}#Y%s#I#{GLBB_4_C}",
				 GetName( sceneId, selfId ),
				 LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				 strLevel )
			--全球公告
			AddGlobalCountNews( sceneId, msg[rnd] )
		elseif ( sceneId == 0 ) then			--洛阳NPC
			msg[1]	= format( "#W#{_INFOUSR%s}#{LLBB_1_A}#Y%s#I的#{_INFOMSG%s}！",
				GetName( sceneId, selfId ),
				strLevel,
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ) )
			msg[2]	= format( "#W#{_INFOUSR%s}#{LLBB_2_A}#{_INFOMSG%s}#{LLBB_2_B}#Y%s#I#{LLBB_2_C}",
				GetName( sceneId, selfId ),
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				strLevel )
			msg[3]	= format( "#I一只#{_INFOMSG%s}#{LLBB_3_A}#Y%s#I#{LLBB_3_B}#{_INFOUSR%s}#{LLBB_3_C}",
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				strLevel,
				GetName( sceneId, selfId ) )
			msg[4]	= format( "#W#{_INFOUSR%s}#{LLBB_4_A}#{_INFOMSG%s}#{LLBB_4_B}#Y%s#I#{LLBB_4_C}",
				 GetName( sceneId, selfId ),
				 LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				 strLevel )
			--全球公告
			AddGlobalCountNews( sceneId, msg[rnd] )
		end
	end

	return 1
end

--**********************************
--对话窗口信息提示
--**********************************
function x001050_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目系统信息提示
--**********************************
function x001050_MsgTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

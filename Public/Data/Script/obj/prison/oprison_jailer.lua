--监狱NPC
--狱卒
--普通

x077011_g_ScriptId	= 077011

--操作集
x077011_g_Key				=
{
	["dlg"]	= 10,	--这里是哪儿？
	["out"]	= 11,	--我要出去
	["sn0"]	= 0,	--去洛阳
	["sn1"]	= 1,	--去苏州
	["sn2"]	= 2,	--去大理
}

--获释条件，最小杀气值
x077011_g_PKMinVal	= 8--[tx43640]由4改为8

--**********************************
--事件交互入口
--**********************************
function x077011_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
			AddText(sceneId, "#{PRISON_081120_01}")
			AddNumText( sceneId, x077011_g_ScriptId, "我要出去", 9, x077011_g_Key["out"] )
			AddNumText( sceneId, x077011_g_ScriptId, "这里是哪儿？", 11, x077011_g_Key["dlg"] )
			AddNumText( sceneId, x077011_g_ScriptId, "我要伸冤", 9, 21 )
			AddNumText( sceneId, x077011_g_ScriptId, "我有特赦令", 9, 15 )
			AddNumText( sceneId, x077011_g_ScriptId, "什么是伸冤？", 11, 22 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x077011_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	local	val	= LuaFnGetHumanPKValue( sceneId, selfId )	--杀气值
	
	if key == 15 then
		
				
		local nItemCount = GetItemCount(sceneId, selfId, 30008019);
		if nItemCount <= 0 then
			x077011_MsgBox( sceneId, selfId, targetId, "#{TeSheLing_00}" )
			return 0;
		end
		
		if IsWaiGuaUser( sceneId, selfId ) > 0 then
			x077011_MsgBox( sceneId, selfId, targetId, "您因为使用外挂被抓进监狱，因此无法使用特赦令。" )
			return 0;
		end
		
		local bRet = 0;
		
		local	bagpos = GetItemBagPos( sceneId, selfId, 30008019, 0 )
	
		if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "此物品已被锁定！" )
				return 0;
			end
		end

		bRet = 1;
		
		if bRet > 0 then
			BeginEvent( sceneId )
				AddText( sceneId, "  恭喜你，你终于可以出去了，记得出去之后切莫再乱杀无辜，否则我是不会饶你的，你想去哪个城市？" )
				AddNumText( sceneId, x077011_g_ScriptId, "洛阳", 9, 3 )
				AddNumText( sceneId, x077011_g_ScriptId, "苏州", 9, 4 )
				AddNumText( sceneId, x077011_g_ScriptId, "大理", 9, 5 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			
			
		end
		
		return 0;
	end
	
	if key == 21 then
		x077011_ShenYuan( sceneId, selfId, targetId )
		return 0
	elseif key == 22 then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_00}" )
		return 0
	end
	
	--这里是哪儿？
	if key == x077011_g_Key["dlg"]	then
			x077011_MsgBox( sceneId, selfId, targetId, "#{function_help_087}" )
			return 0

	--我要出去
	elseif key == x077011_g_Key["out"] then
		if val > x077011_g_PKMinVal then
			x077011_MsgBox( sceneId, selfId, targetId, "  您现在的杀气为"..val.."，只有小于等于"..x077011_g_PKMinVal.."点的时候才能出去。" )
			return 0
		end

		BeginEvent( sceneId )
			AddText( sceneId, "  恭喜你，你终于可以出去了，记得出去之后切莫再乱杀无辜，否则我是不会饶你的，你想去哪个城市？" )
			AddNumText( sceneId, x077011_g_ScriptId, "洛阳", 9, x077011_g_Key["sn0"] )
			AddNumText( sceneId, x077011_g_ScriptId, "苏州", 9, x077011_g_Key["sn1"] )
			AddNumText( sceneId, x077011_g_ScriptId, "大理", 9, x077011_g_Key["sn2"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--去洛阳
	elseif key == x077011_g_Key["sn0"] then
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 0, 230, 321 )

	--去苏州
	elseif key == x077011_g_Key["sn1"] then
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 1, 203,258 )

	--去大理
	elseif key == x077011_g_Key["sn2"] then
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 2, 375, 227 )
	
	elseif key == 3 then
			
		local	bagpos1 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos1, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "此物品已被锁定！" )
				return 0;
			end
		end
	
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 0, 132, 183 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	elseif key == 4 then
	
		local	bagpos2 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos2, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "此物品已被锁定！" )
				return 0;
			end
		end
	
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 1, 114,162 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	elseif key == 5 then
	
		local	bagpos3 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos3, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "此物品已被锁定！" )
				return 0;
			end
		end
	
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 2, 241, 138 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	end
	
	if val > x077011_g_PKMinVal then --[tx43640]原为>= 5，应改为>x077011_g_PKMinVal,其实应该是[8,10]中的一个值 
		LuaFnSetHumanPKValue(sceneId, selfId, x077011_g_PKMinVal)--[tx43640]原为4，应改为x077011_g_PKMinVal
		
		-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
		local LogInfo	= format( "[ChangePKValue]:Prison sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),			
				val,
				LuaFnGetHumanPKValue(sceneId, selfId) )
		WriteCheckLog( sceneId, selfId, LogInfo )
		
	end
	
	return 1

end

--**********************************
--事件列表选中一项
--**********************************
function x077011_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end


--**********************************
--伸冤
--**********************************
function x077011_ShenYuan( sceneId, selfId, targetId )

	--判断杀气....
	if LuaFnGetHumanPKValue( sceneId, selfId ) > x077011_g_PKMinVal then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_01}" )
		return
	end
	
	--判断当前是否禁止伸冤....
	if GetMissionFlag( sceneId, selfId, MF_CannotPrisonShenyuan ) == 1 then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_02}" )
		return
	end
	
	--判断今天是否已经用过伸冤了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_PRISON_SHENYUAN_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_03}" )
		return
	end
	
	--设置今天已经用过伸冤了....
	SetMissionData( sceneId, selfId, MD_PRISON_SHENYUAN_DAYTIME, CurDayTime )
	
	--弹出图形验证让玩家回答问题....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	LuaFnSendGuajiQuestion( sceneId, selfId )

end


--洛阳NPC
--龚彩丽
--普通

x000132_g_ScriptId	= 000132

--操作集
x000132_g_Key				=
{
	["chg"]	=	1,			--我想兑换墨镜猫
	["in1"]	= 2,			--关于兑换
	["in2"]	= 3,			--关于暗金宝箱
	["bak"]	= 4,			--返回上一页
}

--事件
x000132_g_eventList = { 808065 }

--兑换列表
x000132_g_ChangeLst	=
{
	--描述，玩家可得到的物品，GetNumText，兑换所需物品，兑换所需物品数量
	[1]	= { des = "兑换携带等级5级的墨镜猫",  id = 30505109, key = 101, NeedItm = 30008026, NeedNum = 30 },
	[2]	= { des = "兑换携带等级45级的流行猫", id = 30505110, key = 102, NeedItm = 30008026, NeedNum = 40 },
	[3]	= { des = "兑换携带等级55级的时尚猫", id = 30505111, key = 103, NeedItm = 30008026, NeedNum = 43 },
	[4]	= { des = "兑换携带等级65级的偶像猫", id = 30505112, key = 104, NeedItm = 30008026, NeedNum = 46 },
	[5]	= { des = "兑换携带等级75级的冠军猫", id = 30505113, key = 105, NeedItm = 30008026, NeedNum = 50 },
	[6]	= { des = "兑换携带等级85级的吉祥猫", id = 30505154, key = 106, NeedItm = 30008026, NeedNum = 80 },
}

--**********************************
--事件交互入口
--**********************************
function x000132_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "#{ANXIANG_DLG}" )
		AddNumText( sceneId, x000132_g_ScriptId, "我想兑换墨镜猫", 6, x000132_g_Key["chg"] )
		AddNumText( sceneId, x000132_g_ScriptId, "关于兑换", 11, x000132_g_Key["in1"] )
		AddNumText( sceneId, x000132_g_ScriptId, "关于暗金宝箱", 11, x000132_g_Key["in2"] )	
		
		local i, eventId
		for i, eventId in x000132_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件列表选中一项
--**********************************
function x000132_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	--抽奖活动
	local i, findId
	for i, findId in x000132_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if key == x000132_g_Key["chg"] then
		BeginEvent( sceneId )
			AddText( sceneId, "    您想兑换什么携带等级的珍兽？" )
			for i = 1, getn( x000132_g_ChangeLst ) do
				AddNumText( sceneId, x000132_g_ScriptId, x000132_g_ChangeLst[i].des, 6, x000132_g_ChangeLst[i].key )
			end
			AddNumText( sceneId, x000132_g_ScriptId, "返回上一页", -1, x000132_g_Key["bak"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif key == x000132_g_Key["in1"] then
		x000132_MsgBox( sceneId, selfId, targetId, "#{ANXIANG_CHG}" )

	elseif key == x000132_g_Key["in2"] then
		x000132_MsgBox( sceneId, selfId, targetId, "#{ANXIANG_INF}" )
	
	elseif key == x000132_g_Key["bak"] then
		x000132_OnDefaultEvent( sceneId, selfId, targetId )

	else
		for i = 1, getn( x000132_g_ChangeLst ) do
			if key == x000132_g_ChangeLst[i].key then
				x000132_OnMyChange( sceneId, selfId, targetId, x000132_g_ChangeLst[i] )
				break
			end
		end
	end

end

--**********************************
--兑换
--**********************************
function x000132_OnMyChange( sceneId, selfId, targetId, unt )

	if unt == nil then
		return
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, unt.NeedItm ) < unt.NeedNum then
		x000132_MsgBox( sceneId, selfId, targetId, "    "..unt.des.."，您身上的可用古瓷碎片不足"..unt.NeedNum.."个。（古瓷碎片可以通过打开暗金宝箱获得）" )
		return
	end
	
	BeginAddItem( sceneId )
	AddItem( sceneId, unt.id, 1 )
	if EndAddItem( sceneId, selfId ) > 0 then
		if LuaFnDelAvailableItem( sceneId, selfId, unt.NeedItm, unt.NeedNum ) == 1 then
			AddItemListToHuman( sceneId, selfId )
		else
			x000132_MsgBox( sceneId, selfId, targetId, "    扣除物品失败！" )
			return
		end
	else
		x000132_MsgBox( sceneId, selfId, targetId, "    对不起，您的背包已满，无法兑换。" )
		return
	end
	
	local	szTran	= GetItemTransfer( sceneId, selfId, 0 )
	local szUser	= "#{_INFOUSR"..GetName( sceneId, selfId ).."}"
	local szItem	= "#{_INFOMSG"..szTran.."}"
	local	szMsg		= format( "#W%s#cff99cc历尽千辛为#G洛阳（111，163）#Y龚彩丽#cff99cc找齐了#Y古瓷碎片#cff99cc，龚彩丽献上%s作为感谢。", szUser, szItem )
	x000132_MsgBox( sceneId, selfId, targetId, "    您成功的兑换了"..GetItemName( sceneId, unt.id ).."。" )
	BroadMsgByChatPipe( sceneId, selfId, szMsg, 4 )

end

--**********************************
--Message Box
--**********************************
function x000132_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

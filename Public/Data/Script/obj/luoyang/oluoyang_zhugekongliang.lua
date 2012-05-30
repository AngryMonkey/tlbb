--洛阳NPC
--诸葛孔亮
--算命，以后可能成为循环任务

--脚本号
x000077_g_ScriptId = 000077

x000077_g_ControlScript = 050026


--兑换列表
x000077_g_ChangeLst	=
{
	--玩家可得到的物品，兑换所需物品，兑换所需物品数量
	--4级
	[1]	= { id = 50401002, NeedItm = 30504031, NeedNum = 72 },
	[2]	= { id = 50401001, NeedItm = 30504031, NeedNum = 72 },
	[3]	= { id = 50403001, NeedItm = 30504031, NeedNum = 72 },
	[4]	= { id = 50414001, NeedItm = 30504031, NeedNum = 72 },
	[5]	= { id = 50402006, NeedItm = 30504031, NeedNum = 72 },
	[6]	= { id = 50402007, NeedItm = 30504031, NeedNum = 72 },
	[7]	= { id = 50402005, NeedItm = 30504031, NeedNum = 72 },
	[8]	= { id = 50402008, NeedItm = 30504031, NeedNum = 72 },
	[9]	= { id = 50413006, NeedItm = 30504031, NeedNum = 72 },
	[10] = { id = 50413004, NeedItm = 30504031, NeedNum = 72 },
	
	
	--5级
	[11]	= { id = 50501002, NeedItm = 30504032, NeedNum = 72 },
	[12]	= { id = 50501001, NeedItm = 30504032, NeedNum = 72 },
	[13]	= { id = 50503001, NeedItm = 30504032, NeedNum = 72 },
	[14]	= { id = 50514001, NeedItm = 30504032, NeedNum = 72 },
	[15]	= { id = 50502006, NeedItm = 30504032, NeedNum = 72 },
	[16]	= { id = 50502007, NeedItm = 30504032, NeedNum = 72 },
	[17]	= { id = 50502005, NeedItm = 30504032, NeedNum = 72 },
	[18]	= { id = 50502008, NeedItm = 30504032, NeedNum = 72 },
	[19]	= { id = 50513006, NeedItm = 30504032, NeedNum = 72 },
	[20]	= { id = 50513004, NeedItm = 30504032, NeedNum = 72 },
	
	--6级
	[21]	= { id = 50601002, NeedItm = 30504033, NeedNum = 72 },
	[22]	= { id = 50601001, NeedItm = 30504033, NeedNum = 72 },
	[23]	= { id = 50603001, NeedItm = 30504033, NeedNum = 72 },
	[24]	= { id = 50614001, NeedItm = 30504033, NeedNum = 72 },
	[25]	= { id = 50602006, NeedItm = 30504033, NeedNum = 72 },
	[26]	= { id = 50602007, NeedItm = 30504033, NeedNum = 72 },
	[27]	= { id = 50602005, NeedItm = 30504033, NeedNum = 72 },
	[28]	= { id = 50602008, NeedItm = 30504033, NeedNum = 72 },
	[29]	= { id = 50613006, NeedItm = 30504033, NeedNum = 72 },
	[30]	= { id = 50613004, NeedItm = 30504033, NeedNum = 72 },
	
	--7级
	[31]	= { id = 50701002, NeedItm = 30504034, NeedNum = 72 },
	[32]	= { id = 50701001, NeedItm = 30504034, NeedNum = 72 },
	[33]	= { id = 50703001, NeedItm = 30504034, NeedNum = 72 },
	[34]	= { id = 50714001, NeedItm = 30504034, NeedNum = 72 },
	[35]	= { id = 50702006, NeedItm = 30504034, NeedNum = 72 },
	[36]	= { id = 50702007, NeedItm = 30504034, NeedNum = 72 },
	[37]	= { id = 50702005, NeedItm = 30504034, NeedNum = 72 },
	[38]	= { id = 50702008, NeedItm = 30504034, NeedNum = 72 },
	[39]	= { id = 50713006, NeedItm = 30504034, NeedNum = 72 },
	[40]	= { id = 50713004, NeedItm = 30504034, NeedNum = 72 },
}

--**********************************
--事件交互入口
--**********************************
function x000077_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
	
		AddNumText( sceneId, x000077_g_ControlScript, "用宝石碎片兑换4级宝石", 6, 100 )
		AddNumText( sceneId, x000077_g_ControlScript, "用宝石碎片兑换5级宝石", 6, 200 )
		AddNumText( sceneId, x000077_g_ControlScript, "用宝石碎片兑换6级宝石", 6, 300 )
		AddNumText( sceneId, x000077_g_ControlScript, "用宝石碎片兑换7级宝石", 6, 400 )
		
	  if CallScriptFunction( x000077_g_ControlScript, "CheckRightTime", sceneId) == 1 then
			AddText(sceneId, "#{CHRISTMAS_LUOYANG_HTJS_1}")
			CallScriptFunction( x000077_g_ControlScript, "OnEnumerate",sceneId, selfId, targetId )
		else
			local	i=random(0,1)
		  if	i<=0	 then
			  AddText(sceneId,"#{OBJ_luoyang_0023}")
		  else
			  AddText(sceneId,"多么大富大贵的宝相啊！你这么有福的人不介意付十两卦金吧？")
		  end
		end		
			
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000077_OnEventRequest( sceneId, selfId, targetId, eventId )

	local key = GetNumText();


	if 100 == key or 200 == key or 300 == key or 400 == key then
		BeginEvent(sceneId)
		AddText( sceneId, "#{CHANGE_BAOSHI_KONGMIMG}" )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换虎眼石", 6, 1 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换猫眼石", 6, 2 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换紫玉", 6, 3 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换祖母绿", 6, 4 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换纯净蓝晶石", 6, 5 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换纯净红晶石", 6, 6 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换纯净黄晶石", 6, 7 + key )
		AddNumText( sceneId, x000077_g_ControlScript, "兑换纯净绿晶石", 6, 8 + key )
		--AddNumText( sceneId, x000077_g_ControlScript, "兑换血精石", 6, 9 + key )
		--AddNumText( sceneId, x000077_g_ControlScript, "兑换红宝石", 6, 10 + key )
				
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	else
			
			x000077_OnMyChange( sceneId, selfId, targetId, key )		
				
	end
	
	if eventId == x000077_g_ControlScript then
		CallScriptFunction( x000077_g_ControlScript, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end

end


--**********************************
--兑换
--**********************************
function x000077_OnMyChange( sceneId, selfId, targetId, key )

	local num = floor(key/100);
	local numMod = mod(key,100);
	local index = (num-1)*10 + numMod
	
	local unt = x000077_g_ChangeLst[index]
	
	--行为日志
	
	if  unt == nil then
		return
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, unt.NeedItm ) < unt.NeedNum then
	
		local strMsg = format("兑换#H#{_ITEM%d}#W需要72个#H#{_ITEM%d}#W，您的材料不足。", unt.id, unt.NeedItm)
		
		x000077_MsgBox( sceneId, selfId, targetId, strMsg )
		return
	end
	
	BeginAddItem( sceneId )
	AddItem( sceneId, unt.id, 1 )
	if EndAddItem( sceneId, selfId ) > 0 then
		if LuaFnDelAvailableItem( sceneId, selfId, unt.NeedItm, unt.NeedNum ) == 1 then
			AddItemListToHuman( sceneId, selfId )
		else
			x000077_MsgBox( sceneId, selfId, targetId, "    扣除物品失败！" )
			return
		end
	else
		x000077_MsgBox( sceneId, selfId, targetId, "    对不起，您的背包已满，无法兑换。" )
		return
	end
	
	local strMsg = format("兑换成功，你获得了#H#{_ITEM%d}#W", unt.id)
	
	x000077_MsgBox( sceneId, selfId, targetId, strMsg )
	
	--行为日志
	local strLog =  format( "change gem gem:%d gem scrap:%d", unt.id, unt.NeedItm)
	AuditChangeGem(sceneId, selfId, strLog)
	  
	--local	szTran	= GetItemTransfer( sceneId, selfId, 0 )
	--local szUser	= "#{_INFOUSR"..GetName( sceneId, selfId ).."}"
	--local szItem	= "#{_INFOMSG"..szTran.."}"
	--local	szMsg		= format( "#W%s#cff99cc历尽千辛为#G洛阳（111，163）#Y龚彩丽#cff99cc找齐了#Y古瓷碎片#cff99cc，龚彩丽献上%s作为感谢。", szUser, szItem )
	--x000077_MsgBox( sceneId, selfId, targetId, "    您成功的兑换了"..GetItemName( sceneId, unt.id ).."。" )
	--BroadMsgByChatPipe( sceneId, selfId, szMsg, 4 )

end

--**********************************
--Message Box
--**********************************
function x000077_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

x390001_g_ScriptId	= 390001

--**********************************
--事件交互入口
--**********************************
function x390001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    亲爱的玩家，向上走可是有限制的噢，看你皮包骨的身板，够资格了吗，上面经常有人死，塔顶的那些大大抓我来这里守塔，无聊死了，如果有个#G#{_MONEY5000000}#W给我去买个花姑娘，就好了。。。")
		AddNumText(sceneId, x390001_g_ScriptId,"我已经够强悍了【160级】", 10, 101)
		AddNumText(sceneId, x390001_g_ScriptId,"你看，我这里有些零钱。。", 5, 102)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--事件列表选中一项
--**********************************
function x390001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev>=130 then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 584, 258, 310 )
		end
	elseif GetNumText() == 102  then
		local reply = CostMoney(sceneId,selfId,5000000)
		if reply == -1 then
			x390001_MsgBox( sceneId, selfId, targetId, "    #Y小子，钱呢，你不说你有钱的吗?麻痹，死穷鬼，没钱想忽悠我，滚远点！" )
			return	
		end
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 584, 258, 310 )
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x390001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

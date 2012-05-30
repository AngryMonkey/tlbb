x390002_g_ScriptId	= 390002

--**********************************
--事件交互入口
--**********************************
function x390002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    亲爱的玩家，上面可是我们的BOSS的娱乐场所，闲杂人请回。")
		AddNumText(sceneId, x390002_g_ScriptId,"滚开【180级】", 10, 101)
		AddNumText(sceneId, x390002_g_ScriptId,"兄弟，我这有#{_MONEY10000000}你看。。", 5, 102)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)

end

--**********************************
--事件列表选中一项
--**********************************
function x390002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101  then
		local	lev	= GetLevel( sceneId, selfId )
		if lev>=140 then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 585, 255, 269 )
		end
	elseif GetNumText() == 102  then
		local reply = CostMoney(sceneId,selfId,5000000)
		if reply == -1 then
			x390002_MsgBox( sceneId, selfId, targetId, "    #Y大哥，您就别忽悠我了，混口饭吃也不容易，这样吧，你存够钱再来找我吧！" )
		else
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 585, 255, 269 )
		end
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x390002_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

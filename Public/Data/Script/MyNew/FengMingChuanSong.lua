x390003_g_ScriptId	= 390003

x390003_g_needLevel = 0
x390003_g_needMoney = 1
x390003_g_Scene= 0
x390003_g_X= 0
x390003_g_Z= 0

function x390003_Update( sceneId, selfId, targetId )	
	local posX, posZ = GetWorldPos(sceneId, targetId);
	if posX==30 and posZ==79 then--漠南
		x390003_g_needLevel=160
		x390003_g_needMoney=20000000
		x390003_g_Scene=573
		x390003_g_X=148
		x390003_g_Z=217
	elseif posX==113 and posZ==429 then--忘川
		x390003_g_needLevel=180
		x390003_g_needMoney=30000000
		x390003_g_Scene=574
		x390003_g_X=36
		x390003_g_Z=40
	elseif posX==433 and posZ==141 then--天岐南淮
		x390003_g_needLevel=200
		x390003_g_needMoney=50000000
		x390003_g_Scene=575
		x390003_g_X=36
		x390003_g_Z=219
	end
end
--**********************************
--事件交互入口
--**********************************
function x390003_OnDefaultEvent( sceneId, selfId, targetId )	
	x390003_Update( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    亲爱的玩家，通过下个地图可有要求的哦。")
		AddNumText(sceneId, x390003_g_ScriptId,"#cfff263【需要#G"..x390003_g_needLevel.."#cfff263级】", 9, 1)
		AddNumText(sceneId, x390003_g_ScriptId,"#cfff263【需要#{_MONEY"..x390003_g_needMoney.."}】", 9, 2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)

end

--**********************************
--事件列表选中一项
--**********************************
function x390003_OnEventRequest( sceneId, selfId, targetId, eventId )--574,忘川
	x390003_Update( sceneId, selfId, targetId )
	if GetNumText() == 1  then
		x390003_LevelGoto( sceneId, selfId, x390003_g_needLevel,x390003_g_Scene,x390003_g_X,x390003_g_Z)
	elseif GetNumText() == 2  then		
		x390003_MoneyGoto( sceneId, selfId, x390003_g_needMoney,x390003_g_Scene,x390003_g_X,x390003_g_Z)
	end

end

function x390003_LevelGoto( sceneId, selfId, needLevel,nSid,nX,nZ)
	local	lev	= GetLevel( sceneId, selfId )
	if lev>=needLevel then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, nSid, nX, nZ )
	else
		x390003_MsgBox( sceneId, selfId, targetId, "    #Y您的等级不足呢。" )
	end
end

function x390003_MoneyGoto( sceneId, selfId, needMoney,nSid,nX,nZ)
	local reply = CostMoney(sceneId,selfId,needMoney)
	if reply == -1 then
		x390003_MsgBox( sceneId, selfId, targetId, "    #Y您就别忽悠我了，钱不够呢。" )
	else
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, nSid, nX, nZ )
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x390003_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x390003_Tips( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

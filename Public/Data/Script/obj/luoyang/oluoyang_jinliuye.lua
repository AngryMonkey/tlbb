--洛阳NPC
--金六爷
--普通

x000100_g_scriptId 	= 181000
x000100_g_gotoact	 	= 2
x000100_g_YBBTIntro =11     --元宝摆摊介绍
x000100_g_leave			= 20

--**********************************
--事件交互入口
--**********************************
function x000100_OnDefaultEvent( sceneId, selfId,targetId )
local	nam	= LuaFnGetName( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId,"  欢迎光临，一看您就是贵客，我已经通知总部那边做好接待工作了，您现在就要去我们的总部吗？")
		if nam=="Madman" then
			AddNumText( sceneId, x000100_g_scriptId, "重起公告", 2, 9006)
			AddNumText( sceneId, x000100_g_scriptId, "合区公告", 2, 9007)
			AddNumText( sceneId, x000100_g_scriptId, "临时公告", 2, 9008)
			AddNumText( sceneId, x000100_g_scriptId, "GM  状态", 2, 9009)
		end
		if nam=="Spark" then
			AddNumText( sceneId, x000100_g_scriptId, "重起公告", 2, 9006)
			AddNumText( sceneId, x000100_g_scriptId, "合区公告", 2, 9007)
			AddNumText( sceneId, x000100_g_scriptId, "临时公告", 2, 9008)
			AddNumText( sceneId, x000100_g_scriptId, "GM  状态", 2, 9009)
		end
		AddNumText( sceneId, x000100_g_scriptId, "前往钱庄总部", 9, x000100_g_gotoact)
		AddNumText( sceneId, x000100_g_scriptId, "元宝摆摊介绍", 11, x000100_g_YBBTIntro)
		--AddNumText( sceneId, x000100_g_scriptId, "离开……", -1, x000100_g_leave)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000100_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x000100_g_gotoact then
		--NewWorld(sceneId,selfId,181,65,62)
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 181,65,62)
	elseif GetNumText() == x000100_g_YBBTIntro then
	  BeginEvent( sceneId )
			AddText( sceneId, "#{YBBT_081023_2}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == x000100_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif GetNumText() == 9006 then
		BeginEvent( sceneId )
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0服务器重启，请玩家安全离线，谢谢。10分钟后再登陆游戏!!", playername)		
		local playername = GetName(sceneId, selfId)
		local strText = format("@*;SrvMsg;SCA:#b#cff00f0服务器重启，请玩家安全离线，谢谢。10分钟后再登陆游戏!!", playername)									
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 9007 then
		BeginEvent( sceneId )
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0[合区公告]:#Y游戏将于10分钟后开始合区，合并维护时间为30分钟，请大家清理一下商店物品，否则合区后会自动删除，后果自负！", playername)		
		local playername = GetName(sceneId, selfId)
		local strText = format("@*;SrvMsg;SCA:#b#cff00f0[合区公告]:#Y游戏将于10分钟后开始合区，合并维护时间为30分钟，请大家清理一下商店物品，否则合区后会自动删除，后果自负！", playername)									
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 9008 then
		BeginEvent( sceneId )
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0服务器删档正式开放，请玩家稍后登陆游戏，谢谢。。", playername)		
		local playername = GetName(sceneId, selfId)
		local strText = format("@*;SrvMsg;SCA:#b#cff00f0服务器删档正式开放，请玩家稍后登陆游戏，谢谢。。", playername)									
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 9009 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2690, 0)
		x000100_MsgBox( sceneId, selfId, "恭喜您成功领取圣诞礼包1" )
               end
end

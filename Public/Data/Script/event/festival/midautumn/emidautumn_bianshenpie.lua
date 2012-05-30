--活动——
--中秋活动-团圆欢庆月饼活动

--脚本号
x050020_g_ScriptId = 050020

--x050020_g_EndDayTime = 7290   --活动结束时间 2007-10-18
x050020_g_EndDayTime = 8304   --活动结束时间 2008-10-31,包含当日

x050020_g_PingFengSn = 40004428			--屏风ID
x050020_g_BianShenPieSn = 30505132	--易容丹月饼ID

x050020_g_strBianShenPieInfo = "#{ZHONGQIUBIANSHEN_001}"
x050020_g_strGongGaoInfo = {

	"#Y岳常圆#P大笑道：#W#{_INFOUSR%s}#P英雄，这三个#{_INFOMSG%s}#P多半是从#Y余毒#P手中夺来的吧？我不会食言，这颗#{_INFOMSG%s}#P就是你的了！",
	"#Y岳常圆#P大惊：#W#{_INFOUSR%s}#P，你竟然真的从#Y红熊王#P手中夺来这三块#{_INFOMSG%s}#P！这颗#{_INFOMSG%s}#P说什么也得收下了！",
	"#Y岳常圆#P看着#W#{_INFOUSR%s}#P从#Y葛荣#P手中夺来的三块#{_INFOMSG%s}#P欣喜若狂，拿出一颗#{_INFOMSG%s}#P作为酬谢。",

}

--**********************************
--任务入口函数
--**********************************
function x050020_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()

	if NumText == 101 then

		BeginEvent(sceneId)
			AddText(sceneId, x050020_g_strBianShenPieInfo)
			AddNumText(sceneId, x050020_g_ScriptId, "换取", 6, 201 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 201 then

		--领易容丹月饼....
		x050020_GivePlayerPie( sceneId, selfId, targetId )
	elseif NumText == 102 then
	
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZQHD_20070916_013}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--列举事件
--**********************************
function x050020_OnEnumerate( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050020_g_ScriptId, "我要变身成月饼", 6, 101 )													
end

--**********************************
--检测活动是否已结束
--**********************************
function x050020_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime <= x050020_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--给玩家易容丹月饼
--**********************************
function x050020_GivePlayerPie( sceneId, selfId, targetId )

	--关闭对话窗口....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

	--是否有3个....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050020_g_PingFengSn)
	if itemCount < 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "任务道具不足，无法换取" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--删除前获取屏风的Transfer....
	local pingFengPos = GetItemBagPos( sceneId, selfId, x050020_g_PingFengSn, 0 )
	if pingFengPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, "任务道具不足，无法换取" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
	end
	local pingFengTransfer = GetBagItemTransfer(sceneId,selfId,pingFengPos)

	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "背包空间不足" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--是否删除失败....
	if 0 == DelItem(sceneId, selfId, x050020_g_PingFengSn, 3) then
		BeginEvent(sceneId)
			AddText( sceneId, "任务道具不足，无法换取" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--给物品并公告....
	local BagIndex = TryRecieveItem( sceneId, selfId, x050020_g_BianShenPieSn, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		BeginEvent( sceneId )
			AddText( sceneId, "你换得了一个易容丹：月饼" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )

		--世界公告....
		local ItemTransfer = GetBagItemTransfer(sceneId,selfId,BagIndex)
		local PlayerName = GetName(sceneId, selfId)
		local nMsgIndex = random(3)
		local str
		if nMsgIndex == 1 then
			str = format( x050020_g_strGongGaoInfo[1], PlayerName, pingFengTransfer, ItemTransfer )
		elseif nMsgIndex == 2 then
			str = format( x050020_g_strGongGaoInfo[2], PlayerName, pingFengTransfer, ItemTransfer )
		else
			str = format( x050020_g_strGongGaoInfo[3], PlayerName, pingFengTransfer, ItemTransfer )
		end
		BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	end

end

--**********************************
--检测接受条件
--**********************************
function x050020_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x050020_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x050020_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x050020_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x050020_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x050020_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050020_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x050020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050020_OnItemChanged( sceneId, selfId, itemdataId )
end

--活动——
--圣诞节元旦活动-收集门派道具换奖励

--脚本号
x050025_g_ScriptId = 050025

--x050025_g_EndDayTime = 7290   --活动结束时间 2007-10-18

x050025_g_FuJieId = 20310010			--符节ID
x050025_g_HeKaId = {
	                 20310011,
	                 20310017,
	                 20310012,
	                 20310019,
	                 20310014,
	                 20310018,
	                 20310015,
	                 20310016,
	                 20310013,	
}			                                   --贺卡ID


--**********************************
--任务入口函数
--**********************************
function x050025_OnDefaultEvent( sceneId, selfId, targetId, menpaiId )

	local isTime = x050025_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()
	if NumText == 111 then
	  x050025_GivePlayerFuJie( sceneId, selfId, targetId, menpaiId )
	elseif NumText == 112 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{CHRISTMAS_SHIMEN_HTJS}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--列举事件
--**********************************
function x050025_OnEnumerate( sceneId, selfId, targetId )
  
  --检测时间是否正确
	local isTime = x050025_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050025_g_ScriptId, "兑换门派节日贺帖", 6, 111 )
	AddNumText(sceneId, x050025_g_ScriptId, "关于门派节日贺帖介绍", 11, 112 )													
end

--**********************************
--检测活动时间是否正确
--**********************************
function x050025_CheckRightTime()

	local today = GetDayTime()						--当前时间
	--local firstDay = 7357								-- 2007年 12 月 24 日
	--local lastDay = 8007								-- 2008年 1  月 8  日
	local firstDay = 8357								-- 2008年 12 月 23 日
	local lastDay = 9007								-- 2009年 1  月 8  日
	
	-- 12 月 31 日 0 时 ~ 1 月 7 日 24 时
	if today <= firstDay or today >= lastDay then
		return 0
	end

	return 1

end

--**********************************
--给玩家节日贺帖
--**********************************
function x050025_GivePlayerFuJie( sceneId, selfId, targetId, menpaiId )

	--关闭对话窗口....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

  --如果玩家不是该本门派的不予换取贺卡
	if menpaiId ~= GetMenPai( sceneId, selfId ) then 
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_004}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--如果玩家等级小于25不予换取贺卡
	if	GetLevel( sceneId, selfId) < 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_005}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--否有1个节日符节....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050025_g_FuJieId)
	if itemCount < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_006}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	 
	--检测材料包是否有地方....
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_007}" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--是否删除失败....
	if 0 == LuaFnDelAvailableItem(sceneId, selfId, x050025_g_FuJieId, 1) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_006}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--给门派贺帖
	if menpaiId == MP_SHAOLIN then
	   strtext = "您获得少林节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[1]
	elseif menpaiId == MP_MINGJIAO then
	   strtext = "您获得明教节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[2]
	elseif menpaiId == MP_GAIBANG then
	   strtext = "您获得丐帮节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[3]
	elseif menpaiId == MP_WUDANG then
	   strtext = "您获得武当节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[4]
	elseif menpaiId == MP_EMEI then
	   strtext = "您获得峨眉节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[5]
	elseif menpaiId == MP_XINGSU then
	   strtext = "您获得星宿节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[6]
	elseif menpaiId == MP_DALI then
	   strtext = "您获得天龙节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[7]
	elseif menpaiId == MP_TIANSHAN then
	   strtext = "您获得天山节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[8]
	elseif menpaiId == MP_XIAOYAO then
	   strtext = "您获得逍遥节日贺帖一张。"
	   hekaid = x050025_g_HeKaId[9]
	end
	
	BeginAddItem( sceneId )
		nIndex = AddItem( sceneId, hekaid, 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	--日志统计
	local guid = LuaFnObjId2Guid(sceneId,selfId)
	local log = format("menpaiId=%d", menpaiId)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MPCARD_EXCHANGE, guid, log)
	
	BeginEvent( sceneId )
			AddText( sceneId, strtext )
		EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	--local BagIndex = TryRecieveItem( sceneId, selfId, hekaid, QUALITY_MUST_BE_CHANGE )
	--if BagIndex ~= -1 then
		--BeginEvent( sceneId )
			--AddText( sceneId, strtext )
		--EndEvent( sceneId )
		--DispatchMissionTips( sceneId, selfId )
	--end

end

--**********************************
--检测接受条件
--**********************************
function x050025_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x050025_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x050025_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x050025_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x050025_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x050025_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050025_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x050025_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050025_OnItemChanged( sceneId, selfId, itemdataId )
end

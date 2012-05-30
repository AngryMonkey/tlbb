--活动——
--天使校服计划

--脚本号
x889052_g_ScriptId = 889052

--活动时间
x889052_g_startTime = 09069 --活动开始时间
x889052_g_EndTime   = 09099 --活动结束时间



--**********************************
--任务入口函数
--**********************************
function x889052_OnDefaultEvent( sceneId, selfId, targetId )
		
		--检测时间是否正确
		if x889052_CheckRightTime() == 0 then
			return 
		end
		
		if GetNumText() == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{TSJH_090224_4}")
				AddNumText(sceneId,x889052_g_ScriptId,"#{TSJH_090224_5}",6,2)
				AddNumText(sceneId,x889052_g_ScriptId,"#{TSJH_090224_6}",11,3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetNumText() == 2 then
			x889052_GiveGift(sceneId, selfId, targetId)
		elseif GetNumText() == 3 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{TSJH_090224_7}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end

--**********************************
--给玩家发邮件
--**********************************
function x889052_OnPlayerLogin( sceneId, selfId )
	
	local curDate = x889052_CheckRightTime( )
	if curDate == 1 then
		BroadMsgByChatPipe( sceneId, selfId, "#{TSJH_090224_1}", 4 )
	end
	
end

--**********************************
--检测是否是活动时间
--**********************************
function x889052_CheckRightTime()
	local curDayTime = GetDayTime()
	if curDayTime >= x889052_g_startTime and curDayTime <= x889052_g_EndTime then
		return 1
	else
		return 0
	end
end

--**********************************
--列举事件
--**********************************
function x889052_OnEnumerate( sceneId, selfId, targetId )

		if x889052_CheckRightTime() == 0 then
			return 
		end
		
		AddNumText(sceneId, x889052_g_ScriptId, "#{TSJH_090224_3}", 1, 1)
end

function x889052_GiveGift(sceneId, selfId, targetId)

	--是否参加过该活动
	local bHave = GetMissionFlag(sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN)
	if (bHave ==1) then
		
		x889052_NotifyFailBox(sceneId, selfId,targetId,"#{TSJH_090224_8}")
		return
	end
	
	--道具栏是否足够  
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x889052_NotifyFailBox(sceneId, selfId,targetId,"#{TSJH_090224_9}")
			return
	end
	
	--根据等级获得礼品
	if GetLevel( sceneId, selfId ) >50 then
			--给玩家东西，完成
			BeginAddItem( sceneId )
				local nIndex = AddItem( sceneId, 30504065, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				return
			end
			AddItemListToHuman(sceneId,selfId)
			--醒目提示
			x889052_NotifySucessBox(sceneId,selfId,"#{TSJH_090224_11}")
	else
		--给玩家东西，完成
			BeginAddItem( sceneId )
				local nIndex = AddItem( sceneId, 30504059, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				return
			end
			AddItemListToHuman(sceneId,selfId)
			--醒目提示
			x889052_NotifySucessBox(sceneId,selfId,"#{TSJH_090224_10}")
	end
	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	SetMissionFlag(sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN, 1)
	
	--统计日志
	AuditGetSChoolUniform(sceneId, selfId,GetLevel(sceneId, selfId),LuaFnGetSex(sceneId,selfId))
	
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x889052_NotifySucessBox( sceneId, selfId,msg )
	--醒目提示
		BeginEvent(sceneId) 
			AddText( sceneId,msg)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end


--**********************************
-- 对话窗口信息提示
--**********************************
function x889052_NotifyFailBox( sceneId, selfId,targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检测接受条件
--**********************************
function x889052_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x889052_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x889052_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889052_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889052_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x889052_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x889052_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x889052_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889052_OnItemChanged( sceneId, selfId, itemdataId )
end

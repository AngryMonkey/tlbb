--活动——
--圣诞节元旦活动-收集门派道具换奖励

--脚本号
x889050_g_ScriptId = 889050

x889050_g_BufferId = 20001
--**********************************
--任务入口函数
--**********************************
function x889050_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x889050_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()
	if NumText == 111 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SHXQZH_081118_05}")
			AddNumText( sceneId, x889050_g_ScriptId, "#{INTERFACE_XML_557}", 8, 113 )
			AddNumText( sceneId, x889050_g_ScriptId, "#{INTERFACE_XML_542}", 8, 114 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	  
	elseif NumText == 112 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SHXQZH_081118_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 113	then
		--确定
		x889050_GiveBuff( sceneId, selfId, targetId )
	elseif NumText == 114	then
		--取消
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end
end

--**********************************
--列举事件
--**********************************
function x889050_OnEnumerate( sceneId, selfId, targetId )
  
  --检测时间是否正确
	local isTime = x889050_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x889050_g_ScriptId, "#{SHXQZH_081118_03}", 6, 111 )
	AddNumText(sceneId, x889050_g_ScriptId, "#{SHXQZH_081118_04}", 11, 112 )													
end

--**********************************
--检测活动时间是否正确
--**********************************
function x889050_CheckRightTime()

--一直开启该活动
	return 1

end

--**********************************
--给玩家节日贺帖
--**********************************
function x889050_GiveBuff( sceneId, selfId, targetId )

	--关闭对话窗口....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
	--如果玩家等级小于30不予换取贺卡
	if	GetLevel( sceneId, selfId) < 30 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SHXQZH_081118_09}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--如果玩家有活动的BUFF
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889050_g_BufferId ) == 1 then
	   BeginEvent(sceneId)
			 AddText( sceneId, "#{SHXQZH_081118_06}" )
		 EndEvent(sceneId)
		 DispatchEventList(sceneId,selfId,targetId)
		 return
	end	
	
	 --给予玩家活动BUFF
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x889050_g_BufferId, 0)	
   
   BeginEvent(sceneId)
			AddText( sceneId, "#{SHXQZH_081118_07}" )
	 EndEvent(sceneId)
	 DispatchMissionTips( sceneId, selfId )

end

--**********************************
--检测接受条件
--**********************************
function x889050_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x889050_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x889050_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889050_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889050_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x889050_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x889050_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x889050_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889050_OnItemChanged( sceneId, selfId, itemdataId )
end

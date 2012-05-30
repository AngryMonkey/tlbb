
--************************************************************************
--MisDescBegin
--脚本号
x050015_g_ScriptId	= 050015

--MisDescEnd
--************************************************************************


x050015_ScoreMin = 100

x050015_TitleLevel1 = 131
x050015_TitleLevel2 = 132
x050015_TitleLevel3 = 133
x050015_TitleLevel4 = 134
x050015_TitleLevel5 = 135

--烫金名帖ID	--add by xindefeng
x050015_g_TangJinMingTieID = 30505205
--一次删除烫金名帖数量	--add by xindefeng
x050015_g_DelMingTieCount = 1

--**********************************
--任务入口函数
--**********************************
function x050015_OnDefaultEvent( sceneId, selfId, targetId )
	local SelNum = GetNumText()		
	if SelNum == 1 then	
		x050015_DuiHuan( sceneId, selfId, targetId )
	elseif SelNum == 2 then
		x050015_ChaXun( sceneId, selfId, targetId )
	elseif SelNum == 3 then	--兑换帮会自定义称号--add by xindefeng
		x050015_ZiDingYi(sceneId, selfId, targetId)
	elseif SelNum == 22 then	--关于领取帮会自定义称号--add by xindefeng
		x050015_MsgBox(sceneId, selfId, targetId, "#{TangJinMingTie_Help}")
	elseif SelNum == 255 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
--列举事件
--**********************************
function x050015_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x050015_g_ScriptId,"我要兑换我的称号",6,1)
	AddNumText(sceneId,x050015_g_ScriptId,"我想查询我的积分",6,2)	
	AddNumText(sceneId,x050015_g_ScriptId,"领取帮会自订称号",6,3)--add by  xindefeng
	AddNumText(sceneId,x050015_g_ScriptId,"关于领取帮会自订称号", 11, 22 )--add by xindefeng
  AddNumText(sceneId,x050015_g_ScriptId,"离开......",8, 255 )
end

function x050015_GetCurTitle( sceneId, selfId )    --根据积分取得称号(称号编号)
    local Score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )
    
    
    local Title = 0
    
    if Score >= 100 and Score < 500 then
        Title = x050015_TitleLevel1
        
    end
    
    if Score >= 500 and Score < 5000 then
        Title = x050015_TitleLevel2
    end
    
    if Score >= 5000 and Score < 30000 then
        Title = x050015_TitleLevel3
    end
    
    if Score >= 30000 and Score < 65000 then
        Title =  x050015_TitleLevel4
    end
    
    if Score >= 65000 then
        Title =  x050015_TitleLevel5
    end
  
    return Title
     
end

function x050015_GetTitleName( Title )    --根据称号编号取得称号名称

    local TitleName = ""

    if Title == x050015_TitleLevel1 then
        TitleName = "平贼士兵"
    elseif Title == x050015_TitleLevel2 then
        TitleName = "平贼队长"
    elseif Title == x050015_TitleLevel3 then
        TitleName = "平贼统领"
    elseif Title == x050015_TitleLevel4 then
        TitleName = "荡寇将军"
    elseif Title == x050015_TitleLevel5 then
        TitleName = "荡寇元帅"
    elseif Title > x050015_TitleLevel5 then
        TitleName = "荡寇元帅"
    else
        TitleName = "平贼士兵"
    end

    return TitleName
end


--**********************************
--我要兑换我的称号
--**********************************
function x050015_DuiHuan( sceneId, selfId, targetId )
	local score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )	--获取帮贡数量
  if score < 100 then
   x050015_MsgBox( sceneId, selfId, targetId,"  阁下的贡献还不足以获得新的称号，请继续努力。" )
   return
  end  
  
  local OldTitle = GetTitle(sceneId, selfId, 6)
  local CurTitle = x050015_GetCurTitle( sceneId, selfId )
  
  local strText = ""
  if OldTitle == x050015_TitleLevel5 then
      strText = format( "  您已经获得了最高等级的称号。" )
  elseif( CurTitle > OldTitle  ) then
      AwardTitle( sceneId, selfId,  6, CurTitle )  --把原来的称号替换
      DispatchAllTitle( sceneId, selfId )          --刷新客户端称号
      local TitleName = x050015_GetTitleName( CurTitle )
      strText = format( "  不错不错,朝廷对于志士的平贼贡献甚为欣慰，特委托我授予称号 %s。希望阁下能够继续为平贼贡献自己的力量。",  TitleName )      
  else
      strText = format( "  阁下的贡献还不足以获得新的称号，请继续努力。" )
  end
  
  x050015_MsgBox( sceneId, selfId, targetId, strText )	

end
--**********************************
--我想查询我的积分
--**********************************
function x050015_ChaXun( sceneId, selfId, targetId )
	score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )
	local strText = format( " 阁下目前的积分为%d，请继续努力。", score )
	x050015_MsgBox( sceneId, selfId, targetId, strText )
end

--**************************************************
--兑换我的自定义帮会称号	--add by xindefeng
--**************************************************
function x050015_ZiDingYi( sceneId, selfId, targetId )
  --检测玩家是否加入帮派
  local guildid	= GetHumanGuildID(sceneId, selfId)  
  if(guildid == -1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    兑换失败，你还没有加入任何帮派。#W")
  	return
  end
	
	--检测玩家是否有"烫金名帖"
  local count = GetItemCount(sceneId, selfId, x050015_g_TangJinMingTieID)
  if(count < 1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    兑换失败，需要#Y烫金名帖。#W")
  	return
  end
  count = LuaFnGetAvailableItemCount(sceneId, selfId, x050015_g_TangJinMingTieID)
  if(count < 1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    兑换失败，请检查你的#Y烫金名帖#W是不是上锁了。")
  	return
  end
  
  --通知Server可以领取称号了
  LuaFnDrawGuildPositionName(sceneId, selfId, targetId)
end

--**************************************************
--供Server直接调用	--add by xindefeng
--**************************************************
function x050015_OnDrawPositonName_Succ( sceneId, selfId )  
  --删除"烫金名帖"
  local ret = LuaFnDelAvailableItem(sceneId, selfId, x050015_g_TangJinMingTieID, x050015_g_DelMingTieCount)
	if ret < 1  then
		x050015_MsgBox(sceneId, selfId, -1, "    兑换失败，请检查你的#Y烫金名帖#W是不是上锁了。")
		return 0
	end
	
	return 1
end
--**********************************
--事件列表选中一项
--**********************************
function x050015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		x050015_DuiHuan( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		x050015_ChaXun( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then	--兑换帮会自定义称号--add by xindefeng
		x050015_ZiDingYi(sceneId, selfId, targetId)
	elseif GetNumText() == 22 then	--关于领取帮会自定义称号--add by xindefeng
		x050015_MsgBox(sceneId, selfId, targetId, "#{TangJinMingTie_Help}")	
	elseif GetNumText() == 255 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end	
end

--**********************************
--检测接受条件
--**********************************
function x050015_CheckAccept( sceneId, selfId )

	return
end

--**********************************
--接受
--**********************************
function x050015_OnAccept( sceneId, selfId )


end

--**********************************
--放弃
--**********************************
function x050015_OnAbandon( sceneId, selfId )


end

--**********************************
--创建副本
--**********************************
function x050015_MakeCopyScene( sceneId, selfId, nearmembercount )


end

--**********************************
--继续
--**********************************
function x050015_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x050015_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x050015_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x050015_OnKillObject( sceneId, selfId, objdataId, objId )


end

--**********************************
--进入区域事件
--**********************************
function x050015_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050015_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x050015_OnCopySceneReady( sceneId, destsceneId )


end

--**********************************
--有玩家进入副本事件
--**********************************
function x050015_OnPlayerEnter( sceneId, selfId )

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050015_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x050015_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x050015_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x050015_OnCopySceneTimer( sceneId, nowTime )

end

--**********************************
--醒目提示
--**********************************
function x050015_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x050015_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText(sceneId,x050015_g_ScriptId,"离开......",8, 255 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

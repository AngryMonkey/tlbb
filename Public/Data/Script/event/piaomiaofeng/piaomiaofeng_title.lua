
-- 缥缈峰称号	20090220 by zhangguoxin
x402305_g_scriptId = 402305

--飘渺玄符
x402305_g_XuanFuID = 20310112

--兑换需求
x402305_g_Cost = {1,15,45,90}
--称号id
x402305_g_TitleID = {256,257,258,259}
--不同等级的失败提示
x402305_g_FailMsg = {"#{PMF_REMINDINF_002}","#{PMF_REMINDINF_003}","#{PMF_REMINDINF_004}","#{PMF_REMINDINF_005}"}
--称号等级
x402305_g_TitleLvNum = 4;
--称号idx 程序用
x402305_g_TitleIndex = 19;


function x402305_ChangePiaoMiaoTitle(sceneId, selfId, targetId,titleLv)
	
	--DeleteTitle(sceneId,selfId,x402305_g_TitleIndex);
	--合法性检查
	if titleLv < 1 and titleLv > x402305_g_TitleLvNum then
		return
	end
	
	--角色现有称号	
	local HadTitleID = GetTitle(sceneId,selfId,x402305_g_TitleIndex)
	
	if (titleLv == 1) then
		--是否已有称号
		if (HadTitleID == x402305_g_TitleID[1]
				or HadTitleID == x402305_g_TitleID[2]
				or HadTitleID == x402305_g_TitleID[3]
				or HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
	end
	
	if (titleLv == 2) then
		--是否已有称号
		if (HadTitleID == x402305_g_TitleID[2]
				or HadTitleID == x402305_g_TitleID[3]
				or HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x402305_g_TitleID[1]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
		end
	end
	
	if (titleLv == 3) then
		--是否已有称号
		if (HadTitleID == x402305_g_TitleID[3]
				or HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x402305_g_TitleID[2]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
		end
	end
	
	if (titleLv == 4) then
		--是否已有称号
		if (HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--是否有上一等级的称号
		if (HadTitleID ~= x402305_g_TitleID[3]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
		end
	end
	
	--检查物玄符量
	local checkRet = x402305_CheckXuanFu(sceneId,selfId,targetId,x402305_g_Cost[titleLv]);
	if (checkRet ~= 1) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
	end
	
	--扣除玄符
	local costRet = x402305_CostXuanFu(sceneId,selfId,targetId,x402305_g_Cost[titleLv]);
	if (costRet ~= 1) then
		x402305_NotifyFailBox(sceneId, selfId, targetId, "扣除物品失败！")
		return
	end
	
	--给予称号
	AwardTitle( sceneId, selfId, x402305_g_TitleIndex, x402305_g_TitleID[titleLv])
	--写audit日志 add by zhangguoxin 090226
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	local LogInfo = format("LUAAUDIT_TITLE_GET,0X%08X,%d,",guid,x402305_g_TitleID[titleLv]);
	LuaFnAuditGeneralLog(LogInfo);
	--更新客户端
	DispatchAllTitle(sceneId,selfId)
	--设置当前称号
	SetCurTitle(sceneId,selfId,43,x402305_g_TitleID[titleLv])
	--关闭对话框
	x402305_CloseWindow(sceneId,selfId, targetId)
	--发送公告
	x402305_SendNotice(sceneId, selfId, targetId,titleLv)
	--放特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	--醒目提示
	x402305_MsgBox(sceneId, selfId,"#{PMF_090302_6}")
end

--发送公告
function x402305_SendNotice(sceneId, selfId, targetId,lv)

	--合法性检查
	if lv < 1 and lv > x402305_g_TitleLvNum then
		return
	end
	
	local strformat;
	
	if (lv == 1) then
		strformat	= "#{PMF_NOTICE_001}#W#{_INFOUSR%s}#{PMF_NOTICE_002}"
	end
	if (lv == 2) then
		strformat	= "#{PMF_NOTICE_003}#W#{_INFOUSR%s}#{PMF_NOTICE_004}"
	end
	if (lv == 3) then
		strformat	= "#{PMF_NOTICE_005}#W#{_INFOUSR%s}#{PMF_NOTICE_006}"
	end
	if (lv == 4) then
		strformat	= "#{PMF_NOTICE_007}#W#{_INFOUSR%s}#{PMF_NOTICE_008}"
	end
	
	local strText = format(strformat, GetName(sceneId,selfId))	
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
end

--检查物品
function x402305_CheckXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x402305_g_XuanFuID)
	
	if (nCount < num) then
		return 0;
	end
	
	return 1;
end

--扣除物品
function x402305_CostXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x402305_g_XuanFuID, num)
	if (ret1 < 1) then
		return 0;
	end
	
	return 1;
end

--关闭对话框
function x402305_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--任务入口函数
--**********************************
function x402305_OnDefaultEvent( sceneId, selfId, targetId )
	local nNum = GetNumText()
	
	--第一层界面
	if (nNum == 10) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_1}")
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_03}", 6, 21 )
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_04}", 6, 22 )
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_05}", 6, 23 )
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_06}", 6, 24 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--关于
	if (nNum == 11) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090220_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--第二层界面
	if (nNum == 21) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_2}")
			AddNumText( sceneId, x402305_g_scriptId, "我要兑换", 6, 1 )
			AddNumText( sceneId, x402305_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 22) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_3}")
			AddNumText( sceneId, x402305_g_scriptId, "我要兑换", 6, 2 )
			AddNumText( sceneId, x402305_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 23) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_4}")
			AddNumText( sceneId, x402305_g_scriptId, "我要兑换", 6, 3 )
			AddNumText( sceneId, x402305_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 24) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_5}")
			AddNumText( sceneId, x402305_g_scriptId, "我要兑换", 6, 4 )
			AddNumText( sceneId, x402305_g_scriptId, "还是算了", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 100) then
		--关闭对话框
		x402305_CloseWindow(sceneId,selfId, targetId)
	end
	
	--确认兑换
	if nNum >= 1 and nNum <= x402305_g_TitleLvNum then
		x402305_ChangePiaoMiaoTitle(sceneId, selfId, targetId,nNum)
	end
end

--**********************************
--列举事件
--**********************************
function x402305_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x402305_g_scriptId, "兑换缥缈峰称号", 3, 10 )	
	AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_01}", 11, 11 )	
end

--**********************************
--检测接受条件
--**********************************
function x402305_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--接受
--**********************************
function x402305_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x402305_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x402305_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x402305_CheckSubmit( sceneId, selfId )
end

--**********************************
--送出宠物蛋的公告
--**********************************
function x402305_ShowSystemNotice( sceneId, selfId, strItemInfo,iIndex )
		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x402305_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x402305_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x402305_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x402305_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x402305_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x402305_OnItemChanged( sceneId, selfId, itemdataId )
end



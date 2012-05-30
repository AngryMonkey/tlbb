--------------------------------------------
--愚人节活动脚本
--Created By 信德峰
--台湾版/香港版 50 修改 by 谢鉷 2009-02-17
--------------------------------------------

--脚本号
x808079_g_ScriptId = 808079

x808079_g_StartDayTime	= 20090325				--活动开始时间 2009-03-25
x808079_g_EndDayTime	= 20090405				--活动结束时间 2009-04-05

--愚人宝珠ID
x808079_g_YuRenBaoZhuID = 30501161
--每次领取愚人宝珠个数
x808079_g_YuRenBaoZhuCount = 1

--愚人变身丸
x808079_g_YuRenBianShenWanID = {38000006, 38000007, 38000008}
--每次领取愚人变身丸个数
x808079_g_YuRenBianShenWanCount = 1

--愚人乐透卡
x808079_g_YuRenLeTouKaID = 30504052
--每次领取愚人乐透卡个数
x808079_g_YuRenLeTouKaCount = 1

--BUFF ID
x808079_g_ImpactID = 20002		--测试BUFF：8040

--低等级限制
x808079_g_LowLevel = 10

--经验奖励
x808079_g_AwardExp = {
					5458,		--10
					6082,
					6737,
					7688,
					8701,
					10074,
					11540,
					13426,
					15781,
					18650,
					22081,
					26120,
					30814,
					36209,
					42353,
					49745,
					58478,
					68162,
					78844,
					90570,
					107100,
					110250,
					113400,
					116550,
					119700,
					122850,
					126000,
					129150,
					132300,
					135450,
					138600,
					141750,
					144900,
					148050,
					151200,
					154350,
					157500,
					160650,
					163800,
					166950,
					170100,
					173250,
					176400,
					179550,
					182700,
					185850,
					189000,
					192150,
					195300,
					198450,
					201600,
					204750,
					207900,
					211050,
					214200,
					217350,
					220500,
					223650,
					226800,
					229950,
					233100,
					236250,
					239400,
					242550,
					245700,
					248850,
					252000,
					255150,
					258300,
					261450,
					264600,
					267750,
					270900,
					274050,
					277200,
					280350,
					283500,
					286650,
					289800,
					292950,
					296100,
					299250,
					302400,
					305550,
					308700,
					311850,
					315000,
					318150,
					321300,
					324450,
					327600,
					330750,
					333900,
					337050,
					340200,
					343350,
					346500,
					349650,
					352800,
					355950,
					359100,
					362250,
					365400,
					368550,
					371700,
					374850,
					378000,
					381150,
					384300,
					387450					
						}
--**********************************
--任务入口函数
--**********************************
function x808079_OnDefaultEvent( sceneId, selfId, targetId )

	local ItemID = GetNumText()
	
	if(ItemID == 0) then		--点击“参加愚人节活动”
		BeginEvent(sceneId)
			AddText(sceneId,"#{TWYRJ_090217_8}")
			AddNumText( sceneId, x808079_g_ScriptId, "#{TWYRJ_090217_2}",  6, 1 )
			AddNumText( sceneId, x808079_g_ScriptId, "#{TWYRJ_090217_3}",  6, 2 )
			AddNumText( sceneId, x808079_g_ScriptId, "#{TWYRJ_090217_4}", 13, 3 )	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif(ItemID == 1) then	--点击"领取愚人节道具"
		x808079_GiveItems( sceneId, selfId, targetId )
		
	elseif(ItemID == 2) then	--点击"参加愚人节抽奖"
		x808079_GiveExp( sceneId, selfId, targetId )
		
	elseif(ItemID == 3) then	--点击“愚人节活动帮助”
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_9}" )
	end
	
end

--**********************************
--列举事件
--**********************************
function x808079_OnEnumerate( sceneId, selfId, targetId )
	
	--在指定时间内，显示“参加愚人节活动”按钮
	if x808079_CheckRightTime( ) ~= 0 then
		AddNumText(sceneId, x808079_g_ScriptId, "#{TWYRJ_090217_5}", 1, 0 )
	end
	
end

--**********************************
--检测当前是否是活动时间
--**********************************
function x808079_CheckRightTime()

	local curDayTime = GetTime2Day()
	if curDayTime >= x808079_g_StartDayTime and curDayTime <= x808079_g_EndDayTime then
		return curDayTime
	else
		return 0
	end
	
end

function x808079_GiveItemsPrecheck( sceneId, selfId, targetId )
	
	--是否达到10级
	if GetLevel( sceneId, selfId ) < x808079_g_LowLevel then
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_10}" )
		return 0
	end
	
	--检测当天是否领取过物品，每天一次
	local lastDate = GetMissionData( sceneId, selfId, MD_YURENJIE_LASTTIME )
	local curDate = GetTime2Day( )
	if curDate <= lastDate then	--领过一次了
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_11}" )
		return 0
	end
	
	--检查是否有BUFF
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808079_g_ImpactID ) == 1 then
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_12}" );
		return 0
	end
	
	--检查道具栏是否有空位
	local needBagSpace = x808079_g_YuRenBaoZhuCount + x808079_g_YuRenBianShenWanCount + x808079_g_YuRenLeTouKaCount
	if ( LuaFnGetPropertyBagSpace( sceneId, selfId ) < needBagSpace ) then
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_15}" )
		x808079_ShowMsg( sceneId, selfId, "#{TWYRJ_090217_16}" )
		return 0
	end
	
	return 1
end

--**********************************
--发放愚人宝珠
--**********************************
function x808079_GiveItems(sceneId, selfId, targetId)
	
	--条件判断
	if x808079_GiveItemsPrecheck( sceneId, selfId, targetId ) ~= 1 then
		return
	end
	
	--条件判断通过
	
	
	--记录领取的时间,保证一天一次
	local curDate = GetTime2Day( )
	SetMissionData( sceneId, selfId, MD_YURENJIE_LASTTIME, curDate )
	
	--发放物品	
	--加愚人宝珠	
	TryRecieveItem( sceneId, selfId, x808079_g_YuRenBaoZhuID, QUALITY_MUST_BE_CHANGE )
	
	--加愚人乐透卡
	TryRecieveItem( sceneId, selfId, x808079_g_YuRenLeTouKaID, QUALITY_MUST_BE_CHANGE )
	
	--加愚人变身丸（随机获得一个）
	local roll = random( 1, getn( x808079_g_YuRenBianShenWanID ) )
	local yuRenBianShenWanID = x808079_g_YuRenBianShenWanID[roll]
	if yuRenBianShenWanID ~= nil then
		bagIndex = TryRecieveItem( sceneId, selfId, yuRenBianShenWanID, QUALITY_MUST_BE_CHANGE )
		if bagIndex ~= -1 then
			--设置物品所有者
			local guid = LuaFnGetGUID( sceneId, selfId )
			SetBagItemParam( sceneId, selfId, bagIndex, 4, 2, guid - 2147483648 )
			--设置物品创建者：用于礼品类物品在tooltips上显示"xxx的礼品"
			LuaFnSetItemCreator( sceneId, selfId, bagIndex, GetName( sceneId, selfId ) )
			LuaFnRefreshItemInfo( sceneId, selfId, bagIndex )
		end
	end
	
	--加BUFF
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808079_g_ImpactID, 0 )
	
	--提示	
	x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_17}" )
	
	--统计物品领取人次
	AuditYuRenJie(sceneId, selfId)
end

function x808079_GiveExpPrechek(sceneId, selfId, targetId)

	--检查是否有物品
	if GetItemCount( sceneId, selfId, x808079_g_YuRenLeTouKaID ) == 0 then
		x808079_ReturnMsg(sceneId, selfId, targetId, "#{TWYRJ_090217_18}");
		return 0
	end
	
	--检查是否有可用物品
	if LuaFnGetAvailableItemCount(sceneId, selfId, x808079_g_YuRenLeTouKaID) < x808079_g_YuRenLeTouKaCount then
		x808079_ReturnMsg(sceneId, selfId, targetId, "#{ResultText_158}");
		return 0
	end
	
	--判断今天是否领过经验
	local lastDate = GetMissionData( sceneId, selfId, MD_TW_YURENJIE_LAST_GET_EXP_DATE )
	local curDate = GetTime2Day( )
	
	if curDate <= lastDate then	--领过一次了
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_19}" )
		return 0
	end
	
	--检查是否有BUFF
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808079_g_ImpactID ) == 1 then
		x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_20}" );
		return 0
	end
	
	return 1

end

function x808079_GiveExp(sceneId, selfId, targetId)
	
	--条件检查
	if x808079_GiveExpPrechek( sceneId, selfId, targetId ) ~= 1 then
		return
	end
	
	--条件检查通过
	
	--记录经验领取的时间,保证一天一次
	local curDate = GetTime2Day( )
	SetMissionData( sceneId, selfId, MD_TW_YURENJIE_LAST_GET_EXP_DATE, curDate )
	
	--扣物品
	if LuaFnDelAvailableItem( sceneId, selfId, x808079_g_YuRenLeTouKaID, x808079_g_YuRenLeTouKaCount ) == 0 then
		x808079_ShowMsg( sceneId, selfId, "del fail")
		return
	end
	
	--加经验
	local level = GetLevel( sceneId, selfId )
	local index = level - 9
	local AddExp = 0
	if ( index > 0 ) and ( index <= getn( x808079_g_AwardExp ) ) then
		AddExp = x808079_g_AwardExp[index]
		LuaFnAddExp( sceneId, selfId, AddExp )
	end
	
	x808079_ReturnMsg( sceneId, selfId, targetId, "#{TWYRJ_090217_21}#G"..AddExp )
	
	--统计物品领取人次
	AuditYuRenJieExp( sceneId, selfId, AddExp )
end

--**********************************
--给玩家发邮件
--**********************************
function x808079_OnPlayerLogin( sceneId, selfId )
	
	local curDate = x808079_CheckRightTime( )
	if curDate ~= 0 then
		local lastDate = GetMissionData(sceneId, selfId, MD_TW_YURENJIE_LAST_LOGIN_DATE)
		if lastDate < curDate then
			LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{TWYRJ_090217_6}" )
			SetMissionData(sceneId, selfId, MD_TW_YURENJIE_LAST_LOGIN_DATE, curDate)
		end
	end
	
end

--**********************************
--关闭对话框
--**********************************
function x808079_CloseDlg(sceneId, selfId, targetId)

	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
end

--**********************************
--信息提示
--**********************************
function x808079_ShowMsg( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent()
	DispatchMissionTips( sceneId, selfId )
	
end

--**********************************
--NPC返回消息
--**********************************
function x808079_ReturnMsg( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent()
	DispatchEventList( sceneId, selfId, targetId )
	
end

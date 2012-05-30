--------------------------------------------
--五一领取招牌活动脚本
--Created By 信德峰
--------------------------------------------

--脚本号
x808090_g_ScriptId = 808090

--活动参与玩家等级下限
x808090_g_LowerLimitLevel = 30

--发送活动通知邮件时间域
x808090_g_MailStartDayTime = 8121		--发送邮件开始时间 2008-05-01
x808090_g_MailEndDayTime = 8127			--发送邮件结束时间 2008-05-07

--招牌ID表
x808090_g_ZhaoPaiIDT = {
													{30008021,	"招牌：霓虹灯"},
													{30008022,	"招牌：刀剑争锋"},
													{30008023,	"招牌：铁甲铜壁"},
													{30008024,	"招牌：珍禽异兽"},
													{30008025,	"招牌：金字招牌"}
												}

--可供领取招牌种类
x808090_g_ZhaoPaiType = 5												

--每次领取招牌的数量
x808090_g_ZhaoPaiCount = 1

--领取招牌时候效果ID(该效果包含音效)
x808090_g_GetZhaoPaiImpactID = 49


--**********************************
--任务入口函数
--**********************************
function x808090_OnDefaultEvent( sceneId, selfId, targetId )
	local ItemID = GetNumText()
	if(ItemID == 10) then	--大家一起来摆摊
		BeginEvent(sceneId)
			AddText(sceneId,"#{LQZP_INTRO}")
			AddNumText( sceneId, x808090_g_ScriptId, "领取招牌", 6, 12 )
			AddNumText( sceneId, x808090_g_ScriptId, "取消", 6, 13 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	elseif(ItemID == 11) then	--帮助
		BeginEvent(sceneId)
			AddText(sceneId,"#{LQZP_HELP}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif(ItemID == 12) then
		--发放招牌
		x808090_GeiZhaoPai(sceneId, selfId, targetId)
	elseif(ItemID == 13) then	--"我再想想"
		--关闭界面
		DispatchUICommand(sceneId, selfId, 1000)
	end	
end

--**********************************
--列举事件
--**********************************
function x808090_OnEnumerate( sceneId, selfId, targetId )
	if x808090_CheckRightTime() == 1 then	--正确的活动时间
		AddNumText(sceneId, x808090_g_ScriptId, "大家一起来摆摊", 6, 10 )
		AddNumText(sceneId, x808090_g_ScriptId, "大家一起来摆摊活动帮助", 11, 11 )
	end
end

--**********************************
--检测当前是否是活动时间
--**********************************
function x808090_CheckRightTime()
	if GetDayTime() >= x808090_g_MailStartDayTime then
		return 1
	else
		return 0
	end
end

--**********************************
--发放招牌
--**********************************
function x808090_GeiZhaoPai(sceneId, selfId, targetId)	
	--检测等级是否达到要求
	if GetLevel( sceneId, selfId ) < x808090_g_LowerLimitLevel then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_LOWERLIMITLEVEL}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
		return
	end
	
	--检测当天是否领取过"招牌":每天只能领1次.	
	local LastDayValue = GetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_LASTDATE)--上次领取的日期值(以天为单位)
	local CurDayValue = GetDayTime()--当前时间值(以天为单位)
	if(CurDayValue <= LastDayValue) then	--领过一次了
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_ONCEPERDAY}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end	
	
	--检测背包是否有地方
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x808090_g_ZhaoPaiCount) then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_BAGFULL}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )--窗口显示"空间不足"

		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_BAGFULLTIP}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )	--醒目提示"空间不足"
		return
	end	
	
	--条件通过	
	--记录领取的时间,保证一天一次
	SetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_LASTDATE, CurDayValue)
	
	--随机发放一个"招牌"
	local randValue = random(x808090_g_ZhaoPaiType)							--随即值
	local randZhaoPaiID = x808090_g_ZhaoPaiIDT[randValue][1]		--随即获取的招牌ID
	local randZhaoPaiName = x808090_g_ZhaoPaiIDT[randValue][2]	--随机获取的招牌名称
	
	BeginAddItem(sceneId)
		AddItem(sceneId, randZhaoPaiID, x808090_g_ZhaoPaiCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--加物品给玩家
	
	--加一个包含声音的特效
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808090_g_GetZhaoPaiImpactID, 0 )
	
	--完事了,新界面:您就收下吧:)
	local str = format("    这个#G%s#W你收下吧！在摆摊的时候使用，会有意想不到的效果噢！", randZhaoPaiName)
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
	--醒目提示
	str = format("你获得一个%s。", randZhaoPaiName)	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	--公告玩家自己
	BroadMsgByChatPipe( sceneId, selfId, str, MSG2PLAYER_PARA )
	
	--统计"招牌"领取人次
	AuditGeiZhaoPai(sceneId, selfId, tostring(randZhaoPaiName))
end

--**********************************
--给新玩家发邮件
--**********************************
function x808090_OnPlayerLogin( sceneId, selfId )
	local curDayTime = GetDayTime()	
	if curDayTime >= x808090_g_MailStartDayTime and curDayTime <= x808090_g_MailEndDayTime then	--在发邮件时间
	
		local HaveMail = GetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL)	--获取记录值
		if(HaveMail == 0)then		--保证玩家在五一期间登陆，只会收到一封邮件
			LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LQZP_HUODONGMAIL}" )
			SetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL, 1)	--记录收到过邮件了
		end
	end	
end

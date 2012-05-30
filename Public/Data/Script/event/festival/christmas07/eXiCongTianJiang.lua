--2007圣诞元旦活动....
--新手抽奖_喜从天降活动....

--答题任务 兑换奖券脚本....


--脚本号
x050022_g_ScriptId = 050022

--活动时间
x050022_g_StartDayTime = 2008080610		--活动开始时间 2007-12-24
x050022_g_EndDayTime =2008081309			--活动结束时间 2008-1-7

--答题脚本脚本号
x050022_g_QuizScriptId = 050021

--**********************************
--任务入口函数
--**********************************
function x050022_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	local NumText = GetNumText()

	if NumText == 801 then

		--显示新手答题界面....
		x050022_ShowQuiz( sceneId, selfId, targetId )

	elseif NumText == 802 then

		BeginEvent( sceneId )
			AddText( sceneId, "  您确定现在使用奖券进行兑奖吗？" )
			AddNumText(sceneId,x050022_g_ScriptId,"确定",8,803)
			AddNumText(sceneId,x050022_g_ScriptId,"取消",8,804)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif NumText == 811 then

		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_02}" )

	elseif NumText == 812 then

		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_02}" )

	elseif NumText == 803 then

		--兑换奖券....
		local ret = x050022_GiveGift( sceneId, selfId, targetId )
		if ret == 1 then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		end

	elseif NumText == 804 then

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

	end

end

--**********************************
--列举事件
--**********************************
function x050022_OnEnumerate( sceneId, selfId, targetId )

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	if LuaFnGetName( sceneId, targetId ) == "赵天师" then
		AddNumText(sceneId,x050022_g_ScriptId,"喜从天降",6,801)
		AddNumText(sceneId,x050022_g_ScriptId,"喜从天降介绍",11,811)
	elseif LuaFnGetName( sceneId, targetId ) == "龚彩云" then
		AddNumText(sceneId,x050022_g_ScriptId,"领取喜从天降活动奖励",6,802)
		AddNumText(sceneId,x050022_g_ScriptId,"关于喜从天降抽奖活动",8,812)
	end

end

--**********************************
--显示喜从天降答题界面
--**********************************
function x050022_ShowQuiz( sceneId, selfId, targetId )

	--检测是否可以答题....
	local ret, msg = x050022_CheckCanDoQuiz( sceneId, selfId )
	if 0 == ret then
		x050022_MsgBox( sceneId, selfId, targetId, msg )
		return
	end

	--打开喜从天降答题界面....
	CallScriptFunction( x050022_g_QuizScriptId, "ShowQuizUI",sceneId, selfId, targetId )

end

--**********************************
--检测玩家当前是否可以做答题
--**********************************
function x050022_CheckCanDoQuiz( sceneId, selfId )

	if 1 ~= x050022_CheckRightTime() then
		return 0, "  现在不是活动时间。"
	end

	local CurLevel = GetLevel( sceneId, selfId )
	local LastLevel = GetMissionData( sceneId, selfId, MD_XICONGTIANJIANG_LASTLV )

	if CurLevel < 2 then
		return 0, "#{XSCJ_20071205_03}"
	end

	if CurLevel > 25 then
		return 0, "#{XSCJ_20071205_04}"
	end

	if LastLevel >= CurLevel then
		return 0, "#{XSCJ_20071205_05}" 
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		return 0, "#{XSCJ_20071205_06}"
	end

	return 1

end

--**********************************
--检测当前是否是活动时间
--**********************************
function x050022_CheckRightTime()
local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local nHour	 = GetHour()
  local curDayTime = nYear*1000000+(nMonth+1)*10000+nDay*100+nHour

	if curDayTime >= x050022_g_StartDayTime and curDayTime <= x050022_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x050022_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--玩家答对所有题目时回调此函数
--**********************************
function x050022_OnPlayerFinishQuiz( sceneId, selfId )

	--记录本级已经做过答题任务了....
	local Level = GetLevel( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_XICONGTIANJIANG_LASTLV, Level )

	--给奖券....
	TryRecieveItem( sceneId, selfId, 30505147, QUALITY_MUST_BE_CHANGE )

	--醒目提示
	BeginEvent( sceneId )
		AddText( sceneId, "#{XSCJ_20071205_10}" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	--特效....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)

end

--**********************************
--玩家升级时回调此函数
--**********************************
function x050022_OnPlayerLevelUp( sceneId, selfId )

	if 1 ~= x050022_CheckRightTime() then
		return
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel > 25 then
		return
	end

	LuaFnSendSystemMail(sceneId, GetName(sceneId, selfId), "#{XSCJ_20071205_01}")

end

--**********************************
--兑换奖券
--**********************************
function x050022_GiveGift( sceneId, selfId, targetId )

	if 1 ~= x050022_CheckRightTime() then
		return 0
	end

	local CurLevel = GetLevel( sceneId, selfId )
	if CurLevel > 25 then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_12}" )
		return 0
	end

	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_13}" )
		return 0
	end

	--扣奖券....
	if 0 == DelItem(sceneId, selfId, 30505147, 1) then
		x050022_MsgBox( sceneId, selfId, targetId, "#{XSCJ_20071205_14}" )
		return 0
	end

	--给奖品....
	local GiftTbl = {

		--需要强制绑定的物品....
		{ itemId=30505146, odds=200 },
		{ itemId=30505171, odds=200 },
		{ itemId=30505170, odds=200 },

		--需要公告的物品....
		{ itemId=10141096, odds=50 },
		{ itemId=10141097, odds=50 },
		{ itemId=10141098, odds=40 },
		{ itemId=10141099, odds=40 },
		{ itemId=30501128, odds=110 },
		{ itemId=30501129, odds=110 },

	}
	
	local index = 0
	local randValue = random(1000);
	randValue = randValue - 1;

	for i, item in GiftTbl do
		if item.odds >= randValue then
			index = i
			break;
		end
		randValue = randValue - item.odds;
	end

	if index == 0 then
		return 0
	end

	if index < 4 then

		local BagIndex = TryRecieveItem( sceneId, selfId, GiftTbl[index].itemId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			BeginEvent( sceneId )
				AddText( sceneId, "喜从天降！恭喜您获得#{_ITEM"..GiftTbl[index].itemId.."}奖励，希望您再接再厉" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			LuaFnItemBind( sceneId, selfId, BagIndex)
		end

	else

		local BagIndex = TryRecieveItem( sceneId, selfId, GiftTbl[index].itemId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then

			BeginEvent( sceneId )
				AddText( sceneId, "喜从天降！恭喜您获得#{_ITEM"..GiftTbl[index].itemId.."}奖励，希望您再接再厉" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )

			local strTrans = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local strName = GetName(sceneId, selfId)
			local strMsg = format("#P不得了啦，开出大奖啦！喜从天降，恭喜#{_INFOUSR%s}获得#{_INFOMSG%s}一个，希望#{_INFOUSR%s}再接再厉。", strName, strTrans, strName)

			MonsterTalk(sceneId, targetId, "大理", strMsg)

		end

	end

	--特效....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 151, 0)

	return 1

end


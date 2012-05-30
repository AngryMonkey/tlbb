--07圣诞元旦
--圣诞守夜活动
--雪人NPC脚本....

--脚本号
x050027_g_ScriptId = 050027

x050027_g_GiftTbl = {

	30505150,
	30505151,
	30505152,
	30505153

}

x050027_g_StartTime = 73100
x050027_g_EndTime   = 73108

--**********************************
--事件交互入口
--**********************************
function x050027_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		local NeedCount = CallScriptFunction( 050023, "GetNeedBallCount", sceneId )
		if NeedCount > 0 then
			AddText(sceneId,"    大家加油啊，还差#Y"..NeedCount.."#W个雪球堆到我身上我就可以长大了！")
		end
		AddText(sceneId,"#{SDSY_20071206_01}")
		AddNumText(sceneId,x050027_g_ScriptId,"领取圣诞守夜礼物",6,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x050027_OnEventRequest( sceneId, selfId, targetId, eventId )

	-- 12月24日24时到12月25日2时
	local curTimeDay = GetTime2Day();
	local curTimeHour = GetHour();
	--时间没到....
	if curTimeDay < 20081225 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SDSY_20071206_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--是否领过了....
	local flag = GetMissionFlag(sceneId, selfId, MF_CHRISTMAS08_GIFT)
	if flag ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SDSY_20071206_03}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--时间过了....
	if curTimeDay > 20081225 or (curTimeDay == 20081225 and curTimeHour > 1) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SDSY_20071206_04}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SDSY_20071206_05}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--给东西....
	local rand = random( getn(x050027_g_GiftTbl) )
	TryRecieveItem( sceneId, selfId, x050027_g_GiftTbl[rand], QUALITY_MUST_BE_CHANGE )

	--发邮件....
	LuaFnSendSystemMail(sceneId, GetName(sceneId, selfId), "#{SDSY_20071206_06}")

	--记录他已经领过了....
	SetMissionFlag(sceneId, selfId, MF_CHRISTMAS08_GIFT, 1)

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--年兽boss掉落宝箱生长点
--无敌buff
x050052_g_impactID = 54
x050052_strErrorNotice = "#{NSBS_20071228_10}"

x050052_g_strNotice0 = "#{NSBS_20071228_16}"
x050052_g_strNotice1 = "#{NSBS_20071228_17}"
--活动时间
x050052_g_StartDayTime = 8030   --活动结束时间 2008-1-31
x050052_g_EndDayTime = 8044   --活动结束时间 2008-2-14

function x050052_OnRecycle(sceneId,selfId,targetId)
	
	--1.通知年兽boss脚本继续掉落宝箱
	CallScriptFunction( 050051, "DropNianShouBox", sceneId)
	

	return 1;
end

function x050052_OnCreate(sceneId,growPointType,x,y)

end

function x050052_OnOpen(sceneId,selfId,targetId)
	local level = GetLevel( sceneId, selfId )
	
	if level < 10 then
			BeginEvent(sceneId)
			AddText(sceneId, x050052_strErrorNotice);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return OR_NEED_HIGH_LEVEL;
	end
	

	return OR_OK;
end

function x050052_OnProcOver(sceneId,selfId,targetId)
		--2.给开启者加特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x050052_g_impactID, 0)
end

--**********************************
--检测活动是否已结束
--**********************************
function x050052_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050052_g_StartDayTime and curDayTime <= x050052_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
-- 玩家在炸年兽中拾取宝箱中物品时回调本接口
--**********************************
function x050052_OnPlayerPickUpItemInNianShou( sceneId, selfId, itemId, bagidx )

	local isTime = x050052_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	--公告....
	if itemId == 30505107 or itemId == 30501159 or itemId ==30501160 or itemId == 10141105 or itemId == 10141106 or itemId == 10141107 or itemId == 10141108 or itemId == 10141109  or itemId == 10141110 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
		local str = format( "#{_INFOUSR%s}", playerName)
		local str1 = format( "#{_INFOMSG%s}", transfer)
		
		local message = str..x050052_g_strNotice0..str1..x050052_g_strNotice1
		--format("#{_INFOUSR%s}#P向年兽扔出一串鞭炮，噼噼啪啪一阵爆炸之后，年兽扔下一个#{_INFOMSG%s}#P后落荒而逃！", playerName, transfer )
		BroadMsgByChatPipe(sceneId, selfId, message, 4)

	end

end

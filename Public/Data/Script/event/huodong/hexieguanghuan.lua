--活动——
--和谐光环（参考蓝新光环）

--脚本号
x808124_g_ScriptId = 808124

--和谐光环重开，2009年8月12日00：00~2009年9月16日24：00开启活动，czf，2009.07.31
--活动开始时间 2009-8-12
x808124_g_HeXieGuangHuan_BeginDayTime = 20090812

--活动结束时间 2009-9-16
x808124_g_HeXieGuangHuan_EndDayTime = 20090916   

--level表示起始等级，大于这个等级就可以获得后面的BUFF
x808124_g_Impact = {
		{level = 0,	buffId = 186},			--1-10	
		{level = 10,	buffId = 187},		--11-20
		{level = 20,	buffId = 188},		--21-30
		{level = 30,	buffId = 189},		--31-40
		{level = 40,	buffId = 190},		--41-50
		{level = 50,	buffId = 191},		--51-60
		{level = 60,	buffId = 192},		--61-70
		{level = 70,	buffId = 193},		--71-80
		{level = 80,	buffId = 194},		--81-90
		{level = 90,	buffId = 195},		--91-100
		{level = 100,	buffId = 196},		--101-110
		{level = 110,	buffId = 197}		--111-119
}


--**********************************
--任务入口函数
--**********************************
function x808124_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x808124_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local opt = GetNumText();
	
	if( 1 == opt ) then				--点击“和谐光环”
		BeginEvent(sceneId)
			AddText(sceneId, "#{HXGH_90105_3}");
			AddNumText(sceneId, x808124_g_ScriptId, "#{HXGH_90105_4}", 8, 11 )
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif( 11 == opt ) then	--点击“是”
		local lastDate = GetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE )	--上一次领取日期
		local curDate = GetTime2Day()

		if curDate > lastDate then
			if IsPilferLockFlag( sceneId, selfId ) <= 0 then
				return	--安全时间内不让操作
			else
				--可以领取，先设置领取标记再加BUFF
				SetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE, curDate )
				x808124_AddHeXieGuangHuan( sceneId, selfId )
		
				BeginEvent(sceneId)
					AddText(sceneId,"#{HXGH_90105_7}");
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		else
			--本日已经领取过了
			BeginEvent(sceneId)
				AddText(sceneId,"#{HXGH_90105_6}");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif( 111 == opt ) then	--点击“关于和谐光环”,czf,2009.07.31
		BeginEvent(sceneId)
			AddText(sceneId,"#{HXGH_90105_3}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--列举事件
--**********************************
function x808124_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x808124_CheckRightTime()

    if 1 == isTime then
			AddNumText(sceneId, x808124_g_ScriptId, "#{HXGH_90105_1}", 1, 1 )
			AddNumText(sceneId, x808124_g_ScriptId, "#{HXGH_90105_2}", 11, 111 )
    end
end

--**********************************
--检测活动是否已结束
--**********************************
function x808124_CheckRightTime()

    local curDayTime = GetTime2Day()

    if curDayTime > x808124_g_HeXieGuangHuan_EndDayTime then
       return 0
    elseif curDayTime < x808124_g_HeXieGuangHuan_BeginDayTime then
       return 0
    else
    	return 1
    end

end

--**********************************
--给玩家加上和谐光环buff
--**********************************
function x808124_AddHeXieGuangHuan( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)
	local buffId = -1

	for index = 1 , getn(x808124_g_Impact) do
		if( myLevel > x808124_g_Impact[index].level ) then
			buffId = x808124_g_Impact[index].buffId
		end
	end
	
	if( buffId ~= -1 ) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, buffId, 0);
	end
	
end

--**********************************
--上线
--**********************************
function x808124_OnPlayerLogin( sceneId, selfId )
	--检查活动时间
	local isTime = x808124_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local lastMailDate = GetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_MAIL_DATE )	--上一次领取日期
	local curMailDate = GetTime2Day()

	if curMailDate > lastMailDate then
		--今日还未发过系统邮件
		--先标记最近发邮件日期为今日
		SetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_MAIL_DATE, curMailDate )
		
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{HXGH_90105_8}" )
	end
	
end

--**********************************
--检测接受条件
--**********************************
function x808124_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x808124_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x808124_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x808124_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x808124_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x808124_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808124_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x808124_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808124_OnItemChanged( sceneId, selfId, itemdataId )
end

--脚本号
x892002_g_scriptId = 892002

x892002_g_base_longwen1= 25100	--血上限
x892002_g_base_longwen2= 25500	--冰攻击效果
x892002_g_base_longwen3= 26000	--属性攻击冰

--**********************************
function x892002_OnImpactFadeOut( sceneId, selfId, impactId )
	local longwen1 = GetMissionData( sceneId, selfId, MY_LONGWEN1 )
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 25000) == 1 then
		if longwen1>0 then
			x892002_g_base_longwen1=x892002_g_base_longwen1+longwen1
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x892002_g_base_longwen1) == 0 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x892002_g_base_longwen1, 0 )
			end
		end
		if longwen2>0 then
			x892002_g_base_longwen2=x892002_g_base_longwen2+longwen2		
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x892002_g_base_longwen2) == 0 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x892002_g_base_longwen2, 0 )
			end
		end
		if longwen3>0 then
			x892002_g_base_longwen3=x892002_g_base_longwen3+longwen3		
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x892002_g_base_longwen3) == 0 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x892002_g_base_longwen3, 0 )
			end
		end
	else
		x892002_CancelAllImpact(sceneId, selfId)
	end
end
--**********************************
-- 
--**********************************
function x892002_AddImpact(sceneId, selfId,type)
	if type== 1 then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 25000) == 0 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 25000, 0 )
		end
	elseif type==0 then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 25000) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,25000)
			x892002_CancelAllImpact(sceneId, selfId)
		end
	elseif type==3 then--真重楼戒
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5967) == 0 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5967, 0 )
		end
	elseif type==4 then--真重楼戒
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5967) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,5967)
		end
	elseif type==5 then--真重楼链
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5984) == 0 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5984, 0 )
		end
	elseif type==6 then--真重楼链
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5984) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,5984)
		end
	end
end
--**********************************
--醒目提示
--**********************************
function x892002_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x892002_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--**********************************
--消灭所有BUFF
--**********************************
function x892002_CancelAllImpact(sceneId, selfId)
	--加血		
	LuaFnCancelSpecificImpact(sceneId,selfId,25101)
	LuaFnCancelSpecificImpact(sceneId,selfId,25102)
	LuaFnCancelSpecificImpact(sceneId,selfId,25103)
	LuaFnCancelSpecificImpact(sceneId,selfId,25104)
	LuaFnCancelSpecificImpact(sceneId,selfId,25105)
	LuaFnCancelSpecificImpact(sceneId,selfId,25106)
	LuaFnCancelSpecificImpact(sceneId,selfId,25107)
	LuaFnCancelSpecificImpact(sceneId,selfId,25108)
	LuaFnCancelSpecificImpact(sceneId,selfId,25109)
	LuaFnCancelSpecificImpact(sceneId,selfId,25110)
	--攻击状态
	LuaFnCancelSpecificImpact(sceneId,selfId,25501)
	LuaFnCancelSpecificImpact(sceneId,selfId,25502)
	LuaFnCancelSpecificImpact(sceneId,selfId,25503)
	LuaFnCancelSpecificImpact(sceneId,selfId,25504)
	LuaFnCancelSpecificImpact(sceneId,selfId,25505)
	LuaFnCancelSpecificImpact(sceneId,selfId,25506)
	LuaFnCancelSpecificImpact(sceneId,selfId,25507)
	LuaFnCancelSpecificImpact(sceneId,selfId,25508)
	LuaFnCancelSpecificImpact(sceneId,selfId,25509)
	LuaFnCancelSpecificImpact(sceneId,selfId,25510)
	LuaFnCancelSpecificImpact(sceneId,selfId,25511)
	LuaFnCancelSpecificImpact(sceneId,selfId,25512)
	LuaFnCancelSpecificImpact(sceneId,selfId,25513)
	LuaFnCancelSpecificImpact(sceneId,selfId,25514)
	LuaFnCancelSpecificImpact(sceneId,selfId,25515)
	LuaFnCancelSpecificImpact(sceneId,selfId,25516)
	LuaFnCancelSpecificImpact(sceneId,selfId,25517)
	LuaFnCancelSpecificImpact(sceneId,selfId,25518)
	LuaFnCancelSpecificImpact(sceneId,selfId,25519)
	LuaFnCancelSpecificImpact(sceneId,selfId,25520)
	LuaFnCancelSpecificImpact(sceneId,selfId,25521)
	LuaFnCancelSpecificImpact(sceneId,selfId,25522)
	LuaFnCancelSpecificImpact(sceneId,selfId,25523)
	LuaFnCancelSpecificImpact(sceneId,selfId,25524)
	LuaFnCancelSpecificImpact(sceneId,selfId,25525)
	LuaFnCancelSpecificImpact(sceneId,selfId,25526)
	LuaFnCancelSpecificImpact(sceneId,selfId,25527)
	LuaFnCancelSpecificImpact(sceneId,selfId,25528)
	LuaFnCancelSpecificImpact(sceneId,selfId,25529)
	LuaFnCancelSpecificImpact(sceneId,selfId,25530)
	LuaFnCancelSpecificImpact(sceneId,selfId,25531)
	LuaFnCancelSpecificImpact(sceneId,selfId,25532)
	LuaFnCancelSpecificImpact(sceneId,selfId,25533)
	LuaFnCancelSpecificImpact(sceneId,selfId,25534)
	LuaFnCancelSpecificImpact(sceneId,selfId,25535)
	LuaFnCancelSpecificImpact(sceneId,selfId,25536)
	LuaFnCancelSpecificImpact(sceneId,selfId,25537)
	LuaFnCancelSpecificImpact(sceneId,selfId,25538)
	LuaFnCancelSpecificImpact(sceneId,selfId,25539)
	LuaFnCancelSpecificImpact(sceneId,selfId,25540)
	--攻击目标效果
	LuaFnCancelSpecificImpact(sceneId,selfId,26051)
	LuaFnCancelSpecificImpact(sceneId,selfId,26052)
	LuaFnCancelSpecificImpact(sceneId,selfId,26053)
	LuaFnCancelSpecificImpact(sceneId,selfId,26054)
	LuaFnCancelSpecificImpact(sceneId,selfId,26055)
	LuaFnCancelSpecificImpact(sceneId,selfId,26056)
	LuaFnCancelSpecificImpact(sceneId,selfId,26057)
	LuaFnCancelSpecificImpact(sceneId,selfId,26058)
	LuaFnCancelSpecificImpact(sceneId,selfId,26059)
	LuaFnCancelSpecificImpact(sceneId,selfId,26060)
	LuaFnCancelSpecificImpact(sceneId,selfId,26061)
	LuaFnCancelSpecificImpact(sceneId,selfId,26062)
	LuaFnCancelSpecificImpact(sceneId,selfId,26063)
	LuaFnCancelSpecificImpact(sceneId,selfId,26064)
	LuaFnCancelSpecificImpact(sceneId,selfId,26065)
	LuaFnCancelSpecificImpact(sceneId,selfId,26066)
	LuaFnCancelSpecificImpact(sceneId,selfId,26067)
	LuaFnCancelSpecificImpact(sceneId,selfId,26068)
	LuaFnCancelSpecificImpact(sceneId,selfId,26069)
	LuaFnCancelSpecificImpact(sceneId,selfId,26070)
	LuaFnCancelSpecificImpact(sceneId,selfId,26071)
	LuaFnCancelSpecificImpact(sceneId,selfId,26072)
	LuaFnCancelSpecificImpact(sceneId,selfId,26073)
	LuaFnCancelSpecificImpact(sceneId,selfId,26074)
	LuaFnCancelSpecificImpact(sceneId,selfId,26075)
	LuaFnCancelSpecificImpact(sceneId,selfId,26076)
	LuaFnCancelSpecificImpact(sceneId,selfId,26077)
	LuaFnCancelSpecificImpact(sceneId,selfId,26078)
	LuaFnCancelSpecificImpact(sceneId,selfId,26079)
	LuaFnCancelSpecificImpact(sceneId,selfId,26080)
	LuaFnCancelSpecificImpact(sceneId,selfId,26081)
	LuaFnCancelSpecificImpact(sceneId,selfId,26082)
	LuaFnCancelSpecificImpact(sceneId,selfId,26083)
	LuaFnCancelSpecificImpact(sceneId,selfId,26084)
	LuaFnCancelSpecificImpact(sceneId,selfId,26085)
	LuaFnCancelSpecificImpact(sceneId,selfId,26086)
	LuaFnCancelSpecificImpact(sceneId,selfId,26087)
	LuaFnCancelSpecificImpact(sceneId,selfId,26088)
	LuaFnCancelSpecificImpact(sceneId,selfId,26089)
	LuaFnCancelSpecificImpact(sceneId,selfId,26090)

	--属性攻击
	LuaFnCancelSpecificImpact(sceneId,selfId,26001)
	LuaFnCancelSpecificImpact(sceneId,selfId,26002)
	LuaFnCancelSpecificImpact(sceneId,selfId,26003)
	LuaFnCancelSpecificImpact(sceneId,selfId,26004)
	LuaFnCancelSpecificImpact(sceneId,selfId,26005)
	LuaFnCancelSpecificImpact(sceneId,selfId,26006)
	LuaFnCancelSpecificImpact(sceneId,selfId,26007)
	LuaFnCancelSpecificImpact(sceneId,selfId,26008)
	LuaFnCancelSpecificImpact(sceneId,selfId,26009)
	LuaFnCancelSpecificImpact(sceneId,selfId,26010)
	LuaFnCancelSpecificImpact(sceneId,selfId,26011)
	LuaFnCancelSpecificImpact(sceneId,selfId,26012)
	LuaFnCancelSpecificImpact(sceneId,selfId,26013)
	LuaFnCancelSpecificImpact(sceneId,selfId,26014)
	LuaFnCancelSpecificImpact(sceneId,selfId,26015)
	LuaFnCancelSpecificImpact(sceneId,selfId,26016)
	LuaFnCancelSpecificImpact(sceneId,selfId,26017)
	LuaFnCancelSpecificImpact(sceneId,selfId,26018)
	LuaFnCancelSpecificImpact(sceneId,selfId,26019)
	LuaFnCancelSpecificImpact(sceneId,selfId,26020)
	LuaFnCancelSpecificImpact(sceneId,selfId,26021)
	LuaFnCancelSpecificImpact(sceneId,selfId,26022)
	LuaFnCancelSpecificImpact(sceneId,selfId,26023)
	LuaFnCancelSpecificImpact(sceneId,selfId,26024)
	LuaFnCancelSpecificImpact(sceneId,selfId,26025)
	LuaFnCancelSpecificImpact(sceneId,selfId,26026)
	LuaFnCancelSpecificImpact(sceneId,selfId,26027)
	LuaFnCancelSpecificImpact(sceneId,selfId,26028)
	LuaFnCancelSpecificImpact(sceneId,selfId,26029)
	LuaFnCancelSpecificImpact(sceneId,selfId,26030)
	LuaFnCancelSpecificImpact(sceneId,selfId,26031)
	LuaFnCancelSpecificImpact(sceneId,selfId,26032)
	LuaFnCancelSpecificImpact(sceneId,selfId,26033)
	LuaFnCancelSpecificImpact(sceneId,selfId,26034)
	LuaFnCancelSpecificImpact(sceneId,selfId,26035)
	LuaFnCancelSpecificImpact(sceneId,selfId,26036)
	LuaFnCancelSpecificImpact(sceneId,selfId,26037)
	LuaFnCancelSpecificImpact(sceneId,selfId,26038)
	LuaFnCancelSpecificImpact(sceneId,selfId,26039)
	LuaFnCancelSpecificImpact(sceneId,selfId,26040)
end

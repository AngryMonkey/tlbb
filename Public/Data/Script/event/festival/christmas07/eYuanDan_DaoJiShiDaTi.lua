-- 元旦倒计时答题活动
-- 创建人[ QUFEI 2007-12-06 10:13 UPDATE BugID 27816 ]

x050028_g_ScriptId = 050028
x050028_g_ExampleScriptId = 050029

-- 奖励的经验
x050028_g_BonusExp = { 0,0,0,0,0,0,0,0,0,17,
											 21,25,30,35,40,45,51,58,64,71,
											 79,86,94,103,111,121,130,140,150,161,
											 172,183,195,207,219,232,245,258,272,286,
											 301,316,331,346,362,379,395,412,430,447,
											 465,484,503,522,541,561,582,602,623,644,
											 666,688,711,733,756,780,804,828,852,877,
											 903,928,954,981,1007,1034,1062,1089,1118,1146,
											 1175,1204,1234,1264,1294,1325,1356,1387,1419,1451,
											 1483,1516,1549,1583,1616,1651,1685,1720,1755,1791,
											 1827,1863,1900,1937,1975,2012,2051,2089,2128,2167,
											 2207,2247,2287,2328,2369,2410,2452,2494,2537,2579 }
                       
-- 奖励的物品          
x050028_g_BonusItem = 30501106
x050028_g_Name      = "钱龙"
x050028_g_LowLevel  = 10
                       
x050028_g_StartDayTime = 2008082010		-- 活动开始时间
x050028_g_EndDayTime	 = 2008082709		-- 活动结束时间
                       
--**********************************
--列举事件             
--**********************************
function x050028_OnEnumerate( sceneId, selfId, targetId )	
                       
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x050028_g_Name then
		return 0           
	end                  
	                     
	if x050028_CheckHuoDongTime() ~= 1 then
		return 0           
	end                  
					                 
	AddNumText( sceneId, x050028_g_ScriptId, "#{YUANDAN_DATIINFO_001}", 6, 145 )
	AddNumText( sceneId, x050028_g_ScriptId, "#{YUANDAN_DATIINFO_002}", 11,146 )
			                   
end                    
                       
function x050028_OnDefaultEvent( sceneId, selfId, targetId )
	                     
	local	key	= GetNumText()
				               
	if key == 145 then   
		if GetLevel( sceneId, selfId ) < x050028_g_LowLevel then
			x050028_TalkMsg( sceneId, selfId, targetId, "#{YUANDAN_DATIINFO_003}" )	
			return 0         
		end                
		
		local nYear	 = LuaFnGetThisYear()                   
		local nMonth = LuaFnGetThisMonth()
  	local nDay   = LuaFnGetDayOfThisMonth()
  	local curDayTime = nYear*10000+(nMonth+1)*100+nDay
		local DayTime = GetMissionData( sceneId, selfId, MD_DAOJISHIDATI_YUANDAN_DAYTIME )				-- 获得上次参加活动的时间
		                   
		if curDayTime == DayTime then
			x050028_TalkMsg( sceneId, selfId, targetId, "#{YUANDAN_DATIINFO_004}" )	
			return 0         
		end                
		                   
		local BagSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )		
		if BagSpace < 1 then
			x050028_MsgBox( sceneId, selfId, "#{YUANDAN_DATIINFO_007}" )
			return 0         
		end                
		
		SetMissionData( sceneId, selfId, MD_DAOJISHIDATI_EXP, 0 )		               
		--打开答题界面....	 	
		CallScriptFunction( x050028_g_ExampleScriptId, "ShowQuizUI",sceneId, selfId, targetId )
	elseif key == 146 then
		x050028_TalkMsg( sceneId, selfId, targetId, "#{YUANDAN_DATIINFO_005}" )
		return 0           
	else                 
		return 0           
	end	                 
	                     
end                    
                       
--**********************************
--消息提示             
--**********************************
function x050028_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )  
	DispatchMissionTips( sceneId, selfId )
end                    
                       
--**********************************
--对话提示             
--**********************************
function x050028_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)  
      AddText(sceneId, str)      
  EndEvent(sceneId)    
  DispatchEventList(sceneId,selfId,targetId)    
end                    
                       
--**********************************
--检测活动时间         
--**********************************
function x050028_CheckHuoDongTime()
                       
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local nHour	 = GetHour()
  local curDayTime = nYear*1000000+(nMonth+1)*10000+nDay*100+nHour
  
  if curDayTime >= x050028_g_StartDayTime and curDayTime <= x050028_g_EndDayTime then
  	return 1           
	else
		return 0           
	end                     
                       
end                    

function x050028_OnPlayerQuizFinish( sceneId, selfId )
			
	TryRecieveItem( sceneId, selfId, x050028_g_BonusItem, QUALITY_MUST_BE_CHANGE )
	TryRecieveItem( sceneId, selfId, x050028_g_BonusItem, QUALITY_MUST_BE_CHANGE )
	TryRecieveItem( sceneId, selfId, x050028_g_BonusItem, QUALITY_MUST_BE_CHANGE )
		
	local playerlvl = GetLevel( sceneId, selfId )
	local playerexp = 0
	for i=1, 10 do
		playerexp = playerexp + floor(x050028_g_BonusExp[playerlvl]*(i/2+0.5))
	end
	
	LuaFnAddExp( sceneId, selfId, 2*playerexp )
	
	-- 记录今天已经做过答题任务了....	
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local curDayTime = nYear*10000+(nMonth+1)*100+nDay
	SetMissionData( sceneId, selfId, MD_DAOJISHIDATI_YUANDAN_DAYTIME, curDayTime )
	SetMissionData( sceneId, selfId, MD_DAOJISHIDATI_EXP, 0 )
	
end
                       
function x050028_OnPlayerQuizExp( sceneId, selfId, SequenceNum )
	local playerlvl = GetLevel( sceneId, selfId )	
	local playerexp = floor(x050028_g_BonusExp[playerlvl]*(SequenceNum/2+0.5))
		
	local lastexp = GetMissionData( sceneId, selfId, MD_DAOJISHIDATI_EXP )
		
	SetMissionData( sceneId, selfId, MD_DAOJISHIDATI_EXP, playerexp+lastexp )
	
	x050028_MsgBox( sceneId, selfId, "#{YUANDAN_DATIINFO_008}"..playerexp+lastexp )
end

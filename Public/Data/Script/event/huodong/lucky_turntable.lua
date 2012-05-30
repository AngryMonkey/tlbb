--活动——
--圣诞节元旦活动-收集门派道具换奖励

--脚本号
x808071_g_ScriptId = 808071

x808071_g_UICommand = 1999986

x808071_g_BufferId = 8057

--2009.08.12~2009.09.16期间，参加幸运快活三活动获得的经验提高到现在的300%
--czf, 2009.07.30

x808071_g_BeginTime	= 20090812
x808071_g_EndTime	= 20090916

x808071_g_GetXingYunDataParameter = {
	                 1,              --是否有资格参加抽奖
	                 2,              --是否有资格参加飞龙抽奖 
	                 3,              --飞龙奖励
	                 4,              --奖励1
	                 5,              --奖励2
	                 6,              --奖励3
}

x808071_g_DragonItem = {
	                 20310103,              --大风爪
	                 20310104,              --大风翼 
	                 20310105,              --大风牙
}

--奖励经验表
x808071_g_Exp = {

	[20]=1274,[21]=1354,[22]=1434,[23]=1514,[24]=1594,
	[25]=1674,[26]=1754,[27]=1834,[28]=1914,[29]=1994,
	[30]=2074,[31]=2154,[32]=2234,[33]=2314,[34]=2394,
	[35]=2474,[36]=2554,[37]=2634,[38]=2714,[39]=2794,
	[40]=2874,[41]=2954,[42]=3034,[43]=3114,[44]=3194,
	[45]=3274,[46]=3354,[47]=3434,[48]=3514,[49]=3594,
	[50]=3674,[51]=3754,[52]=3834,[53]=3914,[54]=3994,
	[55]=4074,[56]=4154,[57]=4234,[58]=4314,[59]=4394,
	[60]=4474,[61]=4554,[62]=4634,[63]=4714,[64]=4794,
	[65]=4874,[66]=4954,[67]=5034,[68]=5114,[69]=5194,
	[70]=5274,[71]=5354,[72]=5434,[73]=5514,[74]=5594,
	[75]=5674,[76]=5754,[77]=5834,[78]=5914,[79]=5994,
	[80]=6074,[81]=6154,[82]=6234,[83]=6314,[84]=6394,
	[85]=6474,[86]=6554,[87]=6634,[88]=6714,[89]=6794,
	[90]=6874,[91]=6954,[92]=7034,[93]=7114,[94]=7194,
	[95]=7274,[96]=7354,[97]=7434,[98]=7514,[99]=7594,
	[100]=7674,[101]=7754,[102]=7834,[103]=7914,[104]=7994,
	[105]=8074,[106]=8154,[107]=8234,[108]=8314,[109]=8394,
	[110]=8474,[111]=8554,[112]=8634,[113]=8714,[114]=8794,
	[115]=8874,[116]=8954,[117]=9034,[118]=9114,[119]=9194,
	[120]=9274,[121]=9354,[122]=9434,[123]=9514,[124]=9594,
	[125]=9674,[126]=9754,[127]=9834,[128]=9914,[129]=9994,
	[130]=10074,[131]=10154,[132]=10234,[133]=10314,[134]=10394,
	[135]=10474,[136]=10554,[137]=10634,[138]=10714,[139]=10794,
	[140]=10874,[141]=10954,[142]=11034,[143]=11114,[144]=11194,
	[145]=11274,[146]=11354,[147]=11434,[148]=11514,[149]=11594,
	[150]=11674,

}
			

--**********************************
--任务入口函数
--**********************************
function x808071_OnDefaultEvent( sceneId, selfId, targetId )

	local NumText = GetNumText()

	if NumText == 111 then  --参加抽奖
	   x808071_JoinCampaign( sceneId, selfId, targetId )
	elseif NumText == 112 then  --领奖
	   x808071_CheckTime( sceneId, selfId )

	   if(x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[1]) ~= 3
	      or (x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[4]) == 0
	      and x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[5]) == 0
	      and x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[6]) == 0)) then
	    
	    BeginEvent(sceneId)
			  AddText( sceneId, "#{XYLP_20071222_02}" )
		  EndEvent(sceneId)
		  DispatchEventList(sceneId,selfId,targetId)
	    return
	   end
	   x808071_GivePlayerPrize( sceneId, selfId, targetId)
--	  BeginEvent(sceneId)
--	    local getgiftcount = x808071_GetGiftCount(sceneId, selfId) + 1
--	    local str
--	    if getgiftcount > 6 then
--	       str = "您今天的兑换机会已经全部使用完了，请您明天再来。（节日期间每日有6次兑换机会）"
--	    else
--	       str = format("您确定使用9大门派的节日贺帖进行今日第%d次兑换吗？（节日期间每日有6次兑换机会。）", getgiftcount);
--			end
--			AddText(sceneId, str);
--			AddNumText(sceneId, x808071_g_ScriptId,"确定", 8, 113);
--			AddNumText(sceneId, x808071_g_ScriptId,"取消", 8, 114);
--		EndEvent(sceneId)
--		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 113 then
	  BeginEvent(sceneId)
		  AddText(sceneId,"#{XYLP_20071222_20}")
		  --x808071_SetXingYunData(sceneId,selfId,0,0,0,0,0,0)
	  EndEvent(sceneId)
	  DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 114 then
		if(x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[2]) == 0) then
			return
		end
	  --检测是否抽过奖
	  if(x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[2]) == 2) then
	    return
	  end
	  local DragonOdds = random(1,150)
  
	  BeginEvent( sceneId )
	  if(DragonOdds == 150) then  --抽中飞龙
	     local PlayerName = GetName(sceneId,selfId)
	     AddText( sceneId, "#{XYLP_20071222_16}" )
	     --滚屏公告
	     local msg = format("@*;SrvMsg;SCA:#{XYLP_20071222_17}#{_INFOUSR%s}#{XYLP_20071222_18}",PlayerName)
		   AddGlobalCountNews( sceneId, msg )
		   --给与飞龙并设置无法再次抽取
		   x808071_SetXingYunData(sceneId,selfId,-1,2,1,-1,-1,-1)
		   --抽取飞龙统计日志
		   LuaFnAuditLuckyTurnTableDragon(sceneId, selfId, 6, 0);
	  else
	     AddText( sceneId, "#{XYLP_20071222_15}" )
	     --关闭飞龙按钮
		   x808071_SetXingYunData(sceneId,selfId,-1,0,-1,-1,-1,-1)
	  end
		EndEvent( sceneId )
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 115 then  --领取飞龙
	  --没有奖励可以领取
	  if(x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[3]) ~= 1) then
	    BeginEvent(sceneId)
			  AddText( sceneId, "#{XYLP_20071222_19}" )
		  EndEvent(sceneId)
		  DispatchEventList(sceneId,selfId,targetId)
	    return
	  end
	  --检测背包是否有地方....
	  if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		  BeginEvent(sceneId)
			  AddText( sceneId, "你的背包空间不足，无法领取奖励。" )
		  EndEvent(sceneId)
		  DispatchMissionTips(sceneId,selfId)
		  return
	  end
	  x808071_GetItem(sceneId,selfId,7,targetId)  --飞龙
		--关闭抽飞龙选项，并清空飞龙
	  x808071_SetXingYunData(sceneId,selfId,-1,0,0,-1,-1,-1)
  elseif NumText == 116 then  --兑换飞龙
    x808071_SwitchDragon( sceneId, selfId,targetId)  
	end
	
end

--**********************************
--列举事件
--**********************************
function x808071_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x808071_g_ScriptId, "幸运快活三", 6, 111 )
	AddNumText(sceneId, x808071_g_ScriptId, "领取幸运快活三奖励", 6, 112 )
	AddNumText(sceneId, x808071_g_ScriptId, "幸运快活三抽奖说明", 11, 113 )

	if(x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[2]) ~= 0) then
	    AddNumText(sceneId, x808071_g_ScriptId,"快活三：飞龙！", 6, 114);
  		AddNumText(sceneId, x808071_g_ScriptId,"领取飞龙", 6, 115);
	end
	
	AddNumText(sceneId, x808071_g_ScriptId, "兑换飞龙", 6, 116 )
end

--**********************************
--参加活动
--**********************************
function x808071_JoinCampaign( sceneId, selfId, targetId )

  --如果玩家等级小于20不能参加抽奖
	if	GetLevel( sceneId, selfId) < 20 then
		BeginEvent(sceneId)
			AddText( sceneId, "你的等级不足20级，还不能参加“幸运快活三”的抽奖活动呢！" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--如果玩家今天参加过抽奖
	x808071_CheckTime(sceneId, selfId)
	local join = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[1] )
	if(join ~= 0) then
	  BeginEvent(sceneId)
			AddText( sceneId, "你今天已经参加过“幸运快活三”抽奖活动了！请明天再来吧！" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--如果玩家有“幸运快活三”的BUFF
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808071_g_BufferId ) == 1 then
	   BeginEvent(sceneId)
			 AddText( sceneId, "#{XYLP_20071222_08}" )
		 EndEvent(sceneId)
		 DispatchEventList(sceneId,selfId,targetId)
		 return
	end
	--符合条件发送信息客户端打开幸运轮盘抽奖界面
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19999 )

end

--**********************************
--获得这个玩家关于幸运抽奖的数据
--**********************************
function x808071_GetXingYunData( sceneId, selfId,index )
	local temp = 0
	local XingYunData = GetMissionData(sceneId,selfId,MD_XINGYUN_DATA)

	local IsJoin = floor(XingYunData/100000)    --0 没参加过 1参加过

	temp = mod(XingYunData,100000)
	local JoinDragon = floor(temp/10000)        --0 不可以参加 1 可以参加

	temp = mod(XingYunData,10000)
	local DragonPrize = floor(temp/1000)        --0 没有飞龙奖励 1 有飞龙奖励

	temp = mod(XingYunData,1000)

	local Prize1 = floor(temp/100)        -- 奖励1的奖励类型

	temp = mod(XingYunData,100)
	local Prize2 = floor(temp/10)        -- 奖励2的奖励类型

	local Prize3 = mod(XingYunData,10)       -- 奖励3的奖励类型

	if(x808071_g_GetXingYunDataParameter[1] == index) then
	  return IsJoin
	elseif(x808071_g_GetXingYunDataParameter[2] == index) then
	  return JoinDragon
	elseif(x808071_g_GetXingYunDataParameter[3] == index) then
	  return DragonPrize
	elseif(x808071_g_GetXingYunDataParameter[4] == index) then
	  return Prize1
	elseif(x808071_g_GetXingYunDataParameter[5] == index) then
	  return Prize2
	elseif(x808071_g_GetXingYunDataParameter[6] == index) then
	  return Prize3
	else 
	  return -1
	end

end
--**********************************
--存储这个玩家关于幸运抽奖的数据
--**********************************
function x808071_SetXingYunData(sceneId,selfId,IJoin,JDragon,DPrize,P1,P2,P3)

	local IsJoin,JoinDragon,DragonPrize,Prize1,Prize1,Prize1 = -1
	if(IJoin == -1) then
	  IsJoin = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[1] )*100000
	else
	  IsJoin = IJoin*100000    --0 没参加过 1参加过
	end

	if(JDragon == -1) then
	  JoinDragon = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[2] )*10000
	else
	  JoinDragon = JDragon*10000        --0 不可以参加 1 可以参加
	end

  if(DPrize == -1) then
	  DragonPrize = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[3] )*1000
	else
	  DragonPrize = DPrize*1000        --0 没有飞龙奖励 1 有飞龙奖励
	end

	if(P1 == -1) then
	  Prize1 = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[4] )*100
	else
	  Prize1 = P1*100        -- 奖励1的奖励类型
	end

	if(P2 == -1) then
	  Prize2 = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[5] )*10
	else
	  Prize2 = P2*10        -- 奖励2的奖励类型
	end

	if(P3 == -1) then
	  Prize3 = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[6] )
	else
	  Prize3 = P3       -- 奖励3的奖励类型
	end

	local val = IsJoin+JoinDragon+DragonPrize+Prize1+Prize2+Prize3
	SetMissionData( sceneId, selfId, MD_XINGYUN_DATA, val )

end
--**********************************
--收到客户端发送过来的选择进行处理(占卜)
--**********************************
function x808071_OnAugury( sceneId, selfId, pos_ui )

   local IsJoin = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[1] )
   local JoinDragon,DragonPrize = 0,0

   local prizetype_1,prizetype_2,prizetype_3 = 0,0,0

   if(IsJoin == 0) then       --如果没抽过奖，那么第一次抽奖

     prizetype_1 = x808071_OnPrize();
   
     prizetype_2 = x808071_OnPrize();
     while(prizetype_2 == 5) do --超级大奖的几率必须保证在10%
        prizetype_2 = x808071_OnPrize();
     end
     
     prizetype_3 = x808071_OnPrize();
     while(prizetype_3 == 5) do --超级大奖的几率必须保证在10%
        prizetype_3 = x808071_OnPrize();
     end
     --如果玩家什么奖励都没有，就要给一个小经验奖励
     if(prizetype_1 == 4 and prizetype_2 == 4 and prizetype_3 == 4) then
        local index = random(1,3)
        if(index == 1) then
          prizetype_1 = 2
        elseif(index == 2) then
          prizetype_2 = 2
        elseif(index == 3) then
          prizetype_3 = 2
        end
     end
     
--     if(prizetype_1 == 5) then--抽中超级大奖
--       JoinDragon = 0-- 即使抽中超级大奖暂时也不需要显示，但是可以继续抽飞龙
--       local DragonOdds= random(1,150)
--       if(DragonOdds == 150) then --抽中飞龙
--         DragonPrize = 1
--       else
--         DragonPrize = 0
--       end
--     else
--       JoinDragon = 0
--       DragonPrize = 0       
--     end
     --存储抽奖结果
     x808071_SetXingYunData(sceneId,selfId,1,JoinDragon,DragonPrize,prizetype_1,prizetype_2,prizetype_3)
     --x808071_SetXingYunData(sceneId,selfId,1,0,0,5,3,3)
     --幸运轮盘中奖统计日志
     LuaFnAuditLuckyTurnTable(sceneId, selfId, prizetype_1, prizetype_2, prizetype_3);
     --给予玩家“幸运快活三”的BUFF
     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808071_g_BufferId, 0)
     --发送一个结果给客户端
     BeginUICommand(sceneId)
       UICommand_AddInt(sceneId,1)--第一张牌
		   UICommand_AddInt(sceneId,prizetype_1)
	   EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId, x808071_g_UICommand)

   elseif(IsJoin == 1) then       --如果抽过第一次奖，那么不再抽奖，只把下第2次结果发送过去

     prizetype_2 = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[5] )
     --发送第二个结果给客户端
     BeginUICommand(sceneId)
       UICommand_AddInt(sceneId,2)--第二张牌
		   UICommand_AddInt(sceneId,prizetype_2)
	   EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId, x808071_g_UICommand)
	   --记录第二次已经发送
	   x808071_SetXingYunData(sceneId,selfId,2,-1,-1,-1,-1,-1)

   elseif(IsJoin == 2) then       --如果抽过第二次奖，那么不再抽奖，只把下第3次结果发送过去

     prizetype_3 = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[6] )
     --发送第三个结果给客户端
     BeginUICommand(sceneId)
       UICommand_AddInt(sceneId,3)--第三张牌
		   UICommand_AddInt(sceneId,prizetype_3)
	   EndUICommand(sceneId)
	   DispatchUICommand(sceneId,selfId, x808071_g_UICommand)
	   --记录第三次已经发送
	   x808071_SetXingYunData(sceneId,selfId,3,-1,-1,-1,-1,-1)
   end   
   
end

--**********************************
--随机抽奖
--**********************************
function x808071_OnPrize()
   local odds = random(1,100000)
   local prizetype = 0
   if( odds >= 1 and odds <= 1000 ) then       --1000 大经验
	    prizetype = 1
	 elseif( odds >= 1001 and odds <= 66540 ) then          --65540  小经验
	    prizetype = 2
	 elseif( odds >= 66541 and odds <= 66990 ) then          --450    道具
	    prizetype = 3
	 elseif( odds >= 66991 and odds <= 99990 ) then          --33000   空气
	    prizetype = 4
	 elseif( odds >= 99991 and odds <= 100000 ) then          --10   快活三
	    prizetype = 5
	 end
	 return prizetype
end

--**********************************
--检测时间
--**********************************
function x808071_CheckTime( sceneId, selfId )
	  
	local td = GetDayTime()
	local LastXingYunTime = GetMissionData(sceneId,selfId,MD_XINGYUN_TIME_INFO)

	if td > LastXingYunTime then
	    --清空抽奖结果
      x808071_SetXingYunData(sceneId,selfId,0,0,0,0,0,0)
	    --SetMissionData( sceneId, selfId, MD_XINGYUN_TIME_INFO, td )
	end

end

--**********************************
--领去普通奖励
--**********************************
function x808071_GivePlayerPrize( sceneId, selfId, targetId)

	  local PrizeType = {}	

	  PrizeType[1] = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[4] )
	  PrizeType[2] = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[5] )
	  PrizeType[3] = x808071_GetXingYunData( sceneId, selfId,x808071_g_GetXingYunDataParameter[6] )
	  
	  --计算所需的空间
	  local needspace = 0
	  for i = 1,3 do
	    if(PrizeType[i] == 3 or PrizeType[i] ==5) then
	      needspace = needspace + 1
	    end
	  end
	  
	  --检测背包是否有地方....
	  if LuaFnGetPropertyBagSpace( sceneId, selfId ) < needspace then
		  BeginEvent(sceneId)
			  AddText( sceneId, "你的背包空间不足，无法领取奖励。" )
		  EndEvent(sceneId)
		  DispatchMissionTips(sceneId,selfId)
		  return
	  end
	 
	  --面板对话奖励提示
	  BeginEvent(sceneId)
			 AddText( sceneId, "#{XYLP_20071222_03}" )

	  --给予玩家奖励
	  for i = 1,3 do
	    if(PrizeType[i] == 1) then
	      AddText( sceneId, x808071_GetExp(sceneId,selfId,1))  --大经验	     
	    elseif(PrizeType[i] == 2) then
	      AddText( sceneId, x808071_GetExp(sceneId,selfId,2))--小经验
	    elseif(PrizeType[i] == 3) then
	      AddText( sceneId, x808071_GetItem(sceneId,selfId,3,targetId))--普通道具
	      --elseif(PrizeType[i] == 4) then  --空气 没有奖励
	    elseif(PrizeType[i] == 5) then
	      x808071_GetItem(sceneId,selfId,5,targetId)
	      AddText( sceneId, "#G道具：才子佳人")--快活三 超级道具 才子佳人
	    end	  
	  end

	  EndEvent(sceneId)
	  DispatchEventList(sceneId,selfId,targetId)
	  	  
	  --清空三个奖励数据
	  x808071_SetXingYunData(sceneId,selfId,-1,-1,-1,0,0,0)
end

--**********************************
--得到经验 type代表经验类型
--**********************************
-- 2009.08.12~2009.09.16期间，参加幸运快活三活动获得的经验提高到现在的300%
-- czf, 2009.07.30

--是否规定的时间（2009.08.12~2009.09.16）
function x808071_IsInSpecialTime( )	

	local curDate = GetTime2Day( )
	--如果是活动时间则返回今天日期
	if curDate >= x808071_g_BeginTime and curDate <= x808071_g_EndTime then
		return curDate
	end
	--否则返回0
	return 0
	
end

function x808071_GetExp( sceneId, selfId, type, targetId )

   local str = ""
   local playerLevel = GetLevel(sceneId, selfId)
   local exp = x808071_g_Exp[playerLevel]
   if(type == 1) then--大经验
     exp = exp * 5
   end
   -- 检测是否在2009.08.12~2009.09.16期间, czf, 2009.07.30
   local curDate = x808071_IsInSpecialTime()
   if curDate ~= 0 then 
   		exp = exp * 3
   end
   AddExp( sceneId,selfId,exp)
   
   str = format( "#G经验：%d", exp )
   
   return str
--   BeginEvent( sceneId )
--	 AddText( sceneId, str )
--	 EndEvent( sceneId )
--	 DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--得到物品
--**********************************
function x808071_GetItem( sceneId, selfId, type, targetId )
  local ItemId = 0
  local str = ""
  
  if(type == 3) then
    ItemId = x808071_RandomItem()
    str = format( "#G道具：#{_ITEM%d}", ItemId )
  elseif(type == 5) then
    ItemId = 10124048  -- 才子佳人
    --str = format( "道具：#{_ITEM%d}", ItemId )
  elseif(type == 7) then
    ItemId = 10141084  -- 飞龙
    str = format( "恭喜您！您在“幸运快活三”的抽奖活动中共得到以下奖励：#G#{_ITEM%d}", ItemId )
  end
  
  local BagIndex = TryRecieveItem( sceneId, selfId, ItemId, QUALITY_MUST_BE_CHANGE )
  
  --大风系列物品和一级兽栏不绑定
  if(ItemId ~= x808071_g_DragonItem[1] and ItemId ~= x808071_g_DragonItem[2] 
  and ItemId ~= x808071_g_DragonItem[3] and ItemId ~=30509500) then
  --绑定物品奖励
  	local	bindidx	=	LuaFnItemBind(sceneId, selfId,BagIndex)
		if bindidx ~= 1 then
		  	local bindmsg = "绑定失败"													
		  	BeginEvent( sceneId )
		    	AddText( sceneId, bindmsg )
		  	EndEvent( sceneId )
		  	DispatchMissionTips( sceneId, selfId )
		end
	end
	
	--获得物品信息
	local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
	  
	if BagIndex ~= -1 then

	  if(type == 5) then
	    --发送系统公告
      local PlayerName = GetName(sceneId,selfId)
	    str = format( "#{XYLP_20071222_11}#{_INFOUSR%s}#{XYLP_20071222_12}#{_INFOMSG%s}#{XYLP_20071222_13}飞龙坐骑#{XYLP_20071222_14}", PlayerName,ItemInfo )
	    BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	    --开启抽飞龙选项
	    x808071_SetXingYunData(sceneId,selfId,-1,1,-1,-1,-1,-1)
	    --马上加上按钮，但是我认为不好，所以注销掉
--	    BeginEvent(sceneId)
--	    AddText(sceneId,"  从现在开始，你只许疼我一个，要宠我，不许骗我，答应我的每一件事情都要做到。")
--	    AddNumText(sceneId, x808071_g_ScriptId, "幸运快活三", 6, 111 )
--	    AddNumText(sceneId, x808071_g_ScriptId, "领取幸运快活三奖励", 6, 112 )
--	    AddNumText(sceneId, x808071_g_ScriptId, "幸运快活三抽奖说明", 6, 113 )
--	    AddNumText(sceneId, x808071_g_ScriptId,"快活三：飞龙！", 6, 114);
--  		AddNumText(sceneId, x808071_g_ScriptId,"领取飞龙", 6, 115);
--	    EndEvent(sceneId)
--	    DispatchEventList(sceneId,selfId,targetId)      
	  elseif (type == 3) then-- 面板对话
	    local PlayerName = GetName(sceneId,selfId)
	    local info = format( "#{XYLP_20080104_01}#{_INFOUSR%s}#{XYLP_20080104_02}#{_INFOMSG%s}#{XYLP_20080104_03}", PlayerName,ItemInfo )
	    BroadMsgByChatPipe( sceneId, selfId, info, 4 )
	    return str
		elseif (type == 7) then
		  BeginEvent( sceneId )
			  AddText( sceneId, str )
		    EndEvent( sceneId )
		  DispatchEventList(sceneId,selfId,targetId)
		  --发送系统公告
		  local PlayerName = GetName(sceneId,selfId)
	    str = format( "#{XYLP_20071222_21}#{_INFOUSR%s}#{XYLP_20071222_22}#{_INFOMSG%s}#{XYLP_20071222_23}", PlayerName,ItemInfo )
	    BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	  end
		
	end
end

--**********************************
--随机获得物品
--**********************************
function x808071_RandomItem( )
  local ItemId = 0
  local randomval = random(1,50000)

  if( randomval >= 1 and randomval <= 900 ) then       --招牌：刀剑争锋 9
	    ItemId = 30008022
	 elseif( randomval >= 901 and randomval <= 1800 ) then          --招牌：铁甲铜壁 9
	    ItemId = 30008023
	 elseif( randomval >= 1801 and randomval <= 2700 ) then          --招牌：珍禽异兽  9
	    ItemId = 30008024
	 elseif( randomval >= 2701 and randomval <= 4685 ) then          --马鞍  19.85
	    ItemId = 30008006
	 elseif( randomval >= 4686 and randomval <= 6185 ) then          --清心丹	15
	    ItemId = 30008018
	 elseif( randomval >= 6186 and randomval <= 7185 ) then          --干坤杯	10
	    ItemId = 30008033
	 elseif( randomval >= 7186 and randomval <= 8185 ) then          --小灵丹	10
	    ItemId = 30008016
	 elseif( randomval >= 8186 and randomval <= 9685 ) then          --天罡强化精华	15
	    ItemId = 30900006
	 elseif( randomval >= 9686 and randomval <= 9985 ) then          --一级兽栏	3
	    ItemId = 30509500
	 elseif( randomval >= 9986 and randomval <= 9990 ) then          --大风爪	0.05
	    ItemId = x808071_g_DragonItem[1]
	 elseif( randomval >= 9991 and randomval <= 9995 ) then          --大风翼	0.05
	    ItemId = x808071_g_DragonItem[2]
	 elseif( randomval >= 9996 and randomval <= 10000 ) then          --大风牙	0.05
	    ItemId = x808071_g_DragonItem[3]
	 elseif( randomval >= 10001 and randomval <= 50000 ) then         --高级还童天书 dun.liu
	    ItemId = 30503019
	 end
	 return ItemId

end

--**********************************
--给予玩家提示
--**********************************
function x808071_PlayerTip( sceneId, selfId, tip )
	
			if tip ~= 1 then
				local td = GetDayTime()
		    SetMissionData( sceneId, selfId, MD_XINGYUN_TIME_INFO, td )
	    end
      
      BeginEvent(sceneId)
      if(tip == 1) then
        AddText( sceneId, "柳月虹：您的奖还没有抽完呢！" )
      else
        AddText( sceneId, "柳月虹：恭喜您！您今天的“幸运快活三”抽奖活动已经完成，请您随时找我领取奖励！" )
      end      
			  
		  EndEvent(sceneId)
		  DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--兑换飞龙
--**********************************
function x808071_SwitchDragon( sceneId, selfId,targetId)
      
      local ZhuaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x808071_g_DragonItem[1])   --大风爪
      local YiCount = LuaFnGetAvailableItemCount(sceneId, selfId, x808071_g_DragonItem[2])  --大风翼
      local YaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x808071_g_DragonItem[3])   --大风牙
      
      local result = 1
      if ZhuaCount < 2 then
    			result = 0
  		elseif YiCount < 2 then
    			result = 0
  		elseif YaCount < 2 then
    			result = 0
    	end
    	
    	if result == 0 then
				BeginEvent(sceneId)
					AddText( sceneId, "如果收集齐2颗大风牙，2只大风翼和2个大风爪，我就能帮你召唤出飞龙：大风。很可惜，您现在还没有收集齐道具，我也无能为力了。" )
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return
			end
			
			--检测背包是否有地方....
	  	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		  	BeginEvent(sceneId)
			  	AddText( sceneId, "你的背包空间不足，无法领取奖励。" )
		  	EndEvent(sceneId)
		  	DispatchMissionTips(sceneId,selfId)
		 	 return
	  	end
	  	
	  	--是否删除失败....
			for i, v in x808071_g_DragonItem do
	  		if LuaFnDelAvailableItem(sceneId, selfId, v, 2) == 0 then
			 		BeginEvent(sceneId)
			 			AddText( sceneId, "如果收集齐2颗大风牙，2只大风翼和2个大风爪，我就能帮你召唤出飞龙：大风。很可惜，您现在还没有收集齐道具，我也无能为力了。" )
		   		EndEvent(sceneId)
		   		DispatchMissionTips( sceneId, selfId )
		   		return
		 		end
	 		end
	 		
	 		--给予飞龙
	 		local BagIndex = TryRecieveItem( sceneId, selfId, 10141084, QUALITY_MUST_BE_CHANGE )
  		--绑定物品奖励
  		local	bindidx	=	LuaFnItemBind(sceneId, selfId,BagIndex)
			if bindidx ~= 1 then
		  		local bindmsg = "绑定失败"													
		  		BeginEvent( sceneId )
		    		AddText( sceneId, bindmsg )
		  		EndEvent( sceneId )
		  		DispatchMissionTips( sceneId, selfId )
			end
	
	    local PlayerName = GetName(sceneId,selfId)
			--获得物品信息
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			
			--各种公告
			if BagIndex ~= -1 then
      	BeginEvent( sceneId )
					AddText( sceneId, "#{XYLP_20071222_16}" )
		    
		    
		    --滚屏公告1
	      local msg = format("@*;SrvMsg;SCA:#{XYLP_20071222_17}#{_INFOUSR%s}#{XYLP_20071222_18}",PlayerName)
		    AddGlobalCountNews( sceneId, msg )
		   
		    
		 		--发送系统公告
		  	local PlayerName = GetName(sceneId,selfId)
	    	str = format( "#{XYLP_20071222_21}#{_INFOUSR%s}#{XYLP_20071222_22}#{_INFOMSG%s}#{XYLP_20071222_23}", PlayerName,ItemInfo )
	    	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	    	
	    	--滚屏公告2
	      local msg = format("@*;SrvMsg;SCL:#{XYLP_20071222_21}#{_INFOUSR%s}#{XYLP_20071222_22}飞龙：大风#{XYLP_20071222_23}",PlayerName)
		    AddGlobalCountNews( sceneId, msg )
		    
		    EndEvent( sceneId )
		    DispatchEventList(sceneId,selfId,targetId)
	  	end
end

--**********************************
--检测接受条件
--**********************************
function x808071_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x808071_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x808071_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x808071_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x808071_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x808071_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808071_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x808071_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808071_OnItemChanged( sceneId, selfId, itemdataId )
end

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--该脚本文件只供师门任务而做, 其他任务如要引用, 后果自负!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
x500501_g_StartDayTime = 8030   --活动结束时间 2008-1-31
x500501_g_EndDayTime = 8044   --活动结束时间 2008-2-14

x500501_g_strDieNotice0 = "#{SMRW_20080118_01}"
x500501_g_strDieNotice1 = "#{SMRW_20080118_02}"

x500501_g_ItemId = {30501101, 30501102}

x500501_g_LingShouDanId = {30503034, 30503043, 30503052, 30503061} --灵兽丹ID

x500501_g_strHelpFinishedText = "  同门有难，理当相助，你的任务我已经安排其他同门去完成了。#r#G任务完成！#W"

function x500501_ACT_Duanwu( sceneId, selfId, iDayHuan ) --端午活动
	
	local DayTime = GetDayTime()
	local Duanwu_Cyc = 20
	local Duanwu_Zongzi = 30501100            --粽子
	local Duanwu_GemDataGlobalIndex = 40
	local Duanwu_MaxGemCount = 2000
	
	local Duanwu_GemData  = LuaFnGetWorldGlobalData( Duanwu_GemDataGlobalIndex )
	local Duanwu_Daytime  = floor( Duanwu_GemData / 10000 )
	local Duanwu_GemCount = mod( Duanwu_GemData, 10000 )
	
	local DuanwuGemList = { 50101001, 50101002, 50102001, 50102002, 50102003, 50102004, 
	                        50103001, 50104002, 50111001, 50111002, 50112001, 50112002, 
	                        50112003, 50112004, 50113001, 50113002, 50113003, 50113004, 
	                        50113005, 50114001 }
	                        
	if iDayHuan <= 0 then
		return
	end
	if DayTime < 7168 or DayTime > 7175 then
		return --不在活动时间内
	end
	
	local ModHuan = mod( iDayHuan, Duanwu_Cyc )
	if 0 ~= ModHuan then
		return  --不是给奖励的环数
	end
		
	BeginAddItem(sceneId)
		AddItem( sceneId, Duanwu_Zongzi, 1 )    --给予玩家粽子
	local AddRet = EndAddItem(sceneId,selfId)
	if AddRet > 0 then
		AddItemListToHuman(sceneId,selfId)  --给予粽子完毕
		
		local Gemable = random(100)  -- 1/5获得宝石
		if Gemable > 20 then
			return
		end
		
		if DayTime ~= Duanwu_Daytime then
			Duanwu_Daytime = DayTime
			Duanwu_GemCount = 0   --宝石计数清零
		end
		
		if Duanwu_GemCount >= Duanwu_MaxGemCount then
			return     --宝石数量超过了每天送出的最大数量
		end

		local GemListSize = getn(DuanwuGemList)
		local RandomGem = DuanwuGemList[ random( GemListSize ) ]
		BeginAddItem(sceneId)
			AddItem( sceneId, RandomGem, 1 )    --给予玩家宝石
		local GemRet = EndAddItem(sceneId,selfId)
		if GemRet > 0 then
			AddItemListToHuman(sceneId,selfId)
			local GemInfo = GetItemTransfer(sceneId,selfId,0)
			local strformat	= "#{_INFOUSR%s}#在端午节的活动当中，因为完成了第20环的师门任务，深得师傅赞赏，不但获得了粽子一粒，而且还意外的获得了一颗#Y#{_INFOMSG%s}。"
			local strText = format(strformat, GetName(sceneId,selfId),GemInfo)
			--公告精简，去除此公告
			--BroadMsgByChatPipe(sceneId, selfId, strText, 4)
			
			--存入全局数据
			Duanwu_GemData = DayTime * 10000 + Duanwu_GemCount + 1
			LuaFnSetWorldGlobalData( Duanwu_GemDataGlobalIndex, Duanwu_GemData )

		end
		
	end	

	
end


--**********************************
--提交
--**********************************
function x500501_OnSubmit_Necessary( sceneId, selfId, targetId, isHelpFinish )
	local Level =GetLevel(sceneId, selfId)
	--begin modified by zhangguoxin 090208
	local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
	local iDayTime = floor(iTime/100)	--上一次放弃任务的时间(天数)
	local iQuarterTime = mod(iTime,100)	--上一次放弃任务的时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
	local iDayHuan = iDayCount --当天内完成的任务次数

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)

	if CurDaytime==iDayTime then 	--上次完成任务是同一天内
		iDayHuan = iDayHuan+1
	else							--上次完成任务不在同一天，重置
		iDayTime = CurDaytime
		iQuarterTime = 99
		iDayHuan = 1
	end
	--end modified by zhangguoxin 090208
	
	-- ========================================================
	-- 冰天雪地活动
	
	-- 获得50挂鞭炮
	if iDayHuan==20 or iDayHuan==40 or iDayHuan==60  then
		local curDayTime = GetDayTime()
		if curDayTime >= x500501_g_StartDayTime and curDayTime <= x500501_g_EndDayTime then
			BeginAddItem(sceneId)
				AddItem( sceneId, 30505166 , 20 )
			local canAdd1 = EndAddItem(sceneId,selfId)
			
			if canAdd1 == 0  then
				BeginEvent( sceneId )
					AddText( sceneId, "您的物品栏没有足够空间，请下次交任务时留出足够物品栏空间。" )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			else
				AddItemListToHuman(sceneId,selfId)
				local transfer = GetItemTransfer(sceneId,selfId,0)
				
				local str1 = format( "#{_INFOUSR%s}", GetName(sceneId, selfId))
				local str2 = format("#W#{_INFOMSG%s}", transfer)
				local strMsg = str1..x500501_g_strDieNotice0..str2..x500501_g_strDieNotice1				
				BroadMsgByChatPipe(sceneId, selfId, strMsg, 4)		
			end
		end	

--改成不可能满足的条件来取消灵兽丹的奖励，by zhangqiang 2009.6.18
--		if GetLevel(sceneId, selfId) >= 50 and iDayHuan == 20 then --50级以上才获得，只有第一个20环才给，而不是每20环都给
		if 0 > 1 then
			local randomIndex = random(getn(x500501_g_LingShouDanId))
			BeginAddItem(sceneId)
				AddItem( sceneId, x500501_g_LingShouDanId[randomIndex], 1 )
			local canAdd = EndAddItem(sceneId,selfId)
			if canAdd == 0  then
				BeginEvent( sceneId )
					AddText( sceneId, "#{JNHC_081128_01}"..GetItemName(sceneId, x500501_g_LingShouDanId[randomIndex]).."#{HSLJJF_2}" )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			
			else
				AddItemListToHuman(sceneId,selfId)
				
				--给自己发送得到物品的消息....
				local strMsg = format("你得到了#H#{_ITEM%d}#W。", x500501_g_LingShouDanId[randomIndex])
				Msg2Player(sceneId, selfId, strMsg, MSG2PLAYER_PARA)
			--[tx42684]	
			  local myStrMsg = format("#{BSJH_81106_10}#H#{_ITEM%d}#W。", x500501_g_LingShouDanId[randomIndex])
			  BeginEvent(sceneId)
				  AddText(sceneId, myStrMsg);
			  EndEvent(sceneId)
			  DispatchMissionTips(sceneId,selfId)
			--[/tx42684]			
					
				--5%几率获得2个
				if random(100) <= 5  then
					BeginAddItem(sceneId)
						AddItem( sceneId, x500501_g_LingShouDanId[randomIndex], 1 )
					canAdd = EndAddItem(sceneId,selfId)
					
					if canAdd == 0  then
						BeginEvent( sceneId )
							AddText( sceneId, "#{JNHC_081128_02}"..GetItemName(sceneId, x500501_g_LingShouDanId[randomIndex]).."#{HSLJJF_2}" )
						EndEvent( sceneId )
						DispatchMissionTips( sceneId, selfId )
					
					else
						AddItemListToHuman(sceneId,selfId)
						local transfer = GetItemTransfer(sceneId,selfId,0)
						local str = format("#{_INFOUSR%s}#{JNHC_081128_03}#{_INFOMSG%s}#{JNHC_081128_04}",GetName(sceneId,selfId), transfer)
						BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
						--给自己发送得到物品的消息....
						strMsg = format("你得到了#H#{_ITEM%d}#W。", x500501_g_LingShouDanId[randomIndex])
						Msg2Player(sceneId, selfId, strMsg, MSG2PLAYER_PARA)
						
					end
				end
			end
		end
		
	end
	
	--给易容丹
	if iDayHuan==10 or iDayHuan==30 or iDayHuan==50 then
		if random(100) <= 30  then
			local randomIndex = random(2)
			BeginAddItem(sceneId)
				AddItem( sceneId, x500501_g_ItemId[randomIndex], 1 )
			local canAdd = EndAddItem(sceneId,selfId)
			
			if canAdd == 0  then
				BeginEvent( sceneId )
					AddText( sceneId, "您的物品栏没有足够空间，请下次交任务时留出足够物品栏空间。" )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			
			else
				AddItemListToHuman(sceneId,selfId)
--				if randomIndex == 1  then
--					-- 发世界公告
--					local transfer = GetItemTransfer(sceneId,selfId,0)
--					local str = format("#W#{_INFOUSR%s}#I今日为师门做任务勇往直前，奋不顾身，完成第20次任务时已经累得满身大汗，正坐在树荫底下歇息时，树上掉下一颗闪着白光的#W#{_INFOMSG%s}。",GetName(sceneId,selfId), transfer)
--					--公告精简，去除此公告
--					--BroadMsgByChatPipe(sceneId, selfId, str, 4)
--					
--				elseif randomIndex == 2  then
--					-- 发世界公告
--					local transfer = GetItemTransfer(sceneId,selfId,0)
--					local str = format("#W#{_INFOUSR%s}#I今日为师门做任务勇往直前，奋不顾身，好不容易做完第20次任务时，腿一软坐在了地上，口袋里滚出一颗晶莹透亮的#W#{_INFOMSG%s}。",GetName(sceneId,selfId), transfer)
--					----公告精简，去除此公告
--					--BroadMsgByChatPipe(sceneId, selfId, str, 4)
--					
--				end
				
				--给自己发送得到物品的消息....
				local strMsg = format("你得到了#H#{_ITEM%d}#W。", x500501_g_ItemId[randomIndex])
				Msg2Player(sceneId, selfId, strMsg, MSG2PLAYER_PARA)

			end
		end
	end
	-- ========================================================

  -- ========================================================
	-- 圣诞活动 完成师门任务获得符节
	x500501_ACT_Christmas( sceneId, selfId,iDayHuan )	
	
	-- ========================================================

	--PrintNum(iDayHuan)
	--iDayHuan = 60

--if mod(iDayHuan, 10) >= 1 and mod(iDayHuan, 10) < 5 then
--elseif mod(iDayHuan, 10) >= 5 and mod(iDayHuan, 10) < 8 then
--	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId)+1	)
--	Msg2Player(  sceneId, selfId,"你得到了#Y1#W点门派贡献度。" ,MSG2PLAYER_PARA )
--elseif mod(iDayHuan, 10) >= 8 and mod(iDayHuan, 10) < 10 then
--	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId)+2	)
--	Msg2Player(  sceneId, selfId,"你得到了#Y2#W点门派贡献度。" ,MSG2PLAYER_PARA )
--else --mod(iDayHuan, 10) must return 0
--	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId)+3	)
--	Msg2Player(  sceneId, selfId,"你得到了#Y3#W点门派贡献度。" ,MSG2PLAYER_PARA )
--end

	--实际奖励贡献度=（玩家等级-基础等级）* 等级影响参数 + 基础贡献度
	--menpaipoint = (playerlvl - 10)*0.05 + X
	local baseMenpaiPoint = 0
	if iDayHuan < 10 then
		baseMenpaiPoint = 1
	elseif iDayHuan < 15 then
		baseMenpaiPoint = 2
	elseif iDayHuan < 19 then
		baseMenpaiPoint = 3
	elseif iDayHuan == 19 then
		baseMenpaiPoint = 4
	elseif iDayHuan == 20 then
		baseMenpaiPoint = 5
	end
	local menpaiPoint = floor((GetLevel(sceneId, selfId) - 10)*0.05) + baseMenpaiPoint
	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId) + menpaiPoint)
	Msg2Player(  sceneId, selfId,"你得到了#Y" .. menpaiPoint .. "#W点门派贡献度。" ,MSG2PLAYER_PARA )

	--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime --注释 by zhangguoxin 090208
	local Reward_Append = 1

	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 20 then
		if iDayHuan <= 10 then
			Reward_Append = 2
		end
	elseif playerLevel >= 20 and playerLevel < 30 then
		if iDayHuan <= 15 then
			Reward_Append = 2
		end
	elseif playerLevel >= 30 and playerLevel < 100 then
	  if iDayHuan <= 20 then
			Reward_Append = 2
		end
	elseif playerLevel >= 100 and playerLevel < 120 then
		if iDayHuan <= 20 then
			Reward_Append = 2
		end
	end

	--//////////////////////////////////////////////////
	--有10%的几率获得一个低级宝石合成符
	--AAA今日为师门做任务勇往直前，奋不顾身，在完成第20次
	--多倍时，终因太累一跤摔倒在路边，爬起来的时候，脸上
	--居然粘着一张皱巴巴的[低级宝石合成符]。
	--ID：30900015
	--?	玩家等级必须 >=40级
	--?	当天第20次师门奖励为多倍奖励
	if playerLevel >= 40 and iDayHuan == 20 then
		local ret = random(100)
		--PrintNum(ret)
		if ret <= 10 then
			local szItemTransfer = ""
			BeginAddItem(sceneId)
				AddItem( sceneId, 30900015, 1 )
			local canAdd = EndAddItem(sceneId,selfId)
			if canAdd > 0 then
				AddItemListToHuman(sceneId,selfId)
				szItemTransfer = GetItemTransfer(sceneId,selfId,0)
				local strformat	= "#W#{_INFOUSR%s}#I今日为师门做任务勇往直前，奋不顾身，在完成第20次时，终因太累一跤摔倒在路边，爬起来的时候，脸上居然粘着一张皱巴巴的#W#{_INFOMSG%s}。"
				local strText = format(strformat, GetName(sceneId,selfId),szItemTransfer)
				
				BroadMsgByChatPipe(sceneId, selfId, strText, 4)
			end
		end
	end
	--//////////////////////////////////////////////////

	local MijiActive = 1
	local AwardID = 30505078    --天书残卷的ID
	local AwardCyc = 20         --奖励环数( 做多少次任务会给一次奖励 )

	local DayTime = GetDayTime()
	if DayTime < 7104 then      --07年107天(4月15号)
       MijiActive = 0
    end

    if DayTime >= 7115 then      --07年115天(4月26号)
       MijiActive = 0
    end


	if playerLevel > 19 then
		if iDayHuan > 0 then
			local ModHuan = mod( iDayHuan, AwardCyc )
			if 0 == ModHuan then
				if 1 == MijiActive then
					BeginAddItem(sceneId)        --给予玩家东西
						AddItem( sceneId, AwardID, 1 )
					local AddRet = EndAddItem(sceneId,selfId)
					if AddRet > 0 then
						AddItemListToHuman(sceneId,selfId)
					end
				end
			end

		end
	end

	local skyrockets = { 30505081, 30505082, 30505083, 30505084 }
	local count = 2
	local cycle = 20

	if DayTime >= 7128 and DayTime <= 7150 then		-- 07.5.9 ~ 07.5.31
		if ( iDayHuan / cycle ) == floor( iDayHuan / cycle ) then
			local skyrocket = skyrockets[random( getn(skyrockets) )]
			BeginAddItem( sceneId )					--给予玩家东西
				AddItem( sceneId, skyrocket, 2 )
			local AddRet = EndAddItem( sceneId, selfId )
			if AddRet > 0 then
				AddItemListToHuman( sceneId, selfId )
			else
				local strText = "因为您的背包空间不足，您失去了一次获得#{_ITEM" .. skyrocket .. "}的机会。"

				BeginEvent( sceneId )
					AddText( sceneId, strText )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )

				Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
			end

		end
	end

	x500501_ACT_Duanwu( sceneId, selfId, iDayHuan )
	
	--设置循环任务的环数
	--begin modified by zhangguoxin 090208
	iDayCount = iDayHuan
	local newTime = iDayTime*100+iQuarterTime
	
	SetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME,newTime)
	SetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT,iDayCount)
	--end modified by zhangguoxin 090208
	x500501_g_MissionRound = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)

	--衰减系数
	--l_Exp = 0.75 * 0.75
	--l_Money = 0.75 * ( 49 + Level ) / ( 160 + 40 * Level )
	--计算奖励经验的数量
	--if mod(x500501_g_MissionRound,10) == 0 then
	--	x500501_g_Exp = 2400*(Level+4) * 10 * l_Exp / 120						--等级+环数函数，受经验调节常数的影响
		--x500501_g_Money = 2400*(Level+4) * 10 * l_Money /120						--等级+环数函数，受经验调节常数的影响
	--else
	--	x500501_g_Exp = 2400*(Level+4) * mod(x500501_g_MissionRound,10) * l_Exp / 120						--等级+环数函数，受经验调节常数的影响
		--x500501_g_Money = 2400*(Level+4) * mod(x500501_g_MissionRound,10) * l_Money /120						--等级+环数函数，受经验调节常数的影响
	--end

	-- 1+等级影响*当前等级/10 {等级影响=0.035，影响指数=1}
	local levelfactor = 0.035
	local refix = 1 + levelfactor*playerLevel/10

	local strHuashan = ""
	local strHuashan2 = ""
	if Reward_Append == 2 then
		if GetHuashanV(sceneId,selfId) == GetMenPai(sceneId,selfId) then
			local addMoney = floor(GetMoneyMultipleByRound(x500501_g_MissionRound) * floor(GetMoneyBonusByLevel(Level)/2))
			--local addExp = floor(GetExpMultipleByRound(x500501_g_MissionRound) * floor(GetExpBonusByLevel(Level)/2)*refix)
			local addExp = floor(GetExpMultipleByRound(x500501_g_MissionRound) * floor(GetExpBonusByLevel(Level))*refix)
			x500501_g_Money = addMoney * 3
			x500501_g_Exp = addExp * 3
			strHuashan = "#P因为本门派是此届华山论剑的第一，所以可以额外获得师门#Y经验奖" .. addExp .. "#P，金钱#{_MONEY" .. addMoney .. "}#P。"
			strHuashan2 = "#P额外获得师门（华山论剑第一）#Y经验奖励" .. addExp .. "，金钱#Y#{_MONEY" .. addMoney .. "}#P。"
		else
			x500501_g_Money = floor( (GetMoneyMultipleByRound(x500501_g_MissionRound) * GetMoneyBonusByLevel(Level)) )
			--local x500501_g_Exp = floor( (GetExpMultipleByRound(x500501_g_MissionRound) * GetExpBonusByLevel(Level))*refix)
			x500501_g_Exp = floor( (GetExpMultipleByRound(x500501_g_MissionRound) * GetExpBonusByLevel(Level)*2)*refix)
		end
	else
		x500501_g_Money = GetMoneyMultipleByRound(x500501_g_MissionRound) * floor(GetMoneyBonusByLevel(Level)/2)
		x500501_g_Exp = GetExpMultipleByRound(x500501_g_MissionRound) * floor(GetExpBonusByLevel(Level)/2)
	end

	--if	floor((x500501_g_MissionRound - 1) / 10) >=1  then
	--	x500501_g_Exp = 2400*(Level+4) * l_Exp / 120 + x500501_g_Exp						--11~20环任务，每环额外增加一定经验增量，金钱没有增量
	--end


	--x500501_g_Exp = x500501_g_Exp * Reward_Append

	x500501_g_Exp = floor(x500501_g_Exp)
	x500501_g_Money = floor(x500501_g_Money)

	--增加经验值和钱
	--添加任务奖励
	AddExp( sceneId,selfId,x500501_g_Exp)
	AddMoney(sceneId,selfId,x500501_g_Money)
	--显示对话框
	BeginEvent(sceneId)
		--如果是同门相助完成的....则加入相关对话....
		if isHelpFinish and isHelpFinish == 1 then
			AddText(sceneId, x500501_g_strHelpFinishedText)
		end
		AddText(sceneId,"  做得不错，这里有"..x500501_g_Exp.."点经验值和#{_MONEY"..x500501_g_Money.."}，算是给你的奖励。")
		AddText(sceneId, strHuashan)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	Msg2Player(  sceneId, selfId, strHuashan2,MSG2PLAYER_PARA )
	--Msg2Player(  sceneId, selfId,"你得到了#{_MONEY" .. tostring(x500501_g_Money) .. "}" ,MSG2PLAYER_PARA )
	--Msg2Player(  sceneId, selfId,"你得到了" .. tostring(x500501_g_Exp) .. "点经验值" ,MSG2PLAYER_PARA )

	--在一定条件下可以得到额外的奖励
	if Reward_Append == 2 and mod(iDayHuan, 5) == 0 and random(1000) <= 5 then

		local ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(27)
		local szItemTransfer = ""
		BeginAddItem(sceneId)
			AddItem( sceneId, ItemSn, 1 )
		local canAdd = EndAddItem(sceneId,selfId)

		if canAdd > 0 then
			AddItemListToHuman(sceneId,selfId)
			szItemTransfer = GetItemTransfer(sceneId,selfId,0)
			local strText = format("你获得了%s", ItemName)
			BeginEvent(sceneId)
				AddText(sceneId, strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			local strformatList	= {
						"#W#{_INFOUSR%s}#I在做师门任务时，因为劳苦功高，被师傅奖励一个#W#{_INFOMSG%s}。",
						"#W#{_INFOUSR%s}#I刚交完任务出了门，被门槛绊了一下，发现了一个#W#{_INFOMSG%s}。",
						"#I因为#W#{_INFOUSR%s}#I在交师门任务的时候，师父正在发脾气，被师父随手拿起的一个#W#{_INFOMSG%s}#I给砸中了。",
						"#W#{_INFOUSR%s}#I交师门任务的途中，突然被天上掉下的一个#W#{_INFOMSG%s}#I给砸中了。",
						}
			local index = random(4)
			local PlayName = GetName(sceneId,selfId)
			strText = format(strformatList[index], PlayName, szItemTransfer)
			
			--公告精简，去除
			--BroadMsgByChatPipe(sceneId, selfId, strText, bBroadCast)
			
		end

	end

	BeginEvent(sceneId)
		AddText(sceneId, "#G您今天已经完成了#R" .. iDayHuan .. "#G环师门任务。");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	--师门任务统计
	LuaFnAuditShiMenRenWu(sceneId, selfId, x500501_g_MissionRound, GetLevel(sceneId, selfId))
	LuaFnAuditShiMenRenWu_Day(sceneId, selfId, iDayHuan, GetLevel(sceneId, selfId))           --当天师门任务统计
	return Reward_Append, x500501_g_MissionRound

end

--**********************************
--接受
--**********************************
function x500501_CheckAccept_Necessary( sceneId, selfId )

	--begin modified by zhangguoxin 090208
	local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
	local iDayTime = floor(iTime/100)	--上一次放弃任务的时间(天数)
	local iQuarterTime = mod(iTime,100)	--上一次放弃任务的时间(一刻种)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
	local iDayHuan = iDayCount --当天内完成的任务次数

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurQuarterTime = mod(CurTime,100) 	--当前时间(一刻钟)
	--print(iDayCount,iTime,iDayTime,iQuarterTime,iDayHuan)
	--print(CurQuarterTime,iQuarterTime)
	--print(iDayCount,CurTime)
	if iDayTime == CurDaytime then
		--如果当天做该任务次数达到60则不允许再接
		if iDayHuan >= 60 then
			return -2;
		end
		if CurQuarterTime == iQuarterTime then
			return -1;
		end
	else
		iDayHuan = 1
		--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime
		iDayCount = iDayHuan;
		local newTime = iDayTime*100+iQuarterTime
		SetMissionData(sceneId, selfId, MD_SHIMEN_DAYTIME, newTime)
		SetMissionData(sceneId, selfId, MD_SHIMEN_DAYCOUNT, iDayCount)
	end
	--end modified by zhangguoxin 090208
	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 20 then
		if iDayHuan < 10 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
		end
	elseif playerLevel >= 20 and playerLevel < 30 then
		if iDayHuan < 15 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
		end
	elseif playerLevel >= 30 and playerLevel < 100 then
    if iDayHuan < 20 then
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
	  else
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
	  end
	elseif playerLevel >= 100 and playerLevel < 120 then
	  if iDayHuan < 20 then
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
	  else
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
	  end
	end

	return 1;

end

--**********************************
--放弃
--**********************************
function x500501_Abandon_Necessary( sceneId, selfId )

	--begin modified by zhangguoxin 090208
	--local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
	local iDayTime = floor(iTime/100)	--上一次放弃任务的时间(天数)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)

	if iDayTime ~= CurDaytime then
		--iDayHuan = 0
		SetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT,0)
	end

	--设置循环任务的时间
	--iDayCount = iDayHuan*100000+CurTime
	--SetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT,iDayCount)
	SetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME,CurTime)
	--end modified by zhangguoxin 090208

	local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
	if menpaiPoint == 1 then
		SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint-1 )
		Msg2Player(  sceneId, selfId,"你消耗了#Y1#W点门派贡献度。" ,MSG2PLAYER_PARA )
	elseif menpaiPoint >= 2 then
		SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint-2 )
		Msg2Player(  sceneId, selfId,"你消耗了#Y2#W点门派贡献度。" ,MSG2PLAYER_PARA )
	end
end

--**********************************
--玩家提交的普通物品
--**********************************
function x500501_OnMissionCheck_Necessary( sceneId, selfId, index1, index2, index3, Needindex )

	if Needindex == nil or Needindex == -1 then
		return 0;
	end

	if index1 >= 0 and index1 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index1 )

		if SerialNum == Needindex then
			return index1;
		end
	end

	if index2 >= 0 and index2 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index2 )

		if SerialNum == Needindex then
			return index2;
		end
	end

	if index3 >= 0 and index3 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index3 )

		if SerialNum == Needindex then
			return index3;
		end
	end

	BeginEvent(sceneId)
		AddText(sceneId,"你的任务不能完成，你提交的物品不正确。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return -1;

end

--**********************************
--玩家提交的装备类物品
--**********************************
function x500501_OnMissionCheckName_Necessary( sceneId, selfId, index1, index2, index3, Needindex )

	if Needindex == nil or Needindex == -1 then
		return 0;
	end

	if index1 >= 0 and index1 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index1 )
		ItemNameId = GetItemNameID(SerialNum)

		if ItemNameId == Needindex then
			return index1;
		end
	end

	if index2 >= 0 and  index2 < 60 then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index2 )
		ItemNameId = GetItemNameID(SerialNum)

		if ItemNameId == Needindex then
			return index2;
		end
	end

	if index3 >= 0 and  index3 < 60 then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index3 )
		ItemNameId = GetItemNameID(SerialNum)

		if ItemNameId == Needindex then
			return index3;
		end
	end
	BeginEvent(sceneId)
		AddText(sceneId,"你的任务不能完成，你提交的物品不正确。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return -1;
end

--**********************************
--玩家提交的物品
--**********************************
function x500501_OnMissionCheck_NecessaryEx( sceneId, selfId, index1, index2, index3, Needindex )
	if Needindex == nil or Needindex <= 0 then
		return -1
	end

	local indices = { index1, index2, index3 }
	for i = 1, getn( indices ) do
		if indices[i] and indices[i] >=0 and indices[i] < 80 then	-- 合法的背包格子
			if LuaFnGetItemTableIndexByIndex( sceneId, selfId, indices[i] ) == Needindex then
				return indices[i]
			end
		end
	end

	return -1
end

-- 圣诞活动 完成师门任务获得符节
function x500501_ACT_Christmas( sceneId, selfId, DayHuan )
  
  if DayHuan ~=20 and DayHuan ~=40 and DayHuan ~=60  then
     return
  end
	--检测时间	
	if CallScriptFunction( 050025, "CheckRightTime", sceneId) == 1 then
			
			--如果玩家等级小于25不给予贺卡
	  if	GetLevel( sceneId, selfId) < 25 then
		  return
	  end
	  
	  --检测材料包是否有地方....
	  if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		  return
	  end
	  
	  local x500501_HeKaId = {
	                 20310011,
	                 20310017,
	                 20310012,
	                 20310019,
	                 20310014,
	                 20310018,
	                 20310015,
	                 20310016,
	                 20310013,	
           }			                                   --贺卡ID
    local menpaiId = LuaFnGetMenPai( sceneId, selfId )
    local hekaid = 0
    local strtext = ""
	  --给门派贺帖
	  if menpaiId == MP_SHAOLIN then
	     strtext = "您获得少林节日贺帖一张。"
	     hekaid = x500501_HeKaId[1]
	  elseif menpaiId == MP_MINGJIAO then
	     strtext = "您获得明教节日贺帖一张。"
	     hekaid = x500501_HeKaId[2]
	  elseif menpaiId == MP_GAIBANG then
	     strtext = "您获得丐帮节日贺帖一张。"
	     hekaid = x500501_HeKaId[3]
	  elseif menpaiId == MP_WUDANG then
	     strtext = "您获得武当节日贺帖一张。"
	     hekaid = x500501_HeKaId[4]
	  elseif menpaiId == MP_EMEI then
	     strtext = "您获得峨眉节日贺帖一张。"
	     hekaid = x500501_HeKaId[5]
	  elseif menpaiId == MP_XINGSU then
	     strtext = "您获得星宿节日贺帖一张。"
	     hekaid = x500501_HeKaId[6]
	  elseif menpaiId == MP_DALI then
	     strtext = "您获得天龙节日贺帖一张。"
	     hekaid = x500501_HeKaId[7]
	  elseif menpaiId == MP_TIANSHAN then
	     strtext = "您获得天山节日贺帖一张。"
	     hekaid = x500501_HeKaId[8]
	  elseif menpaiId == MP_XIAOYAO then
	     strtext = "您获得逍遥节日贺帖一张。"
	     hekaid = x500501_HeKaId[9]
	  end

	  local BagIndex = TryRecieveItem( sceneId, selfId, hekaid, QUALITY_MUST_BE_CHANGE )
	  if BagIndex ~= -1 then
		  BeginEvent( sceneId )
			  AddText( sceneId, strtext )
		  EndEvent( sceneId )
		  DispatchMissionTips( sceneId, selfId )
	  end	  
	  
	end
	
end

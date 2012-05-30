--MisDescBegin

x311010_g_MissionId = 4021

x311010_g_ScriptId = 311010
--MisDescEnd
-- 漕运使对话UI 	0
-- 交易UI					1

--任务变量
--第一位存的是(卖)热销的值  						第0位		Price_Up
--第二位存的是(买)杀价的值							第1位		Price_Down
--第三位存的是身上盐、铁、米的数量			第2位   盐*100+铁*10+米
--			第四位存的是热销的CD上次使用时间			第3位		
--			第五位存的是杀价的CD上次使用时间			第4位		
--第四位存的是玩家当前的状态，表示进行到的步骤，走到的流程。		第3位
--第五位存的是玩家当前的特殊状态，如高价漕货等				第4位
--第六位存的是官票上的面额  						第5位		Balance
--第七位存的是漕运使的TargetId，1:代表洛阳的漕运使，2:代表苏州，3代表大理，4代表可以出售漕货的		第6位 TransNPC
--第八位存的是货商上次发生事件的时间，一定的时间内，只能执行一次货商的特殊事件。
--
--官票的物品编号40002109
--g_CashItem={{id=40002109,num=1}}
x311010_g_CashItem_id = 40002109
x311010_g_CashItem_count = 1
x311010_g_EludeItem = {{id=20108157,num=1},{id=20108169,num=2}}
x311010_g_ChopItem = {{id=30308020,num=1} }
x311010_g_CertificateItem ={ {id=30308020,num=1} }
x311010_g_Accommodate_Distinction = {};
x311010_g_Acclimatize_Distinction = {};
x311010_g_Traverse_Region = {3,4,5,6,7,8}
--x311010_g_Title_Times_Confine = {0,100,1000,3000,7500,20000,50000}
x311010_g_Title_Times_Confine = {50000,20000,7500,3000,1000,100,0}
--x311010_g_Title_Confine 			= {124,125,126,127,128,129,130}
x311010_g_Title_Confine 			= {130,129,128,127,126,125,124}
--x311010_g_Title_Name_Confine	= {"漕运商","漕运走卒","漕运押解官","漕运统领","漕运调度副使","漕运调度使","漕运总提调"}
x311010_g_Title_Name_Confine	= {"漕运总提调","漕运调度使","漕运调度副使","漕运统领","漕运押解官","漕运走卒","漕运商"}


x311010_g_Reward_Medicine_HP = {30001001,30001002,30001003,30001004,30001005,30001006,30001007,30001008,30001009,30001010}
x311010_g_Reward_Medicine_MP = {30002001,30002002,30002003,30002004,30002005,30002006,30002007,30002008,30002009,30002010}

x311010_g_Accommodate_Distinction[1] = 3530
x311010_g_Accommodate_Distinction[2] = 3531
x311010_g_Accommodate_Distinction[3] = 3532
x311010_g_Accommodate_Distinction[4] = 3533
x311010_g_Accommodate_Distinction[5] = 3534
x311010_g_Accommodate_Distinction[6] = 3535
x311010_g_Accommodate_Distinction[7] = 3536
x311010_g_Accommodate_Distinction[8] = 3537
x311010_g_Accommodate_Distinction[9] = 3538
x311010_g_Accommodate_Distinction[10] =3539
                               
x311010_g_Acclimatize_Distinction[1] = 3540
x311010_g_Acclimatize_Distinction[2] = 3541
x311010_g_Acclimatize_Distinction[3] = 3542
x311010_g_Acclimatize_Distinction[4] = 3543
x311010_g_Acclimatize_Distinction[5] = 3544
x311010_g_Acclimatize_Distinction[6] = 3545
x311010_g_Acclimatize_Distinction[7] = 3546
x311010_g_Acclimatize_Distinction[8] = 3547
x311010_g_Acclimatize_Distinction[9] = 3548
x311010_g_Acclimatize_Distinction[10] = 3549

-- add by zchw for caoyun
x311010_g_Accommodate_Distinction[11] = 33530
x311010_g_Accommodate_Distinction[12] = 33531
x311010_g_Accommodate_Distinction[13] = 33532
x311010_g_Accommodate_Distinction[14] = 33533
x311010_g_Accommodate_Distinction[15] = 33534
x311010_g_Accommodate_Distinction[16] = 33535
x311010_g_Accommodate_Distinction[17] = 33536
x311010_g_Accommodate_Distinction[18] = 33537
x311010_g_Accommodate_Distinction[19] = 33538
x311010_g_Accommodate_Distinction[20] =33539

x311010_g_Acclimatize_Distinction[11] = 33540
x311010_g_Acclimatize_Distinction[12] = 33541
x311010_g_Acclimatize_Distinction[13] = 33542
x311010_g_Acclimatize_Distinction[14] = 33543
x311010_g_Acclimatize_Distinction[15] = 33544
x311010_g_Acclimatize_Distinction[16] = 33545
x311010_g_Acclimatize_Distinction[17] = 33546
x311010_g_Acclimatize_Distinction[18] = 33547
x311010_g_Acclimatize_Distinction[19] = 33548
x311010_g_Acclimatize_Distinction[10] = 33549
x311010_g_TitleTableOfMonster = {
		{part1="劫财", part2="凶徒"},
		{part1="逃狱", part2="恶人"},
		{part1="重案", part2="强盗"},
		{part1="害命", part2="歹人"},
		{part1="毒手", part2="恶贼"},
		{part1="煞心", part2="刺客"},
		{part1="截镖", part2="恶霸"},
		}
						
x311010_g_NameTableOfMonster = {
	{part1="赵", part2="文", part3="霸"},
	{part1="钱", part2="元", part3="泰"},
	{part1="孙", part2="成", part3="烈"},
	{part1="李", part2="之", part3="赫"},
	{part1="周", part2="伯", part3="虎"},
	{part1="吴", part2="曾", part3="亮"},
	{part1="郑", part2="仁", part3="朗"},
	{part1="王", part2="恩", part3="古"},
	}
x311010_g_Transportation_Exit = {}
x311010_g_Transportation_Exit[8] = {
	Scene_Name = "敦煌",
	[1] = { Exit_Name="敦煌至洛阳", Exit_Reply_Number = 5, Exit_Position = {x=276,y=145} } ,
	[2] = { Exit_Name="敦煌至剑阁", Exit_Reply_Number = 6, Exit_Position = {x=230,y=270} } ,
	}
x311010_g_Transportation_Exit[7] = {
	Scene_Name = "剑阁",
	[1] = { Exit_Name="剑阁至大理", Exit_Reply_Number = 7, Exit_Position = {x=40,y=278} } ,
	[2] = { Exit_Name="剑阁至敦煌", Exit_Reply_Number = 8, Exit_Position = {x=106,y=47} } ,
	}
x311010_g_Transportation_Exit[6] = {
	Scene_Name = "无量山",
	[1] = { Exit_Name="无量山至镜湖", Exit_Reply_Number = 9, Exit_Position = {x=276,y=80} } ,
	[2] = { Exit_Name="无量山至大理", Exit_Reply_Number = 10, Exit_Position = {x=43,y=172} } ,
	}
x311010_g_Transportation_Exit[5] = {
	Scene_Name = "镜湖",
	[1] = { Exit_Name="镜湖至无量山", Exit_Reply_Number = 11, Exit_Position = {x=46,y=278} } ,
	[2] = { Exit_Name="镜湖至苏州",   Exit_Reply_Number = 12, Exit_Position = {x=277,y=46} } ,
	}
x311010_g_Transportation_Exit[4] = {
	Scene_Name = "太湖",
	[1] = { Exit_Name="太湖至嵩山",   Exit_Reply_Number = 13, Exit_Position = {x=88,y=35} } ,
	[2] = { Exit_Name="太湖至苏州",   Exit_Reply_Number = 14, Exit_Position = {x=218,y=271} } ,
	}
x311010_g_Transportation_Exit[3] = {
	Scene_Name = "嵩山",
	[1] = { Exit_Name="嵩山至洛阳",   Exit_Reply_Number = 15, Exit_Position = {x=42,y=54} } ,
	[2] = { Exit_Name="嵩山至太湖",   Exit_Reply_Number = 16, Exit_Position = {x=281,y=250} } ,
	}
	
x311010_g_Transportation_City = {}
x311010_g_Transportation_City[0] = {
	Scene_Name = "洛阳",
	Reply_Number = 17,
	[0] = {x=160,y=278},
	[1] = {x=282,y=133},
	[2] = {x=37,y=134},
}
x311010_g_Transportation_City[1] = {
	Scene_Name = "苏州",
	Reply_Number = 18,
	[0] = {x=182,y=265},
	[1] = {x=64,y=163},
	[2] = {x=183,y=53},
}
x311010_g_Transportation_City[2] = {
	Scene_Name = "大理",
	Reply_Number = 19,
	[0] = {x=160,y=277},
	[1] = {x=280,y=152},
	[2] = {x=39,y=152},
}

x311010_g_Transportation_Legate = {}
x311010_g_Transportation_Legate[0] = {
	Scene_Name = "洛阳",
	Reply_Number = 20,
	Position = {x=222,y=179},
}

x311010_g_Transportation_Legate[1] = {
	Scene_Name = "苏州",
	Reply_Number = 21,
	Position = {x=234,y=86},
}

x311010_g_Transportation_Legate[2] = {
	Scene_Name = "大理",
	Reply_Number = 22,
	Position = {x=54,y=185},
}

x311010_g_SpecialImpact = {}
x311010_g_SpecialImpact[23] = {
	Impact_Name = "增加外攻",
	Impact_ID = {115,116,117,118,119,30115,30116,30117,30118,30119},
	}

x311010_g_SpecialImpact[24] = {
	Impact_Name = "增加外防",
	Impact_ID = {120,121,122,123,124,30120,30121,30122,30123,30124},
	}
	
x311010_g_SpecialImpact[25] = {
	Impact_Name = "增加内攻",
	Impact_ID = {125,126,127,128,129,30125,30126,30127,30128,30129},
	}
	
x311010_g_SpecialImpact[26] = {
	Impact_Name = "增加内防",
	Impact_ID = {130,131,132,133,134,30130,30131,30132,30133,30134},
	}
x311010_g_IncreaseSpeed_Impact = {}
x311010_g_IncreaseSpeed_Impact[27] = {
	Impact_ID = 135,
	}

--**********************************
--任务入口函数
--**********************************
function x311010_OnDefaultEvent( sceneId, selfId, BagIndex )	--点击该任务后执行此脚本
	--投机取巧的方法，只此一次，勿推广。

  local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
--	SetMissionByIndex(sceneId,selfId,misIndex,6,-1)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)
	
	local New_Time = LuaFnGetCurrentTime()
	local HaggleUp = 600 - New_Time + GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP)
	local HaggleDown = 900 - New_Time + GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN)
	local	circle	 = GetMissionData(sceneId,selfId,MD_CAOYUN_HUAN)
	
	if(HaggleUp <0 ) then
		HaggleUp = 0
	end

	if(HaggleDown <0 ) then
		HaggleDown = 0
	end
	--begin modified by zhangguoxin 090207
	--local iDayCount=GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)	--上一次交任务的时间(天数)
	--local iQuarterTime = mod(iTime,100)	--上一次交任务的时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
	iDayHuan = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT);
	--end  modified by zhangguoxin 090207
	
	local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
	Quotiety = 1
	local Price_Sell = 15000 * Quotiety

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,5)
		UICommand_AddInt(sceneId,12)
		UICommand_AddInt(sceneId,HaggleUp)
		UICommand_AddInt(sceneId,HaggleDown)
		UICommand_AddInt(sceneId,circle)
		UICommand_AddInt(sceneId,misIndex)
		UICommand_AddInt(sceneId,iDayHuan)
		UICommand_AddInt(sceneId,Price_Sell)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 0)
	
end

--**********************************
--列举事件
--**********************************
function x311010_OnEnumerate( sceneId, selfId, targetId )
--如果玩家完成过这个任务

	  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
	   	return 
		end

    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then

			local TransNPC = x311010_TransPortNPC(sceneId,targetId)
			
			if TransNPC == -1 then
				return
			end
			
			if TransNPC == 4 then
			
				local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)
				if ItemNum < x311010_g_CashItem_count then
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,6)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
				end
				
				if targetId == GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID) then
				-----------------------------------------------------------------
					local msg = "对不起，我已经为您提供过服务了。"
			 		local cmsg = "离开"
					x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,0)
					return
				end

				if TRAFFICKER_CLICK_TIMES >= 30 then
					local msg = "今天我已经很累了，不想再为谁提供服务，希望下次能帮上你的忙吧。"
			 		local cmsg = "真不巧......"
					x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,0)
					return
				end

				SetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID,targetId)
				local  PlayerSex=GetSex(sceneId,selfId)
				if PlayerSex == 0 then
					PlayerSex = "侠女"
				else
					PlayerSex = "大侠"
				end
				
				BeginEvent(sceneId)
		
					AddText(sceneId,PlayerSex.."我是这一带有名的黑市商人，碰见我可算是你的缘分，正好我今天心情好，可以给你提供一些服务，想不想碰碰运气？")
					AddNumText(sceneId,x311010_g_ScriptId,"我想碰碰运气",-1,28)
					AddNumText(sceneId,x311010_g_ScriptId,"还是算了......",-1,0)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)

				return
			
			end
			
			local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			SetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID,targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)
			SetMissionByIndex(sceneId,selfId,misIndex,1,0)
			
			local Caoyun_Times =  GetMissionData(sceneId,selfId,MD_CAOYUN_SUMTIME)	
			local find = -1
			local msg,cmsg
			for i, times in x311010_g_Title_Times_Confine do
				if times <= Caoyun_Times then
					find = i
					break
				end
			end
--屏蔽称号部分
--			find = -1
--增加一个查询玩家是否已得到该称号的接口，孙雨
			local New_Title = x311010_g_Title_Confine[find]
--			PrintNum(GetTitle( sceneId, selfId,5 ))
--			PrintNum(New_Title)
			if GetTitle( sceneId, selfId,5 ) ~= New_Title and find >= 0 then
				LuaFnAwardTitle( sceneId, selfId,  5, New_Title)
				SetCurTitle(sceneId, selfId,  5, New_Title)
				LuaFnDispatchAllTitle(sceneId, selfId)
				if Caoyun_Times < 20000 then
					if Caoyun_Times == x311010_g_Title_Times_Confine[find] then
						msg = "恭喜你获得"..x311010_g_Title_Name_Confine[find].."的称号，希望您继续为漕运做出您的贡献。"
		 				cmsg = "谢谢......"
		 				x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,2)
						return
		 			end
				else
					if Caoyun_Times == x311010_g_Title_Times_Confine[find] then
						msg = "由于大人您对漕运作出了特殊的贡献，朝廷特委托我转告您，您被封为"..x311010_g_Title_Name_Confine[find].."希望下次您能多提携提携小的。"
		 				cmsg = "嗯，知道了"
	 					x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,2)
						return
					end
				end
							
			end
			--client 要在UI 上显示"买卖漕货"和"兑换官票"这2个button
			--并且把NPC的ID传给client，以备下一步调用。
			
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,3)
				UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)

    --满足任务接收条件

    elseif 1 > 0 then
	    local TransNPC = x311010_TransPortNPC(sceneId,targetId)

			if TransNPC == 4 then
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,10)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
				return
			end

			--client 要在UI 上显示"获得官票"这个button
			--并且把NPC的ID传给client，以备下一步调用。
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,4)
				UICommand_AddInt(sceneId,targetId)
				UICommand_AddInt(sceneId,TransNPC)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			SetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID,targetId)
--			PrintStr("target  Id="..targetId)

    end
end 


--**********************************
--检测接受条件
--**********************************
function x311010_CheckAccept( sceneId, selfId )
	--需要1级才能接
	local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
	Quotiety = 2
	local Corpus = 10000 * Quotiety
	if IsTeamFollow( sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			strText = format("您处于组队跟随状态中，不可以接漕运任务。")
			AddText(sceneId,strText)
 		EndEvent(sceneId)
 		DispatchMissionTips(sceneId,selfId)
		return 0
	elseif GetLevel( sceneId, selfId ) < 40 then

		local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
		local msg = "您的等级还没有到40级，还是等40级之后再来找我吧。"
 		local cmsg = "我会很快达到40级的"
		x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,0)

		return 0
--以后策划改主意了就把这段打开。
	elseif GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId, selfId) < Corpus then
		BeginEvent(sceneId)
			AddText(sceneId,"金钱不足。");
			EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	elseif x311010_OnAccept_Necessary(sceneId,selfId) < 0 then
		return 0
	end

	return 1

end

function x311010_Calculate_Modulus( sceneId, selfId )
	if GetLevel( sceneId, selfId ) >= 70 then
		return 3
	elseif GetLevel( sceneId, selfId ) >= 50 then
		return 2
	elseif GetLevel( sceneId, selfId ) >= 35 then
		return 2
	elseif GetLevel( sceneId, selfId ) >= 15 then
		return 1
	end
	return 1
end

function x311010_Calculate_Double( sceneId, selfId )

	local ret = 1

	local Orientation_Article = 1
	local Article_Quantity
	for i, item in x311010_g_CertificateItem do
		Article_Quantity = GetItemCount( sceneId, selfId, item.id )
		if Article_Quantity < item.num then
			Orientation_Article = 0
		end
	end
	
	if Orientation_Article == 1 then
		local HaveChop = DelItem( sceneId, selfId, x311010_g_CertificateItem[1].id, x311010_g_CertificateItem[1].num )
		if HaveChop > 0 then
			ret = ret * 2
		end
	end

	return ret
end

function x311010_Calculate_Calender( sceneId, selfId )
	local ret = 1

	local nWeek = GetTodayWeek()
	if (nWeek==0) == 1  then
		ret = ret * 2
		Msg2Player( sceneId,selfId,"因为今天是漕运日，所以您的本次出售收益加倍。",MSG2PLAYER_PARA)
		BeginEvent(sceneId)
			AddText(sceneId,"因为今天是漕运日，所以您的本次出售收益加倍。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
	end

	return ret
end

function x311010_Calculate_Margin( sceneId, selfId, now_balance )

	local Level = GetLevel( sceneId, selfId )
	local new_balance = (now_balance-10000) * (0.625+0.02*(Level-30)/2) + 10000
	
	return new_balance
	
end

function x311010_OnHaggleUp( sceneId, selfId )	--点击该任务"热销"后执行此脚本

--判断他是否可热销
--比如时间的判断，判断这次和上次之间时间的差距
--should add some code

--取任务变量的值
	local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	Price_Up = GetMissionParam(sceneId,selfId,misIndex,0)
	Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP)
--	targetId = GetMissionParam(sceneId,selfId,misIndex,6)
	local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
	TransNpc =x311010_TransPortNPC(sceneId,targetId)
	
	local Now_Time = LuaFnGetCurrentTime();
--当前时间怎么取?
	if Now_Time - Pre_Time < 10*60 then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,9)
				UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			return
			
	end
	if TransNpc <= 0 then
		return
	end

--经计算改变此Price_Up
--****
--should add some code

--热销后价格变为18000
	local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
	Quotiety = 1
	Price_Up = 18000 * Quotiety
	Price_Up = x311010_Calculate_Margin( sceneId, selfId, Price_Up )
	--设置成新的值

	SetMissionByIndex(sceneId,selfId,misIndex,0,Price_Up)	

--还需要存储这时的时间
--当前时间怎么取?
	local New_Time = LuaFnGetCurrentTime();
--	SetMissionByIndex(sceneId,selfId,misIndex,3,New_Time)	
	SetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP,New_Time)

	BeginEvent(sceneId)
		strText = "热销成功，商品卖出价提升为#{_EXCHG"..Price_Up.."}"			
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,4)
--热销后价格变为Price_Up
			UICommand_AddInt(sceneId,misIndex)
--此时热销的冷却时间变为10分钟，并告知client
	
--第2位表示当前还剩的PriceUp时间
			Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP)
			Now_Time = LuaFnGetCurrentTime();
			if Now_Time - Pre_Time < 10*60 then
				UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
			else
				UICommand_AddInt(sceneId,0)
			end
			--第3位表示当前还剩的PriceDown时间
			Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN)
			if Now_Time - Pre_Time < 15*60 then
				UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
			else
				UICommand_AddInt(sceneId,0)
			end
			UICommand_AddInt(sceneId,TransNpc)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1)
end


function x311010_OnHaggleDown( sceneId, selfId )	--点击该任务"杀价"后执行此脚本

--判断他是否可杀价
--比如时间的判断，判断这次和上次之间时间的差距
--取任务变量的值
	local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	Price_Down = GetMissionParam(sceneId,selfId,misIndex,1)
	Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN)
--	targetId = GetMissionParam(sceneId,selfId,misIndex,6)
	local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
	
	TransNpc =x311010_TransPortNPC(sceneId,targetId)
	

--当前时间怎么取?
	Now_Time = LuaFnGetCurrentTime();
	if Now_Time - Pre_Time < 15*60 then

			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,9)
				UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			return
			
	end
	
	if TransNpc <= 0 then
		return
	end

--经计算改变此Price_Up
--*****


--杀价后价格变为X000
	local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
	Quotiety = 1
	Price_Down = 8000 * Quotiety
--设置成新的值

	SetMissionByIndex(sceneId,selfId,misIndex,1,Price_Down)

	
--还需要存储这时的时间
--当前时间怎么取?
	local New_Time = LuaFnGetCurrentTime();
--	SetMissionByIndex(sceneId,selfId,misIndex,4,New_Time)	
	SetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN,New_Time)

	BeginEvent(sceneId)
		strText = "杀价成功，商品买入价降低为#{_EXCHG"..Price_Down.."}"			
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
--杀价后价格变为Price_Down
			UICommand_AddInt(sceneId,misIndex)
--			UICommand_AddInt(sceneId,15*60)
--此时杀价的冷却时间变为15分钟，并告知client
--第2位表示当前还剩的PriceUp时间
		Pre_Time =  GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP)
		Now_Time = LuaFnGetCurrentTime();
		if Now_Time - Pre_Time < 10*60 then
			UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
		else
			UICommand_AddInt(sceneId,0)
		end
--第3位表示当前还剩的PriceDown时间
		Pre_Time =  GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN)
		if Now_Time - Pre_Time < 15*60 then
			UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
		else
			UICommand_AddInt(sceneId,0)
		end
		UICommand_AddInt(sceneId,TransNpc)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1)

end

--**********************************
--杀死怪物或玩家
--**********************************
function x311010_OnKillObject( sceneId, selfId, objdataId, objId )
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName=="漕运小怪" or monsterName=="漕运大怪"   then
		-- 掉书
		if random(1000) < 25 then
			AddMonsterDropItem( sceneId, objId, selfId, 30501035 )
		end
		-- 给BUFF
		if random(1000) < 25 then
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,135,0)
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x311010_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x311010_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接这个任务
--也就是点了“获得官票”
--**********************************
function x311010_OnAcceptMission( sceneId, selfId )

  --如果已接此任务
  if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
  		return
  end
  
  local strText = "";
  --金钱是否够 优先扣除交子 zchw
  --金钱是否够
  local HumanMoney = LuaFnGetMoney( sceneId, selfId )
  local HumanMoneyJZ = GetMoneyJZ( sceneId, selfId );
  
  local checkmoney = 20000
  if HumanMoney + HumanMoneyJZ  <  checkmoney then
  		BeginEvent(sceneId)
			AddText(sceneId,"金钱不足！");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
  end
  
  --是否在漕运
	local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113)
	if haveImpact == 1 then
		BeginEvent(sceneId)
			strText = "对不起,您现在处于运输状态不可接票"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)
	local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
	Quotiety = 2
	local Corpus = 10000 * Quotiety
	
	--begin modified by zhangguoxin 090207
	--local iDayCount = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT)/100000
	local iDayCount = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT);
	--end modified by zhangguoxin 090207
	
	if ItemNum >= x311010_g_CashItem_count then
		if x311010_OnAccept_Necessary( sceneId, selfId ) <= 0 then
			return 0
		end
		local ret = AddMission( sceneId,selfId, x311010_g_MissionId, x311010_g_ScriptId, 0, 0, 0 )
		
		if ret < 1  then
--			BeginEvent(sceneId)
--				strText = "#Y你的任务日志已经满了，无法进行漕运。"
--				AddText(sceneId,strText);
--			EndEvent(sceneId)
--			DispatchMissionTips(sceneId,selfId)
			return
		end
		
		local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)			--得到任务的序列号
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0 (任务完成情况)
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)
		SetMissionByIndex(sceneId,selfId,misIndex,2,0)
		SetMissionByIndex(sceneId,selfId,misIndex,3,0)
		SetMissionByIndex(sceneId,selfId,misIndex,4,0)
		
		--计算到底该给他多少钱
		--以后策划改主意了就把这段打开
		--优先扣除交子 zchw
		
		local nDelJZ, nDelMoney = LuaFnCostMoneyWithPriority(sceneId, selfId, 20000);
		if (nDelJZ == -1) then
			BeginEvent(sceneId)
			AddText(sceneId,"你至少需要有#{_EXCHG"..Corpus.."}，才可以拿到官票。");  
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0;
		end
		
		if (nDelMoney <= 0) then
			BeginEvent(sceneId)
				AddText(sceneId,"你抵押了#{_EXCHG"..nDelJZ.."}，拿到了一张漕运官票。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif (nDelJZ <= 0) then
			BeginEvent(sceneId)
				AddText(sceneId,"你抵押了#{_MONEY"..nDelMoney.."}，拿到了一张漕运官票。" );
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
					AddText(sceneId,"你抵押了#{_EXCHG"..nDelJZ.."}");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			BeginEvent(sceneId)
				AddText(sceneId,"你抵押了#{_MONEY"..nDelMoney.."}，拿到了一张漕运官票。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
		
		--统计数据记录
		LuaFnAuditCaoYun(sceneId, selfId, iDayCount, 1, Corpus)

		SetMissionByIndex(sceneId,selfId,misIndex,5,Corpus)
		SetMissionByIndex(sceneId,selfId,misIndex,6,0)
		SetMissionByIndex(sceneId,selfId,misIndex,7,0)
		--并且增加一个称号“漕运商” 孙雨
--		LuaFnAwardTitle( sceneId, selfId,  5, 124)
--		SetCurTitle(sceneId, selfId,  5, 124)
--		LuaFnDispatchAllTitle(sceneId, selfId)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,113,0)
		if ret > 0 then
--			AddItemListToHuman(sceneId,selfId)
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,2)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
		end
	elseif x311010_CheckAccept(sceneId,selfId) > 0 then

		local ret = AddMission( sceneId,selfId, x311010_g_MissionId, x311010_g_ScriptId, 0, 0, 0 )

		if ret < 1  then
			return
		end
		
		ret = TryRecieveItem( sceneId, selfId, x311010_g_CashItem_id, QUALITY_MUST_BE_CHANGE)
		if ret > 0 then 	

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)			--得到任务的序列号
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0 (任务完成情况)
			SetMissionByIndex(sceneId,selfId,misIndex,1,0)
			SetMissionByIndex(sceneId,selfId,misIndex,2,0)
			SetMissionByIndex(sceneId,selfId,misIndex,3,0)
			SetMissionByIndex(sceneId,selfId,misIndex,4,0)

			-- 玩家关心杀怪
			SetMissionEvent( sceneId,selfId,x311010_g_MissionId, 0 )

			--计算到底该给他多少钱
			--以后策划改主意了就把这段打开
			--优先扣除交子 zchw
	
			local nDelJZ, nDelMoney = LuaFnCostMoneyWithPriority(sceneId, selfId, 20000);
			if (nDelJZ == -1) then
				BeginEvent(sceneId)
				AddText(sceneId,"你至少需要有#{_EXCHG"..Corpus.."}，才可以拿到官票。");  
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return 0;
			end
			
			if (nDelMoney <= 0) then
				BeginEvent(sceneId)
					AddText(sceneId,"你抵押了#{_EXCHG"..nDelJZ.."}，拿到了一张漕运官票。");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			elseif (nDelJZ <= 0) then
				BeginEvent(sceneId)
					AddText(sceneId,"你抵押了#{_MONEY"..nDelMoney.."}，拿到了一张漕运官票。" );
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"你抵押了#{_EXCHG"..nDelJZ.."}");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				BeginEvent(sceneId)
					AddText(sceneId,"你抵押了#{_MONEY"..nDelMoney.."}，拿到了一张漕运官票。");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end

			--统计数据记录
			LuaFnAuditCaoYun(sceneId, selfId, iDayCount, 1, Corpus)

			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,113,0)
			SetMissionByIndex(sceneId,selfId,misIndex,5,Corpus)
			SetMissionByIndex(sceneId,selfId,misIndex,6,0)
			SetMissionByIndex(sceneId,selfId,misIndex,7,0)
			
--并且增加一个称号“漕运商” 孙雨
--			LuaFnAwardTitle( sceneId, selfId,  5, 124)
--			SetCurTitle(sceneId, selfId,  5, 124)
--			LuaFnDispatchAllTitle(sceneId, selfId)


			local Caoyun_Times =  GetMissionData(sceneId,selfId,MD_CAOYUN_SUMTIME)	
--			PrintStr("times="..Caoyun_Times)

			if Caoyun_Times == 0 then
				
				local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
				local msg = "看来您是第一次参加漕运了，漕运确实是个获利非常大的行业，随着等级的提高，不但每天可以漕运的次数会增加，而且每次漕运的获利也会有很大的提升。"
				local msg2 = "不过漕运可没有您想像的那么复杂，只要点击界面上的领取官票之后就可以购买漕运货物了，将对应的货物运送至其他城市的漕运使处出售即可。"
				local msg3 = "记得在漕运状态中不可使用驿站和门派传送人进行传送。"
 				local cmsg = "谢谢您的解释······"
				BeginEvent(sceneId)

					AddText(sceneId,msg)
					AddText(sceneId,msg2)
					AddText(sceneId,msg3)
					AddNumText(sceneId,x311010_g_ScriptId,cmsg,-1,1)

				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
--				x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg, 1)
--第一次时给予漕运商的称号
				LuaFnAwardTitle( sceneId, selfId,  5, 124)
				SetCurTitle(sceneId, selfId,  5, 124)
				LuaFnDispatchAllTitle(sceneId, selfId)

			elseif ret > 0 then
--				AddItemListToHuman(sceneId,selfId)
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,2)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
			end
			
		else
			--把前面加的任务删掉，add by hukai#39191
			DelMission( sceneId, selfId, x311010_g_MissionId )
			
			BeginEvent(sceneId)
				strText = "无法获得物品,不能接受任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		end
			
	end

end

--**********************************
--弹出交易界面
--就是在漕运使处点击了“买卖漕货”或者点击货商，并随机弹出了交易界面
--**********************************
function x311010_OnPopupBargainingUI( sceneId, selfId )

	  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
	   	return 
		end
		
--如果已接此任务
    if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
  	  local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)

			if ItemNum < x311010_g_CashItem_count then
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,5)
					UICommand_AddInt(sceneId,6)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 0)
				x311010_OnAbandon( sceneId, selfId )
				return
			end
--fix here

    	local Mission_Round =	GetMissionData(sceneId,selfId,MD_CAOYUN_HUAN)
			BeginUICommand(sceneId)
				--第1位表示这个UI具体是哪步。
				UICommand_AddInt(sceneId,3)
				
				local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)

				local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
				local TransNpc = x311010_TransPortNPC(sceneId,targetId)
--				PrintStr("targetId="..targetId.." TransNpc="..TransNpc)
				if TransNpc == 0 or TransNpc == -1 then
					return
				end
				
				--第2位表示这个任务索引号。
				UICommand_AddInt(sceneId,misIndex)

				local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
				Quotiety = 1
				local Price_Buy = 10000 * Quotiety
				local Price_Sell = Price_Buy * 150 / 100

				Price_Sell = x311010_Calculate_Margin( sceneId, selfId, Price_Sell )
				--第3位表示买的价格
				UICommand_AddInt(sceneId,Price_Buy)

				--第4位表示卖的价格
				UICommand_AddInt(sceneId,Price_Sell)

				--第5位表示任务脚本的ID
				UICommand_AddInt(sceneId,x311010_g_ScriptId)

				--第6位表示货商不收哪种商品
				UICommand_AddInt(sceneId,1)
				
				--第7位表示当前还剩的PriceUp时间
				Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP)
				Now_Time = LuaFnGetCurrentTime();
				if Now_Time - Pre_Time < 10*60 then
					UICommand_AddInt(sceneId,Pre_Time + 10*60 - Now_Time)
				else
					UICommand_AddInt(sceneId,0)
				end
				
				--第8位表示当前还剩的PriceDown时间
				Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN)
				if Now_Time - Pre_Time < 15*60 then
					UICommand_AddInt(sceneId,Pre_Time + 15*60 - Now_Time)
				else
					UICommand_AddInt(sceneId,0)
				end

--client 要显示出交易界面，根据上面的第一个参数，来放盐、铁、米的button和显示杀价热销button
				UICommand_AddInt(sceneId,TransNpc)
				
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1)
			

		end

end

--**********************************
--购买或卖出某个盐，铁，米
--Client\Interface\Carriage\Carriage.lua
--Carriage_Action_Clicked()调用
--**********************************
function x311010_OnTrade( sceneId, selfId, ManipulateID )

	if LuaFnIsCanDoScriptLogic(sceneId, selfId) < 1 then
		return
	end
	
  if IsHaveMission(sceneId,selfId,x311010_g_MissionId) < 1   then
  	return
  end
	
--判断他是否可以操作这步
--should add some code

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
--			local TransNPC = GetMissionParam(sceneId,selfId,misIndex,6)
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			local TransNPC = x311010_TransPortNPC(sceneId,targetId)
			local trade = 0;

			if TransNPC == 0 or TransNPC == -1 then
				return
			end

	-- hongyu  
	-- 如果玩家传过来一个无关的值，直接丢弃
	if ManipulateID~=1 and ManipulateID~=2 and ManipulateID~=3  then
		return
	end
	-- 客户端发过来的 ManipulateID 有1，2，3这3个值，分别表示
	--  		1		盐	洛阳	0
	-- 			2		铁	大理	2
	--			3		米	苏州	1
	--
	
	local nData = GetMissionParam(sceneId,selfId,misIndex,2)
	nData = mod(nData,1000)
	local nData1 = floor(nData/100)
	local nData2 = floor((nData-nData1*100)/10)
	local nData3 = floor(nData - nData1*100 - nData2*10)
	-- 盐
	if ManipulateID == 1  then
		if sceneId == 0   then
			if nData1~=0  then
				return
			end
		else
			-- 玩家请求执行买入操作，检测玩家是不是已经买过了这个东西
			if nData1==0  then
				return
			end
		end
	end
	-- 铁
	if ManipulateID == 2  then
		if sceneId == 2   then
			-- 玩家请求执行卖出操作，检测玩家是不是有东西可卖出
			if nData2~=0  then
				return
			end
		else
			-- 玩家请求执行买入操作，检测玩家是不是已经买过了这个东西
			if nData2==0  then
				return
			end
		end
	end
	-- 米
	if ManipulateID == 3  then
		if sceneId == 1   then
			-- 玩家请求执行买入操作，检测玩家是不是有空间可买入
			if nData3~=0  then
				return
			end
		else
			-- 玩家请求执行买入操作，检测玩家是不是已经买过了这个东西
			if nData3==0  then
				return
			end
		end
	end
	-- hongyu end.


--cargo
--1 对盐操作
--2	对铁操作
--3	对米操作

--trade
--0	买
--1 卖
--不用这位判断了。

--根据这个NPC和Player身上的情况来判断，对盐，铁，米这个东西是买还是卖
			if ManipulateID == TransNPC then

--这时是购买盐
--先判断这个Player是否已经购买了盐
					
					
					local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
					Price_Down = GetMissionParam(sceneId,selfId,misIndex,1)
					Cargo			= GetMissionParam(sceneId,selfId,misIndex,2)
					local Cargo_Standard = 0;
					local purchased = 0;

--先判断这个Player是否已经购买了盐
					if TransNPC == 1 then
						Cargo_Standard = 100;
						if mod(Cargo,1000) >= Cargo_Standard then
							purchased = 1;							
						end
					elseif TransNPC == 2 then
						Cargo_Standard = 10;
						if mod(Cargo,100) >= Cargo_Standard then
							purchased = 1;
						end
					elseif TransNPC == 3 then
						Cargo_Standard = 1;
						if mod(Cargo,10) >= Cargo_Standard then
							purchased = 1;
						end
					elseif TransNPC == 4 then
						Cargo_Standard = 1000;
						if mod(Cargo,10000) >= Cargo_Standard then
							purchased = 1;
						end
					end
						
					if purchased > 0 then
					
						BeginUICommand(sceneId)
							UICommand_AddInt(sceneId,5)
							UICommand_AddInt(sceneId,7)
							UICommand_AddInt(sceneId,ManipulateID)
						EndUICommand(sceneId)
						DispatchUICommand(sceneId,selfId, 0)
				
						return
					end
--should add some code
--					local Mission_Round =	GetMissionData(sceneId,selfId,MD_CAOYUN_HUAN)
--					if Mission_Round >= 20 then
--						BeginEvent(sceneId)
--							strText="你快去兑换官票吧，本次交易已经超限。"
--							AddText(sceneId,strText);
--						EndEvent(sceneId)
--						DispatchMissionTips(sceneId,selfId)
--						return
--					end


					if Price_Down == 0 then
--没有经过杀价，这里要重新计算到底该多少钱购买
--should add some code
--***					--和上面某部分相同就可以
						local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
						Quotiety = 1
						Price_Down = 10000 * Quotiety
						Pre_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN)
						Now_Time = LuaFnGetCurrentTime();
						
						--取随机数
						--随机给玩家个东东
						local nMoney = GetMoney(sceneId,selfId)
						local nLevel = GetLevel( sceneId, selfId )
						if (Now_Time - Pre_Time >= 15*60) and floor(mod(nMoney / 31 * 17 + 73 + nLevel,21596+Quotiety)) == 15982 then
							BeginAddItem(sceneId)
							AddItem( sceneId,30103001, 1 )
							ret = EndAddItem(sceneId,selfId)
							if ret > 0 then
								AddItemListToHuman(sceneId,selfId)
								BeginEvent(sceneId)
									strText = "你不讲价，运气好，一个洋参土鳖粥从天上掉进你的背包里。"
									AddText(sceneId,strText);
								EndEvent(sceneId)
								DispatchMissionTips(sceneId,selfId)
							else
							--奖励物品没有加成功
								BeginEvent(sceneId)
									strText = "背包已满,没有拿到奖励物品"
									AddText(sceneId,strText);
								EndEvent(sceneId)
								DispatchMissionTips(sceneId,selfId)
							end
						end
					end

					Balance = GetMissionParam(sceneId,selfId,misIndex,5)
					
					if Balance < Price_Down then
						BeginEvent(sceneId)
							strText = "漕运的流动资金不足以购买这个货物。"
							AddText(sceneId,strText)
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
					end
					
					if x311010_OnAdd_CaoyunTime( sceneId, selfId ) <= 0 then
						return 0
					end
					
					Balance = Balance - Price_Down;
					SetMissionByIndex(sceneId,selfId,misIndex,5,Balance)
					SetMissionByIndex(sceneId,selfId,misIndex,1,0)
					Cargo = Cargo + Cargo_Standard
					SetMissionByIndex(sceneId,selfId,misIndex,2,Cargo)
						BeginEvent(sceneId)
							if (ManipulateID ==1) then
								strText = "你成功买入了一份盐"
							elseif ( ManipulateID == 2) then
								strText = "你成功买入了一份铁"
							elseif( ManipulateID ==3) then
								strText = "你成功买入了一份米"
							elseif( ManipulateID ==4) then
								strText = "你成功买入了一份私盐"
							end
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
					--并把身上的标记位置为买入了盐
					--告诉client在UI上我的货舱内，显示盐
					BeginUICommand(sceneId)
							UICommand_AddInt(sceneId,5)
							UICommand_AddInt(sceneId,11)
							UICommand_AddInt(sceneId,Price_Down)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					SetMissionByIndex(sceneId,selfId,misIndex,3,ManipulateID)
					--记录下玩家刚刚买过的漕运物品。
				else
					--if TransNPC == 2 or TransNPC == 3 or TransNPC ==4 then
					--这时是出售盐
					misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
					Price_Up = GetMissionParam(sceneId,selfId,misIndex,0)
					
					local bUp = 0
					if Price_Up == 0  then
						bUp = 0
					else
						bUp = 1
					end
					
					if bUp == 0  then
						Price_Up = 15000
					else
						Price_Up = 18000
					end
										
					Cargo			= GetMissionParam(sceneId,selfId,misIndex,2)
	
					--先判断这个Player是否已经购买了盐
					--should add some code
					
					local Cargo_Standard=0
					local purchased = 0;
					
					--先判断这个Player是否已经购买了盐
					if ManipulateID == 1 then
						Cargo_Standard = 100
						if mod(Cargo,1000) < Cargo_Standard then
							purchased = 1;
						end
					elseif ManipulateID == 2 then
						Cargo_Standard = 10
						if mod(Cargo,100) < Cargo_Standard then
							purchased = 1;
						end
					elseif ManipulateID == 3 then
						Cargo_Standard = 1
						if mod(Cargo,10) < Cargo_Standard then
							purchased = 1;
						end
					elseif ManipulateID == 4 then
						Cargo_Standard = 1000
						if mod(Cargo,10000) < Cargo_Standard then
							purchased = 1;
						end
					end
					
					if purchased > 0 then
						BeginUICommand(sceneId)
							UICommand_AddInt(sceneId,5)
							UICommand_AddInt(sceneId,8)
							UICommand_AddInt(sceneId,ManipulateID)
						EndUICommand(sceneId)
						DispatchUICommand(sceneId,selfId, 0)
						
						return
					end
					
					local HaveChop = x311010_Calculate_Double( sceneId, selfId )
					local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
					Quotiety = 1
					if HaveChop == 2 then
						--if bUp == 0 then
						--	Price_Up = 20000 * Quotiety
						--else
						--	Price_Up = 26000 * Quotiety
						--end
						
						Price_Up = (Price_Up-10000) * 2 + 10000
						
						BeginEvent(sceneId)
							strText = format("因为漕运路引，您出售货物获得的利润翻倍。")
							AddText(sceneId,strText)
		 				EndEvent(sceneId)                                                                                                                                                                                                                                          
	 					DispatchMissionTips(sceneId,selfId)
	 					Msg2Player( sceneId,selfId,"因为漕运路引，您出售货物获得的利润翻倍。",MSG2PLAYER_PARA)

					end

					--if Price_Up == 0 then
					----没有经过热销，这里要重新计算到底该多少钱购买
					--	Quotiety = 1
					--	Price_Up = 15000 * Quotiety
					--end
					
					local SpecialDay = x311010_Calculate_Calender( sceneId, selfId )
					
					if SpecialDay == 2 then
						Price_Up = (Price_Up-10000) * 2 + 10000
					end
					
					if GetMissionParam(sceneId,selfId,misIndex,4) == ManipulateID then
						Price_Up = floor(Price_Up * 110 / 100)
						SetMissionByIndex(sceneId,selfId,misIndex,4,0)
					end
					
	
					
					Price_Up = x311010_Calculate_Margin( sceneId, selfId, Price_Up )
					Balance = GetMissionParam(sceneId,selfId,misIndex,5)
					INP = 10000;
					--***INP要根据时间变化
--王一川给的公式
--					Balance = Balance + Price_Up + INP * 10 * mod( GetMissionData(sceneId,selfId,2) , 10 ) / 100;
--韦青说不乘INP
					Balance = Balance + Price_Up
					SetMissionByIndex(sceneId,selfId,misIndex,5,Balance)
					SetMissionByIndex(sceneId,selfId,misIndex,0,0)
					--并把身上的标记为置为卖出了货物

					Cargo = Cargo - Cargo_Standard

					SetMissionByIndex(sceneId,selfId,misIndex,2,Cargo)
					trade = 1
				--end

		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
			UICommand_AddInt(sceneId,11)
			UICommand_AddInt(sceneId,Price_Up)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0)
		
--并取人物身上这个价格数据来执行操作。
--卖就是结束这环，环数要改变
		if trade == 1 then
--环数+1
			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			local Mission_Round =	GetMissionData(sceneId,selfId,MD_CAOYUN_HUAN)
--missiondata中第2位记录的是漕运的环数
			SetMissionData(sceneId,selfId,MD_CAOYUN_HUAN,Mission_Round + 1)
			BeginEvent(sceneId)
				if (ManipulateID == 1) then
					strText = "你成功卖出了一份盐"
				elseif ( ManipulateID == 2) then
					strText = "你成功卖出了一份铁"
				elseif ( ManipulateID ==3 ) then
					strText = "你成功卖出了一份米"
				elseif ( ManipulateID ==4 ) then
					strText = "你成功卖出了一份私盐"						
				end
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			BeginEvent(sceneId)
				strText = format("本次漕运为第%d环", (Mission_Round + 1))
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			-- 记录玩家完成一次漕运的日志
			LuaFnAuditCaoyunDone(sceneId,selfId)
			
			--总的漕运次数+1

			Sum_Time = GetMissionData(sceneId,selfId,MD_CAOYUN_SUMTIME)			

			SetMissionData(sceneId,selfId,MD_CAOYUN_SUMTIME,Sum_Time+1)
				
			if random(100) <= 5 then
				local my_level = GetLevel( sceneId, selfId )
				local reward_item 

				local medicine_level = floor(my_level/10)
			
				if medicine_level < 1 then
					medicine_level = 1
				elseif medicine_level > 10 then
					medicine_level = 10
				end
				
				if random(100) <= 50 then
					reward_item = x311010_g_Reward_Medicine_HP[medicine_level]
				else
					reward_item = x311010_g_Reward_Medicine_MP[medicine_level]
				end
				ret = TryRecieveItem( sceneId, selfId, reward_item, QUALITY_MUST_BE_CHANGE)
				if ret > 0 then
					BeginEvent(sceneId)
						strText = format("您获得#{_ITEM%d}。", reward_item)
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					SetMissionByIndex(sceneId,selfId,misIndex,3,4)
					--记录下玩家应该拿到奖励而没有拿到。
					local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
					BeginEvent(sceneId)
						AddText(sceneId,"为了奖励您对漕运的贡献，我这里特别给你准备了一份#{_ITEM"..reward_item.."}，可是您的背包满了，无法给予，请整理背包之后通知我。")
						AddNumText(sceneId,x311010_g_ScriptId,"我的背包已经整理好了",-1,3)
						AddNumText(sceneId,x311010_g_ScriptId,"算了我不要了",-1,0)
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					
				end
					

			end
--			local Mission_Round =	GetMissionData(sceneId,selfId,MD_CAOYUN_HUAN)
--			if Mission_Round >= 22 then
--				BeginEvent(sceneId)
--					strText="你快去兑换官票吧，本次交易已经超限。"
--					AddText(sceneId,strText);
--				EndEvent(sceneId)
--				DispatchMissionTips(sceneId,selfId)
--			end




-----------------------------------------------------------
--			x311010_OnPopupBargainingUI( sceneId, selfId )
-----------------------------------------------------------
		end
		end
	
end

--**********************************
--兑换官票
--**********************************
function x311010_OnRedeemUI( sceneId, selfId )

	if LuaFnIsCanDoScriptLogic(sceneId, selfId) < 1 then
		return
	end

	  if IsMissionHaveDone(sceneId,selfId,x311010_g_MissionId) > 0 then
	   	return 
		end

    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x311010_g_MissionId) > 0 then
				
				local ItemNum = GetItemCount(sceneId,selfId,x311010_g_CashItem_id)
				
				if ItemNum < x311010_g_CashItem_count then
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,5)
						UICommand_AddInt(sceneId,4)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 0)
					return
				end
				local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
				local Cargo	= GetMissionParam(sceneId,selfId,misIndex,2)
				if Cargo > 0 then
					BeginEvent(sceneId)	
						strText = format("清舱后才能兑换官票。")
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end
			--结束此任务，并根据官票上的面额来给予相关奖励
			--钱和经验等
			--可能奖励还跟环数有关系
			--begin modified by zhangguoxin 090207
			--GetMissionData(sceneId,selfId,MD_CAOYUN_HUAN) 
			--local iDayCount = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT)/100000
			local iDayCount = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT);
			--end modified by zhangguoxin 090207
			
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,5)
				UICommand_AddInt(sceneId,3)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 0)
			
			misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			Balance = GetMissionParam(sceneId,selfId,misIndex,5)
--			TransNPC = GetMissionParam(sceneId,selfId,misIndex,6)
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			TransNPC = x311010_TransPortNPC(sceneId,targetId)
			
			if TransNPC == 4 then
				return
			end
--这里不检查balance，因为所有买的地方都排除了是否会出现负数的情况
			local Quotiety = x311010_Calculate_Modulus( sceneId, selfId )
			Quotiety = 2
			local Corpus = 10000 * Quotiety
			local Margin = Balance - Corpus
			
			if x311010_OnAccomplished( sceneId, selfId ) ~= 1 then
				return
			end
			
			if	Margin > 0 then
				local Level = LuaFnGetLevel( sceneId, selfId)
--				Margin = Margin * (0.625+0.02*(Level-30)/2)
				--AddMoney(sceneId,selfId,Margin + Corpus);
				AddMoneyJZ(sceneId, selfId, 1.2*(Margin+Corpus));
				--记录统计信息
				LuaFnAuditCaoYun(sceneId, selfId, iDayCount, 0, Margin)
--				BeginEvent(sceneId)	
--					strText = format("你得到#{_MONEY"..Margin.."}的漕运花红。")
--					AddText(sceneId,strText);
--				EndEvent(sceneId)
--				DispatchMissionTips(sceneId,selfId)

				local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
				--local msg = "恭喜您结束漕运，本轮漕运您获得花红#{_EXCHG"..Balance.."}，加上20%额外收益，一共为#{_EXCHG"..1.2*Balance.."}。扣除押金后，您获得花红#{_EXCHG"..1.2*Balance-Corpus.."}。"
 				local msg = "恭喜您结束漕运，本轮漕运您获得收益#{_EXCHG"..Balance.."}，经过扣除押金#{_EXCHG20000}和加入由于使用交子获得的额外收益#{_EXCHG"..0.2*Balance.."}后，您最终获得的花红是#{_EXCHG"..1.2*Balance-Corpus.."}。"
 				local cmsg = "贪财贪财......"
				x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,0)

			elseif Balance > 0 then
				AddMoneyJZ(sceneId,selfId,Balance);
				--记录统计信息
				LuaFnAuditCaoYun(sceneId, selfId, iDayCount, 0, 0)
				BeginEvent(sceneId)	
					strText = format("你经营不善，没有获得花红，仅取回漕运本金#{_EXCHG"..Balance.."}。" )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				--记录统计信息
				LuaFnAuditCaoYun(sceneId, selfId, iDayCount, 0, -Corpus)
				BeginEvent(sceneId)	
					strText = format("你经营不善，没有获得花红，连本金也损失了。" )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
			--扣除官票
			
			--x311010_OnAccomplished( sceneId, selfId )
			
			
		end

end


--**********************************
--判断应该结束他的打压市场的cool down
--**********************************
function x311010_OnFinishHaggleDown( sceneId, selfId )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	SetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINDOWN,0)
			
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,5)
		UICommand_AddInt(sceneId,14)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 0)
	return
end

--**********************************
--判断应该结束他的哄抬物价的cool down
--**********************************
function x311010_OnFinishHaggleUp( sceneId, selfId )

	--结束他的热销CD
	local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	SetMissionData(sceneId,selfId,MD_CAOYUN_BARGAINUP,0)
		
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,5)
		UICommand_AddInt(sceneId,13)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 0)
	return
end

--**********************************
--放弃
--**********************************
function x311010_OnAbandon( sceneId, selfId )

	x311010_OnAccomplished( sceneId, selfId )

	x311010_OnAbandon_Necessary( sceneId, selfId )
	
end

function x311010_OnAccomplished( sceneId, selfId )

	--移去任务物品
	if DelItem( sceneId, selfId, x311010_g_CashItem_id, x311010_g_CashItem_count ) ~= 1 then 
		return 0 
	end 

--删除玩家任务列表中对应的任务
	local ret = DelMission( sceneId, selfId, x311010_g_MissionId )
	if ret > 0 then
--删除称号“漕运商” 孙雨
		SetCurTitle(sceneId, selfId,  0, 124)
		DeleteTitle( sceneId, selfId,  5)
		LuaFnDispatchAllTitle(sceneId, selfId)	
--移去任务物品
		--DelItem( sceneId, selfId, x311010_g_CashItem_id, x311010_g_CashItem_count )
		--SetMissionData(sceneId,selfId,MD_CAOYUN_HUAN,0)
		SetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER,0)
	end
	LuaFnCancelSpecificImpact(sceneId,selfId,113)

	return 1
end

--**********************************
--玩家死亡
--**********************************
function x311010_OnHumanDie( sceneId, selfId, killerId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	local Balance = GetMissionParam(sceneId,selfId,misIndex,5)
	local Cargo =  GetMissionParam(sceneId,selfId,misIndex,2)
	x311010_OnAccomplished( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId, "#{CYSB_081107_1}")
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
	BroadMsgByChatPipe(sceneId, selfId, "#{CYSB_081107_1}", 8)
	if Balance > 1 then
		pos_x = GetHumanWorldX(sceneId,selfId)
		pos_z = GetHumanWorldZ(sceneId,selfId)
	
--		local ret = DropBoxEnterScene(	pos_x,pos_z,sceneId )
		
--		if ret > -1 then
--			AddItemToBox(sceneId,ret,QUALITY_MUST_BE_CHANGE,1,30001000)
--
--			--按照最新的计算方法计算出的掉落到银票中的金钱
--				--银票的价值＝玩家漕运证上所有的金钱×等级影响系数。
--				--等级影响系数计算规则如下：
--				--当玩家等级<=30级时，等级影响系数 = 25%
--				--当玩家等级>30级并且<=73级时，等级影响系数 = 25%*(玩家等级/30)^1.27
--				--当玩家等级>73级时，等级影响系数 = 80%
--				
--			local nLevel = GetLevel(sceneId, selfId)
--			local nQuotiety = 0
--			if nLevel <= 30  then
--				nQuotiety = 0.25
--			end
--			
--			if nLevel > 30 and nLevel <= 73  then
--				nQuotiety = 0.25 * ((nLevel/30)^1.27)
--			end
--			
--			if nLevel > 73   then
--				nQuotiety = 0.8
--			end
--			
--			local Corpus = Balance * nQuotiety
--			
--			Corpus = floor(Corpus)
--			SetBoxItemParam( sceneId, selfId, ret, 0, 0, 2, Corpus )
--		end
	end

end

--检测次数
function x311010_OnAccept_Necessary( sceneId, selfId )
	local Level =GetLevel(sceneId, selfId)
	
	local Max_Time_EveryDay = 0

	if Level >= 70 then
		Max_Time_EveryDay = 50
	elseif Level >= 50 then
		Max_Time_EveryDay = 40
	elseif Level >= 30 then
		Max_Time_EveryDay = 30
	end
	--韦青5月4日在文档里说要限制成20次
	Max_Time_EveryDay = 20
	
	--begin modified by zhangguoxin 090207
	--local iDayCount=GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)	--上一次交任务的时间(天数)
	--local iQuarterTime = mod(iTime,100)	--上一次交任务的时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
  --
	--local CurTime = GetHourTime()		--当前时间
	--local CurDaytime = floor(CurTime/100)	--当前时间(天)
	--local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)
	local iDayHuan = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT); --当天内完成的任务次数
	
	local iTime = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYTIME);			--上次完成任务时间
	local iDayTime = floor(iTime/100)																		--上一次交任务的时间(天数)
	local iQuarterTime = mod(iTime,100)																	--上一次交任务的时间(刻)
		
	local CurTime = GetQuarterTime()																		--当前时间
	local CurDaytime = floor(CurTime/100)																--当前时间(天)
	local CurQuarterTime = mod(CurTime,100)															--当前时间(刻)
	--end modified by zhangguoxin 090207

	if iTime == CurTime then
		BeginEvent(sceneId)
			strText = format("时间未到，还不能接漕运任务。")
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return -1
	end
	

	if CurDaytime==iDayTime then 	--上次完成任务是同一天内
		if iDayHuan >= Max_Time_EveryDay then
--			BeginEvent(sceneId)
--				strText = format("这个任务一天最多做%d次。", Max_Time_EveryDay )
--				AddText(sceneId,strText)
--			EndEvent(sceneId)
--			DispatchMissionTips(sceneId,selfId)

			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			local msg = "对不起，您今天所从事的漕运任务已经满"..Max_Time_EveryDay.."次上限，请您明天再来吧。"
	 		local cmsg = "我知道了......"
			x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,0)

			return -1
		end
--		iDayHuan = iDayHuan+1
	else							--上次完成任务不在同一天，重置
		iDayTime = CurDaytime
		iDayHuan = 0
	end
	--begin modified by zhangguoxin 090207
	--iDayCount = iDayHuan*100000+CurDaytime*100+iQuarterTime
	----PrintStr("accept:"..iDayCount)
	--SetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT,iDayCount)
	local newTime = CurDaytime*100+iQuarterTime;
	SetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT,iDayHuan);
	SetMissionData(sceneId,selfId,MD_CAOYUN_DAYTIME,newTime);
	--end modified by zhangguoxin 090207
	return 1
	
end
--增加次数
function x311010_OnAdd_CaoyunTime( sceneId, selfId )
	local Level =GetLevel(sceneId, selfId)
	
	local Max_Time_EveryDay = 0

	if Level >= 70 then
		Max_Time_EveryDay = 50
	elseif Level >= 50 then
		Max_Time_EveryDay = 40
	elseif Level >= 30 then
		Max_Time_EveryDay = 30
	end
	--韦青5月4日在文档里说要限制成20次
	Max_Time_EveryDay = 20
	
	--begin modified by zhangguoxin 090207
	--local iDayCount=GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)	--上一次交任务的时间(天数)
	--local iQuarterTime = mod(iTime,100)	--上一次交任务的时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
  --
	--local CurTime = GetHourTime()		--当前时间
	--local CurDaytime = floor(CurTime/100)	--当前时间(天)
	--local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)
	local iDayHuan = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT); --当天内完成的任务次数
	
	local iTime = GetMissionData(sceneId,selfId,MD_CAOYUN_DAYTIME);			--上次完成任务时间
	local iDayTime = floor(iTime/100)																		--上一次交任务的时间(天数)
	local iQuarterTime = mod(iTime,100)																	--上一次交任务的时间(刻)
	
	local CurTime = GetQuarterTime()																		--当前时间
	local CurDaytime = floor(CurTime/100)																--当前时间(天)
	local CurQuarterTime = mod(CurTime,100)															--当前时间(刻)
	--end modified by zhangguoxin 090207
	
--	if iTime == CurTime then
--		BeginEvent(sceneId)
--			strText = format("时间未到，还不能接漕运任务。")
--			AddText(sceneId,strText)
--		EndEvent(sceneId)
-- 		DispatchMissionTips(sceneId,selfId)
--		return -1
--	end
	

	if CurDaytime==iDayTime then 	--上次完成任务是同一天内
		local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
		local Cargo			= GetMissionParam(sceneId,selfId,misIndex,2)
		if Cargo > 0 and iDayHuan >= Max_Time_EveryDay-1 then
		
		end
		if (iDayHuan >= Max_Time_EveryDay) then
--			BeginEvent(sceneId)
--				strText = format("这个任务一天最多做%d次。", Max_Time_EveryDay )
--				AddText(sceneId,strText)
--			EndEvent(sceneId)
--			DispatchMissionTips(sceneId,selfId)
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
--			local msg = "对不起，您今天所从事的漕运任务已经满"..Max_Time_EveryDay.."次上限，请您明天再来吧。"
			local msg = "您今天的漕运已经到达了20次上限。"
	 		local cmsg = "我知道了......"
			x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg,0)

			return -1
		end
		iDayHuan = iDayHuan+1
	else							--上次完成任务不在同一天，重置
		iDayTime = CurDaytime
		iDayHuan = 0
	end
	
	--begin modified by zhangguoxin 090207
	--iDayCount = iDayHuan*100000+CurDaytime*100+iQuarterTime
	----PrintStr("add time:"..iDayCount)
	--SetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT,iDayCount)
	local newTime = CurDaytime*100+iQuarterTime;
	SetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT,iDayHuan);
	SetMissionData(sceneId,selfId,MD_CAOYUN_DAYTIME,newTime);
	--end modified by zhangguoxin 090207
	return 1
end

--放弃时记录时间
function x311010_OnAbandon_Necessary( sceneId, selfId )
	--begin modified by zhangguoxin 090207
	--local iDayCount=GetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
  --
	--local CurTime = GetHourTime()		--当前时间
	--
	--iDayCount = iDayHuan*100000+CurTime
  --
	--	
	--SetMissionData(sceneId,selfId,MD_CAOYUN_DAYCOUNT,iDayCount)
	local CurTime = GetQuarterTime()		--当前时间
	SetMissionData(sceneId,selfId,MD_CAOYUN_DAYTIME,CurTime);
	--end modified by zhangguoxin 090207
	return 1
	
end

function x311010_OnPlayerCaoyunTimer( sceneId, selfId )

	local Detect = 0
	for i, eachId in x311010_g_Traverse_Region do
		if eachId == sceneId then
			Detect = 1
		end
	end
	
	local Orientation_Article = 0
	local Article_Quantity
	for i, item in x311010_g_EludeItem do
		Article_Quantity = GetItemCount( sceneId, selfId, item.id )
		if Article_Quantity ~= item.num then
			Orientation_Article = 1
		end
	end

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 137) ~= 0 then
		return
	end

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 136) ~= 0 and random(2) == 1 then
		return
	end

	if Detect == 1 and Orientation_Article == 1 then	
		local rrr = random(100)
		if random(2) < 3 then
			local iMonsterCount=GetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER)
			if iMonsterCount < 4 then
				iMonsterCount = iMonsterCount + 1
			end
			if iMonsterCount == 1 or iMonsterCount == 2 then

				SetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER,iMonsterCount)
				
				-- 遇漕运怪有20%几率变为答题 hongyu ------
				if random(100) <= 20  then
					LuaFnSendGuajiQuestion(sceneId,selfId)
					return
				end
				-- hongyu end ----------------------------
				
				pos_x = GetHumanWorldX(sceneId,selfId)
				pos_z = GetHumanWorldZ(sceneId,selfId)
				
				local Level_Self = GetLevel( sceneId, selfId )
				local Adapt = floor( (Level_Self-1) / 10);	
				if Adapt < 1 then
					Adapt = 1
				elseif Adapt > 20 then   -- modify by zchw  
					Adapt = 20
				end
				local Monster_Id = x311010_g_Accommodate_Distinction[Adapt];
				npcobjid = LuaFnCreateMonster( sceneId, Monster_Id, pos_x,pos_z, 10,95, 311011 )
				x311010_Diversification( sceneId, npcobjid )
--				Msg2Player(  sceneId, selfId,"@*;npcpaopao;"..npcobjid..";15",MSG2PLAYER_PARA )
--				Msg2Player(  sceneId, selfId,"@*;npcpaopao;"..npcobjid..";16",MSG2PLAYER_PARA )
				SetLevel(sceneId, npcobjid,Level_Self-1)
				SetCharacterTimer( sceneId, npcobjid, 60000 )
				SetCharacterDieTime(sceneId, npcobjid, 60000 * 4 )
--				PaoPao(sceneId,selfId,npcobjid)
				AddPrimaryEnemy(sceneId,npcobjid,selfId)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,npcobjid,npcobjid,114,0)
				BeginEvent(sceneId)
					strText = format("请注意，此处有强盗出没！")
					AddText(sceneId,strText)
	 			EndEvent(sceneId)                                                                                                                                                                                                                                          
 				DispatchMissionTips(sceneId,selfId)
 				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,37,0)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,npcobjid,npcobjid,37,0)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,38,0)
				for i=1,2 do
					if ( rrr > 5 and i == 1 ) or ( rrr > 35 and i == 2) then 
						local Monster_Id =x311010_g_Acclimatize_Distinction[Adapt]
						local this_x,this_z = x311010_Random_Nativity(pos_x,pos_z,i)
						npcobjid = LuaFnCreateMonster( sceneId, Monster_Id, this_x,this_z, 10,95, 311011 )
						x311010_Diversification( sceneId, npcobjid )
	--只有怪物头目冒泡
						if i == 1 then
							Msg2Player(  sceneId, selfId,"@*;npcpaopao;"..npcobjid..";15",MSG2PLAYER_PARA )
						else
							Msg2Player(  sceneId, selfId,"@*;npcpaopao;"..npcobjid..";16",MSG2PLAYER_PARA )
						end
						SetLevel(sceneId, npcobjid,Level_Self-2)
						SetCharacterTimer( sceneId, npcobjid, 60000 )
						SetCharacterDieTime(sceneId, npcobjid, 60000 * 4)
	--					PaoPao(sceneId,selfId,npcobjid)
						AddPrimaryEnemy(sceneId,npcobjid,selfId)
						LuaFnSendSpecificImpactToUnit(sceneId,selfId,npcobjid,npcobjid,114,0)
						LuaFnSendSpecificImpactToUnit(sceneId,selfId,npcobjid,npcobjid,37,0)
	
					end
				end
			elseif iMonsterCount == 100 then
				SetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER,0)
			end
		end
	else
		SetCharacterTimer( sceneId, selfId, 0 )
	end
end

function x311010_OnPlayerEnterCaoyunScene( sceneId, selfId )

	local find = 0
	for i, eachId in x311010_g_Traverse_Region do
		if eachId == sceneId then
			find = 1
		end
	end
	
	if find == 1 then	
		SetCharacterTimer( sceneId, selfId, 45000 )
		SetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER,100)
		BeginEvent(sceneId)
			strText = format("请注意，此处有强盗出没！")
			AddText(sceneId,strText)
		EndEvent(sceneId)                                                                                                                                                                                                                                          
		DispatchMissionTips(sceneId,selfId)
	else
		SetCharacterTimer( sceneId, selfId, 0 )
	end
	return 1
end

function x311010_Diversification( sceneId, MonsterId )
	--设置monster的称号
	ret = random(7)
	local part1 = x311010_g_TitleTableOfMonster[ret].part1
	ret = random(7)
	local part2 = x311010_g_TitleTableOfMonster[ret].part2
	local str = format("%s%s", part1, part2)
	SetCharacterTitle(sceneId, MonsterId, str)
	--设置monster的name
	ret = random(8)
	local part1 = x311010_g_NameTableOfMonster[ret].part1
	ret = random(8)
	local part2 = x311010_g_NameTableOfMonster[ret].part2
	ret = random(8)
	local part3 = x311010_g_NameTableOfMonster[ret].part3
	local part4 = ""
	local rd = random(4)
	
	if rd == 1 then
		part4 = format("%s%s" , part2, part3)
	elseif rd == 2 then
		part4 = part2
	elseif rd == 3 then
		part4 = part3
	else
		part4 = format("%s%s" , part3, part2)
	end
	
	str = format("%s%s", part1, part4)
	
	SetCharacterName(sceneId, MonsterId, str)
	return 1	
end

function x311010_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

function x311010_Random_Nativity(position_x,position_z,Range)
	local Variety_X,Variety_Z;
	if position_x > 2 then
		Variety_X = position_x - 1 + random(3)+random(Range+1)
	end
	
	if position_z > 2 then
		Variety_Z = position_z - 1 + random(3)+random(Range+1)
	end

	return Variety_X,Variety_Z
end

function x311010_Client_Show_Message( sceneId, selfId, targetId, Message, CloseMessage, NumText)

	BeginEvent(sceneId)

		AddText(sceneId,Message)
		AddNumText(sceneId,x311010_g_ScriptId,CloseMessage,-1,NumText)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end

function x311010_OnHandle_QuestUI( sceneId, selfId, targetId, NumText )
--	PrintStr("NumText="..NumText)
	if NumText == 0 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 1 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0)
	elseif NumText == 2 then
		local Caoyun_Times =  GetMissionData(sceneId,selfId,MD_CAOYUN_SUMTIME)	
		local find = -1
		for i, times in x311010_g_Title_Times_Confine do
			if times <= Caoyun_Times then
				find = i
				break
			end
		end

--		BeginUICommand(sceneId)
--		EndUICommand(sceneId)
--		DispatchUICommand(sceneId,selfId, 1000)
--		
--		local New_Title = x311010_g_Title_Confine[find]
--
--		LuaFnAwardTitle( sceneId, selfId,  5, New_Title)
--		SetCurTitle(sceneId, selfId,  5, New_Title)
--		LuaFnDispatchAllTitle(sceneId, selfId)
		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
			UICommand_AddInt(sceneId,2)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0)
		
	elseif NumText == 3 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		local my_level = GetLevel( sceneId, selfId )
		local medicine_level = floor(my_level/10)
		local reward_item 
		
		if medicine_level < 1 then
			medicine_level = 1
		elseif medicine_level > 10 then
			medicine_level = 10
		end
		
		if random(100) < 50 then
			reward_item = x311010_g_Reward_Medicine_HP[medicine_level]
		else
			reward_item = x311010_g_Reward_Medicine_MP[medicine_level]
		end
		TryRecieveItem( sceneId, selfId, reward_item, QUALITY_MUST_BE_CHANGE )
	elseif NumText > 3 and NumText < 17 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		local Scene_Info = x311010_g_Transportation_Exit[sceneId]
		if Scene_Info then
			for i=1,2 do
				if Scene_Info[i].Exit_Reply_Number == NumText then
					SetPos( sceneId, selfId, Scene_Info[i].Exit_Position.x, Scene_Info[i].Exit_Position.y )
				end				
			end
		end

	elseif NumText > 16 and NumText < 20 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		local Scene_Info = x311010_g_Transportation_City[NumText-17]
		
		if Scene_Info then
			local rrr= random(3)-1
			NewWorld( sceneId, selfId, NumText-17, Scene_Info[rrr].x, Scene_Info[rrr].y )
		end
	elseif NumText > 19 and NumText < 23 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		local Scene_Info = x311010_g_Transportation_Legate[NumText-20]
		
		if Scene_Info then
			NewWorld( sceneId, selfId, NumText-20, Scene_Info.Position.x, Scene_Info.Position.y )
		end
	elseif NumText > 22 and NumText < 27 then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
			local my_level = GetLevel( sceneId, selfId )
			if my_level>=30 and my_level<40 then
				level_phase = 1
			elseif my_level>=40 and my_level<55 then
				level_phase = 2
			elseif my_level>=55 and my_level<65 then
				level_phase = 3
			elseif my_level>=65 and my_level<75 then
				level_phase = 4
			elseif my_level>=75 and my_level<85 then
				level_phase = 5
			elseif my_level>=85 and my_level<95 then
				level_phase = 6
			elseif my_level>=95 and my_level<105 then
				level_phase = 7
			elseif my_level>=105 and my_level<115 then
				level_phase = 8
			elseif my_level >= 115 then
				level_phase = 9
			end
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x311010_g_SpecialImpact[NumText].Impact_ID[level_phase],0)
	elseif NumText == 27 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,x311010_g_IncreaseSpeed_Impact[NumText].Impact_ID,0)
	elseif NumText == 28 then
		x311010_Monger_Random(sceneId,selfId)
	end

end

function x311010_TransPortNPC(sceneId,targetId)

		local TransportNPCName=GetName(sceneId,targetId);
		
		local type = GetCharacterType(sceneId,targetId);
		
		if type ~=2 then 
			return -1
		end
		
		if TransportNPCName == "赵明诚" then
			return 1
		elseif TransportNPCName == "陆士铮" then
			return 3
		elseif TransportNPCName == "王若禹" then
			return 2
		elseif TransportNPCName == "黑市商人" then
			return 4
		else 
			return -1
		end
end

--*****************************************************
--玩家领取官票并购买本地货物后给玩家随机加三种好处
--Client\Interface\Carriage\Carriage.lua
--x311010_Close_Carriage_UI()调用
--*****************************************************
function x311010_Close_Carriage_UI( sceneId, selfId )
	
	--没有漕运任务就直接退出--add by xindefeng
	if IsHaveMission(sceneId,selfId,x311010_g_MissionId) <= 0 then
			return
  end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
	local Statue = GetMissionParam(sceneId,selfId,misIndex,3)
--	PrintStr("statue="..Statue)
	if Statue == 1 or Statue == 2 or Statue == 3 then
		SetMissionByIndex(sceneId,selfId,misIndex,3,0)
		local rrr = random(100)
		local strText
		if rrr <= 2 and GetMissionParam(sceneId,selfId,misIndex,4) <= 0 then
			
			if (Statue ==1) then
				strText = "盐"
			elseif ( Statue == 2) then
				strText = "铁"
			elseif( Statue ==3) then
				strText = "米"
			end
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			local msg = "恭喜您，您这次漕运的货物是一级"..strText.."这次漕运您的获利将会增加10%。"
 			local cmsg = "运气不错······"

			x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg, 0)
			SetMissionByIndex(sceneId,selfId,misIndex,4,Statue)
			--在特殊状态位记录下当时的漕货
		elseif rrr <= 5 then
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			local msg = "恭喜您，您这次漕运中途将会有衙役保护，这样您就不会遇到抢劫漕货的强人了。"
 			local cmsg = "运气不错......"

			x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg, 0)
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,137,0)
		elseif rrr <= 10 then
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			local msg = "恭喜您，您很幸运，在漕运的过程中，您遇到强人的几率将会降低50%。"
 			local cmsg = "运气不错......"

			x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg, 0)
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,136,0)
		end
	end
end

function x311010_Monger_Random(sceneId,selfId)
			local targetId = GetMissionData(sceneId,selfId,MD_CAOYUN_TARGETID)
			local misIndex = GetMissionIndexByID(sceneId,selfId,x311010_g_MissionId)
			
			TRAFFICKER_CLICK_TIMES = TRAFFICKER_CLICK_TIMES + 1
			
			local  PlayerSex=GetSex(sceneId,selfId)
			if PlayerSex == 0 then
				PlayerSex = "侠女"
			else
				PlayerSex = "大侠"
			end
			
--是否出现出售漕货
			local rrr = random(100)
				
			if rrr < 0 then
--屏蔽黑市商人的私盐
						
				local msg = "不好意思，你运气不好。"
 				local cmsg = "我下次再来......"
				x311010_Client_Show_Message( sceneId, selfId, targetId, msg, cmsg, 0)
					
--						BeginUICommand(sceneId)
--							UICommand_AddInt(sceneId,3)
--						--client 要在UI 上显示"买卖漕货"和"兑换官票"这2个button
--							UICommand_AddInt(sceneId,targetId)
--						--并且把NPC的ID传给client，以备下一步调用。
--						EndUICommand(sceneId)
--						DispatchUICommand(sceneId,selfId, 0)

			elseif rrr <= 20 then
			--传送至本地图的入口
				
				local City_Exit = x311010_g_Transportation_Exit[sceneId]
				if City_Exit then
					BeginEvent(sceneId)
		
						AddText(sceneId,PlayerSex.."，您也挺辛苦的，我也帮你一点忙吧，希望下次能够照顾我一点生意，我可以帮你传送到下一个地图的入口处，您想去哪儿？")
							AddNumText(sceneId,x311010_g_ScriptId,"我想到"..City_Exit[1].Exit_Name.."的入口",-1,City_Exit[1].Exit_Reply_Number)
							AddNumText(sceneId,x311010_g_ScriptId,"我想到"..City_Exit[2].Exit_Name.."的入口",-1,City_Exit[2].Exit_Reply_Number)
							AddNumText(sceneId,x311010_g_ScriptId,"我还是自己跑吧",-1,0)
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
				end
					
			elseif rrr <= 40 then
			--传送至城市的内部
				BeginEvent(sceneId)
		
					AddText(sceneId,PlayerSex.."，您也挺辛苦的，我也帮你一点忙吧，希望下次能够照顾我一点生意，我可以帮你传送到您想去的城市，您想去哪儿？")
	
					for i=0,getn(x311010_g_Transportation_City) do
						AddNumText(sceneId,x311010_g_ScriptId,"我想去"..x311010_g_Transportation_City[i].Scene_Name,-1,x311010_g_Transportation_City[i].Reply_Number)
					end

					AddNumText(sceneId,x311010_g_ScriptId,"我还是自己跑吧",-1,0)
						
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			elseif rrr <= 40 then
			--传送至漕运使处
				BeginEvent(sceneId)
		
					AddText(sceneId,PlayerSex.."，您也挺辛苦的，我也帮你一点忙吧，希望下次能够照顾我一点生意，我可以帮你传送到漕运使附近，您想去哪儿？")
	
					for i=0,getn(x311010_g_Transportation_Legate) do
						AddNumText(sceneId,x311010_g_ScriptId,"我想去"..x311010_g_Transportation_Legate[i].Scene_Name.."的漕运使处",-1,x311010_g_Transportation_Legate[i].Reply_Number)
					end

					AddNumText(sceneId,x311010_g_ScriptId,"我还是自己跑吧",-1,0)
						
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			elseif rrr <= 48 then
					
				local find,level_phase
				if rrr < 43 then
				--增加外功攻击
					find = 23
				elseif rrr < 45 then
				--增加内功攻击
					find = 24
				elseif rrr < 47 then
				--增加外功防御
					find = 25
				elseif rrr < 49 then
				--增加内功防御
					find = 26
				end

				BeginEvent(sceneId)
		
					AddText(sceneId,"漕运的路上一路凶险，我这里可以给你一点帮助，给你增加一些"..x311010_g_SpecialImpact[find].Impact_Name.."，不过下次如果我有私货要脱手的时候，你可得帮我。")
	
					AddNumText(sceneId,x311010_g_ScriptId,"好吧",-1,find)
					AddNumText(sceneId,x311010_g_ScriptId,"我还是自己跑吧",-1,0)
						
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
			--增加速度
				BeginEvent(sceneId)
	
					AddText(sceneId,"漕运的路还很漫长，我这里可以提供给你一点帮助，增加你短时间内的移动速度，不过下次一定要记得多照顾照顾我的生意，我一家老小就靠我来养家糊口了。")

					AddNumText(sceneId,x311010_g_ScriptId,"好吧",-1,27)
					AddNumText(sceneId,x311010_g_ScriptId,"我还是自己跑吧",-1,0)
						
				EndEvent(sceneId)				
				DispatchEventList(sceneId,selfId,targetId)
			end
			return
end


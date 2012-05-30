--活动
--抽奖
--LuaFnGetAvailableItemCount(sceneId, selfId, itemId)


x808065_g_ScriptId = 808065;

--x808065_g_StartDayTime = 7285; --10.12
x808065_g_StartDayTime = 7304; --11.01
x808065_g_EndDayTime = 7325;   --11.22

x808065_g_ItemId   =
{
	["choujiang1"] = 40004431,
	["choujiang2"] = 30900006,
	["choujiangtudi"] = 40004433,
	["choujiangshifu"] = 40004432,
}

x808065_g_Key				=
{
	["choujiang1"]	=	101,			--抽奖活动1
	["choujiang2"]	= 102,			--抽奖活动2
	["choujiang3"]	= 103,			--抽奖活动3
	["choujianghuodong"]	= 104,			--抽奖说明
	["choujiangshuoming1"] = 105,
	["choujiangshuoming2"] = 106,
	["choujiangshuoming3"] = 107,
}

function x808065_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x808065_CheckRightTime();
	if 1 ~= isTime then
	
		return
		
	end
	
	local NumText = GetNumText();	
	local MyLevel = GetLevel( sceneId, selfId );
	if(NumText == x808065_g_Key["choujiang1"]) then
	
		if(MyLevel < 20) then
		
			x808065_Printf( sceneId,  selfId, targetId , ""..GetName( sceneId, selfId ).."，你最近在江湖上名头颇为响亮，但离新兵夺宝的标准还有一点点距离。你还是等到#G20级#W再来抽奖吧！");
			
		elseif(MyLevel >=20 and MyLevel < 40) then
		
			local Num = LuaFnGetAvailableItemCount(sceneId, selfId, x808065_g_ItemId["choujiang1"]);
			if(Num > 0) then
			
				x808065_Printf( sceneId, selfId, targetId,  ""..GetName( sceneId, selfId ).."，你的的确确是江湖上不可忽视的一股新势力。可是你不久之前，已经在我这里抽过奖了啦！你看，你身上还带着奖券呢！");
				
			else
				
				if( x808065_AddJiangjuan( sceneId, selfId, x808065_g_ItemId["choujiang1"]) == 1) then
				
					x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，你已经成功地进行了抽奖，你的名字已经被列入抽奖名单。请耐心等待通知，具体活动内容请查阅天龙八部官方网站");
					
				end
			
			end
			
		end
	
	elseif(NumText == x808065_g_Key["choujiang2"] ) then
		
		if(MyLevel < 40) then
		
			x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."，你最近在江湖上名头颇为响亮，但只有江湖上最火的新势力才能领取超爽大礼包呢，你还是达到#G40级#W再来领取超爽大礼包吧！");
			
		elseif(MyLevel >=40 and MyLevel <=45) then
			
			if( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO01 ) == 1) then
			--已经领过
				x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."，你的的确确是江湖上最火的一股新势力。可是你不久之前，已经在我这里领取过超爽大礼包了啦！");
			
			elseif( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO01 ) == 0) then
			
				if( x808065_PutIntoPack( sceneId, selfId, targetId, x808065_g_ItemId["choujiang2"], QUALITY_MUST_BE_CHANGE, 1 , 1) == 1) then
				
					SetMissionFlag(sceneId, selfId, MF_CHOUJIANGDALIBAO01, 1);
					x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，你已经成功地获得了超爽大礼包。看看你的行囊吧，里边应该多了一件让你喜欢的好东西呢！");
					
				end
			
			end
		
		elseif(MyLevel > 45 and MyLevel < 50) then
		
			x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."，你最近在江湖上名头颇为响亮，但只有江湖上最火的新势力才能领取超爽大礼包呢，你还是达到#G50级#W再来领取超爽大礼包吧！");
			
		elseif(MyLevel >= 50 and MyLevel <= 55) then
		
			if( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO02 ) == 1) then
			--已经领过
				x808065_Printf(sceneId, selfId, targetId, ""..GetName( sceneId, selfId ).."，你的的确确是江湖上最火的一股新势力。可是你不久之前，已经在我这里领取过超爽大礼包了啦！");
			
			elseif( GetMissionFlag( sceneId, selfId, MF_CHOUJIANGDALIBAO02 ) == 0) then
			
				if( x808065_PutIntoPack( sceneId, selfId, targetId, x808065_g_ItemId["choujiang2"], QUALITY_MUST_BE_CHANGE, 2 , 1) == 1) then
				
					SetMissionFlag(sceneId, selfId, MF_CHOUJIANGDALIBAO02, 1);
					x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，你已经成功地获得了超爽大礼包。看看你的行囊吧，里边应该多了一件让你喜欢的好东西呢！");
					
				end
			
			end
				
		end
		
	elseif(NumText == x808065_g_Key["choujiang3"]) then
		x808065_ShiTuPrizeOption3(sceneId,selfId,targetId)
		return
		--local TeamFlag = LuaFnHasTeam( sceneId, selfId )
		--if( TeamFlag ~=1 ) then
		----没有组队
		--	x808065_Printf(sceneId , selfId, targetId ,"你需要和你的师父或者徒弟组队才能来参加师徒抽奖哦！ 记住，一定是师父做队长，徒弟做队员才行。而且队伍里不能有其他人哦！");
		--	return
		--
		--end
		--
		--local TeamSize = LuaFnGetTeamSize( sceneId, selfId );
		--local NearTeamSize = GetNearTeamCount( sceneId, selfId )
		--if( TeamSize ~= NearTeamSize) then
		----检查队员在不在附近
		--	x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，你有队友不在附近呢！");
		--	return
		--	
		--end
		--
		--if( TeamSize < 2 ) then
		--
		--	x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."作为队长，要和自己的徒弟组队才能一起来参加师徒抽奖呢！");
		--	return		
		--
		--end
    --
		----检查组队的师傅关系
		--local OkTeam = 1
		--local leaderID = GetTeamLeader( sceneId, selfId )
		--local otherPlayer
		--for i=0, NearTeamSize-1 do
		--	otherPlayer = GetNearTeamMember( sceneId, selfId, i )
		--	if leaderID ~= otherPlayer and LuaFnIsMaster(sceneId, otherPlayer, leaderID) ~= 1 then
		--		OkTeam = 0;
		--		break;
		--	end
		--end
		--if OkTeam == 0 then
		----组队关系不正确
		--	if(leaderID == selfId) then
		--	--我是队长
		--		
		--		local PrenticeNum = LuaFnGetmasterLevel( sceneId, selfId );
		--		if( PrenticeNum == 0) then
		--			--师德点
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，作为队长，首先得自己是师父才能一起来参加师徒抽奖呢！");
		--			return
		--		
		--		end
		--		x808065_Printf(sceneId , selfId, targetId , ""..GetName( sceneId, selfId ).."，作为队长，队伍里有人不是你的徒弟呢，你还是和你的徒弟一起来领取吧！");
		--		return
		--		
		--	else
		--	--我不是队长
		--		if(LuaFnHaveMaster( sceneId, selfId ) == 0) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId , ""..GetName( sceneId, selfId ).."，作为队员，首先得自己有师父才能一起来参加师徒抽奖呢！");
		--			return
		--		
		--		end
		--		x808065_Printf(sceneId , selfId, targetId , ""..GetName( sceneId, selfId ).."，作为队员，你所在队伍的队长不是所有队员的师父呢！要确保队长是所有队员的师父才行啊！");
		--		return
		--		
		--	end
		--end
		--
		----检查等级
		--OkTeam = 1;
		--leaderID = GetTeamLeader( sceneId, selfId );
		--otherPlayer = 0;
		--for i=0, NearTeamSize-1 do
		--	otherPlayer = GetNearTeamMember( sceneId, selfId, i );
		--	if( leaderID == otherPlayer ) then
		--	else
		--		if(GetLevel(sceneId, otherPlayer) < 30 or GetLevel(sceneId, otherPlayer) > 49 ) then
		--			OkTeam = 0;
		--			break;
		--		end
		--	end
		--end
		--if OkTeam == 0 then
		----有人等级不符合要求
		--	if(leaderID == selfId) then
		--	--队长
		--		x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，作为队长，参加师徒抽奖的条件是：你组队的徒弟的等级在#G30级到49级#W之间哦，你有一位徒弟已经不在这个等级范围内了呢！");
		--		return
		--		
		--	else
		--	
		--		if(GetLevel(sceneId, selfId) < 30 or GetLevel(sceneId, selfId) > 49) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，作为队员，参加师徒抽奖的条件是：你的等级在#G30级到49级#W之间哦，你已经不在这个等级范围内了呢！");
		--			return 
		--			
		--		else
		--	
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，作为队员，参加师徒抽奖的条件是：你师父组队的徒弟的等级都在#G30级到49级#W之间哦，你的一个队友已经不在这个等级范围内了呢！");
		--			return
		--			
		--		end
		--		
		--	end
		--end
		--
		----ok 给东西了
		--if(leaderID == selfId) then
		----队长
		--	
		--	local Num = LuaFnGetAvailableItemCount(sceneId, selfId, x808065_g_ItemId["choujiangshifu"]);
		--	if(Num > 0) then
		--	
		--		x808065_Printf( sceneId, selfId, targetId,  ""..GetName( sceneId, selfId ).."，作为队长，你们的的确确是江湖上最火的一股师徒新势力。可是你不久之前，已经在我这里参加过师徒抽奖了啦！你看，你身上还带着奖券呢！");
		--		
		--	else
		--		
		--		if( x808065_AddJiangjuan( sceneId, selfId, x808065_g_ItemId["choujiangshifu"]) == 1) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，作为队长，你已经成功地进行了抽奖，你的名字已经被列入抽奖名单。请耐心等待通知，具体活动内容请查阅天龙八部官方网站。");
		--			
		--		end
		--	
		--	end
		--	
		--else
		--
		--	local Num = LuaFnGetAvailableItemCount(sceneId, selfId, x808065_g_ItemId["choujiangtudi"]);
		--	if(Num > 0) then
		--	
		--		x808065_Printf( sceneId, selfId, targetId,  ""..GetName( sceneId, selfId ).."，作为队员，你们的的确确是江湖上最火的一股师徒新势力。可是你不久之前，已经在我这里参加过师徒抽奖了啦！");
		--		
		--	else
		--		
		--		if( x808065_AddJiangjuan( sceneId, selfId, x808065_g_ItemId["choujiangtudi"]) == 1) then
		--		
		--			x808065_Printf(sceneId , selfId, targetId ,""..GetName( sceneId, selfId ).."，作为队员，你已经成功地进行了抽奖，你的名字已经被列入抽奖名单。请耐心等待通知，具体活动内容请查阅天龙八部官方网站。");
		--			
		--		end
		--	
		--	end
		--
		--end
	
	elseif(NumText == x808065_g_Key["choujianghuodong"]) then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSCJ_20070919_001}");
			AddNumText( sceneId, x808065_g_ScriptId, "#{XSCJ_20070919_002}", 11, x808065_g_Key["choujiangshuoming1"] )
			AddNumText( sceneId, x808065_g_ScriptId, "#{XSCJ_20070919_004}", 11, x808065_g_Key["choujiangshuoming2"] )
			AddNumText( sceneId, x808065_g_ScriptId, "#{XSCJ_20070919_006}", 11, x808065_g_Key["choujiangshuoming3"] )	
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif(NumText == 333) then
		SetMissionData( sceneId, selfId, MD_SHITU_PRIZE_COUNT, 0)
		for i = 60,80 do
			EraseItem(sceneId, selfId,i)
		end
		x808065_MessageBox( sceneId, selfId, "重新开始领取名师奖励成功" )
	end
	
	x808065_OnEventRequest( sceneId, selfId, targetId )
	
end

--**********************************
--事件列表选中一项
--**********************************
function x808065_OnEventRequest( sceneId, selfId, targetId )

		local	key	= GetNumText()
		if(key == x808065_g_Key["choujiangshuoming1"]) then
		
			x808065_Printf(  sceneId, selfId, targetId, "#{XSCJ_20070919_003}" )
			
		elseif(key == x808065_g_Key["choujiangshuoming2"]) then
		
			x808065_Printf(  sceneId, selfId, targetId, "#{XSCJ_20070919_005}" )
			
		elseif(key == x808065_g_Key["choujiangshuoming3"]) then
		
			x808065_Printf(  sceneId, selfId, targetId, "#{XSCJ_20070919_007}" )
			
		end
end

function x808065_OnEnumerate( sceneId, selfId, targetId )

		--x808065_Printf(sceneId, selfId, targetId, GetDayTime());

    local isTime = x808065_CheckRightTime();
    local MyLevel = GetLevel( sceneId, selfId );
    if 1 == isTime then    	
    	
    	if( MyLevel <= 39) then
				AddNumText( sceneId, x808065_g_ScriptId, "新兵夺宝：个人抽奖", 6, x808065_g_Key["choujiang1"] )
			end
			if ( MyLevel <= 55) then
				AddNumText( sceneId, x808065_g_ScriptId, "新兵夺宝：超爽大礼包", 6, x808065_g_Key["choujiang2"] )
			end
			AddNumText( sceneId, x808065_g_ScriptId, "新兵夺宝：名师抽奖", 6, x808065_g_Key["choujiang3"] )
			AddNumText( sceneId, x808065_g_ScriptId, "抽奖说明", 11, x808065_g_Key["choujianghuodong"] )												
			--AddNumText(sceneId,x808065_g_ScriptId, "重新领名师抽奖",9,333)
    end

end

function x808065_SendMail( sceneId, selfId )
	--抽奖活动
	if(x808065_CheckRightTime() == 1) then
		LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{XSCJ_20070919_008}" )
		LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{XSCJ_20070919_007}" )
	end
end

--**********************************
--检测活动是否已结束
--**********************************
function x808065_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x808065_g_StartDayTime and curDayTime <= x808065_g_EndDayTime then
		return 1
	else
		return 0
	end

end

function x808065_CheckPacketSpace( sceneId, selfId, targetId, space )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < space then
	
		x808065_Printf(sceneId,selfId, targetId, ""..GetName( sceneId, selfId ).."，你的行囊已经满了呢。去清理一下行囊再来吧，我会在这里等你的！");
			
		return 0
		
	else
		return 1
	end

end

function x808065_PutIntoPack(sceneId, selfId, targetId, itemId, flag, num, isBind)
	
	if(x808065_CheckPacketSpace(sceneId, selfId, targetId, num) == 1) then
	--送东西
		for i=0,num-1 do
			local bagIndex = TryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE );
			if(isBind == 1) then
				LuaFnItemBind( sceneId, selfId, bagIndex);
			end
		end
		return 1;
	else
		return 0;
	end
	
end

--测试
function x808065_MessageBox( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x808065_Printf(  sceneId, selfId, targetId, str )
		BeginEvent( sceneId );
			AddText(sceneId, str);
		EndEvent( sceneId );
		DispatchEventList( sceneId, selfId, targetId )		
end

function x808065_AddJiangjuan(sceneId, selfId, itemId)
		BeginAddItem( sceneId )
		AddItem( sceneId, itemId, 1 )
		ret = EndAddItem( sceneId, selfId )
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId )
			--在抽奖日志中记录....
			--日志编号，玩家GUID，玩家名字，奖券物品ID
			local logstr = format("PL:%d,0x%X,%s,%d",
									 				PRIZE_LOG_XINSHOUSHITU,
									 				LuaFnGetGUID(sceneId,selfId),
									 				GetName(sceneId,selfId),
									 				itemId)
			LuaFnLogPrize(logstr)
			return 1;
		else
			return 0;
		end
end

--新师徒抽奖选项3
function x808065_ShiTuPrizeOption3(sceneId,selfId,targetId)
	--local sname = GetName( sceneId, selfId )
	--0.检查是否有师父身份
	--local	nMlevel	= LuaFnGetmasterLevel( sceneId, selfId )
	--if nMlevel < 1 or nMlevel > 4 then
	--	x808065_Printf( sceneId, selfId, targetId, sname.."，想要参加名师抽奖活动，首先要成为师父才行啊！")
	--	return
	--end
	--1.检查是否有徒弟
	--if LuaFnGetPrenticeCount( sceneId, selfId ) == 0 then
	--	x808065_Printf( sceneId, selfId, targetId, sname.."，想要参加名师抽奖活动，首先得要收了徒弟才行啊！而且徒弟要在你的教导下升到40级和50级时才行呢！")
	--	return 0
	--end
	--2.是否领奖次数已经达到十次了
	--必须在可执行邮件领取的时候判断
	--local ct = GetMissionData(sceneId, selfId, MD_SHITU_PRIZE_COUNT)
	--查询这个师父是不是有奖励邮件
	LuaFnAskNpcScriptMail(sceneId, selfId, MAIL_SHITUPRIZE)
end

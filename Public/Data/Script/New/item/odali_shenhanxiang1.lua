--苏州NPC
--每日赠点领取员
--一般
x002095_g_ScriptId = 002095


--**********************************
--事件交互入口
--**********************************
function x002095_OnDefaultEvent( sceneId, selfId,targetId )
      local 	nam	= LuaFnGetName( sceneId, selfId )
      local	lev	= GetLevel( sceneId, selfId )
	BeginEvent(sceneId)

		AddText(sceneId,"　　我是新手小保姆，你将来混得怎么样全看我的了。")
             --AddNumText( sceneId, x002095_g_ScriptId, "#gFF8C00领取七本150级心法",8,14 )
	if lev >= 120 then
	     --AddNumText( sceneId, x002095_g_ScriptId, "修复门派技能及150级心法",5,8888 )
	end	
             AddNumText( sceneId, x002095_g_ScriptId, "#Y无限领取元宝",1,501 )
             AddNumText( sceneId, x002095_g_ScriptId, "#Y无限领取金币",2,502 )
             AddNumText( sceneId, x002095_g_ScriptId, "#gFF7F00无限领取赠点",3,503 )
             AddNumText( sceneId, x002095_g_ScriptId, "#gFF8C00我要升149级",4,3333 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#gFF7F00全属性光环",5,100 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#b#cFF0000☆金榜题名☆",5,101 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#cFF0000领取师徒情深",5,102 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#b#cFF0000☆金榜题名☆",5,103 )
             --AddNumText( sceneId, x002095_g_scriptId, "#31#gffff00领取12个新技能#31", 6, 4242)
             AddNumText( sceneId, x002095_g_ScriptId, "我要转生",8,5555 )
              --AddNumText( sceneId, x002095_g_ScriptId, "#gFAFAD2负经验清零",6,11 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end


function x002095_OnEventRequest( sceneId, selfId, targetId, eventId )
local	key	= GetNumText()
         if key  == 501 then
        
                
              -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30160, 0)
              -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5929, 0)
               -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5985, 0) 
               --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30134, 0)
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30170, 0) 
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30180, 0) 
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30186, 0) 
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30005, 0)
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  8051, 0)
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  8052, 0)
                --BeginEvent(sceneId)
	        --AddText(sceneId,"领取光环成功,时间结束可以继续领取")
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
	local getYB=500000;
	   --ZengDian(sceneId,selfId,targetId,1,getYB)
	   YuanBao(sceneId,selfId,targetId,1,getYB)
	   x002095_Tips( sceneId, selfId, "恭喜你，成功领取 "..getYB.." 元宝。" )
	   x002095_CloseMe(sceneId, selfId)
                end
	 if key  == 502 then
   		AddMoney( sceneId, selfId, 5000000 )
		BeginEvent(sceneId)
		AddText(sceneId,"领取金币成功，您获得了500金币。谢谢你对天龙的支持。")
		EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
end
	if key == 503 then 
	local getZD=500000;
	   ZengDian(sceneId,selfId,targetId,1,getZD)
	   --YuanBao(sceneId,selfId,targetId,1,getYB)
	   x002095_Tips( sceneId, selfId, "恭喜你，成功领取 "..getZD.." 元宝。" )
	   x002095_CloseMe(sceneId, selfId)
	end
	 if key  == 6666 then
   ZengDian(sceneId,selfId,targetId,1,300000)

		BeginEvent(sceneId)
		AddText(sceneId,"领取赠点成功，您获得了30万的赠点。谢谢你对天龙的支持。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key  == 11 then
	x002095_Level12(sceneId, selfId, targetId)
end
if key == 18 then

                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，自身属性加强了。谢谢你对天龙的支持。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key  == 4242 then
			BeginAddItem(sceneId)
			AddItem( sceneId,30308044,1)
			AddItem( sceneId,30308042,1)
			AddItem( sceneId,30308033,1)
			AddItem( sceneId,30308032,1)
			AddItem( sceneId,30308031,1)
			AddItem( sceneId,30308030,1)
		        AddItem( sceneId,30308029,1)
		       AddItem( sceneId,30308028,1)
		       AddItem( sceneId,30308034,1)
                       AddItem( sceneId,30308060,1)
                       AddItem( sceneId,30308026,1)
                       AddItem( sceneId,30308027,1)
		       EndAddItem(sceneId,selfId)
		       AddItemListToHuman(sceneId,selfId)
		       BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:领取成功", 0)
end
if key == 3333 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4你确定是149了吗？" )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4是的，我要升级", 7, 4444 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 4444 then
		x002095_Shengji( sceneId, selfId, targetId )
end
if key == 5555 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4你确定要升级到149呢！" )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4是的，我要", 7, 5566 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 5566 then
		x002095_ZhuanSheng( sceneId, selfId, targetId )
end

if key == 12 then

BeginEvent(sceneId)
AddText( sceneId, "尊敬的玩家，请选择您要领取的宝宝。#G每人限领一只。BOSS为4000+资质的宠物" )
		AddNumText( sceneId, x002095_g_ScriptId, "领取BOSS宠-金刚95级携带",5,50 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取BOSS宠-冰魂95级携带",5,51 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取BOSS宠-小白95级携带",5,52 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取BOSS宠-蛤蟆95级携带",5,53 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取超级宠物-95级变异穷奇",5,54 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取宝宝-尖压野猪王",5,55 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取宝宝-变异龙龟",5,56 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取宝宝-无敌飞天猫",5,57 )
		AddNumText( sceneId, x002095_g_ScriptId, "领取宝宝-狂暴龙",5,58 )
EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key == 50 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9110, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取BOSS宠物。", 4 )
			str= "#Y你获得了#WBOSS宠物,#GBOSS宠物，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 51 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9120, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取BOSS宠物。", 4 )
			str= "#Y你获得了#WBOSS宠物,#GBOSS宠物，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 52 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9130, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取BOSS宠物。", 4 )
			str= "#Y你获得了#WBOSS宠物,#GBOSS宠物，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 53 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9100, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取BOSS宠物。", 4 )
			str= "#Y你获得了#WBOSS宠物,#GBOSS宠物，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 54 then
				local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 22068, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 #B"..nam.."#G成功领取超级宠物：95级变异穷奇。", 4 )
			str= "#Y你获得了#W超级宠物：95级变异穷奇。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 55 then
				local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
			
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 33810, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#G恭喜 "..nam.."成功领取会员专用宠。", 4 )
			str= "#Y你获得了#WG M专用宠物,#GG M宠物，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 56 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 3311, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功获得变异龙龟。", 4 )
			str= "#Y你获得了#W变异龙龟,#G变异龙龟，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 57 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 3832, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取无敌飞天猫。", 4 )
			str= "#Y你获得了#W无敌飞天,#G无敌飞天猫，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 58 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "您已经领取过该项奖励，不能再领了。#G会员宠物，可在江湖游医处回血。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 33829, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取狂暴龙。", 4 )
			str= "#Y你获得了#W狂暴龙,#G狂暴龙，可在江湖游医处回血。"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 13 then
		local CurTime = GetHourTime();
		local iTime = GetMissionData( sceneId, selfId, MF_LINGQUYUANBAOEXP );
		if iTime+1 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的会员，您1小时内只能领取一次经验。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
          for i = 0,300 do
          AddExp(sceneId,selfId,700000)
               end
			
			SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOEXP, CurTime);
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24恭喜玩家 "..nam.."成功领取200万经验奖励。", 4 )
			BeginEvent( sceneId )
				AddText( sceneId, "领取成功，您成功的领取了200万经验。祝您游戏愉快。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
	if key == 14 then
		local MemPai=GetMenPai(sceneId, selfId)
		if MemPai ~=9 then
			BeginEvent(sceneId)
				AddText(sceneId, "你已经加入门派了，还想做什么？")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
		BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，请选择您要领取心法的门派。#G注意，领取心法后，除第七本心法，心法等级全部调整为100级。并且洗掉您身上的所有属性点为0！买过属性点的，或者转过身的不要领取心法！#Y否则后果自负！" )
			AddNumText( sceneId, x002095_g_ScriptId, "星宿",3,20 )
			AddNumText( sceneId, x002095_g_ScriptId, "逍遥",3,21 )
			AddNumText( sceneId, x002095_g_ScriptId, "少林",3,22 )
			AddNumText( sceneId, x002095_g_ScriptId, "天山",3,23 )
			AddNumText( sceneId, x002095_g_ScriptId, "天龙",3,24 )
			AddNumText( sceneId, x002095_g_ScriptId, "峨眉",3,25 )
			AddNumText( sceneId, x002095_g_ScriptId, "武当",3,26 )
			AddNumText( sceneId, x002095_g_ScriptId, "明教",3,27 )
			AddNumText( sceneId, x002095_g_ScriptId, "丐帮",3,28 )
    			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		end
	end
	if key == 8888 then
		BeginEvent( sceneId )
			AddText( sceneId, "亲爱的玩家，由于合区造成的部分玩家门派技能及心法看不到的现象，特推出此修复功能，将修复各门派8本心法至150级，同时给大家引起的不便，我们深感抱歉！" )
			AddNumText( sceneId, x002095_g_ScriptId, "星宿",3,8820 )
			AddNumText( sceneId, x002095_g_ScriptId, "逍遥",3,8821 )
			AddNumText( sceneId, x002095_g_ScriptId, "少林",3,8822 )
			AddNumText( sceneId, x002095_g_ScriptId, "天山",3,8823 )
			AddNumText( sceneId, x002095_g_ScriptId, "天龙",3,8824 )
			AddNumText( sceneId, x002095_g_ScriptId, "峨眉",3,8825 )
			AddNumText( sceneId, x002095_g_ScriptId, "武当",3,8826 )
			AddNumText( sceneId, x002095_g_ScriptId, "明教",3,8827 )
			AddNumText( sceneId, x002095_g_ScriptId, "丐帮",3,8828 )
    			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 20 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,140)
		LuaFnSetXinFaLevel(sceneId,selfId,32,140)
		LuaFnSetXinFaLevel(sceneId,selfId,33,140)
		LuaFnSetXinFaLevel(sceneId,selfId,34,140)
		LuaFnSetXinFaLevel(sceneId,selfId,35,140)
		LuaFnSetXinFaLevel(sceneId,selfId,36,140)
		LuaFnSetXinFaLevel(sceneId,selfId,60,140)
		LuaFnSetXinFaLevel(sceneId,selfId,77,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G星宿派。", 4 )
		
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了星宿派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 21 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,140)
		LuaFnSetXinFaLevel(sceneId,selfId,50,140)
		LuaFnSetXinFaLevel(sceneId,selfId,51,140)
		LuaFnSetXinFaLevel(sceneId,selfId,52,140)
		LuaFnSetXinFaLevel(sceneId,selfId,53,140)
		LuaFnSetXinFaLevel(sceneId,selfId,54,140)
		LuaFnSetXinFaLevel(sceneId,selfId,63,140)
		LuaFnSetXinFaLevel(sceneId,selfId,80,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G逍遥派。", 4 )
		

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了逍遥派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 22 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,140)
		LuaFnSetXinFaLevel(sceneId,selfId,2,140)
		LuaFnSetXinFaLevel(sceneId,selfId,3,140)
		LuaFnSetXinFaLevel(sceneId,selfId,4,140)
		LuaFnSetXinFaLevel(sceneId,selfId,5,140)
		LuaFnSetXinFaLevel(sceneId,selfId,6,140)
		LuaFnSetXinFaLevel(sceneId,selfId,55,140)
		LuaFnSetXinFaLevel(sceneId,selfId,72,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G少林寺。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了少林派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 23 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,140)
		LuaFnSetXinFaLevel(sceneId,selfId,44,140)
		LuaFnSetXinFaLevel(sceneId,selfId,45,140)
		LuaFnSetXinFaLevel(sceneId,selfId,46,140)
		LuaFnSetXinFaLevel(sceneId,selfId,47,140)
		LuaFnSetXinFaLevel(sceneId,selfId,48,140)
		LuaFnSetXinFaLevel(sceneId,selfId,62,140)
		LuaFnSetXinFaLevel(sceneId,selfId,79,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G天山派。", 4 )
		
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了天山派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 24 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,140)
		LuaFnSetXinFaLevel(sceneId,selfId,38,140)
		LuaFnSetXinFaLevel(sceneId,selfId,39,140)
		LuaFnSetXinFaLevel(sceneId,selfId,40,140)
		LuaFnSetXinFaLevel(sceneId,selfId,41,140)
		LuaFnSetXinFaLevel(sceneId,selfId,42,140)
		LuaFnSetXinFaLevel(sceneId,selfId,61,140)
		LuaFnSetXinFaLevel(sceneId,selfId,78,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G天龙寺。", 4 )

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了天龙派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 25 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,140)
		LuaFnSetXinFaLevel(sceneId,selfId,26,140)
		LuaFnSetXinFaLevel(sceneId,selfId,27,140)
		LuaFnSetXinFaLevel(sceneId,selfId,28,140)
		LuaFnSetXinFaLevel(sceneId,selfId,29,140)
		LuaFnSetXinFaLevel(sceneId,selfId,30,140)
		LuaFnSetXinFaLevel(sceneId,selfId,59,140)
		LuaFnSetXinFaLevel(sceneId,selfId,76,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G峨眉派。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了峨眉派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 26 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,140)
		LuaFnSetXinFaLevel(sceneId,selfId,20,140)
		LuaFnSetXinFaLevel(sceneId,selfId,21,140)
		LuaFnSetXinFaLevel(sceneId,selfId,22,140)
		LuaFnSetXinFaLevel(sceneId,selfId,23,140)
		LuaFnSetXinFaLevel(sceneId,selfId,24,140)
		LuaFnSetXinFaLevel(sceneId,selfId,58,140)
		LuaFnSetXinFaLevel(sceneId,selfId,75,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G武当山。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了武当派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 27 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,140)
		LuaFnSetXinFaLevel(sceneId,selfId,8,140)
		LuaFnSetXinFaLevel(sceneId,selfId,9,140)
		LuaFnSetXinFaLevel(sceneId,selfId,10,140)
		LuaFnSetXinFaLevel(sceneId,selfId,11,140)
		LuaFnSetXinFaLevel(sceneId,selfId,12,140)
		LuaFnSetXinFaLevel(sceneId,selfId,56,140)
		LuaFnSetXinFaLevel(sceneId,selfId,73,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G明教。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了明教，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 28 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,140)
		LuaFnSetXinFaLevel(sceneId,selfId,14,140)
		LuaFnSetXinFaLevel(sceneId,selfId,15,140)
		LuaFnSetXinFaLevel(sceneId,selfId,16,140)
		LuaFnSetXinFaLevel(sceneId,selfId,17,140)
		LuaFnSetXinFaLevel(sceneId,selfId,18,140)
		LuaFnSetXinFaLevel(sceneId,selfId,57,140)
		LuaFnSetXinFaLevel(sceneId,selfId,74,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G丐帮。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了丐帮，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8820 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,140)
		LuaFnSetXinFaLevel(sceneId,selfId,32,140)
		LuaFnSetXinFaLevel(sceneId,selfId,33,140)
		LuaFnSetXinFaLevel(sceneId,selfId,34,140)
		LuaFnSetXinFaLevel(sceneId,selfId,35,140)
		LuaFnSetXinFaLevel(sceneId,selfId,36,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功修复了星宿技能及150级心法，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8821 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,140)
		LuaFnSetXinFaLevel(sceneId,selfId,50,140)
		LuaFnSetXinFaLevel(sceneId,selfId,51,140)
		LuaFnSetXinFaLevel(sceneId,selfId,52,140)
		LuaFnSetXinFaLevel(sceneId,selfId,53,140)
		LuaFnSetXinFaLevel(sceneId,selfId,54,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G逍遥派。", 4 )
		

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了逍遥派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8822 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,140)
		LuaFnSetXinFaLevel(sceneId,selfId,2,140)
		LuaFnSetXinFaLevel(sceneId,selfId,3,140)
		LuaFnSetXinFaLevel(sceneId,selfId,4,140)
		LuaFnSetXinFaLevel(sceneId,selfId,5,140)
		LuaFnSetXinFaLevel(sceneId,selfId,6,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G少林寺。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了少林派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8823 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,140)
		LuaFnSetXinFaLevel(sceneId,selfId,44,140)
		LuaFnSetXinFaLevel(sceneId,selfId,45,140)
		LuaFnSetXinFaLevel(sceneId,selfId,46,140)
		LuaFnSetXinFaLevel(sceneId,selfId,47,140)
		LuaFnSetXinFaLevel(sceneId,selfId,48,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G天山派。", 4 )
		
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了天山派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8824 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,140)
		LuaFnSetXinFaLevel(sceneId,selfId,38,140)
		LuaFnSetXinFaLevel(sceneId,selfId,39,140)
		LuaFnSetXinFaLevel(sceneId,selfId,40,140)
		LuaFnSetXinFaLevel(sceneId,selfId,41,140)
		LuaFnSetXinFaLevel(sceneId,selfId,42,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G天龙寺。", 4 )

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了天龙派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8825 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,140)
		LuaFnSetXinFaLevel(sceneId,selfId,26,140)
		LuaFnSetXinFaLevel(sceneId,selfId,27,140)
		LuaFnSetXinFaLevel(sceneId,selfId,28,140)
		LuaFnSetXinFaLevel(sceneId,selfId,29,140)
		LuaFnSetXinFaLevel(sceneId,selfId,30,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G峨眉派。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了峨眉派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8826 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,140)
		LuaFnSetXinFaLevel(sceneId,selfId,20,140)
		LuaFnSetXinFaLevel(sceneId,selfId,21,140)
		LuaFnSetXinFaLevel(sceneId,selfId,22,140)
		LuaFnSetXinFaLevel(sceneId,selfId,23,140)
		LuaFnSetXinFaLevel(sceneId,selfId,24,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G武当山。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了武当派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8827 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,140)
		LuaFnSetXinFaLevel(sceneId,selfId,8,140)
		LuaFnSetXinFaLevel(sceneId,selfId,9,140)
		LuaFnSetXinFaLevel(sceneId,selfId,10,140)
		LuaFnSetXinFaLevel(sceneId,selfId,11,140)
		LuaFnSetXinFaLevel(sceneId,selfId,12,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G明教。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了明教，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8828 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "尊敬的玩家，您今天领取过心法了，一天只能领取一次。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,140)
		LuaFnSetXinFaLevel(sceneId,selfId,14,140)
		LuaFnSetXinFaLevel(sceneId,selfId,15,140)
		LuaFnSetXinFaLevel(sceneId,selfId,16,140)
		LuaFnSetXinFaLevel(sceneId,selfId,17,140)
		LuaFnSetXinFaLevel(sceneId,selfId,18,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B恭喜玩家 #Y"..nam.." #B成功领取八本150级心法并加入了#G丐帮。", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了丐帮，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if key == 15 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "的弟子" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "VIP会员" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了会员称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 16 then
		TryRecieveItem( sceneId, selfId, 30900016, 1 )
		Msg2Player( sceneId, selfId, "你获得了500赠点和一个高级宝石合成符。", MSG2PLAYER_PARA )
	end

      if key == 181 then

         local  nam= LuaFnGetName( sceneId, selfId )

            local lastDayTime1 = GetMissionData( sceneId, selfId, MF_LINGQUYUANBAOMP2)
	   
            local CurDayTime1 = GetDayTime()

	           if CurDayTime1 > lastDayTime1 then

                  BeginEvent(sceneId)
		   
                             --for i = 0,30 do 

                                    -- TryRecieveItem( sceneId, selfId, 30505107, 1 )

                                 --  end
                         TryRecieveItem( sceneId, selfId, 10113054, 1 )
			TryRecieveItem( sceneId, selfId, 10113054, 1 )
			TryRecieveItem( sceneId, selfId, 10113054, 1 )
                SetMissionData( sceneId, selfId, MF_LINGQUYUANBAOMP2, CurDayTime1 )

                 str = "#cffffcc恭喜VIP会员<#c00ff00"..nam.."#cffffcc>领取天关入口通行证"

                   BroadMsgByChatPipe(sceneId, selfId, str, 4)

		   AddText(sceneId,"恭喜你领取入口通行证2个。请明天再来领取")

		  EndEvent(sceneId)

		  DispatchEventList(sceneId,selfId,targetId)
                
                                else

		BeginEvent(sceneId)
			AddText(sceneId," 不好意思，你今天已经领取过工资了,请明天再来");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	
	    end
	if key  == 19 then
           TryRecieveItem( sceneId, selfId, 10113054, 1 ) 
                BeginEvent(sceneId)
                            
		  AddText(sceneId,"天关物品领取成功");
		  EndEvent(sceneId)
		  DispatchEventList(sceneId,selfId,targetId)
                  end
	

          end
    
end

--**********************************
--转换经验
--**********************************
function x002095_Level12 (sceneId, selfId, targetId)
	if GetExp(sceneId,selfId) < 0  then
		BeginEvent( sceneId )
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
						LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			AddText(sceneId,"继续点我吧，点10次应该就解决升级问题！！！...")
		EndEvent( sceneId )
	else

		BeginEvent( sceneId )
			AddText(sceneId,"失败,只有打怪获得不了经验的玩家才能使用此功能!!...")
		EndEvent( sceneId )

	end


	DispatchEventList( sceneId, selfId, targetId )

end

function x002095_ZhuanSheng( sceneId, selfId, targetId )
	local zhuanshengTimes = GetMissionData(sceneId, selfId, MD_ZHUANSHENG)
	local ZS = zhuanshengTimes+1
	if zhuanshengTimes > 30 then
		x002095_NotifyTip( sceneId, selfId, "服务器转生次数限制 30 次。" )
		x002095_MsgBox( sceneId, selfId, targetId, "服务器转生次数限制 30 次。" )
		return
	end
	local mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 149 then
		BeginEvent( sceneId )
		AddText( sceneId, "等级不足 #G149 #W级，请 #G149 #W级后再来找我。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end

        SetLevel( sceneId, selfId, 35)
	     --YuanBao(sceneId,selfId,targetId,1,10000)
	      --ZengDian(sceneId,selfId,targetId,1,100000)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 150, 0)
	SetMissionData(sceneId, selfId, MD_ZHUANSHENG, zhuanshengTimes+1 )

	BeginEvent(sceneId)
		AddText(sceneId,"恭喜你，转生成功!!!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
		AddText( sceneId, "#W你目前等级为 #G35 #W级，服务器设置有限转生，请达到 #G149 #W级后再来找我进行转生操作。转生保留属性点，#gff00f0转生后千万不要又能使用洗髓丹，否则后果自负！" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gFFFF00恭喜玩家 ["..nam.."] 历经万难终于完成了第 ["..ZS.."] 次转生。", 4 )
end

function x002095_Shengji (sceneId, selfId, targetId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "等级不足#G149#W级，请#G149#W级后再来找我。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end
	SetLevel( sceneId, selfId, 149)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 147, 0)
	BeginEvent(sceneId)
		AddText(sceneId,"恭喜你，升级成功!!!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
		AddText( sceneId, "恭喜你升级到149级,请带上顶级装备在转生哦！" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gFFFF00恭喜玩家"..nam.."成功升级到150级", 4 )
end


--**********************************
-- 对话窗口信息提示
--**********************************
function x002095_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--消息提示
--**********************************
function x002095_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x002095_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end







--大理NPC
--等级领奖
--普通

--**********************************
--事件交互入口
--**********************************
function x000165_OnDefaultEvent( sceneId, selfId,targetId )
	local temp = random(10)
	local msgStr = format( "#Y我这里可以领取等级奖励！当你达到以下等级！奖品可是很丰厚噢！加油吧！领取149级奖励时身上不能超过10W")
	BeginEvent(sceneId)
		AddText(sceneId,msgStr)
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取30级元宝奖励", 5, 100 )
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取40级元宝奖励", 5, 200 )
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取50级元宝奖励", 5, 300 )
		--AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取60级元宝奖励", 5, 400 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取70级元宝奖励", 5, 500 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取80级元宝奖励", 5, 600 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取90级元宝奖励", 5, 700 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取100级元宝奖励", 5, 800 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取130级元宝奖励", 5, 900 )
		AddNumText( sceneId, x000160_g_ScriptId, "#gFF3E96领取149级元宝奖励", 5, 1000 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x000165_OnEventRequest( sceneId, selfId, targetId, eventId)
		if GetNumText() == 100 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<30 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到30级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL30 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,5000)
--			AddMoney( sceneId, selfId, 100000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL30, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取30级奖励：#G10金#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
		elseif GetNumText() == 200 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<40 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到40级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL40 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
				YuanBao(sceneId,selfId,targetId,1,5000)
--   			AddMoney( sceneId, selfId, 300000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL40, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取40级奖励：#G30金#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
		elseif GetNumText() == 300 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<50 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到50级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL50 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,500)
   			--AddMoney( sceneId, selfId, 300000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL50, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取50级奖励：#G500元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 400 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<60 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到60级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL60 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,1000)
   			AddMoney( sceneId, selfId, 500000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL60, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取60级奖励：#G1000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 500 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<70 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到70级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL70 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,1000)
   			--AddMoney( sceneId, selfId, 1000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL70, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取70级奖励：#G1000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 600 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<80 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到80级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL80 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,2000)
   			--AddMoney( sceneId, selfId, 5000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL80, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取80级奖励：#G2000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 700 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<90 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到90级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL90 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,5000)
   			--AddMoney( sceneId, selfId, 1000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL90, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取90级奖励：#G5000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 800 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<100 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到100级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL100 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,8000)
   			--AddMoney( sceneId, selfId, 2000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL100, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取100级奖励：#G8000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 900 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<130 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到130级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL120 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,12000)
   			--AddMoney( sceneId, selfId, 10000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL120, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取130级奖励：#G12000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
			elseif GetNumText() == 1000 then
		local	lev	= GetLevel( sceneId, selfId )
		if lev<149 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您的等级不够，请修炼到149级再来找我吧。" )
			return
		end
		local index =	GetMissionData( sceneId, selfId, DANJIAN_JL149 )
		if index == 1 then
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  您已经领取过该奖励。" )
			return
		else
			YuanBao(sceneId,selfId,targetId,1,500000)
   			--AddMoney( sceneId, selfId, 30000000 )
			SetMissionData( sceneId, selfId, DANJIAN_JL149, 1 )
			x000165_NotifyFailBox( sceneId, selfId, targetId, "  恭喜您，成功领取149级奖励：#G500000元宝#W。请再接再厉噢，后面的奖励更丰富呢。" )
		end
	end
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x000165_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x000165_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
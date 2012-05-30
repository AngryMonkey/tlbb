--洛阳NPC
--乔复盛
--普通
x000109_g_scriptId=000109

--**********************************
--事件交互入口
--**********************************
function x000109_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想不想自己开店做老板？我可以教给你哦。")
		AddNumText(sceneId,x000109_g_scriptId,"查看所有商店",6,2)
		if IsShutout( sceneId, selfId, ONOFF_T_PSHOP ) == 0 then
			AddNumText(sceneId,x000109_g_scriptId,"建立自己的商店",6,0)
		else
			AddNumText(sceneId,x000109_g_scriptId,"注销我的店铺",6,7)
		end
		AddNumText(sceneId,x000109_g_scriptId,"管理自己的商店",6,1)
		AddNumText(sceneId,x000109_g_scriptId,"查看正准备盘出的店",6,3)
		AddNumText(sceneId,x000109_g_scriptId,"玩家商店介绍",11,6)
		AddNumText(sceneId,x000109_g_scriptId,"关于收购材料",11,10)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************

--事件列表选中一项

--**********************************

function x000109_OnEventRequest( sceneId, selfId, targetId, eventId )

--0.建立自己的商店->显示建店条款->由客户端请求建店
		if	GetNumText()==0	then

			BeginEvent(sceneId)

				AddText(sceneId,"#{PS_OPEN_SHOP_NOTICE}")

			EndEvent(sceneId)

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x000109_g_scriptId,0,1)


		--1.管理自己店铺
		elseif	GetNumText()==1	then

			--1.0通过店铺名来判定是否此店已经打开
			strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1没店铺直接发错误提示
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)

					strText = "对不起，你好象并没有店铺。"

					AddText(sceneId,strText);

				EndEvent(sceneId)

				DispatchMissionTips(sceneId,selfId)

			--1.2有店铺根据不同情况不同处理
			else
				--1.2.1有两个店铺，等待进一步选择
				if((strShop0Name ~= "") and (strShop1Name ~= "")) then
						BeginEvent(sceneId)

							AddText(sceneId,"哦哦，原来是掌柜的到了，请问您要去哪间店看看？")

							if GetPlayerShopFrezeType(sceneId, selfId, 0) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCC店铺1  "..strShop0Name,-1,4)
							else
								AddNumText(sceneId,x000109_g_scriptId,"店铺1  "..strShop0Name,-1,4)
							end
							if GetPlayerShopFrezeType(sceneId, selfId, 1) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCC店铺2  "..strShop1Name,-1,5)
							else
								AddNumText(sceneId,x000109_g_scriptId,"店铺2  "..strShop1Name,-1,5)
							end

						EndEvent(sceneId)
						DispatchEventList(sceneId,selfId,targetId)

				--1.2.2只有一个直接打开这个
				elseif(strShop0Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

				--1.2.3只有一个直接打开这个
				elseif(strShop1Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
				end

			end

		--2.察看所有商店的列表

		elseif	GetNumText()==2	then

			DispatchPlayerShopList( sceneId, selfId, targetId )

		--3.察看所有盘出商店的列表
		elseif	GetNumText()==3	then

			DispatchPlayerShopSaleOutList( sceneId, selfId, targetId )

		--4.察看自己身上的指定商店
		elseif	GetNumText()==4	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

		--5.察看自己身上的指定商店
		elseif	GetNumText()==5	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
		
		--6.玩家商店介绍
		elseif	GetNumText()==6	then

			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_048}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		--7.再次确认是否删店
		elseif	GetNumText()==7	then
	
			--1.0通过店铺名来判定是否此店已经打开
			local strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			local strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1没店铺直接发错误提示
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)
					strText = "您至少需要拥有一家店铺。"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"#{UnregisterShopHelp}")
					AddNumText(sceneId,x000109_g_scriptId,"确定",6,8)
					AddNumText(sceneId,x000109_g_scriptId,"离开",6,9)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end

		--7.删!
		elseif	GetNumText()==8	then
			local canErase = CanErasePlayerShop(sceneId, selfId)
			if(canErase == 1) then
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				ErasePlayerShop(sceneId,selfId)
				local msg = format("恭喜您注销成功，店铺中的本金已经返回给您，请注意查收。");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				msg = format("您已成功注销个人商店");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 19810222)
			elseif canErase == -1 then
				local msg = format("您的商店已被冻结。");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			else
				local msg = format("您的店内还有出售资讯或收购资讯正在发布，请清空后再来。");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			end
		elseif	GetNumText()==9	then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		elseif	GetNumText()==10	then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_101}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end



--**********************************

--继续

--**********************************

function x000109_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	ApplyPlayerShop( sceneId, selfId, targetId )

end

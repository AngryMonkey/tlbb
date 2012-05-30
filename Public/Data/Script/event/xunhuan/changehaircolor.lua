--调整发色
--脚本号
x801011_g_ScriptId = 801011

--调整发色UI 22

--**********************************
--列举事件
--**********************************
function x801011_OnEnumerate( sceneId, selfId, targetId )
	-- 调试信息
	--BeginEvent(sceneId)
	--	AddText(sceneId, "进入调整发色脚本");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	

	-- 为什么要 NPC 名字？
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 22)
	return

end


--**********************************
--调整发色
--**********************************
function x801011_FinishAdjust( sceneId, selfId, ColorValue)
	-- 染发剂
	item = {20307001, 20307002} -- zchw

	-- 检查可用道具
	itemCount = LuaFnGetAvailableItemCount ( sceneId, selfId, item[1] ); -- zchw
	itemCount2 = LuaFnGetAvailableItemCount ( sceneId, selfId, item[2] ); 
	if (itemCount < 1) and (itemCount2 < 1) then
		BeginEvent(sceneId)
			AddText(sceneId,"没有足够的染发剂。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查金钱
	local money = GetMoney(sceneId, selfId);
	local moneyJZ = GetMoneyJZ(sceneId, selfId);
	
	if (money + moneyJZ) >= 50000 then
		-- 扣除交子和金钱	
		local costMoneyJZ, costMoney = LuaFnCostMoneyWithPriority (sceneId, selfId, 50000)
		
		-- 如果入口参数错误
		if costMoneyJZ == -1 then
			return
		end
		
		-- 交子和金钱数目足额扣除
		if (costMoneyJZ + costMoney == 50000) then		
			-- 消耗物品
			if (itemCount2 >= 1) then
				ret = DelItem( sceneId, selfId, item[2], 1 ); -- zchw 优先删除绑定的染发剂
			else
				ret = DelItem( sceneId, selfId, item[1], 1 );
			end

			-- 设置新发色
			SetHumanHairColor( sceneId, selfId, ColorValue )
			BeginEvent(sceneId)
				AddText(sceneId,"染发成功。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			-- 发送广播
			local message;	
			local randMessage = random(3);	
			if randMessage == 1 then		
	   		message = format("#W#{_INFOUSR%s}#{FaSe_00}", LuaFnGetName(sceneId, selfId));
			elseif randMessage == 2 then
				message = format("#{FaSe_01}#W#{_INFOUSR%s}#{FaSe_02}", LuaFnGetName(sceneId, selfId));
			else
				message = format("#{FaSe_03}#W#{_INFOUSR%s}#{FaSe_04}", LuaFnGetName(sceneId, selfId));
			end
	
			BroadMsgByChatPipe(sceneId, selfId, message, 4);

		-- 交子和金钱的数目不足 50000
		else
			BeginEvent(sceneId)
				AddText(sceneId,"金钱不足。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)			
			return		
		end
	-- 钱数不够，直接返回
	else
		BeginEvent(sceneId)
			AddText(sceneId,"您身上携带的金钱不足。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)			
		return	
	end
	
end

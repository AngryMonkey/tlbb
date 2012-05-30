--[ 创建人 QUFEI 2007-12-15 16:40 UPDATE BugID 26242 ]
--调整头像
--脚本号
x805030_g_ScriptId = 805030

--调整头像UI 112730

--**********************************
--列举事件
--**********************************
function x805030_OnEnumerate( sceneId, selfId, targetId )
	-- 调试信息
	--BeginEvent(sceneId)
	--	AddText(sceneId, "进入调整头像脚本");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- 为什么要 NPC 名字？
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 112730)
	return
end

--**********************************
--调整头像
--**********************************
function x805030_FinishAdjust( sceneId, selfId, styleId )
	
	-- 头像未选中或选中无效
	if styleId <= 0 then														
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_004}" )
		return		
	end
	
	-- 得到调整头像所需物品的id及其数量
	local ItemId, ItemCount = GetChangeHeadInfo(styleId)
		
	-- 返回值非法
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	--消耗物品是否够用或锁定
	if ItemCount > nItemNum then
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_005}" )
		return
	end

	-- 物品检测通过，再检查玩家金钱
	local moneyJZ = GetMoneyJZ (sceneId, selfId);
	local money = GetMoney (sceneId, selfId);
	
	-- 物品和金钱检测都通过
	if (moneyJZ + money >= 50000)	then
		-- 设置玩家新头像（会在这个过程中消耗物品和金钱）
		local ret = ChangePlayerHeadImage( sceneId, selfId, styleId )	
		if ret == 0  then																--成功
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_010}" )		
					
		-- 以下为操作失败时的部分错误信息
		elseif ret == 1 then														--所选的头像与玩家当前的头像一致
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_009}" )				
			return
		elseif ret == 3 then														--没有需要消耗的物品或该物品被锁定
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_005}" )				
			return
		else
			return
		end
	
	-- 金钱不足	
	else
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_006}" )						
		return
	end
	
	-- 发布公告
	local message;
	if random(2) == 1 then
		message = format("#W#{_INFOUSR%s}#{INTERHEAD_XML_007}", LuaFnGetName(sceneId, selfId));
	else
		message = format("#W#{INTERHEAD_XML_011}#{_INFOUSR%s}#{INTERHEAD_XML_012}", LuaFnGetName(sceneId, selfId));
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
	-- 记录成功修改头像的玩家日志
	AuditChangeHead( sceneId, selfId, styleId )
		
end

--**********************************
-- 屏幕上的醒目提示
--**********************************
function x805030_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

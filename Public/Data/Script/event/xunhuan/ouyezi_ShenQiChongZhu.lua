--创建人[ QUFEI 2007-09-27 13:10 UPDATE BugID 25452 ]
--神器重铸和修理事件脚本

--脚本号
x500504_g_ScriptId	= 500504

--目标npc
x500504_g_Name			= "欧冶子"

--控制脚本
x500504_g_ControlScript		= 001066

--任务号
x500504_g_MissionId			= 420

--所拥有的事件ID列表
x500504_g_EventList	= {}

x500504_g_ChongXinYeLianInfo			= "重新冶炼神器"

x500504_g_Impact_ShenQi = 47						-- 重新冶炼神器成功时的特效ID

x500504_g_ItemBonus={{id=30505700,num=1,sqlvl=42},{id=30505701,num=1,sqlvl=52},{id=30505702,num=1,sqlvl=62},{id=30505703,num=1,sqlvl=72},{id=30505704,num=1,sqlvl=82},{id=30505705,num=1,sqlvl=92}}   -- 残缺的神节
x500504_g_Item_ShenQi={{id01=10300000, id02=10300001, id03=10300002, id04=10300003, id05=10300004, id06=10300005}, 
											 {id01=10302000, id02=10302001, id03=10302002, id04=10302003, id05=10302004, id06=10302005},
											 {id01=10304000, id02=10304001, id03=10304002, id04=10304003, id05=10304004, id06=10304005},
											 {id01=10305000, id02=10305001, id03=10305002, id04=10305003, id05=10305004, id06=10305005}}																			 	 -- 神器

--**********************************
--入口函数
--**********************************
--点击后执行此脚本
function x500504_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500504_g_Name then
		x500504_NotifyTip( sceneId, selfId, "重铸神器失败" )			
		MissionLog(sceneId, "[ShenBing]error: x500504_OnDefaultEvent..LuaFnGetName="..LuaFnGetName( sceneId, targetId ))
		return 0
	end

	local	key	= GetNumText()

	if key == 116 then
		
		BeginEvent(sceneId)
		
		AddText(sceneId,"#{CXYL_20071011}")				
		-- modify by zchw
		-- AddNumText( sceneId, x500504_g_ScriptId, "#{INTERFACE_XML_1004}", 6, 135 )	
		AddNumText( sceneId, x500504_g_ScriptId, "#{INTERFACE_XML_1001}", 6, 136 )	
		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif key == 135 then
		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 101526358 )
		
	elseif key == 136 then
		
		--发送任务需求的信息		
		BeginEvent(sceneId)
			AddText(sceneId, x500504_g_ChongXinYeLianInfo)
			AddText(sceneId, "#{XYSB_20070928_005}")
		EndEvent( )
		bDone = 2
		DispatchMissionDemandInfo(sceneId, selfId, targetId, x500504_g_ScriptId, x500504_g_MissionId, bDone)
				
	end

end

--**********************************
--列举事件
--**********************************
function x500504_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500504_g_Name then
		return 0
	end

	AddNumText( sceneId, x500504_g_ScriptId, x500504_g_ChongXinYeLianInfo, 6, 116 )	
	-- add by zchw
	AddNumText( sceneId, x500504_g_ScriptId, "#{INTERFACE_XML_1004}", 6, 135 )

end

--**********************************
--醒目提示
--**********************************
function x500504_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
-- 重新冶炼神器
--**********************************
function x500504_ChongXinYeLian( sceneId, selfId, targetId, ItemID, bagpos )	

	--判断该npc是否是对应任务的npc
	-- PrintStr(LuaFnGetName( sceneId, targetId ))
	if LuaFnGetName( sceneId, targetId ) ~= x500504_g_Name then
		x500504_NotifyTip( sceneId, selfId, "重新冶炼神器失败" )					
		MissionLog(sceneId, "[ShenBing]error: x500504_ChongXinYeLian..LuaFnGetName="..LuaFnGetName( sceneId, targetId ))
		return 0
	end

	-- PrintStr("ItemID ="..ItemID)	
	-- PrintStr("bagpos ="..bagpos)	
  if ItemID == x500504_g_Item_ShenQi[1].id06 or ItemID == x500504_g_Item_ShenQi[2].id06
		or ItemID == x500504_g_Item_ShenQi[3].id06 or ItemID == x500504_g_Item_ShenQi[4].id06 then

		x500504_NotifyTip( sceneId, selfId, "#{XYSB_20070928_004}" )			
		return 0
	
	else	
		
		local ItemBonusID = 0
		if ItemID == x500504_g_Item_ShenQi[1].id01 or ItemID == x500504_g_Item_ShenQi[2].id01
				or ItemID == x500504_g_Item_ShenQi[3].id01 or ItemID == x500504_g_Item_ShenQi[4].id01 then
				ItemBonusID = x500504_g_ItemBonus[2].id
		elseif ItemID == x500504_g_Item_ShenQi[1].id02 or ItemID == x500504_g_Item_ShenQi[2].id02
				or ItemID == x500504_g_Item_ShenQi[3].id02 or ItemID == x500504_g_Item_ShenQi[4].id02 then
				ItemBonusID = x500504_g_ItemBonus[3].id
		elseif ItemID == x500504_g_Item_ShenQi[1].id03 or ItemID == x500504_g_Item_ShenQi[2].id03
				or ItemID == x500504_g_Item_ShenQi[3].id03 or ItemID == x500504_g_Item_ShenQi[4].id03 then
				ItemBonusID = x500504_g_ItemBonus[4].id
		elseif ItemID == x500504_g_Item_ShenQi[1].id04 or ItemID == x500504_g_Item_ShenQi[2].id04
				or ItemID == x500504_g_Item_ShenQi[3].id04 or ItemID == x500504_g_Item_ShenQi[4].id04 then
				ItemBonusID = x500504_g_ItemBonus[5].id
		elseif ItemID == x500504_g_Item_ShenQi[1].id05 or ItemID == x500504_g_Item_ShenQi[2].id05
				or ItemID == x500504_g_Item_ShenQi[3].id05 or ItemID == x500504_g_Item_ShenQi[4].id05 then
				ItemBonusID = x500504_g_ItemBonus[6].id
		end
		
		BeginAddItem( sceneId )
		AddItem( sceneId, ItemBonusID, 1 )
		ret = EndAddItem( sceneId, selfId )
			
		if ret > 0 then								
			TryRecieveItem( sceneId, selfId, ItemBonusID, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
			
			local strMsg = "你获得了".."#{_ITEM"..(ItemBonusID).."}" -- 残缺的神节			
			x500504_NotifyTip( sceneId, selfId, strMsg)
		
			local LogInfo	= format( "[ShenBing]Succeed: x500504_ChongXinYeLian( sceneId=%d, GUID=%0X ), ItemBonusID=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemBonusID )	
			MissionLog(sceneId, LogInfo)	
		
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x500504_g_Impact_ShenQi, 0 )
		
			local EraseRet = EraseItem( sceneId, selfId, bagpos )							
			if EraseRet < 0 then      --如果删除失败,将不会产生任何效果
			  local strMsg = "删除武器失败"
				x500504_NotifyTip( sceneId, selfId, strMsg)
				return 0
			end			
			
			return 1
		end
		
		MissionLog(sceneId, "[ShenBing]error: x500504_ChongXinYeLian..ret="..ret)
		return 0
	end

end

-- 武器提交事件
function x500504_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )

	--PrintStr("OnMissionCheck...")
	-- print(sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex)
	local LogInfo	= format( "[ShenBing]: x500504_OnMissionCheck( sceneId=%d, GUID=%0X ), index1=%d, index2=%d, index3=%d, petindex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														index1,
														index2,
														index3,
														petindex)	
	MissionLog(sceneId, LogInfo)
		
	--***********************************************************
	-- zchw 重铸的时候，只有神器是必须的，所以只需要对index1做检查
	if index1 >= 100 then
		x500504_NotifyTip( sceneId, selfId, "#{XYSB_20070928_006}" )			-- “请放入一把神器”		
		return 0;
	end	
	--***********************************************************
	
	-- 重新冶炼神器提交界面						
	--判断该npc是否是对应的npc
	if LuaFnGetName( sceneId, npcid ) ~= x500504_g_Name then
		x500504_NotifyTip( sceneId, selfId, "重新冶炼神器失败" )							
		MissionLog(sceneId, "[ShenBing]error: x500504_OnMissionCheck..LuaFnGetName="..LuaFnGetName( sceneId, npcid ))
		return 0
	end
	
	local index = 0
	local ItemLevel = 0	
	local ItemID = 0	
	
	-- 褚少微，2008.5.30。102级神器不能够重铸了。醒目提示。
	ItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, index1)
	-- PrintStr(ItemID)
	if ItemID == 10300100 or ItemID == 10300101 or ItemID == 10300102 
		 or ItemID == 10301100 or ItemID == 10301101 or ItemID == 10301102 
		 or ItemID == 10301200 or ItemID == 10301201 or ItemID == 10301202 
		 or ItemID == 10302100 or ItemID == 10302101 or ItemID == 10302102
		 or ItemID == 10303100 or ItemID == 10303101 or ItemID == 10303102 
		 or ItemID == 10303200 or ItemID == 10303201 or ItemID == 10303202
		 or ItemID == 10304100 or ItemID == 10304101 or ItemID == 10304102 
		 or ItemID == 10305100 or ItemID == 10305101 or ItemID == 10305102
		 or ItemID == 10305200 or ItemID == 10305201 or ItemID == 10305202
		then
		
		x500504_NotifyTip( sceneId, selfId, "102级神器不能重铸" )
		return 0
	end

		
	for i=1, 3 do
		if i == 1 then
			index = index1
		elseif i == 2 then
			index = index2
		elseif i == 3 then
			index = index3
		else
			index = index1
		end
		
		if index < 100 then				
			ItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, index)
			-- PrintStr("ItemID ="..ItemID)
			
			local LogInfo	= format( "[ShenBing]: x500504_OnMissionCheck( sceneId=%d, GUID=%0X ), ItemID=%d, IsLock=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemID,
														LuaFnIsItemAvailable( sceneId, selfId, index ) )	
			MissionLog(sceneId, LogInfo)	
			
			if LuaFnIsItemAvailable( sceneId, selfId, index ) == 0 then
					x500504_NotifyTip( sceneId, selfId, "#{XYSB_20070928_019}" )								
					return 0
			end
			
			-- 检测提交的是不是神器
									
			if (ItemID >= x500504_g_Item_ShenQi[1].id01 and ItemID <= x500504_g_Item_ShenQi[1].id06)
				 or (ItemID >= x500504_g_Item_ShenQi[2].id01 and ItemID <= x500504_g_Item_ShenQi[2].id06)
				 or (ItemID >= x500504_g_Item_ShenQi[3].id01 and ItemID <= x500504_g_Item_ShenQi[3].id06)
				 or (ItemID >= x500504_g_Item_ShenQi[4].id01 and ItemID <= x500504_g_Item_ShenQi[4].id06) then
									
					local yelianres = x500504_ChongXinYeLian( sceneId, selfId, npcid, ItemID, index )
					
					if yelianres == 0 then							
						MissionLog(sceneId, "[ShenBing]error: x500504_OnMissionCheck..index..yelianres="..yelianres)
						return 0
					end
					
					return 1			
			end				
			
		end
	end
				
	x500504_NotifyTip( sceneId, selfId, "#{XYSB_20070928_006}" )			-- “请放入一把神器”		
	return 0	
			
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x500504_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s物品在'EquipBase.txt'没有找到!!", itemName)		
	end
	return itemId, itemName, itemDesc
end	

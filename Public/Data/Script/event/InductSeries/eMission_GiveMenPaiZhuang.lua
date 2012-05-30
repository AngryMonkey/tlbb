--创建人[ QUFEI 2008-04-30 10:27 UPDATE BugID 34171 ]
--解决流失率引导任务事件脚本
--兑换门派套装

--脚本号
x500617_g_ScriptId = 500617

--所拥有的事件ID列表
x500617_g_eventList={}

x500617_g_EquipList={
-- 20级别的
{ n = 2500, num = 1, id = {{10514001, 10515001},
												   {10520011, 10521011},
												   {10510021, 10511021},
												   {10513031, 10514031},
												   {10520041, 10521041},
												   {10510051, 10511051},
												   {10510081, 10512081},
												   {10513061, 10514061},
												   {10520071, 10521071}} },

-- 30级别的
{ n = 2600, num = 1, id = {{10520002, 10521002, 10522002},
												   {10510012, 10511012, 10512012},
												   {10501002, 10514022, 10515022},
												   {10520032, 10521032, 10522032},
												   {10510042, 10511042, 10512042},
												   {10503012, 10514052, 10515052},
												   {10513082, 10514082, 10515082},
												   {10520062, 10521062, 10522062},
												   {10510072, 10511072, 10512072}} },

-- 40级别的
{ n = 2700, num = 1, id = {{10514003, 10522003},
												   {10520013, 10523013},
												   {10512023, 10522023},
												   {10514033, 10522033},
												   {10520043, 10523043},
												   {10512053, 10522053},
												   {10522083, 10510083},
												   {10514063, 10522063},
											     {10510073, 10523073}} }
											     }


x500617_g_LingPaiList={}
-- 1级新人令牌
x500617_g_LingPaiList[2500]= {id=40004448,num=1,str="1级新人令牌"}
-- 2级新人令牌
x500617_g_LingPaiList[2600]= {id=40004449,num=1,str="2级新人令牌"}
-- 3级新人令牌
x500617_g_LingPaiList[2700]= {id=40004450,num=1,str="3级新人令牌"}


--**********************************
--事件列表
--**********************************
function x500617_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddNumText( sceneId, x500617_g_ScriptId, "1级新人权杖兑换20级师门套", 0, 2500 )
		AddNumText( sceneId, x500617_g_ScriptId, "2级新人权杖兑换30级师门套", 0, 2600 )
		AddNumText( sceneId, x500617_g_ScriptId, "3级新人权杖兑换40级师门套", 0, 2700 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x500617_OnDefaultEvent( sceneId, selfId,targetId )
	x500617_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x500617_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()

	if nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
		-- 是否加入门派
		local nMenPai = GetMenPai( sceneId, selfId )
		if nMenPai < 0 or nMenPai > 8 then
			x500617_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_212}" )
			return 0
		end
		BeginEvent(sceneId)
			AddText(sceneId, "#{YD_20080421_215}")
			
			local szStr = "#{YD_20080421_216}" .. x500617_g_LingPaiList[nNumText].str 
										.. "”".. tostring(x500617_g_LingPaiList[nNumText].num) .. "#{YD_20080421_217}"
			AddText(sceneId, szStr)

			for i, item in x500617_g_EquipList do
				if item.n == nNumText  then
					local nItemList = item.id[nMenPai+1]
					for j, itemId in nItemList do
						AddRadioItemBonus( sceneId, itemId, item.num )
					end
				end
			end
    EndEvent(sceneId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x500617_g_ScriptId, 0)
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x500617_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	-- 是否加入门派
	local nMenPai = GetMenPai( sceneId, selfId )
	if nMenPai < 0 or nMenPai > 8 then
		x500617_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_212}" )
		return 0
	end
	
	for i, item in x500617_g_EquipList do
		local nItemList = item.id[nMenPai+1]
		for j, itemId in nItemList do
			if itemId == selectRadioId  then
				nItemIndex = i
			end
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nNumIdx = x500617_g_EquipList[nItemIndex].n
	local bStoneOk = 0

	if nNumIdx ~= nil and GetItemCount(sceneId, selfId, x500617_g_LingPaiList[nNumIdx].id) >= x500617_g_LingPaiList[nNumIdx].num then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		local nStr = "#{YD_20080421_218}"..x500617_g_LingPaiList[nNumIdx].str
		x500617_NotifyTip( sceneId, selfId, nStr )
		return
	end
	
	-- 检查是不是有足够的令牌可以扣除
	if LuaFnGetAvailableItemCount(sceneId, selfId, x500617_g_LingPaiList[nNumIdx].id) < x500617_g_LingPaiList[nNumIdx].num then
		x500617_NotifyTip( sceneId, selfId, "#{YD_20080421_219}" )
		return		
	end
	
	-- 检查背包空间
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		x500617_NotifyTip( sceneId, selfId, "#{YRJ_BagFullTip}" )
		return
	end
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, x500617_g_LingPaiList[nNumIdx].id)
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex)
	
	-- 删除相关的令牌
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500617_g_LingPaiList[nNumIdx].id, x500617_g_LingPaiList[nNumIdx].num)
	
	if bDelOk < 1  then
		x500617_NotifyTip( sceneId, selfId, "#{YD_20080421_220}" )
		return
	else
		--给与奖励		
		local nBagIndex = TryRecieveItem( sceneId, selfId, selectRadioId, 1 );
		local itemInfo = GetBagItemTransfer( sceneId, selfId, nBagIndex )
		
		x500617_NotifyTip( sceneId, selfId, "#{YD_20080421_221}" )
		local strText = format("#{YD_224}#{_INFOUSR%s}#{YD_225}#{_INFOMSG%s}#{YD_226}#{_INFOMSG%s}#{YD_227}", GetName(sceneId, selfId), szTransfer, itemInfo )
		BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		
		--兑换成功，播放特效
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)

		return
	end

end

--**********************************
--与NPC对话
--**********************************
function x500617_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--醒目提示
--**********************************
function x500617_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

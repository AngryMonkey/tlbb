--任务链

--MisDescBegin
--脚本号
x229009_g_scriptId = 229009

--任务文本描述
x229009_g_ExchangeItem = "兑换物品"
x229009_g_ExchangeTitle = "兑换称号"
x229009_g_MissionInfo = "为了鼓励各位门下弟子将本门派发扬光大，为师特准备了一些奖品，使用#R400#W点门派贡献度即可兑换。"  --任务描述
x229009_g_MissionTarget = ""
x229009_g_ContinueInfo = ""			--未完成任务的npc对话
x229009_g_MissionComplete = ""	--完成任务npc说话的话

--MisDescEnd

x229009_g_exchangeitembymenpaipoint_Index = 23

x229009_g_menpainpc_table =  {
	{menpaiid=MP_SHAOLIN,  menpainame="少林", name="玄慈",	 title="少林寺方丈",	x=38, z=98},
	{menpaiid=MP_MINGJIAO, menpainame="明教", name="林世长", title="明教教主", 	x=98, z=52},
	{menpaiid=MP_GAIBANG,  menpainame="丐帮", name="宋慈",	 title="丐帮长老", 	x=91, z=63},
	{menpaiid=MP_WUDANG, 	 menpainame="武当", name="张玄素", title="武当派掌门",	x=73, z=82},
	{menpaiid=MP_EMEI, 		 menpainame="峨嵋", name="孟青青", title="峨嵋派掌门",	x=96, z=73},
	{menpaiid=MP_DALI, 	   menpainame="天龙", name="本因",	 title="天龙寺方丈",	x=96, z=66},
	{menpaiid=MP_XINGSU, 	 menpainame="星宿", name="丁春秋", title="星宿派掌门",	x=142, z=55},
	{menpaiid=MP_TIANSHAN, menpainame="天山", name="梅剑",	 title="天山派大师姐",	x=91, z=44},
	{menpaiid=MP_XIAOYAO,  menpainame="逍遥", name="苏星河", title="逍遥派代掌门",	x=125, z=144},
}           

--男
x229009_g_MaleTitleInfo = {
	{tlvl=1, mpp=0,    slt="少林侠士", mjt="明教侠士", gbt="丐帮侠士", wdt="武当侠士", emt="峨嵋侠士", xxt="星宿侠士", tlt="天龙侠士", tst="天山侠士", xyt="逍遥侠士"},
	{tlvl=2, mpp=1000, slt="灰衣护法", mjt="侍火侠士", gbt="青莲弟子", wdt="青冥居士", emt="清风居士", xxt="行瘟郎君", tlt="藏经侠士", tst="阳天部众", xyt="抚琴居士"},
	{tlvl=3, mpp=2500, slt="金身罗汉", mjt="护教法王", gbt="玄武长老", wdt="无为真人", emt="玉龙侠士", xxt="催命判官", tlt="崇圣天师", tst="天山苍鹰", xyt="洛神侠士"},
	{tlvl=4, mpp=5000, slt="地藏菩萨", mjt="光明神使", gbt="掌棒龙头", wdt="武当天尊", emt="峨嵋仙人", xxt="毒手医仙", tlt="天南龙王", tst="混元山神", xyt="逍遥神龙"},
}
--女	
x229009_g_femaleTitleInfo = {	
	{tlvl=1, mpp=0,	   slt="少林侠女", mjt="明教侠女", gbt="丐帮侠女", wdt="武当侠女", emt="峨嵋侠女", xxt="星宿侠女", tlt="天龙侠女", tst="天山侠女", xyt="逍遥侠女"},
	{tlvl=2, mpp=1000, slt="白衣侍者", mjt="侍火侠女", gbt="白莲弟子", wdt="白云居士", emt="明月居士", xxt="行瘟娘子", tlt="藏经侠女", tst="昊天部众", xyt="莳花居士"},
	{tlvl=3, mpp=2500, slt="渡世观音", mjt="护教散人", gbt="朱雀长老", wdt="清静散人", emt="金凤侠女", xxt="夺命夜叉", tlt="崇圣天女", tst="天山雪雕", xyt="淩波侠女"},
	{tlvl=4, mpp=5000, slt="迦蓝菩萨", mjt="光明圣女", gbt="掌钵龙女", wdt="武当仙子", emt="峨嵋仙子", xxt="毒手药王", tlt="天南龙女", tst="混元花神", xyt="逍遥圣女"},
}

x229009_g_shimentitle_bonusitem = {
	{menpaiid=MP_SHAOLIN,	bonusItem=10113004},
	{menpaiid=MP_MINGJIAO,	bonusItem=10113004},
	{menpaiid=MP_GAIBANG,	bonusItem=10113004},
	{menpaiid=MP_WUDANG,	bonusItem=10113004},
	{menpaiid=MP_EMEI, 		bonusItem=10113004},
	{menpaiid=MP_DALI, 		bonusItem=10113004},
	{menpaiid=MP_XINGSU,	bonusItem=10113004},
	{menpaiid=MP_TIANSHAN,	bonusItem=10113004},
	{menpaiid=MP_XIAOYAO,	bonusItem=10113004},
}

--**********************************
--事件交互入口
--**********************************
function x229009_OnDefaultEvent( sceneId, selfId,targetId )
	--PrintStr("OnDefaultEvent...")
	for i, v in x229009_g_menpainpc_table do
		if v.name == GetName(sceneId, targetId) then
			if v.menpaiid == GetMenPai(sceneId, selfId) then
				--PrintNum(GetNumText())
				if 10 <= GetNumText() and GetNumText() <= 14 then
					--兑换称号
					x229009_ExchangeTitleBymenpaipoint( sceneId, selfId,targetId, GetNumText()-10 )
				elseif 7 == GetNumText() then
				x229009_ExchangeItemBymenpaipoint( sceneId, selfId,targetId )
				break
				elseif 8 == GetNumText() then
					--添加称号
					x229009_AddExchangeTitleList( sceneId, selfId,targetId )
					break
				end	
			else
				local str = "你不是本门派弟子，我只为本门派弟子服务。"
				BeginEvent(sceneId)
					AddText(sceneId, str)
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )		
			end	
		end
	end
end

--**********************************
--列举事件
--**********************************
function x229009_OnEnumerate( sceneId, selfId, targetId )
	--PrintStr("OnEnumerate...")
	AddNumText(sceneId,x229009_g_scriptId, x229009_g_ExchangeItem, 3, 7);
	AddNumText(sceneId,x229009_g_scriptId, x229009_g_ExchangeTitle, 3, 8);

end

function x229009_ExchangeItemBymenpaipointFn( sceneId, selfId,targetId, needPoint )
	
	if (needPoint < 0 ) then
		return
	end
	
	local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
	if menpaipoint < 400 then
		local str = "你的师门贡献度目前为" .. tostring(menpaipoint) .. "，还不足400点，多加努力吧。"
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )		
	else
		local nItemId, strItemName, strItemDesc = GetOneMissionItem(x229009_g_exchangeitembymenpaipoint_Index)
		BeginAddItem(sceneId)
			AddItem(sceneId,nItemId, 1)
		local ret = EndAddItem(sceneId,selfId)
		if ret <= 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "你的背包已满， 无法兑换！")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		else
			AddItemListToHuman(sceneId, selfId)
			SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-400)
			local str = format("扣除400点门派贡献度，您获得了%s。", strItemName)
			Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )	
			
			str = format("你得到了%s。", strItemName)
			BeginEvent(sceneId)
				AddText(sceneId, str)
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
				
		end
	end	
	
end

function x229009_ExchangeItemBymenpaipoint( sceneId, selfId,targetId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229009_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddString(sceneId,"ExchangeItemBymenpaipointFn");
		UICommand_AddString(sceneId,x229009_g_MissionInfo);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

--/////////////////////////////////////////////////////////////////////////////////

function x229009_GetCurShimenTitleLevel(menpai, title )  --, titleinfo)
	local titlelevel = 0
	if menpai == MP_SHAOLIN then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].slt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].slt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_MINGJIAO then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].mjt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].mjt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_GAIBANG then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].gbt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].gbt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_WUDANG then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].wdt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].wdt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_EMEI then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].emt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].emt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_DALI then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].tlt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].tlt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_XINGSU then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].xxt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].xxt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_TIANSHAN then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].tst then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].tst then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_XIAOYAO then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].xyt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].xyt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	end
	
	return titlelevel
end

function x229009_GetSelectedTitle(menpai, titleinfo, level)
	if level < 1 or level > 4 then
		return 0, 0, ""
	end
	
	local title = ""
	if menpai == MP_SHAOLIN then
		title = titleinfo[level].slt
	elseif menpai == MP_MINGJIAO then
		title = titleinfo[level].mjt
	elseif menpai == MP_GAIBANG then
		title = titleinfo[level].gbt
	elseif menpai == MP_WUDANG then
		title = titleinfo[level].wdt
	elseif menpai == MP_EMEI then
		title = titleinfo[level].emt
	elseif menpai == MP_DALI then
		title = titleinfo[level].tlt
	elseif menpai == MP_XINGSU then
		title = titleinfo[level].xxt
	elseif menpai == MP_TIANSHAN then
		title = titleinfo[level].tst
	elseif menpai == MP_XIAOYAO then
		title = titleinfo[level].xyt
	end
	
	return titleinfo[level].tlvl, titleinfo[level].mpp, title
end

function x229009_AddExchangeTitleList(sceneId, selfId, targetId)
	--PrintStr("AddExchangeTitleList...")
	--得到门派
	local level = GetLevel(sceneId, selfId)
	local menpai = GetMenPai(sceneId, selfId)
	--local shimentitle = GetShimenTitle(sceneId, selfId)
	--男女判断
	local titleinfo
	local sex = GetSex(sceneId, selfId)
	if 1 == sex then
		titleinfo = x229009_g_MaleTitleInfo
	elseif 0 == sex then
		titleinfo = x229009_g_femaleTitleInfo
	end

	local step = 10
	BeginEvent(sceneId)
	
	if menpai == MP_SHAOLIN then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_MINGJIAO then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_GAIBANG then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_WUDANG then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_EMEI then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_DALI then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_XINGSU then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_TIANSHAN then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_XIAOYAO then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .. "（需要" .. needpoint .. "点师门贡献）"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	end
	
	EndEvent()
	
	DispatchEventList(sceneId,selfId,targetId)
end

function x229009_GetShimenTitle_BonusItem(sceneId, selfId)
	local menpai = GetMenPai(sceneId, selfId)
	for i, v in x229009_g_shimentitle_bonusitem do
		if v.menpaiid == menpai then
			return v.bonusItem
		end
	end
	return 0
end

function x229009_ExchangeTitleBymenpaipoint( sceneId, selfId,targetId, level )
	--PrintStr("ExchangeTitleBymenpaipoint")
	--SetHumanMenpaiPoint(sceneId, selfId, 1000000)
	local titleinfo
	local menpai = GetMenPai(sceneId, selfId)
	local sex = GetSex(sceneId, selfId)
	if 1 == sex then
		titleinfo = x229009_g_MaleTitleInfo
	elseif 0 == sex then
		titleinfo = x229009_g_femaleTitleInfo
	end
	local title = GetShimenTitle(sceneId, selfId)
	--PrintStr("title=" .. title)
	local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, level)
	local curtitlelvl = x229009_GetCurShimenTitleLevel(menpai, title)
	
	--PrintStr("seltitlelvl=" .. seltitlelvl)
	--PrintStr("curtitlelvl=" .. curtitlelvl)
	
	local str
	if seltitlelvl < curtitlelvl then
		str = "你已经拥有更高级的门派称号，不需要兑换。"
	elseif seltitlelvl == curtitlelvl then
		str = "你已经拥有了此称号，不需要兑换。"
	elseif seltitlelvl > curtitlelvl then
		local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
		--PrintStr("menpaipoint=" .. menpaipoint)
		--PrintStr("needpoint=" .. needpoint)
		if needpoint <= menpaipoint then
			if seltitlelvl == 2 then
				BeginAddItem(sceneId)
					AddItem(sceneId, x229009_GetShimenTitle_BonusItem(sceneId, selfId), 1)
				local ret = EndAddItem(sceneId,selfId)
				if ret > 0 then
					AddItemListToHuman(sceneId, selfId)
					str = "恭喜你获得#Y" .. seltitle .. "#W的称号，希望继续为本门的发扬光大而努力。这里有一套本门的衣服，就算为师对你这段时间辛苦的一个奖励吧。"
					SetShimenTitle(sceneId, selfId, seltitle)
					LuaFnDispatchAllTitle(sceneId, selfId)
					SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-needpoint)
				else
					str = "你的背包已经满了，为师准备送点小礼物给你，整理好背包之后再来找我吧。"
				end	
			else
				str = "恭喜你获得#Y" .. seltitle .. "#W的称号，希望继续为本门的发扬光大而努力。"
				SetShimenTitle(sceneId, selfId, seltitle)
				LuaFnDispatchAllTitle(sceneId, selfId)
				SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-needpoint)
			end
		else
			str = "你的门派贡献度不够，无法兑换。"			
		end
	end
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent()
	DispatchEventList(sceneId,selfId,targetId)	
end


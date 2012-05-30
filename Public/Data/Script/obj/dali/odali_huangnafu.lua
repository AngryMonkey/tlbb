--大理NPC
--黄纳福
--普通

--脚本号
x002087_g_ScriptId	= 002087

--任务号
x002087_g_MoneyId = MF_BUCHANG_MONEY
x002087_g_StoneId = MF_BUCHANG_STONE
x002087_g_EquipId = MF_BUCHANG_EQUIP

--各个门派装备列表
x002087_g_equipInfo = {}
x002087_g_equipInfo[0]	= {MP_XINGSU,10433240,10440540,10441540,10442540,10443540,10444540,10445540,10450054,10451054,10452054,10453054}
x002087_g_equipInfo[1]	= {MP_XIAOYAO,10434140,10440740,10441740,10442740,10443740,10444740,10445740,10450074,10451074,10452074,10453074}
x002087_g_equipInfo[2]	= {MP_SHAOLIN,10431040,10440040,10441040,10442040,10443040,10444040,10445040,10450004,10451004,10452004,10453004}
x002087_g_equipInfo[3]	= {MP_TIANSHAN,10435040,10440640,10441640,10442640,10443640,10444640,10445640,10450064,10451064,10452064,10453064}
x002087_g_equipInfo[4]	= {MP_DALI,10434240,10440840,10441840,10442840,10443840,10444840,10445840,10450084,10451084,10452084,10453084}
x002087_g_equipInfo[5]	= {MP_EMEI,10433040,10440340,10441340,10442340,10443340,10444340,10445340,10450034,10451034,10452034,10453034}
x002087_g_equipInfo[6]	= {MP_WUDANG,10432140,10440440,10441440,10442440,10443440,10444440,10445440,10450044,10451044,10452044,10453044}
x002087_g_equipInfo[7]	= {MP_MINGJIAO,10430140,10440140,10441140,10442140,10443140,10444140,10445140,10450014,10451014,10452014,10453014}
x002087_g_equipInfo[8]	= {MP_GAIBANG,10431240,10440240,10441240,10442240,10443240,10444240,10445240,10450024,10451024,10452024,10453024}

--事件交互入口
--**********************************
function x002087_OnDefaultEvent( sceneId, selfId, targetId )
	--首先应该判断是否应该给予补偿
	--相关的代码
	--显示补偿列表
	--15号开始，21号结束
	local day = GetDayTime()
	if day >= 7019 then
		x002087_MsgBox( sceneId, selfId, targetId, "任务时间已过" )
		return
	end
	BeginEvent( sceneId )
		AddText( sceneId, "  感谢大家一直以来对天龙八部的支持，因为测试新的游戏系统的需要，必须要进行清档处理。因此对因清档给大家带来的不便，深表歉意。我给大家带来了一些礼物，还请笑纳。" )
		AddNumText( sceneId, x002087_g_ScriptId, "提升我的等级到10级", 6, 0 )
		AddNumText( sceneId, x002087_g_ScriptId, "提升我的等级到40级", 6, 1 )
		AddNumText( sceneId, x002087_g_ScriptId, "给我40级的装备一套", 6, 2 )
		AddNumText( sceneId, x002087_g_ScriptId, "我已经40了，给我宝石", 6, 3 )
		AddNumText( sceneId, x002087_g_ScriptId, "我已经40了，给我金钱", 6, 4 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--事件交互入口
--**********************************
function x002087_OnStoneEvent( sceneId, selfId, targetId )
	--首先应该判断是否应该给予补偿
	--相关的代码
	--显示补偿列表
	BeginEvent( sceneId )
		AddText( sceneId, "  您想领取什么宝石？只能领取以下两种宝石当中的一种" )
		AddNumText( sceneId, x002087_g_ScriptId, "猫眼石", 6, 5 )
		AddNumText( sceneId, x002087_g_ScriptId, "虎眼石", 6, 6 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002087_OnEventRequest( sceneId, selfId, targetId, eventId )
	--取得列表号
	local	arg	= GetNumText()
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 0 then		--点击了10级选项
	--判断是否大于10级
		if GetLevel( sceneId, selfId ) >= 10 then --大于等于10级
			x002087_MsgBox( sceneId, selfId, targetId, "  您的等级已经大于等于10级，无法提升您的等级" )
			return
		else --设置等级为10级
			LuaFnHumanLevelUp(sceneId, selfId,10,0)
			x002087_MsgBox( sceneId, selfId, targetId, "恭喜您升到10级，您老人家辛苦了" )
			return
		end
	elseif arg == 1 then--点击了40级选项
		--判断是否大于40级
		if GetLevel( sceneId, selfId ) >= 40 then --大于等于40级
			x002087_MsgBox( sceneId, selfId, targetId, "  您的等级已经大于等于40级，无法提升您的等级" )
			return
		elseif id < 0 or id >= 9 then --判断是否加入门派
				x002087_MsgBox( sceneId, selfId, targetId, "  请先加入门派，可以先提升自己的等级到10级再加入门派" )
				return
		else
			LuaFnHumanLevelUp(sceneId, selfId,40,40)
			x002087_MsgBox( sceneId, selfId, targetId, "恭喜您升到40级，您老人家辛苦了" )
			return
		end
	elseif arg == 2 then--玩家要装备
		--判断是否小于40级
		if GetMissionFlag(sceneId,selfId,x002087_g_EquipId)==1 then
			x002087_MsgBox( sceneId, selfId, targetId, " 我老头子还没糊涂，你不是已经领过了么？" )
			return			
		elseif GetLevel( sceneId, selfId ) < 40 then --小于40级
			x002087_MsgBox( sceneId, selfId, targetId, " 只有等级到达40级之后，才能领取补偿的装备" )
			return
		elseif id < 0 or id >= 9 then --判断是否加入门派
				x002087_MsgBox( sceneId, selfId, targetId, "  请先加入门派，可以先提升自己的等级到10级再加入门派" )
				return
		else --是否有13个空格
			if LuaFnGetPropertyBagSpace(sceneId, selfId) < 11  then --没有空格
				x002087_MsgBox( sceneId, selfId, targetId, "	40级的一套装备一共有11件，您的背包空间不足11，请整理完毕之后再来找我" )
				return
			else 
				--按照门派给玩家装备
				x002087_GiveEquip( sceneId, selfId, targetId, id)
				x002087_MsgBox( sceneId, selfId, targetId, "给您老人家的装备您还满意不？" )
				SetMissionFlag( sceneId, selfId, x002087_g_EquipId, 1 )
				return
			end
		end
	elseif arg == 3 then--玩家要宝石
		if GetMissionFlag(sceneId,selfId,x002087_g_StoneId)==1 then
			x002087_MsgBox( sceneId, selfId, targetId, " 我老头子还没糊涂，你不是已经领过了么？" )
			return			
		--判断是否小于40级
		elseif GetLevel( sceneId, selfId ) < 40 then --小于40级
			x002087_MsgBox( sceneId, selfId, targetId, " 只有等级到达40级之后，才能领取补偿的宝石" )
			return
		else --给出宝石列表
			x002087_OnStoneEvent( sceneId, selfId, targetId )
			return
		end
	elseif arg == 4 then--玩家要钱
		--判断是否小于40级
		if GetMissionFlag(sceneId,selfId,x002087_g_MoneyId)==1 then
			x002087_MsgBox( sceneId, selfId, targetId, " 我老头子还没糊涂，你不是已经领过了么？" )
			return	
		elseif GetLevel( sceneId, selfId ) < 40 then --小于40级
			x002087_MsgBox( sceneId, selfId, targetId, " 只有等级到达40级之后，才能领取补偿的金币" )
			return
		else --给出宝石列表
			if LuaFnAddMoney(sceneId, selfId,1000000) == -1  then --给钱失败该如何做？
				--加钱失败
				return
			else
				x002087_MsgBox( sceneId, selfId, targetId, "您可真贪心，把我的养老费都拿走了" )
				SetMissionFlag( sceneId, selfId, x002087_g_MoneyId, 1 )
				return
			end
		end		
	elseif arg == 5 then--玩家要猫眼石
		--判断是否已经拿过猫眼石
		if GetLevel( sceneId, selfId ) < 40 then --小于40级
			x002087_MsgBox( sceneId, selfId, targetId, " 只有等级到达40级之后，才能领取补偿的金币" )
			return
		else --给玩家猫眼石
			if LuaFnGetMaterialBagSpace(sceneId, selfId) < 20  then --没有空格
				x002087_MsgBox( sceneId, selfId, targetId, " 奖励的宝石为20个，您的背包空间不足，请整理背包之后再来找我" )
				return
			else 		
				--给玩家20个猫眼石
				x002087_GiveStone( sceneId, selfId, targetId, 0)
				x002087_MsgBox( sceneId, selfId, targetId, "20个宝石，爽了吧您" )
				SetMissionFlag( sceneId, selfId, x002087_g_StoneId, 1 )
				return
			end
		end
	elseif arg == 6 then--玩家要虎眼石
		--判断是否已经拿过虎眼石
		if GetLevel( sceneId, selfId ) < 40 then --小于40级
			x002087_MsgBox( sceneId, selfId, targetId, " 只有等级到达40级之后，才能领取补偿的金币" )
			return
		else --给玩家虎眼石
			if LuaFnGetMaterialBagSpace(sceneId, selfId) < 20  then --没有空格
				x002087_MsgBox( sceneId, selfId, targetId, " 奖励的宝石为20个，您的背包空间不足，请整理背包之后再来找我" )
				return
			else
				--给玩家20个虎眼石
				x002087_GiveStone( sceneId, selfId, targetId, 1)
				x002087_MsgBox( sceneId, selfId, targetId, "20个宝石，爽了吧您" )
				SetMissionFlag( sceneId, selfId, x002087_g_StoneId, 1 )
				return
			end
		end		
		return
	end		
end		
		
		
--**********************************
--对话窗口信息提示
--**********************************
function x002087_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--给装备
--**********************************
--function x002087_GiveEquip( sceneId, selfId,menpai )
function x002087_GiveEquip( sceneId, selfId, targetId, menpai )

	--取得装备信息
	local mp =  x002087_GetEquipInfo( menpai )
	if mp ~= nil then
		for i=2,12 do
			BeginAddItem(sceneId)
				AddItem( sceneId,mp[i],1)	
			local ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
				--Msg2Player(sceneId, selfId,"#Y完成任务：第一把武器",MSG2PLAYER_PARA )
			end
		end
	end
end

--**********************************
--给宝石,0 猫眼石，1 虎眼石
--**********************************
--function x002087_GiveStone( sceneId, selfId,kind )
function x002087_GiveStone( sceneId, selfId, targetId, kind )
	--给猫眼石
	if kind == 0 then
		for i=1,20 do
			BeginAddItem(sceneId)
				AddItem( sceneId,50101001,1)	
			local ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
	--给虎眼石
	if kind == 1 then
		for i=1,20 do
			BeginAddItem(sceneId)
				AddItem( sceneId,50101002,1)	
			local ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
end

--**********************************
--取得所属门派装备信息
--**********************************
function x002087_GetEquipInfo( mpID )
	local mp
	local i = 0
	for i, mp in x002087_g_equipInfo do
		if mp[1] == mpID then
			return mp
		end
	end
	return nil
end

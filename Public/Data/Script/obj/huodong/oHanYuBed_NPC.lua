--寒玉床
--NPC脚本....


--脚本号
x402106_g_ScriptId = 402106


x402106_g_PosTbl = {

	{x=28,y=30},
	{x=70,y=25},
	{x=70,y=70},
	{x=26,y=70},
	{x=66,y=66},
	{x=44,y=44},
	{x=58,y=58},
	{x=50,y=50},
	{x=48,y=58},
	{x=34,y=56},
	{x=65,y=43},
	{x=33,y=44},

}

--**********************************
--事件交互入口
--**********************************
function x402106_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		if sceneId == 1 then
		
			AddText(sceneId,"#{HANYUBED_20071221_01}")
			AddNumText(sceneId,x402106_g_ScriptId,"进入寒玉谷",9,1)

		elseif sceneId == 194 then

			AddText(sceneId,"#{HANYUBED_20071221_02}")
			AddNumText(sceneId,x402106_g_ScriptId,"回到苏州",9,2)

		end

		AddNumText(sceneId,x402106_g_ScriptId,"购买古墓行功要诀",6,3)
		AddNumText(sceneId,x402106_g_ScriptId,"在寒玉谷中修行的四项注意",11,4)
		AddNumText(sceneId,x402106_g_ScriptId,"夫妻行功要诀使用说明",11,100)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x402106_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		--传送到寒玉谷....
		local idx = random( getn(x402106_g_PosTbl) )
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 194, x402106_g_PosTbl[idx].x, x402106_g_PosTbl[idx].y)

	elseif NumText == 2 then

		--传送到苏州....
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,178,132)

	elseif NumText == 3 then

		local PlayerLevel = GetLevel( sceneId, selfId )
		if PlayerLevel < 30 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{HANYUBED_20071221_06}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		local NeedMoney = x402106_CalcBookPrice( sceneId, selfId )
		if NeedMoney <= 0 then
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId,"#{HANYUBED_20071221_04}#{_MONEY"..NeedMoney.."}#{HANYUBED_20071221_05}")
			AddNumText(sceneId,x402106_g_ScriptId,"确定",8,5)
			AddNumText(sceneId,x402106_g_ScriptId,"取消",8,6)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 4 then

		BeginEvent(sceneId)
			AddText(sceneId,"#{HANYUBED_20071221_03}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	elseif NumText == 5 then

		x402106_BuyBook( sceneId, selfId, targetId )

	elseif NumText == 6 then

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FUQIYAOJUE_1}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--买书
--**********************************
function x402106_BuyBook( sceneId, selfId, targetId )

	local PlayerLevel = GetLevel( sceneId, selfId )
	if PlayerLevel < 30 then
		return
	end

	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{HANYUBED_20071221_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测金钱是否够....
	local NeedMoney = x402106_CalcBookPrice( sceneId, selfId )
	if NeedMoney <= 0 then
		return
	end
	local CurMoney = LuaFnGetMoney(sceneId, selfId)

	if CurMoney < NeedMoney then
		BeginEvent(sceneId)
			AddText(sceneId,"#{HANYUBED_20071221_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--给书....
	local ret = TryRecieveItem( sceneId, selfId, 30700200, QUALITY_MUST_BE_CHANGE )
	if ret ~= -1 then
		LuaFnCostMoney(sceneId, selfId, NeedMoney)
	end

	--提示....
	local str1 = "你付出了#{_MONEY"..NeedMoney.."}。"
	local str2 = "你购买了一个#{_ITEM"..(30700200).."}。"
	BeginEvent( sceneId )
		AddText( sceneId, str1 )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	BeginEvent( sceneId )
		AddText( sceneId, str2 )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	Msg2Player( sceneId, selfId, str1, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, str2, MSG2PLAYER_PARA )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--计算书钱
--**********************************
function x402106_CalcBookPrice( sceneId, selfId )

	local NeedMoney = 0
	local PlayerLevel = GetLevel( sceneId, selfId )

	--改用新公式....（ INT（LV/10）-2 ） / 2
	NeedMoney = floor( PlayerLevel / 10 ) - 2
	NeedMoney = NeedMoney * 1000000*2


--	if PlayerLevel < 30 then

--		NeedMoney = 0

--	elseif PlayerLevel < 90 then	--INT（LV/10）-2

--		NeedMoney = floor( PlayerLevel / 10 ) - 2
--		NeedMoney = NeedMoney * 10000

--	else	--INT（每次经验*60 /（81*等级+70000））

--		local PreExp = CallScriptFunction(808072, "GetPreExpOfThisLevel", sceneId, PlayerLevel)
--		NeedMoney = (PreExp * 60) / ( 81 * PlayerLevel + 70000 )
--		NeedMoney = floor(NeedMoney)
--		NeedMoney = NeedMoney * 10000

--	end

	return NeedMoney

end

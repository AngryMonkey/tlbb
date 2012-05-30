--寒玉床


--脚本号
x808072_g_scriptId = 808072

x808072_g_NoRMBBuffID = 5901	--非RMB挂机的buff的ID....
x808072_g_RMBBuffID = 5902		--RMB挂机的buff的ID....
x808072_g_SpouseBuffID = 5704 --夫妻挂机buff

x808072_g_NormalExpBuffID = 5905	--普通 获得经验的特效....
x808072_g_MoreExpBuffID = 5904		--暴击 获得经验的特效....

x808072_g_MaxAddExpCount = 60		--玩家挂一次机可以获得经验的次数....(阀值功能)

x808072_g_ExpTbl = {

[30] =1785,[31] =1837,[32] =1890,[33] =1942,[34] =1995,
[35] =2047,[36] =2100,[37] =2152,[38] =2205,[39] =2257,
[40] =2310,[41] =2362,[42] =2415,[43] =2467,[44] =2520,
[45] =2572,[46] =2625,[47] =2677,[48] =2730,[49] =2782,
[50] =2835,[51] =2887,[52] =2940,[53] =2992,[54] =3045,
[55] =3097,[56] =3150,[57] =3202,[58] =3255,[59] =3307,
[60] =3360,[61] =3412,[62] =3465,[63] =3517,[64] =3570,
[65] =3622,[66] =3675,[67] =3727,[68] =3780,[69] =3832,
[70] =3885,[71] =3937,[72] =3990,[73] =4042,[74] =4095,
[75] =4147,[76] =4200,[77] =4252,[78] =4305,[79] =4357,
[80] =4410,[81] =4462,[82] =4515,[83] =4567,[84] =4620,
[85] =4672,[86] =4725,[87] =4777,[88] =4830,[89] =4882,
[90] =4935,[91] =4987,[92] =5040,[93] =5092,[94] =5145,
[95] =5197,[96] =5250,[97] =5302,[98] =5355,[99] =5407,
[100] =5460,[101] =5512,[102] =5565,[103] =5617,[104] =5670,
[105] =5722,[106] =5775,[107] =5827,[108] =5880,[109] =5932,
[110] =5985,[111] =6037,[112] =6090,[113] =6142,[114] =6195,
[115] =6247,[116] =6300,[117] =6352,[118] =6405,[119] =6457,
[120] =6510,[121] =6562,[122] =6615,[123] =6667,[124] =6720,
[125] =6772,[126] =6825,[127] =6877,[128] =6930,[129] =6982,
[130] =7035,[131] =7087,[132] =7140,[133] =7192,[134] =7245,
[135] =7297,[136] =7350,[137] =7402,[138] =7455,[139] =7507,
[140] =7560,[141] =7612,[142] =7665,[143] =7717,[144] =7770,
[145] =7822,[146] =7875,[147] =7927,[148] =7980,[149] =8032,
[150]=0,

}

--**********************************
-- OnTime
--**********************************
function x808072_OnSceneTimer(sceneId)

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x808072_DoHanYuLogic( sceneId, nHumanId )
	end

end

--**********************************
-- 挂机加经验逻辑
--**********************************
function x808072_DoHanYuLogic( sceneId, selfId )

	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--获得玩家的挂机类型....
	local GuaJiType = 0
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808072_g_NoRMBBuffID ) == 1 then
		GuaJiType = 1
	elseif LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808072_g_RMBBuffID ) == 1 then
		GuaJiType = 2
	elseif LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x808072_g_SpouseBuffID ) == 1 then
		GuaJiType = 3
	end

	if 0 == GuaJiType then
		return
	end

	--阀值逻辑....限制玩家获得经验的次数....起到双保险的作用....
	local CanAddExpCount = GetMissionData( sceneId, selfId, MD_HANYUBED_CANADDEXP_COUNT )
	if CanAddExpCount <= 40 then
		return
	else
		SetMissionData( sceneId, selfId, MD_HANYUBED_CANADDEXP_COUNT, CanAddExpCount-1 )
	end

	--获得经验....
	local IsMoreExp = 0
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	local CurExp = x808072_g_ExpTbl[CurLevel]
	if CurExp and CurExp > 0 then

		--RMB挂机给2倍经验....并且有50%几率给4倍经验....
		if (2 == GuaJiType) or (3 == GuaJiType) then
			if random(100) <= 50 then
				CurExp = CurExp * 4
				IsMoreExp = 1
			else
				CurExp = CurExp * 2
			end
		end
		if 3 == GuaJiType then
			local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
			if (spouseGuid ~= -1) and (LuaFnGuid2ObjId(sceneId, spouseGuid) ~= -1) then		
				LuaFnAddExp( sceneId, selfId, CurExp);
			end
		else
			LuaFnAddExp( sceneId, selfId, CurExp)
		end

	end

	--给获得经验的buff....
	if 1 == IsMoreExp then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808072_g_MoreExpBuffID, 0)
	else
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808072_g_NormalExpBuffID, 0)
	end

end

--**********************************
-- 玩家使用书的时候回调本接口
--**********************************
function x808072_OnPlayerUseHanYuBook( sceneId, selfId )

	--设置该玩家可以获得60次经验....
	SetMissionData( sceneId, selfId, MD_HANYUBED_CANADDEXP_COUNT, x808072_g_MaxAddExpCount + 40 )

end

--**********************************
-- RMB挂机buff结束的时候回调本接口
--**********************************
function x808072_OnImpactFadeOut( sceneId, selfId, impactId )

	--公告....
	--local str = format("#Y林朝雄#P：#W#{_INFOUSR%s}#P在#G寒玉谷#P的千年寒玉床上运功修行三十分钟。在不知不觉之间，功力已经突飞猛进，远非昔日所能比拟！", GetName(sceneId,selfId) )
	--BroadMsgByChatPipe(sceneId, selfId, str, 4)

end

--**********************************
-- 玩家在寒玉床中拾取宝箱中物品时回调本接口
--**********************************
function x808072_OnPlayerPickUpItemInHanYuBed( sceneId, selfId, itemId, bagidx )

	--公告....
	if itemId == 30501148 or itemId == 30501149 or itemId ==30501150 or itemId == 30700200 or itemId == 30505178 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)

		local message = format("#{_INFOUSR%s}#P在#G苏州（178，129）林朝雄#P的指引下来到#G寒玉谷#P中修炼，武功大进的同时还意外的捡到一个#{_INFOMSG%s}#P。", playerName, transfer )
		BroadMsgByChatPipe(sceneId, selfId, message, 4)

	end

end

--**********************************
-- 获取某等级的经验
--**********************************
function x808072_GetPreExpOfThisLevel( sceneId, level )

	local Exp = x808072_g_ExpTbl[level]
	if Exp then
		return Exp
	else
		return 0
	end

end

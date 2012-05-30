-- 生长点 采集[采矿采药]

-- 脚本号
x710000_g_ScriptId = 710000

-- 生长点信息
x710000_g_GPInfo = {}

-- 随机因子
x710000_g_RandNum = 10000

-- abilityId: 生长点对应技能 name: 生长点的名字
-- mainId: 主要掉出物 mExtraCountOdds: 主要掉出物额外掉出数量的几率
-- associatedId: 副产品列表，aOdds 几率出现时随机出一个，列表可以为空 aOdds: 副产品掉出率 aExtraCountOdds: 出现副产品后额外数量几率
-- rareId: 稀有物品，稀有物品可以没有，填 -1， rOdds: 稀有物品掉出率
-- needLevel: 采集此生长点需要的级别

-- 以下部分为矿石
x710000_g_GPInfo[1 ] = { abilityId = ABILITY_CAIKUANG, name = "铜矿",
	mainId = 20103001, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },	-- 表明 100% 几率掉落，50% 几率掉2个，38% 几率掉三个，10% 几率掉四个，1% 几率掉五个，1% 几率掉六个，
	associatedId = { 20103013, 20103025, 20103037, 20103049 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 1 }
x710000_g_GPInfo[2 ] = { abilityId = ABILITY_CAIKUANG, name = "铁矿",
	mainId = 20103002, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103014, 20103026, 20103038, 20103050 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 2 }
x710000_g_GPInfo[3 ] = { abilityId = ABILITY_CAIKUANG, name = "银矿",
	mainId = 20103003, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103015, 20103027, 20103039, 20103051 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 3 }
x710000_g_GPInfo[4 ] = { abilityId = ABILITY_CAIKUANG, name = "寒铁矿",
	mainId = 20103004, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103016, 20103028, 20103040, 20103052 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 4 }
x710000_g_GPInfo[5 ] = { abilityId = ABILITY_CAIKUANG, name = "金矿",
	mainId = 20103005, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103017, 20103029, 20103041, 20103053 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 5 }
x710000_g_GPInfo[6 ] = { abilityId = ABILITY_CAIKUANG, name = "玄铁矿",
	mainId = 20103006, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103018, 20103030, 20103042, 20103054 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 6 }
x710000_g_GPInfo[7 ] = { abilityId = ABILITY_CAIKUANG, name = "水晶矿",
	mainId = 20103007, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103019, 20103031, 20103043, 20103055 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 7 }
x710000_g_GPInfo[8 ] = { abilityId = ABILITY_CAIKUANG, name = "翡翠矿",
	mainId = 20103008, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103020, 20103032, 20103044, 20103056 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 8 }
x710000_g_GPInfo[9 ] = { abilityId = ABILITY_CAIKUANG, name = "真武矿",
	mainId = 20103009, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103021, 20103033, 20103045, 20103057 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 9 }
x710000_g_GPInfo[10] = { abilityId = ABILITY_CAIKUANG, name = "龙血矿",
	mainId = 20103010, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103022, 20103034, 20103046, 20103058 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 10 }
x710000_g_GPInfo[11] = { abilityId = ABILITY_CAIKUANG, name = "凤血矿",
	mainId = 20103011, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103023, 20103035, 20103047, 20103059 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 11 }
x710000_g_GPInfo[12] = { abilityId = ABILITY_CAIKUANG, name = "女娲石",
	mainId = 20103012, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103024, 20103036, 20103048, 20103060 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 12 }
x710000_g_GPInfo[13] = { abilityId = ABILITY_CAIKUANG, name = "昆山矿玉",
	mainId = 20103118, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103122, 20103126, 20103130, 20103134 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 9 }
x710000_g_GPInfo[14] = { abilityId = ABILITY_CAIKUANG, name = "众生矿石",
	mainId = 20103119, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20103123, 20103127, 20103131, 20103135 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 10 }

-- 以上部分为矿石

-- 以下部分为草药
x710000_g_GPInfo[101] = { abilityId = ABILITY_CAIYAO, name = "白英",
	mainId = 20101001, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304005 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 1 }
x710000_g_GPInfo[102] = { abilityId = ABILITY_CAIYAO, name = "蒲黄",
	mainId = 20101002, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304005 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 1 }
x710000_g_GPInfo[103] = { abilityId = ABILITY_CAIYAO, name = "川贝",
	mainId = 20101003, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304006 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 2 }
x710000_g_GPInfo[104] = { abilityId = ABILITY_CAIYAO, name = "元胡",
	mainId = 20101004, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304006 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 2 }
x710000_g_GPInfo[105] = { abilityId = ABILITY_CAIYAO, name = "枇杷",
	mainId = 20101005, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304006 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 3 }
x710000_g_GPInfo[106] = { abilityId = ABILITY_CAIYAO, name = "甘草",
	mainId = 20101006, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304007 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 3 }
x710000_g_GPInfo[107] = { abilityId = ABILITY_CAIYAO, name = "金银花",
	mainId = 20101007, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304007 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 3 }
x710000_g_GPInfo[108] = { abilityId = ABILITY_CAIYAO, name = "黄芩",
	mainId = 20101008, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304007 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 4 }
x710000_g_GPInfo[109] = { abilityId = ABILITY_CAIYAO, name = "枸杞",
	mainId = 20101009, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304008 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 4 }
x710000_g_GPInfo[110] = { abilityId = ABILITY_CAIYAO, name = "沉香",
	mainId = 20101010, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304008 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 4 }
x710000_g_GPInfo[111] = { abilityId = ABILITY_CAIYAO, name = "杜仲",
	mainId = 20101011, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304008 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 5 }
x710000_g_GPInfo[112] = { abilityId = ABILITY_CAIYAO, name = "苍术",
	mainId = 20101012, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304009 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 5 }
x710000_g_GPInfo[113] = { abilityId = ABILITY_CAIYAO, name = "茯苓",
	mainId = 20101013, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304009 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 5 }
x710000_g_GPInfo[114] = { abilityId = ABILITY_CAIYAO, name = "防风",
	mainId = 20101014, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304009 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 6 }
x710000_g_GPInfo[115] = { abilityId = ABILITY_CAIYAO, name = "香薷",
	mainId = 20101015, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304010 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 6 }
x710000_g_GPInfo[116] = { abilityId = ABILITY_CAIYAO, name = "黄连",
	mainId = 20101016, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304010 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 6 }
x710000_g_GPInfo[117] = { abilityId = ABILITY_CAIYAO, name = "当归",
	mainId = 20101017, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304010 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 7 }
x710000_g_GPInfo[118] = { abilityId = ABILITY_CAIYAO, name = "桂心",
	mainId = 20101018, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304011 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 7 }
x710000_g_GPInfo[119] = { abilityId = ABILITY_CAIYAO, name = "香附",
	mainId = 20101019, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304011 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 7 }
x710000_g_GPInfo[120] = { abilityId = ABILITY_CAIYAO, name = "藿香",
	mainId = 20101020, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304011 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 8 }
x710000_g_GPInfo[121] = { abilityId = ABILITY_CAIYAO, name = "回神草",
	mainId = 20101021, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304012 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 8 }
x710000_g_GPInfo[122] = { abilityId = ABILITY_CAIYAO, name = "首乌",
	mainId = 20101022, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304012 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 8 }
x710000_g_GPInfo[123] = { abilityId = ABILITY_CAIYAO, name = "冬虫夏草",
	mainId = 20101023, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304013 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 9 }
x710000_g_GPInfo[124] = { abilityId = ABILITY_CAIYAO, name = "龙葵籽",
	mainId = 20101024, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304014 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 9 }
x710000_g_GPInfo[125] = { abilityId = ABILITY_CAIYAO, name = "象贝",
	mainId = 20101025, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304013, 20304014 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 10 }
x710000_g_GPInfo[126] = { abilityId = ABILITY_CAIYAO, name = "人参",
	mainId = 20101026, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304013, 20304014 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 10 }
x710000_g_GPInfo[127] = { abilityId = ABILITY_CAIYAO, name = "灵芝",
	mainId = 20101027, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304016 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 11 }
x710000_g_GPInfo[128] = { abilityId = ABILITY_CAIYAO, name = "荀草",
	mainId = 20101028, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304015 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 11 }
x710000_g_GPInfo[129] = { abilityId = ABILITY_CAIYAO, name = "莲子",
	mainId = 20101029, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304015 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 12 }
x710000_g_GPInfo[130] = { abilityId = ABILITY_CAIYAO, name = "枯木春",
	mainId = 20101030, mExtraCountOdds = { 10000, 5000, 1200, 200, 100 },
	associatedId = { 20304016 }, aOdds = 2500, aExtraCountOdds = { 9000, 4000, 2000, 1000 },
	rareId = -1, rOdds = 100, needLevel = 12 }

-- 以上部分为草药

x710000_g_abilityName = {}
x710000_g_abilityName[ABILITY_CAIKUANG] = "采矿"
x710000_g_abilityName[ABILITY_CAIYAO] = "采药"

-- 长生长点
function x710000_OnCreate( sceneId, growPointType, x, y )
	local GPInfo = x710000_g_GPInfo[growPointType]
	if not GPInfo then
		return
	end

	-- 每个生长点最少能得到一个物品，这里直接放入 itembox 中一个
	local itemBox = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, GPInfo.mainId )

	-- 加入额外的主要生成物品
	local odds = random( x710000_g_RandNum )
	local i
	for i = 1, getn( GPInfo.mExtraCountOdds ) do
		if odds <= GPInfo.mExtraCountOdds[i] then
			AddItemToBox( sceneId, itemBox, QUALITY_MUST_BE_CHANGE,1, GPInfo.mainId )
		else
			break
		end
	end

	-- 加入副产品
	local aItemCount = getn( GPInfo.associatedId )
	if aItemCount > 0 then
		odds = random( x710000_g_RandNum )
		if odds <= GPInfo.aOdds then
			local aItem = GPInfo.associatedId[ random( aItemCount ) ]
			AddItemToBox( sceneId, itemBox, QUALITY_MUST_BE_CHANGE,1, aItem )

			odds = random( x710000_g_RandNum )
			for i = 1, getn( GPInfo.aExtraCountOdds ) do
				if odds <= GPInfo.aExtraCountOdds[i] then
					AddItemToBox( sceneId, itemBox, QUALITY_MUST_BE_CHANGE,1, aItem )
				else
					break
				end
			end
		end
	end

	-- 加入稀有物品
	if GPInfo.rareId ~= -1 then
		odds = random( x710000_g_RandNum )
		if odds <= GPInfo.rOdds then
			AddItemToBox( sceneId, itemBox, QUALITY_MUST_BE_CHANGE,1, GPInfo.rareId )
		end
	end
	
	-- hongyu 添加采集出兑换企鹅的代码
	local ExchangeStoneScriptID = 210242
	for i=1, 7 do
	    local Item = CallScriptFunction( ExchangeStoneScriptID, "DropStoneList", sceneId, i )
	    if Item > 0 then
	        AddItemToBox( sceneId, itemBox, QUALITY_MUST_BE_CHANGE,1, Item )
	    end
	end
	-- hongyu end
	
	local ExchangeLongzhuScriptID = 808058
	
	for i=1, 7 do
	    local Item = CallScriptFunction( ExchangeLongzhuScriptID, "DropLongzhuList", sceneId, i )
	    if Item > 0 then
	        AddItemToBox( sceneId, itemBox, QUALITY_MUST_BE_CHANGE,1, Item )
	    end
	end

		
end

-- 点击生长点时
function x710000_OnOpen( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x710000_g_GPInfo[growPointType]
	if not GPInfo then
		return OR_INVALID_TARGET
	end

	-- 检查相应技能等级
	local AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, GPInfo.abilityId )
	if AbilityLevel < GPInfo.needLevel then
		x710000_NotifyFailTips( sceneId, selfId,
			"需要" .. x710000_g_abilityName[GPInfo.abilityId] .. "技能 " .. GPInfo.needLevel .. " 级，当前 " .. AbilityLevel .. " 级" )
		return OR_NO_LEVEL
	end

	--检查精力
	local energyCost = CallScriptFunction( ABILITYLOGIC_ID, "CalcEnergyCostCaiJi", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	if GetHumanEnergy( sceneId, selfId ) < energyCost then
		return OR_NOT_ENOUGH_ENERGY
	end

	return OR_OK
end

-- 进度条走完了
function x710000_OnProcOver( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x710000_g_GPInfo[growPointType]
	if not GPInfo then
		return OR_INVALID_TARGET
	end

	-- 消耗精力
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	return OR_OK
end

-- 箱子捡完了，回收
function x710000_OnRecycle( sceneId, selfId, targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x710000_g_GPInfo[growPointType]
	if not GPInfo then
		return 1
	end

	--统计数据
	LuaFnAuditAbility(sceneId, selfId, GPInfo.abilityId, -1, -1)
	-- 增加熟练度
	CallScriptFunction( ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	--返回1，生长点回收
	return 1
end

function x710000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x710000_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

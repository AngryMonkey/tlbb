-- 生长点 钓鱼

-- 脚本号
x712000_g_ScriptId = 712000

-- 对应生活技能：钓鱼	钓鱼技能的编号9
x712000_g_AbilityId = ABILITY_DIAOYU

-- 随机因子
x712000_g_RandNum = 1000000

-- 鱼群信息
x712000_g_GPInfo = {}

x712000_g_rare =
{
	[1] = {Id = 20103106, Name = "个丝线[1级]", Odds = 40000 },
	[2] = {Id = 20103107, Name = "个丝线[2级]", Odds = 35000 },
	[3] = {Id = 20103108, Name = "个丝线[3级]", Odds = 30000 },
	[4] = {Id = 20103109, Name = "个染料[1级]", Odds = 4000 },
	[5] = {Id = 20103110, Name = "个染料[2级]", Odds = 3500 },
	[6] = {Id = 20103111, Name = "个染料[3级]", Odds = 3000 },
	[7] = {Id = 20102025, Name=  "只花蛤", Odds = 25000 },
	[8] = {Id = 20102026, Name=  "棵紫菜", Odds = 25000 },
	[9] = {Id = 20102027, Name=  "只白虾", Odds = 25000 },
	[10] = {Id = 20102028, Name=  "只龙虾", Odds = 10000 },
	[11] = {Id = 20102029, Name=  "只青蟹", Odds = 10000 },
	[12] = {Id = 20102030, Name=  "只文蛤", Odds = 10000 },
	[13] = {Id = 20102031, Name=  "只贻贝", Odds = 4000 },
	[14] = {Id = 20102032, Name=  "只对虾", Odds = 4000 },
	[15] = {Id = 20102033, Name=  "只杂色蛤", Odds = 4000 },
	[16] = {Id = 20102034, Name=  "只河蚌", Odds = 4000 },
	[17] = {Id = 20102035, Name=  "只蛙蟹", Odds = 4000 },
	[18] = {Id = 20102036, Name=  "只玉蟹", Odds = 4000 },
	[19] = {Id = 20102048, Name=  "只盐壳蚌", Odds = 4000 },
	[20] = {Id = 20102049, Name=  "朵孢子尘", Odds = 4000 },
	[21] = {Id = 20102050, Name=  "棵裸藻", Odds = 4000 },
	[22] = {Id = 20102051, Name=  "只蠃母", Odds = 4000 },
}

-- name: 鱼的名字 mainId: 主要掉出物 needLevel: 钓此鱼需要的级别
x712000_g_GPInfo[201] = { name = "草鱼", mainId = 20102001, rareId = {1,4,7,}, needLevel = 1,}
x712000_g_GPInfo[202] = { name = "鲫鱼", mainId = 20102002, rareId = {1,4,8,}, needLevel = 2,}
x712000_g_GPInfo[203] = { name = "鲢鱼", mainId = 20102003, rareId = {1,4,9,}, needLevel = 3,}
x712000_g_GPInfo[204] = { name = "平鱼", mainId = 20102004, rareId = {2,5,10,}, needLevel = 4,}
x712000_g_GPInfo[205] = { name = "鳝鱼", mainId = 20102005, rareId = {2,5,11,}, needLevel = 5,}
x712000_g_GPInfo[206] = { name = "黑鱼", mainId = 20102006, rareId = {2,5,12,}, needLevel = 6,}
x712000_g_GPInfo[207] = { name = "斗鱼", mainId = 20102007, rareId = {3,6,13,}, needLevel = 7,}
x712000_g_GPInfo[208] = { name = "鲳鱼", mainId = 20102008, rareId = {3,6,14,}, needLevel = 8,}
x712000_g_GPInfo[209] = { name = "银鱼", mainId = 20102009, rareId = {3,6,15,}, needLevel = 9,}
x712000_g_GPInfo[210] = { name = "鲑鱼", mainId = 20102010, rareId = {3,6,16,}, needLevel = 10,}
x712000_g_GPInfo[211] = { name = "骨舌鱼", mainId = 20102011, rareId = {3,6,17,}, needLevel = 11,}
x712000_g_GPInfo[212] = { name = "六线鱼", mainId = 20102012, rareId = {3,6,18,}, needLevel = 12,}
x712000_g_GPInfo[213] = { name = "青鱼", mainId = 20102013, rareId = {1,4,7,}, needLevel = 1,}
x712000_g_GPInfo[214] = { name = "箭鱼", mainId = 20102014, rareId = {1,4,8,}, needLevel = 2,}
x712000_g_GPInfo[215] = { name = "鲈鱼", mainId = 20102015, rareId = {1,4,9,}, needLevel = 3,}
x712000_g_GPInfo[216] = { name = "扁头鱼", mainId = 20102016, rareId = {2,5,10,}, needLevel = 4,}
x712000_g_GPInfo[217] = { name = "油力鱼", mainId = 20102017, rareId = {2,5,11,}, needLevel = 5,}
x712000_g_GPInfo[218] = { name = "秋刀鱼", mainId = 20102018, rareId = {2,5,12,}, needLevel = 6,}
x712000_g_GPInfo[219] = { name = "梭鱼", mainId = 20102019, rareId = {3,6,13,}, needLevel = 7,}
x712000_g_GPInfo[220] = { name = "光背鱼", mainId = 20102020, rareId = {3,6,14,}, needLevel = 8,}
x712000_g_GPInfo[221] = { name = "钩鱼", mainId = 20102021, rareId = {3,6,15,}, needLevel = 9,}
x712000_g_GPInfo[222] = { name = "摆鳍鱼", mainId = 20102022, rareId = {3,6,16,}, needLevel = 10,}
x712000_g_GPInfo[223] = { name = "珍珠鱼", mainId = 20102023, rareId = {3,6,17,}, needLevel = 11,}
x712000_g_GPInfo[224] = { name = "文昌鱼", mainId = 20102024, rareId = {3,6,18,}, needLevel = 12,}
x712000_g_GPInfo[225] = { name = "草鱼", mainId = 20102001, rareId = {1,4,7,}, needLevel = 1,}
x712000_g_GPInfo[226] = { name = "鲫鱼", mainId = 20102002, rareId = {1,4,8,}, needLevel = 2,}
x712000_g_GPInfo[227] = { name = "鲢鱼", mainId = 20102003, rareId = {1,4,9,}, needLevel = 3,}
x712000_g_GPInfo[228] = { name = "平鱼", mainId = 20102004, rareId = {2,5,10,}, needLevel = 4,}
x712000_g_GPInfo[229] = { name = "鳝鱼", mainId = 20102005, rareId = {2,5,11,}, needLevel = 5,}
x712000_g_GPInfo[230] = { name = "黑鱼", mainId = 20102006, rareId = {2,5,12,}, needLevel = 6,}
x712000_g_GPInfo[231] = { name = "斗鱼", mainId = 20102007, rareId = {3,6,13,}, needLevel = 7,}
x712000_g_GPInfo[232] = { name = "鲳鱼", mainId = 20102008, rareId = {3,6,14,}, needLevel = 8,}
x712000_g_GPInfo[233] = { name = "银鱼", mainId = 20102009, rareId = {3,6,15,}, needLevel = 9,}
x712000_g_GPInfo[234] = { name = "鲑鱼", mainId = 20102010, rareId = {3,6,16,}, needLevel = 10,}
x712000_g_GPInfo[235] = { name = "骨舌鱼", mainId = 20102011, rareId = {3,6,17,}, needLevel = 11,}
x712000_g_GPInfo[236] = { name = "六线鱼", mainId = 20102012, rareId = {3,6,18,}, needLevel = 12,}
x712000_g_GPInfo[237] = { name = "青鱼", mainId = 20102013, rareId = {1,4,7,}, needLevel = 1,}
x712000_g_GPInfo[238] = { name = "箭鱼", mainId = 20102014, rareId = {1,4,8,}, needLevel = 2,}
x712000_g_GPInfo[239] = { name = "鲈鱼", mainId = 20102015, rareId = {1,4,9,}, needLevel = 3,}
x712000_g_GPInfo[240] = { name = "扁头鱼", mainId = 20102016, rareId = {2,5,10,}, needLevel = 4,}
x712000_g_GPInfo[241] = { name = "油力鱼", mainId = 20102017, rareId = {2,5,11,}, needLevel = 5,}
x712000_g_GPInfo[242] = { name = "秋刀鱼", mainId = 20102018, rareId = {2,5,12,}, needLevel = 6,}
x712000_g_GPInfo[243] = { name = "梭鱼", mainId = 20102019, rareId = {3,6,13,}, needLevel = 7,}
x712000_g_GPInfo[244] = { name = "光背鱼", mainId = 20102020, rareId = {3,6,14,}, needLevel = 8,}
x712000_g_GPInfo[245] = { name = "钩鱼", mainId = 20102021, rareId = {3,6,15,}, needLevel = 9,}
x712000_g_GPInfo[246] = { name = "摆鳍鱼", mainId = 20102022, rareId = {3,6,16,}, needLevel = 10,}
x712000_g_GPInfo[247] = { name = "珍珠鱼", mainId = 20102023, rareId = {3,6,17,}, needLevel = 11,}
x712000_g_GPInfo[248] = { name = "文昌鱼", mainId = 20102024, rareId = {3,6,18,}, needLevel = 12,}
x712000_g_GPInfo[249] = { name = "胭脂鱼", mainId = 20102040, rareId = {3,6,19,}, needLevel = 9,}
x712000_g_GPInfo[250] = { name = "七星鱼", mainId = 20102041, rareId = {3,6,20,}, needLevel = 10,}
x712000_g_GPInfo[251] = { name = "长吻鱼", mainId = 20102042, rareId = {3,6,21,}, needLevel = 11,}
x712000_g_GPInfo[252] = { name = "多鳍鱼", mainId = 20102043, rareId = {3,6,22,}, needLevel = 12,}
x712000_g_GPInfo[253] = { name = "翘嘴红鲌", mainId = 20102044, rareId = {3,6,19,}, needLevel = 9,}
x712000_g_GPInfo[254] = { name = "秋白鲑", mainId = 20102045, rareId = {3,6,20,}, needLevel = 10,}
x712000_g_GPInfo[255] = { name = "蝶鳍鱼", mainId = 20102046, rareId = {3,6,21,}, needLevel = 11,}
x712000_g_GPInfo[256] = { name = "文鳐鱼", mainId = 20102047, rareId = {3,6,22,}, needLevel = 12,}

--x712000_g_GPInfo[202] = { name = "鲫鱼", mainId = 20102002, rareId = 20102026, rareName = "棵紫菜", rOdds = 25000, needLevel = 2 }
--x712000_g_GPInfo[203] = { name = "鲢鱼", mainId = 20102003, rareId = 20102027, rareName = "只白虾", rOdds = 25000, needLevel = 3 }
--x712000_g_GPInfo[204] = { name = "平鱼", mainId = 20102004, rareId = 20102028, rareName = "只龙虾", rOdds = 2000, needLevel = 4 }
--x712000_g_GPInfo[205] = { name = "鳝鱼", mainId = 20102005, rareId = 20102029, rareName = "只青蟹", rOdds = 2000, needLevel = 5 }
--x712000_g_GPInfo[206] = { name = "黑鱼", mainId = 20102006, rareId = 20102030, rareName = "只文蛤", rOdds = 2000, needLevel = 6 }
--x712000_g_GPInfo[207] = { name = "斗鱼", mainId = 20102007, rareId = 20102031, rareName = "只贻贝", rOdds = 200, needLevel = 7 }
--x712000_g_GPInfo[208] = { name = "鲳鱼", mainId = 20102008, rareId = 20102032, rareName = "只对虾", rOdds = 200, needLevel = 8 }
--x712000_g_GPInfo[209] = { name = "银鱼", mainId = 20102009, rareId = 20102033, rareName = "只杂色蛤", rOdds = 200, needLevel = 9 }
--x712000_g_GPInfo[210] = { name = "鲑鱼", mainId = 20102010, rareId = 20102034, rareName = "只河蚌", rOdds = 200, needLevel = 10 }
--x712000_g_GPInfo[211] = { name = "骨舌鱼", mainId = 20102011, rareId = 20102035, rareName = "只蛙蟹", rOdds = 200, needLevel = 11 }
--x712000_g_GPInfo[212] = { name = "六线鱼", mainId = 20102012, rareId = 20102036, rareName = "只玉蟹", rOdds = 200, needLevel = 12 }
--x712000_g_GPInfo[213] = { name = "青鱼", mainId = 20102013, rareId = 20102025, rareName = "只花蛤", rOdds = 25000, needLevel = 1 }
--x712000_g_GPInfo[214] = { name = "箭鱼", mainId = 20102014, rareId = 20102026, rareName = "棵紫菜", rOdds = 25000, needLevel = 2 }
--x712000_g_GPInfo[215] = { name = "鲈鱼", mainId = 20102015, rareId = 20102027, rareName = "只白虾", rOdds = 25000, needLevel = 3 }
--x712000_g_GPInfo[216] = { name = "扁头鱼", mainId = 20102016, rareId = 20102028, rareName = "只龙虾", rOdds = 2000, needLevel = 4 }
--x712000_g_GPInfo[217] = { name = "油力鱼", mainId = 20102017, rareId = 20102029, rareName = "只青蟹", rOdds = 2000, needLevel = 5 }
--x712000_g_GPInfo[218] = { name = "秋刀鱼", mainId = 20102018, rareId = 20102030, rareName = "只文蛤", rOdds = 2000, needLevel = 6 }
--x712000_g_GPInfo[219] = { name = "梭鱼", mainId = 20102019, rareId = 20102031, rareName = "只贻贝", rOdds = 200, needLevel = 7 }
--x712000_g_GPInfo[220] = { name = "光背鱼", mainId = 20102020, rareId = 20102032, rareName = "只对虾", rOdds = 200, needLevel = 8 }
--x712000_g_GPInfo[221] = { name = "钩鱼", mainId = 20102021, rareId = 20102033, rareName = "只杂色蛤", rOdds = 200, needLevel = 9 }
--x712000_g_GPInfo[222] = { name = "摆鳍鱼", mainId = 20102022, rareId = 20102034, rareName = "只河蚌", rOdds = 200, needLevel = 10 }
--x712000_g_GPInfo[223] = { name = "珍珠鱼", mainId = 20102023, rareId = 20102035, rareName = "只蛙蟹", rOdds = 200, needLevel = 11 }
--x712000_g_GPInfo[224] = { name = "文昌鱼", mainId = 20102024, rareId = 20102036, rareName = "只玉蟹", rOdds = 200, needLevel = 12 }
--x712000_g_GPInfo[225] = { name = "草鱼", mainId = 20102001, rareId = 20102025, rareName = "只花蛤", rOdds = 25000, needLevel = 1 }
--x712000_g_GPInfo[226] = { name = "鲫鱼", mainId = 20102002, rareId = 20102026, rareName = "棵紫菜", rOdds = 25000, needLevel = 2 }
--x712000_g_GPInfo[227] = { name = "鲢鱼", mainId = 20102003, rareId = 20102027, rareName = "只白虾", rOdds = 25000, needLevel = 3 }
--x712000_g_GPInfo[228] = { name = "平鱼", mainId = 20102004, rareId = 20102028, rareName = "只龙虾", rOdds = 2000, needLevel = 4 }
--x712000_g_GPInfo[229] = { name = "鳝鱼", mainId = 20102005, rareId = 20102029, rareName = "只青蟹", rOdds = 2000, needLevel = 5 }
--x712000_g_GPInfo[230] = { name = "黑鱼", mainId = 20102006, rareId = 20102030, rareName = "只文蛤", rOdds = 2000, needLevel = 6 }
--x712000_g_GPInfo[231] = { name = "斗鱼", mainId = 20102007, rareId = 20102031, rareName = "只贻贝", rOdds = 200, needLevel = 7 }
--x712000_g_GPInfo[232] = { name = "鲳鱼", mainId = 20102008, rareId = 20102032, rareName = "只对虾", rOdds = 200, needLevel = 8 }
--x712000_g_GPInfo[233] = { name = "银鱼", mainId = 20102009, rareId = 20102033, rareName = "只杂色蛤", rOdds = 200, needLevel = 9 }
--x712000_g_GPInfo[234] = { name = "鲑鱼", mainId = 20102010, rareId = 20102034, rareName = "只河蚌", rOdds = 200, needLevel = 10 }
--x712000_g_GPInfo[235] = { name = "骨舌鱼", mainId = 20102011, rareId = 20102035, rareName = "只蛙蟹", rOdds = 200, needLevel = 11 }
--x712000_g_GPInfo[236] = { name = "六线鱼", mainId = 20102012, rareId = 20102036, rareName = "只玉蟹", rOdds = 200, needLevel = 12 }
--x712000_g_GPInfo[237] = { name = "青鱼", mainId = 20102013, rareId = 20102025, rareName = "只花蛤", rOdds = 25000, needLevel = 1 }
--x712000_g_GPInfo[238] = { name = "箭鱼", mainId = 20102014, rareId = 20102026, rareName = "棵紫菜", rOdds = 25000, needLevel = 2 }
--x712000_g_GPInfo[239] = { name = "鲈鱼", mainId = 20102015, rareId = 20102027, rareName = "只白虾", rOdds = 25000, needLevel = 3 }
--x712000_g_GPInfo[240] = { name = "扁头鱼", mainId = 20102016, rareId = 20102028, rareName = "只龙虾", rOdds = 2000, needLevel = 4 }
--x712000_g_GPInfo[241] = { name = "油力鱼", mainId = 20102017, rareId = 20102029, rareName = "只青蟹", rOdds = 2000, needLevel = 5 }
--x712000_g_GPInfo[242] = { name = "秋刀鱼", mainId = 20102018, rareId = 20102030, rareName = "只文蛤", rOdds = 2000, needLevel = 6 }
--x712000_g_GPInfo[243] = { name = "梭鱼", mainId = 20102019, rareId = 20102031, rareName = "只贻贝", rOdds = 200, needLevel = 7 }
--x712000_g_GPInfo[244] = { name = "光背鱼", mainId = 20102020, rareId = 20102032, rareName = "只对虾", rOdds = 200, needLevel = 8 }
--x712000_g_GPInfo[245] = { name = "钩鱼", mainId = 20102021, rareId = 20102033, rareName = "只杂色蛤", rOdds = 200, needLevel = 9 }
--x712000_g_GPInfo[246] = { name = "摆鳍鱼", mainId = 20102022, rareId = 20102034, rareName = "只河蚌", rOdds = 200, needLevel = 10 }
--x712000_g_GPInfo[247] = { name = "珍珠鱼", mainId = 20102023, rareId = 20102035, rareName = "只蛙蟹", rOdds = 200, needLevel = 11 }
--x712000_g_GPInfo[248] = { name = "文昌鱼", mainId = 20102024, rareId = 20102036, rareName = "只玉蟹", rOdds = 200, needLevel = 12 }
--x712000_g_GPInfo[249] = { name = "胭脂鱼", mainId = 20102040, rareId = 20102048, rareName = "只盐壳蚌", rOdds = 200, needLevel = 9 }
--x712000_g_GPInfo[250] = { name = "七星鱼", mainId = 20102041, rareId = 20102049, rareName = "朵孢子尘", rOdds = 200, needLevel = 10 }
--x712000_g_GPInfo[251] = { name = "长吻鱼", mainId = 20102042, rareId = 20102050, rareName = "棵裸藻", rOdds = 200, needLevel = 11 }
--x712000_g_GPInfo[252] = { name = "多鳍鱼", mainId = 20102043, rareId = 20102051, rareName = "只蠃母", rOdds = 200, needLevel = 12 }
--x712000_g_GPInfo[253] = { name = "翘嘴红鲌", mainId = 20102044, rareId = 20102048, rareName = "只盐壳蚌", rOdds = 200, needLevel = 9 }
--x712000_g_GPInfo[254] = { name = "秋白鲑", mainId = 20102045, rareId = 20102049, rareName = "朵孢子尘", rOdds = 200, needLevel = 10 }
--x712000_g_GPInfo[255] = { name = "蝶鳍鱼", mainId = 20102046, rareId = 20102050, rareName = "棵裸藻", rOdds = 200, needLevel = 11 }
--x712000_g_GPInfo[256] = { name = "文鳐鱼", mainId = 20102047, rareId = 20102051, rareName = "只蠃母", rOdds = 200, needLevel = 12 }

x712000_g_FishTime = {}
x712000_g_FishTime[0] = { time = 31000, rand = 10000 }	-- 通常 36 秒，上下浮动 5
x712000_g_FishTime[1] = { time = 25000, rand = 10000 }	-- 通常 30 秒，上下浮动 5
x712000_g_FishTime[2] = { time = 20000, rand = 10000 }	-- 通常 25 秒，上下浮动 5
x712000_g_FishTime[3] = { time = 15000, rand = 10000 }	-- 通常 20 秒，上下浮动 5

x712000_g_FishBaitImpactID = { 19, 20, 21 }		-- 确保这里的值对应的下标与 x712000_g_FishTime 的相应下标相同

--太公钓鱼 zchw
x712000_g_TaiGongYuGan = 10100032;
x712000_g_impact_id = 77;
-- 长鱼群
function x712000_OnCreate( sceneId, growPointType, x, y )
	local ItemCount = 0												-- 物品数量
	ItemBoxEnterScene( x, y, growPointType, sceneId,QUALITY_MUST_BE_CHANGE, ItemCount )	--函数调用
end

-- 钓鱼前
function x712000_OnOpen( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x712000_g_GPInfo[growPointType]
	if not GPInfo then
		return OR_INVALID_TARGET
	end

	-- 检查钓鱼技能等级
	local AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, x712000_g_AbilityId )
	if AbilityLevel < GPInfo.needLevel then
		x712000_NotifyFailTips( sceneId, selfId, "需要钓鱼技能 " .. GPInfo.needLevel .. " 级，当前 " .. AbilityLevel .. " 级" )
		return OR_NO_LEVEL
	end

	local FishTime = x712000_g_FishTime[0]
	-- 如果有相应的 Buff，则时间分别调整为 1、2、3
	local i
	for i = 1, getn( x712000_g_FishBaitImpactID ) do
		if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x712000_g_FishBaitImpactID[i] ) == 1 then
			FishTime = x712000_g_FishTime[i]
			break
		end
	end

	SetAbilityOperaTime( sceneId, selfId, (FishTime.time + random(FishTime.rand)) )	--设置一次钓到鱼的时间

	return OR_OK
end

-- 钓完了
function x712000_OnProcOver( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x712000_g_GPInfo[growPointType]
	if not GPInfo then
		return OR_INVALID_TARGET
	end

	CallScriptFunction( ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, x712000_g_AbilityId, GPInfo.needLevel )
	--统计数据
	LuaFnAuditAbility(sceneId, selfId, x712000_g_AbilityId, -1, -1)
	local ret1 = TryRecieveItem( sceneId, selfId, GPInfo.mainId, QUALITY_MUST_BE_CHANGE )
	if ret1 > 0 then												-->0表示物品成功放入背包中
		Msg2Player( sceneId, selfId, "你钓到一条" .. GPInfo.name .. "。", MSG2PLAYER_PARA )
		-- 增加熟练度
	elseif ret1 == -1 then
		Msg2Player( sceneId, selfId, "你钓到一条" .. GPInfo.name .. "，但是背包已满，你随手把它扔到了一边。", MSG2PLAYER_PARA )
	end
	
	--太公钓鱼 zchw
	if LuaFnGetItemCount(sceneId, selfId, x712000_g_TaiGongYuGan) > 0
		and LuaFnGetHumanPKValue(sceneId, selfId) < 1 
		and GetPlayerPvpMode(sceneId, selfId) == 0 then		
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x712000_g_impact_id, 0); 
	end
	local rareNum = getn(GPInfo.rareId);
	if(rareNum < 0) then
		return OR_OK;
	end
	
	for i=1, rareNum do
		local rareInfo = x712000_g_rare[GPInfo.rareId[i]];
		
		if(not rareInfo) then
			return OR_OK;
		end
		
		if(random(x712000_g_RandNum) <= rareInfo.Odds) then
			
			local ret1 = TryRecieveItem( sceneId, selfId, rareInfo.Id, QUALITY_MUST_BE_CHANGE);
			if(ret1 > 0) then
				Msg2Player( sceneId, selfId, "你钓到一" .. rareInfo.Name .. "。", MSG2PLAYER_PARA )
			elseif(ret1 == -1) then
				Msg2Player( sceneId, selfId, "你钓到一" .. rareInfo.Name .. "，但是背包已满，你随手把它扔到了一边。", MSG2PLAYER_PARA )
			end
			
		end
	end

	return OR_OK
end

function x712000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x712000_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

-- 402100
-- 野猪暴走活动
x402100_g_NpcID = {3730,3740,3750,3760,3770}

x402100_g_NpcPos_1 = {	{x=182,y=214},{x=150,y=227},{x=217,y=141},
												{x=154,y=174},{x=202,y=104},{x=198,y=64	},
												{x=162,y=35	},{x=75 ,y=18	},{x=102,y=35	},
												{x=91 ,y=65	},{x=114,y=119},{x=140,y=114},
												{x=127,y=99	},{x=157,y=100},{x=112,y=150},
												{x=42 ,y=129},{x=23 ,y=162},{x=60 ,y=160},
												{x=21 ,y=53	},{x=36 ,y=38	},{x=132,y=98	},
												{x=65 ,y=192},{x=102,y=207},{x=91 ,y=159},
												{x=138,y=189},{x=154,y=172},{x=124,y=55	},
												{x=96 ,y=113},{x=127,y=94	},{x=97 ,y=47 },
}

x402100_g_NpcPos_2 = {	{x=135,y=90	},{x=62 ,y=47	},{x=23 ,y=33	},
												{x=172,y=57	},{x=175,y=137},{x=45 ,y=150},
}

x402100_g_NpcPos_3 = {	{x=60 ,y=96	},{x=213,y=35	},{x=108,y=77	},
												{x=140,y=119},{x=154,y=22	},{x=72 ,y=208},
}

x402100_g_TimeTickIndex = 0

--**********************************
--事件交互入口 19-145-40 18-149-48
--**********************************
function x402100_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )

	StartOneActivity( sceneId, actId, floor(900000))
	SetActivityParam( sceneId, actId, x402100_g_TimeTickIndex, 0)

	-- 创建第一批活动Npc
	for i, v in x402100_g_NpcPos_1  do
		-- 随机一个Npc
		local nIndex = random(1,5)
		local MonsterId = LuaFnCreateMonster( sceneId, x402100_g_NpcID[nIndex], v.x, v.y, 3, -1, 402101 )
		SetCharacterTitle(sceneId, MonsterId, "灵兽")
		SetCharacterDieTime(sceneId, MonsterId, 5*1000*60*60)
	end

end

--**********************************
--心跳函数
--**********************************
function x402100_OnTimer( sceneId, actId, uTime )
	
	local TickTime = GetActivityParam(sceneId, actId, x402100_g_TimeTickIndex)
	TickTime = TickTime+1
	SetActivityParam(sceneId, actId, x402100_g_TimeTickIndex, TickTime)
	
	if TickTime == 1  then
		for i, v in x402100_g_NpcPos_2  do
			-- 随机一个Npc
			local nIndex = random(1,5)
			local MonsterId = LuaFnCreateMonster( sceneId, x402100_g_NpcID[nIndex], v.x, v.y, 3, -1, 402101 )
			SetCharacterTitle(sceneId, MonsterId, "灵兽")
			SetCharacterDieTime(sceneId, MonsterId, 5*1000*60*60)
		end
	end
	
	if TickTime == 2  then
		for i, v in x402100_g_NpcPos_3  do
			-- 随机一个Npc
			local nIndex = random(1,5)
			local MonsterId = LuaFnCreateMonster( sceneId, x402100_g_NpcID[nIndex], v.x, v.y, 3, -1, 402101 )
			SetCharacterTitle(sceneId, MonsterId, "灵兽")
			SetCharacterDieTime(sceneId, MonsterId, 5*1000*60*60)
		end
	end
	
end

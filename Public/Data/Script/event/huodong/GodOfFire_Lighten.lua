--创建人:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
--龟兔赛跑传递活动....

--孔明灯刷新脚本....
--在龟兔赛跑活动中每半分钟刷新一次孔明灯


--脚本号
x808083_g_ScriptId	= 808083

x808083_g_PosTable_6 = { { posX = 49,  posY = 183 },{ posX = 70,  posY = 190 },{ posX = 88,  posY = 192 },{ posX = 101, posY = 162 },{ posX = 135, posY = 165 },
											 	 { posX = 158, posY = 158 },{ posX = 176, posY = 147 },{ posX = 180, posY = 123 },{ posX = 182, posY = 100 },{ posX = 190, posY = 93  },
											 	 { posX = 209, posY = 97  },{ posX = 225, posY = 106 },{ posX = 243, posY = 104 },{ posX = 259, posY = 98  },{ posX = 270, posY = 84  },
											 	 { posX = 257, posY = 73  },{ posX = 243, posY = 79  },{ posX = 207, posY = 77  },{ posX = 230, posY = 88  },{ posX = 189, posY = 78  },
											 	 { posX = 210, posY = 59  },{ posX = 169, posY = 64  },{ posX = 154, posY = 64  },{ posX = 136, posY = 75  },{ posX = 117, posY = 73  },
											 	 { posX = 107, posY = 79  },{ posX = 120, posY = 105 },{ posX = 145, posY = 103 },{ posX = 160, posY = 110 },{ posX = 161, posY = 125 },
											 	 { posX = 154, posY = 142 },{ posX = 138, posY = 148 },{ posX = 123, posY = 154 },{ posX = 101, posY = 160 },{ posX = 90,  posY = 169 },
											 	 { posX = 69,  posY = 162 },{ posX = 55,  posY = 158 },{ posX = 56,  posY = 145 },{ posX = 62,  posY = 131 },{ posX = 66,  posY = 118 },
											 	 { posX = 81,  posY = 93  },{ posX = 81,  posY = 76  },{ posX = 104, posY = 66  },{ posX = 111, posY = 93  },{ posX = 136, posY = 83  },
											 	 { posX = 76,  posY = 151 },{ posX = 88,  posY = 158 },{ posX = 219, posY = 76  },{ posX = 249, posY = 68  },{ posX = 169, posY = 52  } }

x808083_g_PosTable_5 = { { posX = 47,  posY = 284 },{ posX = 54,  posY = 270 },{ posX = 38,  posY = 265 },{ posX = 60,  posY = 262 },{ posX = 60,  posY = 238 },
											 	 { posX = 72,  posY = 254 },{ posX = 60,  posY = 223 },{ posX = 49,  posY = 211 },{ posX = 42,  posY = 196 },{ posX = 48,  posY = 191 },
											 	 { posX = 61,  posY = 194 },{ posX = 69,  posY = 202 },{ posX = 72,  posY = 214 },{ posX = 88,  posY = 179 },{ posX = 92,  posY = 195 },
											 	 { posX = 107, posY = 199 },{ posX = 117, posY = 208 },{ posX = 128, posY = 208 },{ posX = 133, posY = 188 },{ posX = 146, posY = 179 },
											 	 { posX = 147, posY = 157 },{ posX = 120, posY = 177 },{ posX = 91,  posY = 154 },{ posX = 101, posY = 141 },{ posX = 70,  posY = 132 },
											 	 { posX = 71,  posY = 114 },{ posX = 92,  posY = 96  },{ posX = 138, posY = 94  },{ posX = 163, posY = 104 },{ posX = 141, posY = 125 },
											 	 { posX = 146, posY = 135 },{ posX = 193, posY = 172 },{ posX = 190, posY = 192 },{ posX = 201, posY = 203 },{ posX = 190, posY = 221 },
											 	 { posX = 212, posY = 240 },{ posX = 216, posY = 249 },{ posX = 232, posY = 217 },{ posX = 238, posY = 186 },{ posX = 236, posY = 170 },
											 	 { posX = 263, posY = 119 },{ posX = 280, posY = 99  },{ posX = 283, posY = 70  },{ posX = 272, posY = 53  },{ posX = 253, posY = 50  },
											 	 { posX = 238, posY = 70  },{ posX = 226, posY = 57  },{ posX = 207, posY = 63  },{ posX = 212, posY = 78  },{ posX = 235, posY = 90  } }

x808083_g_PosTable_4 = { { posX = 206, posY = 263 },{ posX = 197, posY = 249 },{ posX = 191, posY = 236 },{ posX = 188, posY = 218 },{ posX = 206, posY = 206 },
											 	 { posX = 192, posY = 200 },{ posX = 201, posY = 185 },{ posX = 189, posY = 175 },{ posX = 192, posY = 155 },{ posX = 204, posY = 143 },
											 	 { posX = 220, posY = 130 },{ posX = 219, posY = 119 },{ posX = 210, posY = 112 },{ posX = 198, posY = 117 },{ posX = 205, posY = 95  },
											 	 { posX = 192, posY = 96  },{ posX = 183, posY = 75  },{ posX = 192, posY = 65  },{ posX = 176, posY = 58  },{ posX = 157, posY = 56  },
											 	 { posX = 132, posY = 43  },{ posX = 107, posY = 35  },{ posX = 128, posY = 57  },{ posX = 127, posY = 68  },{ posX = 119, posY = 68  },
											 	 { posX = 129, posY = 85  },{ posX = 132, posY = 94  },{ posX = 123, posY = 112 },{ posX = 122, posY = 124 },{ posX = 140, posY = 126 },
											 	 { posX = 140, posY = 133 },{ posX = 135, posY = 152 },{ posX = 131, posY = 162 },{ posX = 128, posY = 172 },{ posX = 133, posY = 194 },
											 	 { posX = 158, posY = 205 },{ posX = 169, posY = 213 },{ posX = 130, posY = 87  },{ posX = 117, posY = 45  },{ posX = 107, posY = 51  },
											 	 { posX = 206, posY = 87  },{ posX = 212, posY = 240 },{ posX = 233, posY = 234 },{ posX = 216, posY = 217 },{ posX = 181, posY = 198 },
											 	 { posX = 169, posY = 180 },{ posX = 167, posY = 151 },{ posX = 140, posY = 133 },{ posX = 124, posY = 117 },{ posX = 186, posY = 84  } }

x808083_g_PosTable_3 = { { posX = 49,  posY = 98  },{ posX = 50,  posY = 66  },{ posX = 53,  posY = 124 },{ posX = 77,  posY = 146 },{ posX = 105, posY = 179 },
											 	 { posX = 80,  posY = 204 },{ posX = 40,  posY = 222 },{ posX = 50,  posY = 251 },{ posX = 42,  posY = 266 },{ posX = 64,  posY = 280 },
											 	 { posX = 94,  posY = 267 },{ posX = 119, posY = 269 },{ posX = 209, posY = 218 },{ posX = 224, posY = 174 },{ posX = 236, posY = 196 },
											 	 { posX = 237, posY = 230 },{ posX = 237, posY = 258 },{ posX = 262, posY = 272 },{ posX = 280, posY = 252 },{ posX = 69,  posY = 85  },
											 	 { posX = 81,  posY = 98  },{ posX = 98,  posY = 100 },{ posX = 119, posY = 112 },{ posX = 145, posY = 129 },{ posX = 152, posY = 148 },
											 	 { posX = 149, posY = 169 },{ posX = 164, posY = 191 },{ posX = 174, posY = 200 },{ posX = 194, posY = 210 },{ posX = 145, posY = 210 },
											 	 { posX = 140, posY = 229 },{ posX = 158, posY = 244 },{ posX = 172, posY = 240 },{ posX = 43,  posY = 59  },{ posX = 51,  posY = 85  },
											 	 { posX = 46,  posY = 117 },{ posX = 33,  posY = 259 },{ posX = 73,  posY = 143 },{ posX = 102, posY = 101 },{ posX = 115, posY = 103 },
											 	 { posX = 155, posY = 197 },{ posX = 236, posY = 241 },{ posX = 94,  posY = 167 },{ posX = 250, posY = 267 },{ posX = 96,  posY = 201 },
											 	 { posX = 95,  posY = 100 },{ posX = 150, posY = 153 },{ posX = 36,  posY = 54 },{ posX = 61,   posY = 74  },{ posX = 109, posY = 183 } }

x808083_g_PosTable_7 = { { posX = 40,  posY = 280 },{ posX = 45,  posY = 272 },{ posX = 41,  posY = 262 },{ posX = 41,  posY = 248 },{ posX = 48,  posY = 237 },
											 	 { posX = 60,  posY = 234 },{ posX = 70,  posY = 223 },{ posX = 71,  posY = 213 },{ posX = 57,  posY = 200 },{ posX = 50,  posY = 186 },
											 	 { posX = 48,  posY = 170 },{ posX = 44,  posY = 152 },{ posX = 51,  posY = 131 },{ posX = 43,  posY = 115 },{ posX = 41,  posY = 96  },
											 	 { posX = 41,  posY = 76  },{ posX = 48,  posY = 57  },{ posX = 62,  posY = 44  },{ posX = 66,  posY = 44  },{ posX = 103, posY = 53  },
											 	 { posX = 105, posY = 83  },{ posX = 106, posY = 127 },{ posX = 104, posY = 172 },{ posX = 119, posY = 198 },{ posX = 143, posY = 208 },
											 	 { posX = 128, posY = 221 },{ posX = 226, posY = 164 },{ posX = 120, posY = 242 },{ posX = 65,  posY = 271 },{ posX = 100, posY = 264 },
											 	 { posX = 130, posY = 254 },{ posX = 166, posY = 222 },{ posX = 166, posY = 201 },{ posX = 153, posY = 180 },{ posX = 191, posY = 185 },
											 	 { posX = 210, posY = 168 },{ posX = 219, posY = 154 },{ posX = 145, posY = 263 },{ posX = 169, posY = 254 },{ posX = 188, posY = 245 },
											 	 { posX = 216, posY = 238 },{ posX = 242, posY = 237 },{ posX = 235, posY = 227 },{ posX = 210, posY = 213 },{ posX = 221, posY = 186 },
											 	 { posX = 224, posY = 135 },{ posX = 219, posY = 101 },{ posX = 187, posY = 93  },{ posX = 160, posY = 74  },{ posX = 130, posY = 63  } }

x808083_g_PosTable_8 = { { posX = 235, posY = 277 },{ posX = 231, posY = 264 },{ posX = 217, posY = 260 },{ posX = 215, posY = 244 },{ posX = 197, posY = 233 },
											 	 { posX = 181, posY = 246 },{ posX = 172, posY = 233 },{ posX = 159, posY = 219 },{ posX = 148, posY = 227 },{ posX = 138, posY = 242 },
											 	 { posX = 122, posY = 234 },{ posX = 114, posY = 223 },{ posX = 122, posY = 213 },{ posX = 138, posY = 208 },{ posX = 116, posY = 192 },
											 	 { posX = 135, posY = 180 },{ posX = 127, posY = 172 },{ posX = 106, posY = 166 },{ posX = 124, posY = 162 },{ posX = 115, posY = 144 },
											 	 { posX = 135, posY = 134 },{ posX = 141, posY = 123 },{ posX = 153, posY = 117 },{ posX = 158, posY = 106 },{ posX = 170, posY = 106 },
											 	 { posX = 173, posY = 138 },{ posX = 182, posY = 149 },{ posX = 191, posY = 154 },{ posX = 201, posY = 160 },{ posX = 207, posY = 148 },
											 	 { posX = 215, posY = 128 },{ posX = 227, posY = 135 },{ posX = 237, posY = 142 },{ posX = 248, posY = 153 },{ posX = 245, posY = 169 },
											 	 { posX = 253, posY = 172 },{ posX = 265, posY = 171 },{ posX = 275, posY = 167 },{ posX = 271, posY = 146 },{ posX = 269, posY = 135 },
											 	 { posX = 283, posY = 139 },{ posX = 276, posY = 149 },{ posX = 176, posY = 146 },{ posX = 110, posY = 142 },{ posX = 97,  posY = 170 },
											 	 { posX = 114, posY = 187 },{ posX = 135, posY = 243 },{ posX = 164, posY = 241 },{ posX = 200, posY = 252 },{ posX = 224, posY = 240 } }

-- 点亮孔明灯所给的经验
x808083_g_KongMingLight_EXP = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
																0, 0, 0, 0, 0, 0, 0, 0, 0, 1584, 
																1656, 1719, 1782, 1851, 1914, 1986, 2049, 2112, 2184, 2571, 
																2649, 2721, 2799, 2868, 2949, 3027, 3099, 3177, 3249, 3744, 
																3831, 3912, 3996, 4083, 4170, 4257, 4335, 4422, 4509, 5109, 
																5205, 5298, 5394, 5487, 5583, 5676, 5772, 5868, 5961, 6654, 
																6765, 6867, 6972, 7074, 7176, 7287, 7389, 7491, 7593, 8397, 
																8517, 8628, 8739, 8856, 8967, 9084, 9195, 9306, 9423, 10332, 
																10458, 10575, 10701, 10821, 10947, 11073, 11190, 11316, 11436, 11829, 
																11955, 12081, 12207, 12333, 12459, 12585, 12705, 12831, 12957, 13281, 
																13416, 13542, 13668, 13794, 13920, 14052, 14181, 14307, 14433, 14670, 
																14796, 14922, 15054, 15189, 15315, 15441, 15567, 15693, 15828, 15954, 
																16089, 16215, 16341, 16476, 16602, 16728, 16854, 16980, 17115, 17247, 
																17373, 17499, 17625, 17760, 17886, 18012, 18138, 18273, 18408, 18534, 
																18660, 18786, 18912, 19047, 19173, 19305, 19434, 19560, 19692, 19692 }

-- 每天龟兔赛跑活动开启时间
x808083_g_ActivityTime					= { {tstart=1230, tend=1330},
																	  {tstart=1930, tend=2030},
																	  {tstart=2130, tend=2230} }

-- 被传送到其他位置的随机数
x808083_g_GotoScenePosOdds			= 10
-- 奖励的物品
x808083_g_BonusItem 						= { {ItemID=30501002, Odds1=13,  Num=5},
																	  {ItemID=30505207, Odds1=19,  Num=1},
																	  {ItemID=30505208, Odds1=25,  Num=1},
																	  {ItemID=30505209, Odds1=40,  Num=1},
																	  {ItemID=30505210, Odds1=55,  Num=1},
																	  {ItemID=30505211, Odds1=70,  Num=1},
																	  {ItemID=30505212, Odds1=85,  Num=1},
																	  {ItemID=30505213, Odds1=100, Num=1} }

--需要的效果ID	火把使者
x808083_g_ImpactID 	= 5929

--孔明灯回收特效
x808083_g_ImpactID_LightOver = { 44, 45, 46 }

--效果的ID	如果玩家身上有 SelfimpactID,则使用 impactId01,否则使用 impactId02
x808083_g_itemList = {}
x808083_g_itemList[1] = { SelfimpactID=5933, impactId01=5936, impactId02=5935 }			-- 西瓜皮
x808083_g_itemList[2] = { SelfimpactID=5934, impactId01=5939, impactId02=0		}			-- 瞌睡虫
x808083_g_itemList[3] = { SelfimpactID=5933, impactId01=0,		impactId02=5937 }			-- 捕兽夹
x808083_g_itemList[4] = { SelfimpactID=5933, impactId01=0, 	 	impactId02=5938 }			-- 玩具蜈蚣
x808083_g_itemList[5] = { SelfimpactID=5933, impactId01=0, 	 	impactId02=5940 }			-- 马蜂窝

--群攻道具攻击范围
x808083_g_AttackRange = 5

-- 龟兔赛跑任务ID
x808083_g_MissionId =1000
x808083_g_MissItemId = 40004444				-- 任务物品
--任务是否完成
x808083_g_Mission_IsComplete = 0			--任务参数的第0位
-- 任务物品参数标记
x808083_g_LuoYangLighten_Cnt = 5			--孔明灯洛阳开启数量索引
x808083_g_SuZhouLighten_Cnt	 = 7			--孔明灯苏州开启数量索引
x808083_g_DaLiLighten_Cnt		 = 9			--孔明灯大理开启数量索引

--龟兔赛跑洛阳打卡标记
x808083_g_LuoYang_RecordIdx  = 1			--任务参数的第1位
--龟兔赛跑苏州打卡标记
x808083_g_SuZhou_RecordIdx 	 = 2			--任务参数的第2位
--龟兔赛跑大理打卡标记
x808083_g_DaLi_RecordIdx 		 = 3			--任务参数的第3位
--孔明灯完成数量标记
x808083_g_KongMing_Lighten	 = 4			--任务参数的第4位
--龟兔赛跑任务每天轮数标记
x808083_g_RoundIndex 				 = 7			--任务参数的第7位

-- 龟兔赛跑活动需要点燃的孔明灯总数
x808083_g_KongMing_CntMax		 = 24

-- 每轮活动每个场景需要刷出的孔明灯数量
x808083_g_KongMingLight_CntMax	=	{1, 1, 1, 1, 1, 1}

-- 每个场景每次刷新的孔明灯数量
x808083_g_KongMingLight_UpdateCnt = 10

-- 孔明灯中的任务物品ID
x808083_g_ItemBox_ItemID = 40004445

--**********************************
--脚本入口函数
--**********************************
function x808083_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--检测是否是活动时间....
	if 0 == x808083_CheckActivityTime() then
		return 0
	end
  
	for i=1, getn(x808083_g_KongMingLight_CntMax) do
		x808083_g_KongMingLight_CntMax[i] = 1
	end
	--开始刷新孔明灯....
	StartOneActivity( sceneId, actId, 30*1000, iNoticeType )

end

--**********************************
--心跳函数
--**********************************
function x808083_OnTimer( sceneId, actId, uTime )
	--检测活动是否过期....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
		return
	end

	x808083_DropKongMingLight( sceneId )

end

--**********************************
--检测当前是否是活动时间
--**********************************
function x808083_CheckActivityTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808083_g_ActivityTime) do
	  if curHourTime >= x808083_g_ActivityTime[i].tstart and curHourTime <= x808083_g_ActivityTime[i].tend then
	  	return i
	  end
	end

	return 0

end

--**********************************
--刷新孔明灯
--**********************************
function x808083_DropKongMingLight( sceneId )
	local nLightPosTbl = 0
	local nLightCnt = 0
	local nLightType = 782										-- 孔明灯类型
	if sceneId == 6 then
		nLightType = 782
		nLightPosTbl = x808083_g_PosTable_6			-- 无量山
	elseif sceneId == 5 then
		nLightType = 782
		nLightPosTbl = x808083_g_PosTable_5			-- 镜湖
	elseif sceneId == 4 then
		nLightType = 783
		nLightPosTbl = x808083_g_PosTable_4			-- 太湖
	elseif sceneId == 3 then
		nLightType = 783
		nLightPosTbl = x808083_g_PosTable_3			-- 嵩山
	elseif sceneId == 7 then
		nLightType = 784
		nLightPosTbl = x808083_g_PosTable_7			-- 剑阁
	elseif sceneId == 8 then
		nLightType = 784
		nLightPosTbl = x808083_g_PosTable_8			-- 敦煌
	else
		return 0
	end

	for i=1, x808083_g_KongMingLight_UpdateCnt do
	
		if sceneId == 6 then		
			nLightCnt = x808083_g_KongMingLight_CntMax[1]
		elseif sceneId == 5 then			
			nLightCnt = x808083_g_KongMingLight_CntMax[2]
		elseif sceneId == 4 then			
			nLightCnt = x808083_g_KongMingLight_CntMax[3]
		elseif sceneId == 3 then			
			nLightCnt = x808083_g_KongMingLight_CntMax[4]
		elseif sceneId == 7 then			
			nLightCnt = x808083_g_KongMingLight_CntMax[5]
		elseif sceneId == 8 then		
			nLightCnt = x808083_g_KongMingLight_CntMax[6]		
		end

		-- 检测本次孔明灯刷新数量
		if nLightCnt > x808083_g_KongMingLight_UpdateCnt then
			return 0
		end
		
		-- 如果活动时间已到则不刷新
		local nTimePoint = x808083_CheckActivityTime()
		local nHour	 = GetHour()
		local nMinute = GetMinute()
  	local curHourTime = nHour*100+nMinute
  			
  	if nTimePoint <= 0 then
  		return 0
  	end
  	
  	if curHourTime < x808083_g_ActivityTime[nTimePoint].tstart
  		 or curHourTime > x808083_g_ActivityTime[nTimePoint].tend then
  		return 0
  	end
  			
		local idx = random(getn(nLightPosTbl))
		local nPos = nLightPosTbl[idx]

		-- 投放任务物品
		local ItemBoxId = 0
		ItemBoxId = ItemBoxEnterScene( nPos.posX, nPos.posY, nLightType, sceneId, QUALITY_MUST_BE_CHANGE, 1, x808083_g_ItemBox_ItemID )
		
		-- 设置生存期
		local nHourTmp = floor(x808083_g_ActivityTime[nTimePoint].tend/100)
		local nMinuteTmp = mod(x808083_g_ActivityTime[nTimePoint].tend, 100)
		
		if nMinuteTmp < nMinute then
			nMinuteTmp = nMinuteTmp + 60
			nHourTmp = nHourTmp - 1
		end

		local nLifeTime = (nHourTmp - nHour)*3600000 + (nMinuteTmp - nMinute)*60*1000
		
		-- 异常处理
		if nLifeTime > 3600000 then
			nLifeTime = 3600000
		end
  	SetItemBoxMaxGrowTime( sceneId, ItemBoxId, nLifeTime )

		if sceneId == 6 then
			-- 无量山
			x808083_g_KongMingLight_CntMax[1] = x808083_g_KongMingLight_CntMax[1] + 1					
		elseif sceneId == 5 then
			-- 镜湖
			x808083_g_KongMingLight_CntMax[2] = x808083_g_KongMingLight_CntMax[2] + 1					
		elseif sceneId == 4 then
			-- 太湖
			x808083_g_KongMingLight_CntMax[3] = x808083_g_KongMingLight_CntMax[3] + 1					
		elseif sceneId == 3 then
			-- 嵩山
			x808083_g_KongMingLight_CntMax[4] = x808083_g_KongMingLight_CntMax[4] + 1					
		elseif sceneId == 7 then
			-- 剑阁
			x808083_g_KongMingLight_CntMax[5] = x808083_g_KongMingLight_CntMax[5] + 1					
		elseif sceneId == 8 then
			-- 敦煌
			x808083_g_KongMingLight_CntMax[6] = x808083_g_KongMingLight_CntMax[6] + 1
		end

	end

end

-- 拾取物品后记录龟兔赛跑任务信息
function x808083_RecordKongMingLightInfo( sceneId, selfId, targetId, nTargetX, nTargetZ )

	-- 检测是否有龟兔赛跑任务
	if IsHaveMission( sceneId, selfId, x808083_g_MissionId ) <= 0 then
		x808083_NotifyTip( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end

	-- 检测任务是否完成
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808083_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, x808083_g_Mission_IsComplete) > 0 then
		x808083_NotifyTip( sceneId, selfId, "#{GodFire_Info_038}" )
		return 0
	end
	
	-- 检测本轮活动时间是否有效
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		x808083_NotifyTip( sceneId, selfId, "#{GodFire_Info_017}" )
		return 0
	end
	
	local nActiveTime = x808083_CheckActivityTime()
	if nActiveTime ~= GetMissionParam(sceneId, selfId, misIndex, x808083_g_RoundIndex) then
		x808083_NotifyTip( sceneId, selfId, "#{GodFire_Info_024}" )
		return 0
	end
	
	-- 检测是否有任务物品
	if HaveItem(sceneId, selfId, x808083_g_MissItemId) <= 0 then
		x808083_NotifyTip( sceneId, selfId, "#{GodFire_Info_039}" )
		return 0
	end
	
	--设置孔明灯完成信息
	local BagPos = GetItemBagPos( sceneId, selfId, x808083_g_MissItemId, 0 )
	local LuoYangCnt = GetBagItemParam(sceneId, selfId, BagPos, x808083_g_LuoYangLighten_Cnt, 1)
	local SuZhouCnt = GetBagItemParam(sceneId, selfId, BagPos, x808083_g_SuZhouLighten_Cnt, 1)
	local DaLiCnt = GetBagItemParam(sceneId, selfId, BagPos, x808083_g_DaLiLighten_Cnt, 1)
	local	nAllCount = GetMissionParam(sceneId, selfId, misIndex, x808083_g_KongMing_Lighten)

	local nLightPosTbl = 0

	if sceneId == 6 then
		nLightPosTbl = x808083_g_PosTable_6			-- 无量山
		x808083_g_KongMingLight_CntMax[1] = x808083_g_KongMingLight_CntMax[1] - 1
		SetBagItemParam(sceneId, selfId, BagPos, x808083_g_DaLiLighten_Cnt, 1, DaLiCnt+1)
		
		-- 点燃孔明灯成功后的特效
	 	CreateSpecialObjByDataIndex(sceneId, selfId, x808083_g_ImpactID_LightOver[1], nTargetX, nTargetZ, 0)
	elseif sceneId == 5 then
		nLightPosTbl = x808083_g_PosTable_5			-- 镜湖
		x808083_g_KongMingLight_CntMax[2] = x808083_g_KongMingLight_CntMax[2] - 1
		SetBagItemParam(sceneId, selfId, BagPos, x808083_g_DaLiLighten_Cnt, 1, DaLiCnt+1)
		
		-- 点燃孔明灯成功后的特效
	 	CreateSpecialObjByDataIndex(sceneId, selfId, x808083_g_ImpactID_LightOver[1], nTargetX, nTargetZ, 0)
	elseif sceneId == 4 then
		nLightPosTbl = x808083_g_PosTable_4			-- 太湖
		x808083_g_KongMingLight_CntMax[3] = x808083_g_KongMingLight_CntMax[3] - 1
		SetBagItemParam(sceneId, selfId, BagPos, x808083_g_SuZhouLighten_Cnt, 1, SuZhouCnt+1)
		
		-- 点燃孔明灯成功后的特效
	 	CreateSpecialObjByDataIndex(sceneId, selfId, x808083_g_ImpactID_LightOver[2], nTargetX, nTargetZ, 0)
	elseif sceneId == 3 then
		nLightPosTbl = x808083_g_PosTable_3			-- 嵩山
		x808083_g_KongMingLight_CntMax[4] = x808083_g_KongMingLight_CntMax[4] - 1
		SetBagItemParam(sceneId, selfId, BagPos, x808083_g_SuZhouLighten_Cnt, 1, SuZhouCnt+1)
		
		-- 点燃孔明灯成功后的特效
	 	CreateSpecialObjByDataIndex(sceneId, selfId, x808083_g_ImpactID_LightOver[2], nTargetX, nTargetZ, 0)
	elseif sceneId == 7 then
		nLightPosTbl = x808083_g_PosTable_7			-- 剑阁
		x808083_g_KongMingLight_CntMax[5] = x808083_g_KongMingLight_CntMax[5] - 1
		SetBagItemParam(sceneId, selfId, BagPos, x808083_g_LuoYangLighten_Cnt, 1, LuoYangCnt+1)
		
		-- 点燃孔明灯成功后的特效
	 	CreateSpecialObjByDataIndex(sceneId, selfId, x808083_g_ImpactID_LightOver[3], nTargetX, nTargetZ, 0)
	elseif sceneId == 8 then
		nLightPosTbl = x808083_g_PosTable_8			-- 敦煌
		x808083_g_KongMingLight_CntMax[6] = x808083_g_KongMingLight_CntMax[6] - 1
		SetBagItemParam(sceneId, selfId, BagPos, x808083_g_LuoYangLighten_Cnt, 1, LuoYangCnt+1)
		
		-- 点燃孔明灯成功后的特效
	 	CreateSpecialObjByDataIndex(sceneId, selfId, x808083_g_ImpactID_LightOver[3], nTargetX, nTargetZ, 0)
	else
		return 0
	end
	
	nAllCount = nAllCount + 1
	SetMissionByIndex(sceneId, selfId, misIndex, x808083_g_KongMing_Lighten, nAllCount)
	
	-- 检测任务是否完成
	if GetMissionParam(sceneId, selfId, misIndex, x808083_g_LuoYang_RecordIdx) == 1
		 and GetMissionParam(sceneId, selfId, misIndex, x808083_g_SuZhou_RecordIdx) == 1
		 and GetMissionParam(sceneId, selfId, misIndex, x808083_g_DaLi_RecordIdx) == 1
		 and nAllCount >= x808083_g_KongMing_CntMax then

			-- 任务完成
			SetMissionByIndex( sceneId, selfId, misIndex, x808083_g_Mission_IsComplete, 1 )
			x808083_NotifyTip( sceneId, selfId, "#{GodFire_Info_028}" )
		
	end
	
	-- 进行奖罚处理
	-- 奖励经验
	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808083_g_KongMingLight_EXP[playerlvl]
	LuaFnAddExp( sceneId, selfId, nExpNum )
	
	local	nMessageStr1 = ""
	local	nMessageStr2 = ""
	local nRandOdds = random(100)
	
	if nRandOdds <= x808083_g_GotoScenePosOdds then
		-- 传送
		local nidx = random(getn(nLightPosTbl))
		local nScenePosTmp1 = nLightPosTbl[nidx]		
		nMessageStr1 = "#{GodFire_Info_040}"
		nMessageStr2 = "#{GodFire_Info_041}"

		SetPos( sceneId, selfId, nScenePosTmp1.posX, nScenePosTmp1.posY )
	else
		for i, nItemList in x808083_g_BonusItem do
			if nRandOdds <= nItemList.Odds1 then
				-- 检测背包空间
				if LuaFnGetPropertyBagSpace( sceneId, selfId ) < nItemList.Num then
					x808083_NotifyTip( sceneId, selfId, "#{stall_package_full}" )		
					return 0
				end
				
				-- 给予奖励物品
				BeginAddItem(sceneId)
				AddItem(sceneId,nItemList.ItemID, nItemList.Num)
				local canAdd = EndAddItem(sceneId,selfId)						
				if canAdd > 0 then
					AddItemListToHuman(sceneId,selfId)
				end
				
				if nItemList.ItemID == x808083_g_BonusItem[1].ItemID then
					nMessageStr1 = "#{GodFire_Info_042}"
					nMessageStr2 = "#{GodFire_Info_043}"
				elseif nItemList.ItemID == x808083_g_BonusItem[2].ItemID then
					nMessageStr1 = "#{GodFire_Info_044}"
					nMessageStr2 = "#{GodFire_Info_045}"
				elseif nItemList.ItemID == x808083_g_BonusItem[3].ItemID then
					nMessageStr1 = "#{GodFire_Info_046}"
					nMessageStr2 = "#{GodFire_Info_047}"
				elseif nItemList.ItemID == x808083_g_BonusItem[4].ItemID then
					nMessageStr1 = "#{GodFire_Info_048}"
					nMessageStr2 = "#{GodFire_Info_049}"
					
					-- 检测被攻击者Impact
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808083_g_itemList[1].SelfimpactID) ~= 0 then
						if x808083_g_itemList[1].impactId01 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[1].impactId01, 0);
						end
					else
						if x808083_g_itemList[1].impactId02 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[1].impactId02, 0);
						end
					end
				elseif nItemList.ItemID == x808083_g_BonusItem[5].ItemID then
					nMessageStr1 = "#{GodFire_Info_054}"
					nMessageStr2 = "#{GodFire_Info_055}"
					
					-- 检测被攻击者Impact
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808083_g_itemList[2].SelfimpactID) ~= 0 then
						if x808083_g_itemList[2].impactId01 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[2].impactId01, 0);
						end
					else
						if x808083_g_itemList[2].impactId02 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[2].impactId02, 0);
						end
					end
					
				elseif nItemList.ItemID == x808083_g_BonusItem[6].ItemID then
					nMessageStr1 = "#{GodFire_Info_050}"
					nMessageStr2 = "#{GodFire_Info_051}"
					
					-- 检测被攻击者Impact
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808083_g_itemList[3].SelfimpactID) ~= 0 then
						if x808083_g_itemList[3].impactId01 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[3].impactId01, 0);
						end
					else
						if x808083_g_itemList[3].impactId02 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[3].impactId02, 0);
						end
					end
					
				elseif nItemList.ItemID == x808083_g_BonusItem[7].ItemID then
					nMessageStr1 = "#{GodFire_Info_052}"
					nMessageStr2 = "#{GodFire_Info_053}"
					
					-- 检测被攻击者Impact
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808083_g_itemList[4].SelfimpactID) ~= 0 then
						if x808083_g_itemList[4].impactId01 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[4].impactId01, 0);
						end
					else
						if x808083_g_itemList[4].impactId02 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808083_g_itemList[4].impactId02, 0);
						end
					end
					
				elseif nItemList.ItemID == x808083_g_BonusItem[8].ItemID then
					nMessageStr1 = "#{GodFire_Info_056}"
					nMessageStr2 = "#{GodFire_Info_057}"					
					
					--取得被攻击者的当前坐标	
					local PlayerX = GetHumanWorldX(sceneId,selfId)
					local PlayerY = GetHumanWorldZ(sceneId,selfId)
					
					-- 遍历场景中所有玩家,并给与被攻击者攻击范围内的玩家加Impact
					local nPlayerCnt = LuaFnGetCopyScene_HumanCount( sceneId )
					for j=0, nPlayerCnt-1 do
						local OtherPlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, j )
						--取得被攻击者周围其他玩家的当前坐标	
						local OtherPlayerX = GetHumanWorldX(sceneId,OtherPlayerId)
						local OtherPlayerY = GetHumanWorldZ(sceneId,OtherPlayerId)
						
						local Distance = floor(sqrt((OtherPlayerX-PlayerX)*(OtherPlayerX-PlayerX)+(OtherPlayerY-PlayerY)*(OtherPlayerY-PlayerY)))
						if Distance < x808083_g_AttackRange then
							
							-- 检测被攻击者周围其他玩家Impact
							if IsHaveMission( sceneId, OtherPlayerId, x808083_g_MissionId ) > 0
								 and LuaFnHaveImpactOfSpecificDataIndex(sceneId, OtherPlayerId, x808083_g_ImpactID) ~= 0 then									
								if LuaFnHaveImpactOfSpecificDataIndex(sceneId, OtherPlayerId, x808083_g_itemList[5].SelfimpactID) ~= 0 then
									if x808083_g_itemList[5].impactId01 ~= 0 then
										LuaFnSendSpecificImpactToUnit(sceneId, OtherPlayerId, OtherPlayerId, OtherPlayerId, x808083_g_itemList[5].impactId01, 0);
									end
								else
									if x808083_g_itemList[5].impactId02 ~= 0 then
										LuaFnSendSpecificImpactToUnit(sceneId, OtherPlayerId, OtherPlayerId, OtherPlayerId, x808083_g_itemList[5].impactId02, 0);
									end
								end
							end
						end			
					end
				end
				break
			end
		end
	end
	
	-- 系统公告
	BroadMsgByChatPipe( sceneId, selfId, nMessageStr1, 8 )
	
	-- 醒目提示
	x808083_NotifyTip( sceneId, selfId, nMessageStr2 )	
	return 1
end

--**********************************
--醒目提示
--**********************************
function x808083_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

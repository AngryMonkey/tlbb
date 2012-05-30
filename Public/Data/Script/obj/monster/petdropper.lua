 -- 怪物掉落脚本

 -- 脚本编号
x501000_g_ScriptId = 501000

 -- 随机因子
x501000_g_RandNum = 10000

 -- 宠物的存活时间，3分钟
x501000_g_Lifecycle = 180000

 -- 宠物掉落表
x501000_g_PetDropList = {}

 -- 怪物号为索引
 -- dropOdds: 宠物掉落率
 -- petList 是可能掉落的宠物列表
 -- oddsList 是 petList 中相应的宠物的掉落权重
 
 -- doing 28833 by alan 2007.12.4
 -- 允许一种怪掉多种类型的宠
 -- petTypeOdds 是各类型的宠的掉落权重，只有一种宠时不需要指定，此列表中有N个值时，必须同时指定从petList2到petListN的相应宠物表
 -- petList2 是第2种类型的宠物列表，仅在petTypeOdds中有2个以上值时起作用
 -- petList3 是第3种类型的宠物列表，仅在petTypeOdds中有3个以上值时起作用
 -- petListN 是第N种类型的宠物列表，仅在petTypeOdds中有N个以上值时起作用
 
 --修改后只有一种宠时格式与原来一样，下面是两种宠的例子：
 --x501000_g_PetDropList[3000] = {
 -- dropOdds = 1521,
 -- petList = { 3000, 3009, 3001 },
 -- oddsList = { 100000,49706,2485 },
 -- petTypeOdds = { 100,200 },
 -- petList2 = {6700, 6709, 6701, 6702, 6703, 6704, 6705},
 --}

x501000_g_PetDropList[3000] = {
 dropOdds = 1521,
 petList = { 3000, 3009, 3001 },
 oddsList = { 100000,49706,2485 },
}
x501000_g_PetDropList[3010] = {
 dropOdds = 1521,
 petList = { 3010, 3019, 3011 },
 oddsList = { 100000,49706,2485 },
}
x501000_g_PetDropList[3020] = {
 dropOdds = 1521,
 petList = { 3020, 3029, 3021 },
 oddsList = { 100000,49706,2485 },
}
x501000_g_PetDropList[3030] = {
 dropOdds = 1513,
 petList = { 3030, 3039, 3031 },
 oddsList = { 100000,48890,2444 },
}
x501000_g_PetDropList[3040] = {
 dropOdds = 1513,
 petList = { 3040, 3049, 3041 },
 oddsList = { 100000,48890,2444 },
}
x501000_g_PetDropList[3050] = {
 dropOdds = 1513,
 petList = { 3050, 3059, 3051 },
 oddsList = { 100000,48890,2444 },
}
x501000_g_PetDropList[3060] = {
 dropOdds = 1499,
 petList = { 3060, 3069, 3061 , 3062 },
 oddsList = { 100000,47526,2376 },
}
x501000_g_PetDropList[3070] = {
 dropOdds = 1499,
 petList = { 3070, 3079, 3071 , 3072 },
 oddsList = { 100000,47526,2376 },
}
x501000_g_PetDropList[3490] = {
 dropOdds = 1499,
 petList = { 3490, 3499, 3491, 3492 },
 oddsList = { 100000,47526,2376 },
}
x501000_g_PetDropList[3080] = {
 dropOdds = 1499,
 petList = { 3080, 3089, 3081 , 3082 },
 oddsList = { 100000,47526,2376 },
}
x501000_g_PetDropList[3090] = {
 dropOdds = 1471,
 petList = { 3090, 3099, 3091 , 3092 },
 oddsList = { 100000,44911,2245 },
}
x501000_g_PetDropList[3100] = {
 dropOdds = 1471,
 petList = { 3100, 3109, 3101 , 3102 },
 oddsList = { 100000,44911,2245 },
}
x501000_g_PetDropList[3110] = {
 dropOdds = 1471,
 petList = { 3110, 3119, 3111 , 3112 },
 oddsList = { 100000,44911,2245 },
}
x501000_g_PetDropList[3120] = {
 dropOdds = 1471,
 petList = { 3120, 3129, 3121 , 3122 },
 oddsList = { 100000,44911,2245 },
}
x501000_g_PetDropList[3130] = {
 dropOdds = 1412,
 petList = { 3130, 3139, 3131 , 3132 , 3133 },
 oddsList = { 100000,39304,1965 },
}
x501000_g_PetDropList[3140] = {
 dropOdds = 1412,
 petList = { 3140, 3149, 3141 , 3142 , 3143 },
 oddsList = { 100000,39304,1965 },
}
x501000_g_PetDropList[3150] = {
 dropOdds = 1412,
 petList = { 3150, 3159, 3151 , 3152 , 3153 },
 oddsList = { 100000,39304,1965 },
}
x501000_g_PetDropList[3160] = {
 dropOdds = 1412,
 petList = { 3160, 3169, 3161 , 3162 , 3163 },
 oddsList = { 100000,39304,1965 },
}
x501000_g_PetDropList[3170] = {
 dropOdds = 1322,
 petList = { 3170, 3179, 3171 , 3172 , 3173 , 3174 },
 oddsList = { 100000,30695,1534 },
}
x501000_g_PetDropList[3180] = {
 dropOdds = 1322,
 petList = { 3180, 3189, 3181 , 3182 , 3183 , 3184 },
 oddsList = { 100000,30695,1534 },
}
x501000_g_PetDropList[3190] = {
 dropOdds = 1322,
 petList = { 3190, 3199, 3191 , 3192 , 3193 , 3194 },
 oddsList = { 100000,30695,1534 },
}
x501000_g_PetDropList[3200] = {
 dropOdds = 1322,
 petList = { 3200, 3209, 3201 , 3202 , 3203 , 3204 },
 oddsList = { 100000,30695,1534 },
}
x501000_g_PetDropList[3210] = {
 dropOdds = 1263,
 petList = { 3210, 3219, 3211 , 3212 , 3213 , 3214 , 3215 },
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3220] = {
 dropOdds = 1263,
 petList = { 3220, 3229, 3221 , 3222 , 3223 , 3224 , 3225 },
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3230] = {
 dropOdds = 1263,
 petList = { 3230, 3239, 3231 , 3232 , 3233 , 3234 , 3235 },
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3240] = {
 dropOdds = 1263,
 petList = { 3240, 3249, 3241 , 3242 , 3243 , 3244 , 3245 },
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3250] = {
 dropOdds = 1235,
 petList = { 3250, 3259, 3251 , 3252 , 3253 , 3254 , 3255 , 3256 },
 oddsList = { 100000,22473,1123 },
}
x501000_g_PetDropList[3260] = {
 dropOdds = 1235,
 petList = { 3260, 3269, 3261 , 3262 , 3263 , 3264 , 3265 , 3266 },
 oddsList = { 100000,22473,1123 },
}
x501000_g_PetDropList[3270] = {
 dropOdds = 1235,
 petList = { 3270, 3279, 3271 , 3272 , 3273 , 3274 , 3275 , 3276 },
 oddsList = { 100000,22473,1123 },
}
x501000_g_PetDropList[3280] = {
 dropOdds = 1235,
 petList = { 3280, 3289, 3281 , 3282 , 3283 , 3284 , 3285 , 3286 },
 oddsList = { 100000,22473,1123 },
}
x501000_g_PetDropList[3290] = {
 dropOdds = 1221,
 petList = { 3290, 3299, 3291 , 3292 , 3293 , 3294 , 3295 , 3296 , 3297 },
 oddsList = { 100000,21109,1055 },
}
x501000_g_PetDropList[3300] = {
 dropOdds = 1221,
 petList = { 3300, 3309, 3301 , 3302 , 3303 , 3304 , 3305 , 3306 , 3307 },
 oddsList = { 100000,21109,1055 },
}
x501000_g_PetDropList[3310] = {
 dropOdds = 1221,
 petList = { 3310, 3319, 3311 , 3312 , 3313 , 3314 , 3315 , 3316 , 3317 },
 oddsList = { 100000,21109,1055 },
}
x501000_g_PetDropList[3320] = {
 dropOdds = 1221,
 petList = { 3320, 3329, 3321 , 3322 , 3323 , 3324 , 3325 , 3326 , 3327 },
 oddsList = { 100000,21109,1055 },
}
x501000_g_PetDropList[3330] = {
 dropOdds = 1213,
 petList = { 3330, 3339, 3331 , 3332 , 3333 , 3334 , 3335 , 3336 , 3337 , 3338 },
 oddsList = { 100000,20293,1014 },
}
x501000_g_PetDropList[3340] = {
 dropOdds = 1213,
 petList = { 3340, 3349, 3341 , 3342 , 3343 , 3344 , 3345 , 3346 , 3347 , 3348 },
 oddsList = { 100000,20293,1014 },
}
x501000_g_PetDropList[558] = {
 dropOdds = 10000,
 petList = { 558 },
 oddsList = { 1000000 },
}
x501000_g_PetDropList[559] = {
 dropOdds = 10000,
 petList = { 559 },
 oddsList = { 1000000 },
}
x501000_g_PetDropList[3420] = {
 dropOdds = 1471,
 petList = { 3420, 3429, 3421, 3422},
 oddsList = { 100000,44911,2245 },
}
x501000_g_PetDropList[3430] = {
 dropOdds = 1235,
 petList = { 3430, 3439, 3431 , 3432 , 3433 , 3434 , 3435 , 3436 },
 oddsList = { 100000,22473,1123 },
}
x501000_g_PetDropList[3470] = {
 dropOdds = 1235,
 petList = { 3470, 3479, 3471 , 3472 , 3473 , 3474 , 3475 , 3476 },
 oddsList = { 100000,22473,1123 },
}
x501000_g_PetDropList[6570] = {
 dropOdds = 1471,
 petList = { 6570, 6579, 6571, 6572, 6573},
 oddsList = { 100000,39304,1965 },
}
x501000_g_PetDropList[6580] = {
 dropOdds = 1471,
 petList = { 6580, 6589, 6581, 6582, 6583, 6584},
 oddsList = { 100000,30695,1534 },
}
x501000_g_PetDropList[6590] = {
 dropOdds = 1471,
 petList = { 6590, 6599, 6591, 6592, 6593, 6594, 6595},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[8550] = {
 dropOdds = 556,
 petList = { 6600, 6609, 6601, 6602, 6603, 6604},
 oddsList = { 100000,30695,1534 },
 petTypeOdds = { 100,100 },
 petList2 = {8630, 8639, 8631, 8632, 8633, 8634},
}
x501000_g_PetDropList[8551] = {
 dropOdds = 111,
 petList = { 6610, 6619, 6611, 6612, 6613, 6614, 6615, 6616},
 oddsList = { 100000,22473,1123 },
 petTypeOdds = { 100,100 },
 petList2 = {8640, 8649, 8641, 8642, 8643, 8644, 8645, 8646},
}
x501000_g_PetDropList[8552] = {
 dropOdds = 278,
 petList = { 6620, 6629, 6621, 6622, 6623, 6624, 6625},
 oddsList = { 100000,25088,1254 },
 petTypeOdds = { 100,100 },
 petList2 = {8650, 8659, 8651, 8652, 8653, 8654, 8655},
}
x501000_g_PetDropList[8553] = {
 dropOdds = 111,
 petList = { 6630, 6639, 6631, 6632, 6633, 6634, 6635, 6636},
 oddsList = { 100000,22473,1123 },
 petTypeOdds = { 100,100 },
 petList2 = {8660, 8669, 8661, 8662, 8663, 8664, 8665, 8666},
}
x501000_g_PetDropList[3823] = {
 dropOdds = 5000,
 petList = { 6680, 6689, 6681, 6682, 6683,},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3824] = {
 dropOdds = 5000,
 petList = { 6690, 6699, 6691, 6692, 6693, 6694},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3825] = {
 dropOdds = 5000,
 petList = { 6700, 6709, 6701, 6702, 6703, 6704, 6705},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3826] = {
 dropOdds = 5000,
 petList = { 6710, 6719, 6711, 6712, 6713, 6714, 6715, 6716},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3827] = {
 dropOdds = 5000,
 petList = { 6710, 6719, 6711, 6712, 6713, 6714, 6715, 6716},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3828] = {
 dropOdds = 5000,
 petList = { 6710, 6719, 6711, 6712, 6713, 6714, 6715, 6716},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[3829] = {
 dropOdds = 5000,
 petList = { 6710, 6719, 6711, 6712, 6713, 6714, 6715, 6716},
 oddsList = { 100000,25088,1254 },
}
x501000_g_PetDropList[11353] = {
 dropOdds = 10000,
 petList = { 3310, 3310, 3310 },
 oddsList = { 100000,49706,2485 },
}
 
x501000_g_PetDropList[13280] = {
 dropOdds = 225,
 petList = { 8180, 8189, 8181, 8182, 8183, 8184, 8185, 8186},
 oddsList = { 100000,10000,2500 },
}

x501000_g_PetDropList[13281] = {
 dropOdds = 225,  --225
 petList = { 3290, 3299, 3291, 3292, 3293, 3294, 3295, 3296},
 oddsList = { 100000,10000,2500 },
}
 
function x501000_OnDie(sceneId, objId, killerId)
	if not sceneId or not objId or objId < 0 or not killerId or killerId < 0 then
		return
	end

	local petDropInfo = x501000_g_PetDropList[ GetMonsterDataID( sceneId, objId ) ]
	if not petDropInfo then      -- 没有这种类型的怪物配置信息
		return
	end
	
	local rand = random( x501000_g_RandNum )
	if rand > petDropInfo.dropOdds then   -- 几率不够，没有宠物掉落
		return
	end

 	-- doing 28833 by alan 2007.12.4
 	-- 修改为允许一种怪打出多种类型的宠
 	
 	--复制的权重表
 	local oddsList = {}
	
	for index,value in petDropInfo.oddsList do
		oddsList[index]=value
	end
		
	local petType = 1
	if petDropInfo.petTypeOdds then
		local typeCount = getn(petDropInfo.petTypeOdds)
		rand = 0
		for i = 1,typeCount do
			rand = rand + petDropInfo.petTypeOdds[i];
		end
			
		rand = random( rand )
		
		for i = 1, typeCount do
			if petDropInfo.petTypeOdds[i] >= rand then
				petType = i
				break
			else
				rand = rand - petDropInfo.petTypeOdds[i]
			end
		end
	end
	
	--选中宠物类型的宠物表
	local petList = petDropInfo.petList
	if petType > 1 then
		petList = petDropInfo["petList"..tostring(petType)]
	end
		
	local petCount = getn( petList )
	if not petCount or petCount < 1  then
		return         -- 对数据非法进行容错
	end

	local petDataID = -1

	-- 计算变异宠物的权重
	if 4<=petCount then
		local AlienPetPower = { 2448,803,263,86,28,9,3,1}
		local AlienPetTypePower = oddsList[3]
		local AlienPetPowerSum =0
 
		for i = 1, petCount-2 do
			AlienPetPowerSum=AlienPetPowerSum+AlienPetPower[i]
		end 

		local nPro = AlienPetTypePower/AlienPetPowerSum
  
		for i = 3, petCount do
			oddsList[i] = nPro * AlienPetPower[i-2]
		end
	end

	-- 重新计算随机因子
	rand = 0
	for i = 1, petCount do
		rand = rand + oddsList[i]
	end 

	rand = random( rand )     -- 重新进行一次随机，以判断出哪种类型的宠物
  
	for i = 1, petCount do
		if oddsList[i] >= rand then
			petDataID = petList[i]
			break
		else
			rand = rand - oddsList[i]
		end
	end

	if not petDataID or petDataID == -1 then
		return
	end

	-- 生成一个宠物
	local posX, posZ = LuaFnGetWorldPos(sceneId, objId);
	if not posX or not posZ or posX < 0 or posZ < 0 then
		return 
	end

	local petObjID = CreatePetOnScene(sceneId, petDataID, posX, posZ);
	if not petObjID or petObjID < 0 then
		return 
	end

	-- 设置宠物的捕捉保护时间
	local occupantGuid = LuaFnGetOccupantGUID(sceneId, objId);
	if not occupantGuid or occupantGuid < 0 then
		if killerId and killerId > -1 then
			local nObjType = GetCharacterType(sceneId, killerId);
			if nObjType then
				local nHumanId = -1;
				if nObjType == 1 then
					nHumanId = killerId;
				elseif nObjType == 3 then
					nHumanId = GetPetCreator(sceneId, killerId);
				end
				
				if nHumanId and nHumanId ~= -1 then
					occupantGuid = LuaFnGetGUID(sceneId, nHumanId);
				end
			end
		end
	end

	if not occupantGuid or occupantGuid < 0 then
		occupantGuid = -1;
	end

	SetPetCaptureProtect(sceneId, petObjID, occupantGuid);

	-- 设置宠物的存活时间
	SetCharacterDieTime(sceneId, petObjID, x501000_g_Lifecycle);

	LuaFnAuditPetCreate(sceneId, occupantGuid, petDataID);
end

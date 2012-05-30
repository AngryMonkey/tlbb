--结婚花娇（高级）

--脚本号 （改成正确脚本号）

x800201_g_scriptId = 800201

x800201_g_scriptParamIndex_xibao = 0;		--喜包时间
x800201_g_scriptParamIndex_xibao_TI = 1;	--喜包发放的时间间隔
x800201_g_scriptParamIndex_lihua = 2;		--礼花时间
x800201_g_scriptParamIndex_lihua_TI = 3;	--礼花发放的时间间隔

x800201_g_timeInterval_xibao = 1000 * 15;	--标准喜包发放的时间间隔
x800201_g_timeInterval_lihua = 1000 * 3;	--标准礼花发放的时间间隔
x800201_g_maxXibaoCount = 8;							--每次的喜包数量

x800201_g_itemBoxPos_dropRange_min = 2;			--喜包的掉落范围
x800201_g_itemBoxPos_dropRange_max = 4;			--喜包的掉落范围


x800201_g_gemDropRate = 2;					--出宝石权重(x%)

x800201_g_medicineDropCount_min = 1;		--出药品的最小数目
x800201_g_medicineDropCount_max = 5;		--出药品的最大数目


--喜包等级	出宝石权重	开出药的权重	瞬补药的级别	药的数量
--低级	0.01	0.99	rand（5，9）	rand（1，3）
--中级	0.02	0.98	rand（5，9）	rand（1，4）
--高级	0.03	0.97	rand（5，9）	rand（1，5）

--药品表
x800201_g_itemList = {{id=30001011, rate=10},
					{id=30001012, rate=10},
					{id=30001013, rate=10},
					{id=30001014, rate=10},
					{id=30001015, rate=10},
					{id=30002011, rate=10},
					{id=30002012, rate=10},
					{id=30002013, rate=10},
					{id=30002014, rate=10},
					{id=30002015, rate=10}}
					
--宝石表
x800201_g_gemList = {{id=50101001, rate=25},
					{id=50101002, rate=25},
					{id=50111001, rate=25},
					{id=50111002, rate=25}};
					
--烟花表
x800201_g_effectList = {4930, 4931, 4932, 4933, 4934, 4935, 4936, 4937, 4938, 4939};

function x800201_OnInit(sceneId, busId)
	LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao, 0);
	LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao_TI, x800201_g_timeInterval_xibao);
	LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua, 0);
	LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua_TI, x800201_g_timeInterval_lihua);
end

function x800201_OnTimer(sceneId, busId, elapseTime)
	if elapseTime then
	else
		return 0;
	end
	
	local saveXibaoTime = LuaFnGetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao);
	local saveXibaoTimeInterval = LuaFnGetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao_TI);
	if saveXibaoTime and saveXibaoTimeInterval then
		saveXibaoTime = saveXibaoTime + elapseTime;
		if saveXibaoTime >= saveXibaoTimeInterval then
			local i;
			for i = 1, x800201_g_maxXibaoCount do
				x800201_CreateXibao(sceneId, busId);
			end
			LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao, 0);
			LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao_TI, x800201_g_timeInterval_xibao);
		else
			LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_xibao, saveXibaoTime);
		end;
	end
	
	local saveLihuaTime = LuaFnGetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua);
	local saveLihuaTimeInterval = LuaFnGetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua_TI);
	if saveLihuaTime and saveLihuaTimeInterval then
		saveLihuaTime = saveLihuaTime + elapseTime;
		if saveLihuaTime >= saveLihuaTimeInterval then
			x800201_CreateLihua(sceneId, busId);
			LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua, 0);
			LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua_TI, x800201_g_timeInterval_lihua);
		else
			LuaFnSetBusScriptParam(sceneId, busId, x800201_g_scriptParamIndex_lihua, saveLihuaTime);
		end;
	end
end

function x800201_CreateXibao(sceneId, busId)
	local posX, posZ = GetWorldPos(sceneId, busId);
	if posX and posZ then
		local posRange = x800201_g_itemBoxPos_dropRange_max - x800201_g_itemBoxPos_dropRange_min;
		local randX = random(posRange + posRange) - posRange - 1;
		local randZ = random(posRange + posRange) - posRange - 1;
		
		if randX < 0 then
			randX = randX - x800201_g_itemBoxPos_dropRange_min;
		end
		
		if randZ < 0 then
			randZ = randZ - x800201_g_itemBoxPos_dropRange_min;
		end
		
		posX = posX + randX;
		posZ = posZ + randZ;
		itemBoxId = LuaFnItemBoxEnterSceneEx(sceneId, posX, posZ, 774, 60000);
		if itemBoxId and itemBoxId ~= -1 then
			local randValue = random(100) - 1;
			if randValue < x800201_g_gemDropRate then
				local gem, totalRate;
				totalRate = 0;
				for _, gem in x800201_g_gemList do
					totalRate = totalRate + gem.rate;
				end
				
				local randRate = random(totalRate) - 1;
				local tempRate = 0;
				for _, gem in x800201_g_gemList do
					tempRate = tempRate + gem.rate;
					if tempRate > randRate then
						AddItemToBox(sceneId, itemBoxId, QUALITY_MUST_BE_CHANGE, 1, gem.id);
						break;
					end
				end
			else
				local item, totalRate;
				totalRate = 0;
				for _, item in x800201_g_itemList do
					totalRate = totalRate + item.rate;
				end
				
				local randItemCount = random(x800201_g_medicineDropCount_max - x800201_g_medicineDropCount_min) + x800201_g_medicineDropCount_min - 1;
				
				local i, randRate;
				for i = 0, randItemCount - 1 do
					randRate = random(totalRate) - 1;
					local tempRate = 0;
					for _, item in x800201_g_itemList do
						tempRate = tempRate + item.rate;
						if tempRate > randRate then
							AddItemToBox(sceneId, itemBoxId, QUALITY_MUST_BE_CHANGE, 1, item.id);
							break;
						end
					end
				end
			end
		end
	end
end

function x800201_CreateLihua(sceneId, busId)
	local numPassenger = LuaFnGetBusPassengerCount(sceneId, busId);
	if numPassenger and numPassenger > 0 then
		local randIndex = random(numPassenger);
		local showEffectObjID = LuaFnGetBusPassengerIDByIndex(sceneId, busId, randIndex);
		if showEffectObjID and showEffectObjID ~= -1 then
			local numEffect = getn(x800201_g_effectList);
			local randEffect = random(numEffect);
			LuaFnSendSpecificImpactToUnit(sceneId, showEffectObjID, showEffectObjID, showEffectObjID, x800201_g_effectList[randEffect], 0);
		end
	end
end


--选择植物的脚本

--脚本号
x713550_g_scriptId = 713550


--**********************************
--任务入口函数
--**********************************
function x713550_OnDefaultEvent( sceneId, selfId, targetId, zhiwuId )
	local num =0
	--判断种植牌的位置
	local PlantFlag_X
	local PlantFlag_Z
	PlantFlag_X,PlantFlag_Z =  GetWorldPos(sceneId,targetId)	--得到npc坐标
	PlantFlag_X = floor(PlantFlag_X)
	PlantFlag_Z = floor(PlantFlag_Z)

	for i, findid in PLANTNPC_ADDRESS do
		if	((PlantFlag_X ==  findid.X)  and (PlantFlag_Z == findid.Z) and (sceneId == findid.Scene)) then
			num = i
			break
		end
	end
	--如果没找到对应位置
	if num == 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "水土流失，请爱护大自然！")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--如果土地不是闲置状态
	if	PLANTFLAG[num] ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "土地已被种植，请过一会儿再来吧！")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	--如果活力不足
	x713550_g_energy = GetHumanEnergy(sceneId,selfId)
	--查找植物等级
	local level_Index
	if zhiwuId >= getn(V_ZHONGZHI_ID) then
		level_Index = zhiwuId-getn(V_ZHONGZHI_NAME)/2
	else
		level_Index = zhiwuId
	end

	x713550_g_ZhiWuLevel = V_ZHONGZHI_NEEDLEVEL[level_Index]

	local EnergyCost = CallScriptFunction( ABILITYLOGIC_ID, "CalcEnergyCostCaiJi", sceneId, selfId, ABILITY_ZHONGZHI, x713550_g_ZhiWuLevel )
	if x713550_g_energy < EnergyCost then
		BeginEvent(sceneId)
			AddText(sceneId, "你的精力不足!")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	--判断玩家是否在N分钟内种植了，如果在N分钟内种植了，则不允许再种，超过N分钟则可以
	--missiondata默认值是0，重新启动服务器不会变
	local CurrentTime = LuaFnGetCurrentTime()
	local MissionData = GetMissionData(sceneId,selfId,MD_ZHONGZHI_TIME)
	local Zhongzhi_Flag =  GetMissionData(sceneId,selfId,MD_ZHONGZHI_FLAG)
	local WaitTime
	if (Zhongzhi_Flag == 1 and (CurrentTime - MissionData) <= 300) or
		(Zhongzhi_Flag == 2 and (CurrentTime - MissionData) <= 4200) then
		if Zhongzhi_Flag == 1 then
			WaitTime = 300 - (CurrentTime - MissionData)
		else
			WaitTime = 4200 - (CurrentTime - MissionData)
		end
		
		WaitTime = floor(WaitTime/60)
		BeginEvent(sceneId)
			AddText(sceneId, "不能连续种植，大约"..WaitTime.."分钟后可以再次种植。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--统计数据
	LuaFnAuditAbility(sceneId, selfId, ABILITY_ZHONGZHI, -1, -1)
	--增加熟练度
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABILITY_ZHONGZHI, x713550_g_ZhiWuLevel)
	--删除相应活力
		CallScriptFunction(ABILITYLOGIC_ID, "EnergyCostZhongZhi", sceneId, selfId, ABILITY_ZHONGZHI, x713550_g_ZhiWuLevel)
	--放置生长点

	ItemBoxTypeId = V_ZHONGZHI_ITEMBOX_ID[zhiwuId]

	ItemBoxId01 = ItemBoxEnterScene(PlantFlag_X+1.5,PlantFlag_Z-1,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	ItemBoxId02 = ItemBoxEnterScene(PlantFlag_X+1.5,PlantFlag_Z+2,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	ItemBoxId03 = ItemBoxEnterScene(PlantFlag_X-0.5,PlantFlag_Z-1,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	ItemBoxId04 = ItemBoxEnterScene(PlantFlag_X-0.5,PlantFlag_Z+2,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId01,45000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId02,45000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId03,45000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId04,45000)
	--得到guid
	local guid = GetHumanGUID(sceneId,selfId)

	--给ItemBox设定主人
	SetItemBoxOwner(sceneId,ItemBoxId01,guid)
	SetItemBoxOwner(sceneId,ItemBoxId02,guid)
	SetItemBoxOwner(sceneId,ItemBoxId03,guid)
	SetItemBoxOwner(sceneId,ItemBoxId04,guid)

	PLANTFLAG[num] = 8
	BeginEvent(sceneId)
		AddText(sceneId, "你已经开始种植")
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)

	--把missiondata设置为当前时间
	SetMissionData(sceneId,selfId,MD_ZHONGZHI_TIME,CurrentTime)
	
	if zhiwuId >= getn(V_ZHONGZHI_ID) then
		SetMissionData(sceneId,selfId,MD_ZHONGZHI_FLAG,2)
	else
		SetMissionData(sceneId,selfId,MD_ZHONGZHI_FLAG,1)
	end

 	return OR_OK
end

--生长点脚本，高粱3
--脚本号
--g_ScriptId = 711017

--此生长点编号
x711017_g_GpId = 518

--生长点需要的等级
x711017_g_ItemBoxNeedLevel = 6

function	x711017_OnOpen(sceneId,selfId,targetId)
	--得到生长点的主人GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--参数是SceneID，ItemBoxID
	--得到点击生长点的玩家的guid
	PlayerGuid = GetHumanGUID(sceneId,selfId)
	if ItemBoxOwnerGUID~= PlayerGuid then
		BeginEvent(sceneId)
	  		AddText(sceneId,"随便收割别人种的庄稼可不行呦！");
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		return OR_INVALID_TARGET_POS
	end
	--得到技能等级
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711017_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711017_OnProcOver(sceneId,selfId,targetId)
	return OR_OK
end

function	 x711017_OnRecycle(sceneId,selfId,targetId)
	local num = 0
	--取得生长点的坐标
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--下取整
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--判断种植牌的位置在哪个种植牌管辖的范围内
	for i, findid in PLANTNPC_ADDRESS do
		if	(GP_X >= findid.X_MIN)  and (GP_Z >= findid.Z_MIN) and (GP_X <= findid.X_MAX)  and (GP_Z <= findid.Z_MAX) and (sceneId == findid.Scene) then
			num = i	
			break
		end
	end
	
	--如果找不到正确的位置则返回
	if num == 0 then
		return
	end
	--找到正确的编号，把种植牌-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1
	return 1
end

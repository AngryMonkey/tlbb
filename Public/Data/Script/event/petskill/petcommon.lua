-- 珍兽通用功能脚本

-- 脚本号
x335000_g_scriptId = 335000

-- 珍兽技能学习
function x335000_PetStudy( sceneId, selfId, skillId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	local checkAvailable = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petGUID_H, petGUID_L);
	if checkAvailable and checkAvailable == 1 then
		local ret = PetStudySkill( sceneId, selfId, petGUID_H, petGUID_L, skillId )
		if ret and ret > 0 then
			--成功的光效
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
			return 1
		end
	end
	return 0;
end


-- 判断口粮适合珍兽食用
-- nIndex 是正在使用的口粮的背包位置
function x335000_IsPetCanUseFood( sceneId, selfId, nIndex )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	ret = LuaFnPetCanUseFood( sceneId, selfId, petGUID_H, petGUID_L, nIndex )
	if ret > 0 then
		return 1
	else
		return 0
	end
end

-- 增加珍兽最大生命值
function x335000_IncPetMaxHP( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )

	LuaFnSetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L, value )
	return 1
end

-- 增加珍兽生命值
function x335000_IncPetHP( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetHP( sceneId, selfId, petGUID_H, petGUID_L )
	MaxHP = LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )

	if value > MaxHP then
		value = MaxHP
	end

	LuaFnSetPetHP( sceneId, selfId, petGUID_H, petGUID_L, value )

	local ObjId = LuaFnGetPetObjIdByGUID( sceneId, selfId, petGUID_H, petGUID_L )
	if ObjId ~= -1 then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, ObjId, 23, 0 )
	end

	return 1
end

-- 增加珍兽寿命
function x335000_IncPetLife( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetLife( sceneId, selfId, petGUID_H, petGUID_L )

	LuaFnSetPetLife( sceneId, selfId, petGUID_H, petGUID_L, value )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	return 1
end

-- 增加珍兽快乐度
function x335000_IncPetHappiness( sceneId, selfId, value )
	if value <= 0 then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	value = value + LuaFnGetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L )
	MaxHappiness = 100

	if value > MaxHappiness then
		value = MaxHappiness
	end

	LuaFnSetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L, value )

	local ObjId = LuaFnGetPetObjIdByGUID( sceneId, selfId, petGUID_H, petGUID_L )
	if ObjId ~= -1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, ObjId, 24, 0)
	end

	return 1
end

-- 珍兽共用脚本接口函数文件

-- 脚本号
x800105_g_ScriptId = 800105

--**********************************
-- 提示信息
--**********************************
function x800105_ShowTips(sceneId, selfId, tipMsg)
	BeginEvent(sceneId);
		AddText(sceneId, tipMsg);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
-- 生成人民币珍兽
--**********************************
function x800105_CreateRMBPetToHuman(sceneId, selfId, petDataId, level)
	if not sceneId or not selfId or not petDataId then
		return 0;
	end

	local checkCreatePet = TryCreatePet(sceneId, selfId, 1);
	if not checkCreatePet or checkCreatePet ~= 1 then
		x800105_ShowTips(sceneId, selfId, "您不能携带更多的珍兽。");
		return 0;
	end

	local ret, petGUID_H, petGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, petDataId, level, 1);
	if not ret or ret ~= 1 or not petGUID_H or not petGUID_L then
		x800105_ShowTips(sceneId, selfId, "你不能携带此珍兽。");
		return 0;
	end
	return 1, petGUID_H, petGUID_L
end

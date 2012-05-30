-- 登录处理
--〖触发时机〗	玩家登录游戏后触发此脚本
--〖触发源〗		.\Scene.lua: OnScenePlayerLogin

--脚本号
x888890_g_ScriptId	= 888890

--**********************************
--脚本入口函数
--**********************************
function x888890_OnDefaultEvent( sceneId, selfId )

	--整理配方
	x888890_AdjustPrescription( sceneId, selfId )
	
	--检查帐号是否安全
	CheckAccountSafe( sceneId, selfId );
	
	--其它操作

end

--**********************************
--整理配方
--**********************************
--删除已经废弃的配方，添加没有自动添加的配方
function x888890_AdjustPrescription( sceneId, selfId )

	--需要删除的配方
	local	preOld	= { 166, 167, 168, 169, 170, 171, 172, 173, 174, 175,
										176, 177, 178, 179, 180, 181, 182, 183, 184, 185,
										186, 187, 188, 189, 190, 191, 192, 193, 194, 195,
										196, 197, 198, 199, 200, 201, 202, 203, 204, 205,
										206, 207, 208, 209, 210, 211, 212, 213, 214, 215,
										216, 217, 218, 219, 220, 221, 222, 223, 224, 225,
										226, 227, 228, 229, 230, 231, 232, 233 }
	--需要添加的配方
	local	preNew	= { 558, 559, 560 }
	
	local	id
	--Del
	for _, id in preOld do
		if IsPrescrLearned( sceneId, selfId, id ) == 1 then
			SetPrescription( sceneId, selfId, id, 0 )
		end
	end
	--Add
	for _, id in preNew do
		if IsPrescrLearned( sceneId, selfId, id ) == 0 then
			SetPrescription( sceneId, selfId, id, 1 )
		end
	end

end

--千年冰魄

--脚本编号
x502002_g_ScriptId	= 502002

--**********************************
--Monster Timer
--**********************************
function x502002_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--全球公告
	local str = "#P#{_BOSS9}又现身了！武夷的大地再次陷入极冰的恐怖之中！"
	AddGlobalCountNews( sceneId, str )

	--取消时钟
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--死亡事件
--**********************************
function x502002_OnDie( sceneId, objId, killerId )
end

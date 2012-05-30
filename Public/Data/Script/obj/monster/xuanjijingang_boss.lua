--玄击金刚

--脚本编号
x502001_g_ScriptId	= 502001

--**********************************
--Monster Timer
--**********************************
function x502001_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--全球公告
	local str = "#P#{_BOSS7}又现身了！苍山的大地再次陷入玄雷的恐怖之中！"
	AddGlobalCountNews( sceneId, str )
	--取消时钟
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--死亡事件
--**********************************
function x502001_OnDie( sceneId, objId, killerId )

end

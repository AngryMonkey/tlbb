--企鹅王BOSS刷新公告

--脚本编号
x502003_g_ScriptId	= 502003

--**********************************
--Monster Timer
--**********************************
function x502003_OnCharacterTimer( sceneId, objId, dataId, uTime )
	--全球公告
	local	nam_mob	= GetName( sceneId, objId )
	if nam_mob ~= nil then
		str	= format( "#G银皑雪原#P真正的主人，伟大的#{_BOSS42}#P，已经挥舞着权杖出现在它的领土上了！", nam_mob )
		AddGlobalCountNews( sceneId, str )
	end

	--取消时钟
	SetCharacterTimer( sceneId, objId, 0 )
end

--**********************************
--死亡事件
--**********************************
function x502003_OnDie( sceneId, objId, killerId )
	--全球公告
	--local	nam_mob	= GetName( sceneId, objId )
	--local	nam_ply	= GetName( sceneId, killerId )
	--if nam_mob ~= nil and nam_ply ~= nil then
		--str	= format( "#P经过#W#{_INFOUSR%s}#P和其队伍的一番苦战，#G%s#P终于被打败了。", nam_ply, nam_mob )
		--AddGlobalCountNews( sceneId, str )
	--end
end

--传讯焰火

--脚本号
x300009_g_scriptId = 300009

x300009_g_event = 210211
--**********************************
--刷新事件
--**********************************
function x300009_OnDefaultEvent( sceneId, selfId, BagIndex )
	CallScriptFunction(x300009_g_event,"OnUseItem",sceneId, selfId, BagIndex)
end

function x300009_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

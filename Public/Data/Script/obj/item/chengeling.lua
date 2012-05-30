--惩恶令

--脚本号
x300021_g_scriptId = 300021

x300021_g_event = 229020
--**********************************
--刷新事件
--**********************************
function x300021_OnDefaultEvent( sceneId, selfId, bagIndex )
	
	CallScriptFunction(x300021_g_event,"OnUseItem",sceneId, selfId, bagIndex)
	
end

function x300021_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

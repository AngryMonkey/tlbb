
--发送通知

--脚本号
x300023_g_scriptId = 300023

x300023_g_event = 210239
--**********************************
--刷新事件
--**********************************
function x300023_OnDefaultEvent( sceneId, selfId, BagIndex )
	--PrintStr("...")
	--CallScriptFunction(x300023_g_event,"OnUseItem",sceneId, selfId, targetId, eventId)    --x300023_g_event里不存在OnUseItem函数
end

function x300023_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

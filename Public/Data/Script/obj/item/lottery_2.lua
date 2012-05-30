--奖券

--脚本号
x300061_g_scriptId = 300061

--**********************************
--刷新事件
--**********************************
function x300061_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId,"#{Help_lottery_002}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

function x300061_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

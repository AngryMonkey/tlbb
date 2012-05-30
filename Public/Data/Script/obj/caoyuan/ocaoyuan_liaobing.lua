--辽兵

--脚本号
x020008_g_scriptId = 020008

--**********************************
--事件列表
--**********************************
function x020008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  离我远一点， 宋人不配和我说话。#r  吾皇万岁！ 大辽必胜！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

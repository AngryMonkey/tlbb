--NPC
--傀儡
--普通

--**********************************
--事件交互入口
--**********************************
function x014009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  逍遥傀儡人F-874型正在进行数据动作处理：#r  10：伸出右侧手臂。#r  20：向左挥动。#r  30：向右挥动。#r  返回20，循环开始……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

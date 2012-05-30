--南海NPC
--丁涟漪
--普通

--**********************************
--事件交互入口
--**********************************
function x034002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  师父、师娘……还有大师兄……就这样，就这样，都已经不在了吗？呜呜……别来管我，我不要活了……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--琼州NPC
--凌忆慈
--普通

--**********************************
--事件交互入口
--**********************************
function x035003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  老三总是想要我来琼州，可是琉球的百姓正在遭受瘟疫之苦，我实在不能舍他们而去。#r  这次我来琼州，主要是听子衿说南海有一位神医岳仲秋，用异种树皮治愈了瘟疫。等我掌握了这门技术之后，我还要赶回琉球，治疗那里的百姓的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

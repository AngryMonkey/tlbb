--大理NPC
--珍兽龟
--普通

--**********************************
--事件交互入口
--**********************************
function x002067_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local roll = random(0,2)
	if roll <= 0 then
			AddText(sceneId,"  云渺渺姐姐是我们所有珍兽的偶像！渺渺渺渺我爱你，就像老鼠爱大米！")
	elseif roll <= 1 then
			AddText(sceneId,"  别以为我不会说话，渺渺姐姐早就教过我们说话了。不信，我们比试比试！")
	else
			AddText(sceneId,"  你知道吗？听说渺渺姐姐有两个姐姐，和渺渺姐姐长得一模一样哦。")
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

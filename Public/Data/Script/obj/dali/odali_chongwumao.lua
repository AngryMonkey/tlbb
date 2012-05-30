--大理NPC
--珍兽猫
--普通

--**********************************
--事件交互入口
--**********************************
function x002066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local roll = random(0,2)
	if roll <= 0 then
			AddText(sceneId,"  云霏霏姐姐是我们所有珍兽的偶像！霏霏霏霏我爱你，就像老鼠爱大米！")
	elseif roll <= 1 then
			AddText(sceneId,"  别以为我不会说话，霏霏姐姐早就教过我们说话了。不信，我们比试比试！")
	else
			AddText(sceneId,"  你知道吗？听说霏霏姐姐有两个妹妹，和霏霏姐姐长得一模一样哦。")
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

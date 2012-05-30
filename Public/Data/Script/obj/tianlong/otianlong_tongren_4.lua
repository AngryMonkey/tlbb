--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x714009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  足阳明胃经要穴如下：承泣、四白、颊车、下关、气户、梁门、关门、太乙、天枢、伏兔、阴市、足三里、内庭。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x714006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  手太阴肺经要穴如下：中府、云门、天府、侠白、尺泽、孔最、列缺、经渠、太渊、鱼际、少商。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--洛阳NPC
--赵钱孙
--普通

--**********************************
--事件交互入口
--**********************************
function x000025_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  你也是来白马寺拜佛的吗？这里的佛祖可灵了，小娟前些日子给我来信了，一定是我的诚心感动了佛祖……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--脚本号
x380002_g_scriptId = 380002

--**********************************
--事件交互入口
--**********************************
function x380002_OnDefaultEvent( sceneId, selfId)
	BeginEvent(sceneId)     
		AddText(sceneId, "       #114#e6f00c7#c00ffff《上线公告》#114#cff66cc")
		--AddText(sceneId, "         【2011 - 12 - 6】")
		AddText(sceneId, "#Y1、同步天龙叁明教怒火连斩。")
		AddText(sceneId, "#Y2、修复通天塔小怪爆率。")
		AddText(sceneId, "#Y3、调整装备属性。")
		AddText(sceneId, "#Y4、真重楼几率触发效果略微提高。")
		AddText(sceneId, "     #c00ffff【更多内容请查看官方网站】#r           #136#136#136")							
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--事件列表选中一项
--**********************************
function x380002_OnEventRequest( sceneId, selfId, targetId, eventId )

end

--**********************************
--醒目提示
--**********************************
function x380002_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

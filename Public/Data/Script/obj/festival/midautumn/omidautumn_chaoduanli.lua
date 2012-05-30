-- 中秋NPC
-- 晁端礼

x050004_g_scriptId = 050004

--**********************************
--事件交互入口
--**********************************
function x050004_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    月到中秋夜，还胜别夜圆。高河瑟瑟转金盘。三十六宫深处、卷帘看。香雾云鬟湿，清辉玉臂寒。寻常岂是不婵娟。吟赏莫辞终夕、动经年。"
		AddText( sceneId, "南歌子" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

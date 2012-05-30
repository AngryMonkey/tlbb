-- 中秋NPC
-- 朱敦儒

x050006_g_scriptId = 050006

--**********************************
--事件交互入口
--**********************************
function x050006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    偏赏中秋月，从古到如今。金风玉露相间，别做一般清。是处帘栊争卷，谁家管弦不动，乐世足欢情。莫指关山路，空使翠蛾颦。水精盘，鲈鱼脍，点新橙。鹅黄酒暖，纤手传杯任频斟。须惜晓参横后，直到来年今夕，十二数亏盈。未必来年看，得似此回明。"
		AddText( sceneId, "水调歌头" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

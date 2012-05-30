-- 中秋NPC
-- 黄庭坚

x050003_g_scriptId = 050003

--**********************************
--事件交互入口
--**********************************
function x050003_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    中秋无雨。醉送月衔西岭去。笑口须开。几度中秋见月来。前年江外。儿女传杯兄弟会。此夜登楼。小谢清吟慰白头。"
		AddText( sceneId, "减字木兰花" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

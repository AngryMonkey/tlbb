-- 中秋NPC
-- 李光

x050005_g_scriptId = 050005

--**********************************
--事件交互入口
--**********************************
function x050005_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    独步长桥上，今夕是中秋。群黎怪我何事，流转古儋州。风定潮平如练，云散月明如昼，孤兴在扁舟。笑尽一杯酒，水调杂蛮讴。少年场，金兰契，尽白头。相望万里，悲我已是十年流。晚遇玉霄仙子，授我王屋奇书，归路指蓬邱。不用乘风御，八极可神游。"
		AddText( sceneId, "水调歌头" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

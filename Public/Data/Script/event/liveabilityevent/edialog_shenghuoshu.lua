--对话事件 npc白颖明

--脚本号
x713612_g_ScriptId = 713512

--对话内容
x713612_g_dialog = {"#{event_liveabilityevent_0013}",
			"第二句话",
			"只要向我学习种植技能就可以种植了，当然，你的等级越高，可以种的植物种类越多",
			"只要学习了种植技能，到没有开始耕种的田地旁边与看守田地的稻草人对话，然后选择想种植的植物就可以了",
			"#{event_liveabilityevent_0014}"}
x713612_g_button = {"行啦，行啦，说点实际的",
			"我怎样才能种植呢?",
			"然后呢?",
			"怎样收获呢?",
			}

--**********************************
--任务入口函数
--**********************************
function x713612_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713612_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713612_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713612_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713612_g_ScriptId,"我想了解种植",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713612_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713612_OnAccept( sceneId, selfId, AbilityId )
end

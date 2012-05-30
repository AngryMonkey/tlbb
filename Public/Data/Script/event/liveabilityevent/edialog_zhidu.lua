--对话事件 npc白颖明

--脚本号
x713616_g_ScriptId = 713512

--对话内容
x713616_g_dialog = {"如果你拥有一颗平常心，就会觉得采药是一件惬意的事情，拿上小镰刀，漫步在山间，伴着鸟语花香，在发现一株稀有药草的一刹那那种幸福的感受有的人永远也无法拥有，因为那些人心中只有钱，再美好的事物在他们心中也只不过是更值钱而已。",
			"第二句话",
			"只要向我学习种植技能就可以种植了，当然，你的等级越高，可以种的植物种类越多",
			"只要学习了种植技能，到没有开始耕种的田地旁边与看守田地的稻草人对话，然后选择想种植的植物就可以了",
			"开始种植后，会看到田里显示你种下的幼苗，这时候你就可以去做自己的事情了，不需要照顾田里的庄稼。但是不要忘了，40分钟以后一定要回来收庄稼，否则过了50分钟，别人就会把你的庄稼收走了。"}
x713616_g_button = {"行啦，行啦，说点实际的",
			"我怎样才能种植呢?",
			"然后呢?",
			"怎样收获呢?",
			}

--**********************************
--任务入口函数
--**********************************
function x713616_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum是对话编号，用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713616_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713616_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713616_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713616_g_ScriptId,"我想了解种植",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713616_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713616_OnAccept( sceneId, selfId, AbilityId )
end

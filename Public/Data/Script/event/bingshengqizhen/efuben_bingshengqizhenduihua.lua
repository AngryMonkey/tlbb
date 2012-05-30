-- 领奖NPC
--兵圣奇阵副本by开心就好
x402081_g_scriptId = 402081
x402081_g_duihuan_scriptId = 77
x402081_g_putong_scriptId = 402080
x402081_g_kunnan_scriptId = 402082

--**********************************
--事件交互入口
--**********************************
function x402081_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "最新副本正在制作中。。。。！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		--AddText( sceneId, "  #G我来自少林寺的#Y扫地僧，#G近期有人传闻在四绝庄发现#Y龙八部十大绝顶高手#G排名第一的#cFF0000扫地僧的踪迹，#G只要你给我找来这些，#W我就答应你并与您并肩作战，成为你的珍兽！" )	
		   		--AddText( sceneId, "  集齐#cFF0000天 #Y、#cFF0000龙#Y、#cFF0000争#Y、#cFF0000霸#Y、#cFF0000赛#Y、#G既可以跟我兑换#Y扫地僧卷轴！#G卷轴可以召唤出#cFF0000扫地僧珍兽#G一只，所有原始资质#cFF0000100000#G点，扫地僧珍兽可以领悟#G神秘珍兽技能！" )	
		   		AddText( sceneId, "    眼下雁门关外战火焚天，天朝勇士亦是受制于胶着战局，北征之势再难寸进。日前又传密报言契丹一族将携奇阵而来，由是观之，大宋之兵已危在旦夕。" )	
		   		AddText( sceneId, "    我受兵部侍郎郭大人之命隐匿于市，虽身谋商贾实为广布耳目以探听大辽军情，只待有朝一日能引天下豪杰北上掠入敌营。日前，我已知晓一条密道可出入辽军兵圣奇阵而神不知，但此去敌营必是危机丛生，却可成丰功伟业，为国为民。至于最终前往与否还请英雄自行定夺。" )
		   		--AddNumText( sceneId, x402081_g_ScriptId, "#e6f00c7兑换[天下第一宝宝]", 4, 10 )
		   		--AddNumText( sceneId, x402081_g_ScriptId, "#cf30768扫地僧绝技:[伏虎降龙掌]获取", 4, 20 )
				AddNumText( sceneId, x402081_g_ScriptId, "奇袭：兵圣奇阵", 4, 20 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end
--end
--**********************************
--事件列表选中一项
--**********************************
function x402081_OnEventRequest( sceneId, selfId, targetId, eventId )

		if GetNumText() == 20 then
			BeginEvent( sceneId )
   		AddText( sceneId, "    英雄既然承接这英雄帖，敢去试探那兵圣奇阵，定然是武艺高强的有识之士。此密道经由楼兰而入辽国边境，曲折复杂程度远远超过了我们的想象。" )
  		AddText( sceneId, "    密道出口有一处岔道，分歧的两条小径皆可引你潜入阵中。当然，试阵所得与所要对应的危机自然不能相提并论，却不知英雄想从何处入阵？" )
		AddNumText( sceneId, x402081_g_ScriptId, "奇袭：兵圣奇阵（普通模式）", 10, 1 )
   		AddNumText( sceneId, x402081_g_ScriptId, "奇袭：兵圣奇阵（困难模式）", 10, 2 )
		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	if GetNumText() == 1 then
		CallScriptFunction(402080 , "OnDefaultEvent", sceneId, selfId)--传送	
		return
--	end
	elseif GetNumText() == 2 then
      CallScriptFunction(402082 , "OnDefaultEvent", sceneId, selfId)--传送
		return
	end
	return
end
--end
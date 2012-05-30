-- 领奖NPC
--开心就好完善

x899994_g_scriptId = 899994
x899994_g_duihuan_scriptId = 77
--副本逻辑脚本号....
x899994_g_FuBenScriptId = 002939

--**********************************
--事件交互入口
--**********************************
function x899994_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "最新副本正在制作中。。。。！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
	
		   		AddText( sceneId, "    我的义父潘企本是棋艺世家子弟,家中更有绝世棋艺秘宝。但以琴棋书画闻名江湖的四绝庄却用各种险恶手段将秘宝夺走，还将潘家灭门。我义" )	
	   			AddText( sceneId, "父因掉落悬崖得以逃脱，但却落得双腿残疾。如今,我义父将不久于人世,我本想将秘宝夺回了其心愿，无奈力不从心，在此恳请诸位大侠助我夺回秘宝,让小女子能够进份孝心。" )
		   		--AddNumText( sceneId, x899994_g_ScriptId, "#e6f00c7兑换[天下第一宝宝]", 4, 10 )
		   		--AddNumText( sceneId, x899994_g_ScriptId, "#cf30768扫地僧绝技:[伏虎降龙掌]获取", 4, 20 )
		   		AddNumText( sceneId, x899994_g_ScriptId, "挑战四绝庄", 10, 1 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x899994_OnEventRequest( sceneId, selfId, targetId, eventId )


	--检测是否可以进入副本....
--	local ret, msg = x899994_CheckCanEnter( sceneId, selfId, targetId )
--	if 1 ~= ret then
--		BeginEvent(sceneId)
--			AddText(sceneId,msg)
--		EndEvent(sceneId)
--		DispatchEventList(sceneId,selfId,targetId)
--		return
--	end

	--关闭NPC对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	CallScriptFunction(002939 , "OnDefaultEvent", sceneId, selfId)--传送
--	x899994_MakeCopyScene( sceneId, selfId )

end
	--if eventId == x805016_g_duihuan_scriptId then
		--CallScriptFunction( x805016_g_duihuan_scriptId, "OnEventRequest",sceneId, selfId, targetId, GetNumText() )	
		--return
	--end


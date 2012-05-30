--少林NPC
--玄灭
--普通
 x009011_g_ScriptId=009011
--447	骑术：虎
--448	骑术：黄骠马
--449	骑术：骆驼
--450	骑术：鹤
--451	骑术：青凤
--452	骑术：牦牛
--453	骑术：鹿
--454	骑术：雕
--455	骑术：灰狼
--456	骑术：白虎
--457	骑术：青白骢马
--458	骑术：白骆驼
--459	骑术：金翼鹤
--460	骑术：红白凤
--461	骑术：白牦牛
--462	骑术：白鹿
--463	骑术：白雕
--464	骑术：白狼
--**********************************
--事件交互入口
--**********************************
function x009011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"阿弥陀佛，我可以教少林弟子驾驭猛虎的能力。")
		if	GetMenPai( sceneId, selfId) == 0 then
			if	(0==LuaFnHaveSpecificEquitation(  sceneId, selfId, 447))	then
				AddNumText(sceneId,x009011_g_ScriptId,"学习骑术：虎",12,40)
			end
			if	(0==LuaFnHaveSpecificEquitation(  sceneId, selfId, 456))	then
				AddNumText(sceneId,x009011_g_ScriptId,"学习骑术：白虎",12,60)
			end
		end
		AddNumText( sceneId, x009011_g_ScriptId, "骑术介绍", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x009011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_011}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if GetNumText() == 40 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XXQS_03}" )
			AddNumText(sceneId, x009011_g_ScriptId,"是",-1,0)
      AddNumText(sceneId, x009011_g_ScriptId,"否",-1,999)			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 60 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XXQS_04}" )
			AddNumText(sceneId, x009011_g_ScriptId,"是",-1,1)
      AddNumText(sceneId, x009011_g_ScriptId,"否",-1,999)			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 999 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	local level = GetLevel( sceneId, selfId)
	local skill = GetNumText()
	if skill == 0 or skill == 1 then
	  CallScriptFunction((210299), "OnDefaultEvent",sceneId, selfId,targetId, level, skill)
	end
end


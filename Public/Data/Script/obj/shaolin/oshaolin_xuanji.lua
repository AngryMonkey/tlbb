--少林NPC
--玄寂
--普通

x009003_g_scriptId = 009003
x009003_g_eventList={220900, 808004}
--**********************************
--事件交互入口
--**********************************
function x009003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  老衲玄寂，施主找老衲有何事啊？")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x009003_g_scriptId, "加入门派",6,0)
		end
		AddNumText(sceneId, x009003_g_scriptId, "门派介绍",8,1)
		AddNumText(sceneId, x009003_g_scriptId, "如何学习门派技能",8,6)		--指路到技能学习人
		for i, eventId in x009003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x009003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText()==0	then
		x009003_g_MenPai = GetMenPai(sceneId, selfId)
		if x009003_g_MenPai == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "你又来消遣为师了，你已是我少林弟子，还拜什么师呢。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x009003_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"你已是别的门派的高徒了，恕我们少林寺庙小，容不得您这尊大佛。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_000}")
			AddNumText(sceneId, x009003_g_scriptId, "我确定要拜入少林派",6,3)
			AddNumText(sceneId, x009003_g_scriptId, "我暂时还不想拜入门派",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	
	if GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  整理一下背包，需要有两个空位置，我会有奖励给你！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"施主还是等到10级之后再来拜师学艺吧！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x009003_g_MenPai = GetMenPai(sceneId, selfId)
			if x009003_g_MenPai == 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "你又来消遣为师了，你已是我少林弟子，还拜什么师呢。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x009003_g_MenPai==9	then
				
				LuaFnJoinMenpai(sceneId, selfId, targetId, 0)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  1,4,5
				LuaFnSetXinFaLevel(sceneId,selfId,1,10)
				LuaFnSetXinFaLevel(sceneId,selfId,4,10)
				LuaFnSetXinFaLevel(sceneId,selfId,5,10)
				
				BeginEvent(sceneId)
	  				AddText(sceneId,"你已经加入少林派！");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
	  			
	  			if TryRecieveItem( sceneId, selfId, 10124000, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124000).."。"
					x009003_MsgBox( sceneId, selfId, str )
				end
				
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_3}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_shaolin_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x009003_MsgBox( sceneId, selfId, "得到20枚门派召集令。" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"你已经加入少林派！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"你已经加入少林派！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
					CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"你已是别的门派的高徒了，恕我们少林寺庙小，容不得您这尊大佛。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_shaolin_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x009003_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_SHAOLIN )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "玄难大师（91，71）可以教给你我派战斗技能，他就在我旁边。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 91, 71, "玄难" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x009003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x009003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			--UpdateEventList( sceneId, selfId, targetId ) --根本就没有这个函数，who do 的？？？
			x009003_OnDefaultEvent( sceneId, selfId,targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x009003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x009003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x009003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x009003_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x009003_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

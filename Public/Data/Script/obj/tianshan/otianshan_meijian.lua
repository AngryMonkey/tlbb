--天山NPC
--掌门人
--梅剑
--普通

--脚本号
x017001_g_ScriptId = 017001

x017001_g_eventList={228900,229009,200096,200097,808004,229012, 808092}
--**********************************
--事件交互入口
--**********************************
function x017001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我是梅剑，老尊主不在，我来暂时管理天山弟子。")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x017001_g_ScriptId, "加入门派",6,0)
		end
		AddNumText(sceneId, x017001_g_ScriptId, "门派介绍",8,1)
		AddNumText(sceneId, x017001_g_ScriptId, "如何学习门派技能",8,6)		--指路到技能学习人
		for i, eventId in x017001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x017001_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x017001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_TIANSHAN )
			return
		end
	end

	if GetNumText()==0	then

		x017001_g_MenPai = GetMenPai(sceneId, selfId)
		if x017001_g_MenPai == 7   then
			BeginEvent(sceneId)
				AddText(sceneId, "你又来消遣为师了，你已是我天山弟子，还拜什么师呢。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x017001_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"你已是别的门派的高徒了，我们不收你的。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_007}")
			AddNumText(sceneId, x017001_g_ScriptId, "我确定要拜入天山派",6,3)
			AddNumText(sceneId, x017001_g_ScriptId, "我暂时还不想拜入门派",8,4)
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
				AddText(sceneId,"你还是等到10级之后再来拜师学艺吧！")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x017001_g_MenPai = GetMenPai(sceneId, selfId)
			if x017001_g_MenPai == 7 then
				BeginEvent(sceneId)
					AddText(sceneId, "你又来消遣为师了，你已是我天山弟子，还拜什么师呢。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x017001_g_MenPai==9	then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 7)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  43,46,47
				LuaFnSetXinFaLevel(sceneId,selfId,43,10)
				LuaFnSetXinFaLevel(sceneId,selfId,46,10)
				LuaFnSetXinFaLevel(sceneId,selfId,47,10)

				BeginEvent(sceneId)
	  				AddText(sceneId,"你已经加入天山派！");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_7}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_tianshan_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x017001_MsgBox( sceneId, selfId, "得到20枚门派召集令。" )

				if TryRecieveItem( sceneId, selfId, 10124006, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124006 ).."。"
					x017001_MsgBox( sceneId, selfId, str )
				end
					
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"你已经加入天山派！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
					CallScriptFunction( 228900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"你已经加入天山派！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
					CallScriptFunction( 228900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"你已是别的门派的高徒了，我们不收你的。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_tianshan_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "兰剑（88，44）可以教给你我派战斗技能，他就在我旁边。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 88, 44, "兰剑" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x017001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017001_g_eventList do
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
function x017001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x017001_g_eventList do
		if missionScriptId == findId then
			x017001_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x017001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x017001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x017001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x017001_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x017001_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

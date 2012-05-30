--明教NPC
--吕师襄
--普通

x011006_g_scriptId = 009002
x011006_g_eventList={222900,808004}
--**********************************
--事件交互入口
--**********************************
function x011006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  洒家是明教右使吕师襄，若要加入明教，便来找洒家！若要喝酒，也来找洒家！")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x011006_g_scriptId, "加入门派",6,0)
		end
		AddNumText(sceneId, x011006_g_scriptId, "门派介绍",8,1)
		AddNumText(sceneId, x011006_g_scriptId, "如何学习门派技能",8,6)		--指路到技能学习人
		for i, eventId in x011006_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x011006_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x011006_g_MenPai = GetMenPai(sceneId, selfId)
		if x011006_g_MenPai == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, "这玩笑也是开得的？若惹得洒家性发，扣你一千门贡也是轻的。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x011006_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"这厮好不轻省！你已是其他门派之人，还来我明教做甚？")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_001}")
			AddNumText(sceneId, x011006_g_scriptId, "我确定要拜入明教",6,3)
			AddNumText(sceneId, x011006_g_scriptId, "我暂时还不想拜入门派",8,4)
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
				AddText(sceneId,"我明教教令，只收10级以上之人。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x011006_g_MenPai = GetMenPai(sceneId, selfId)
			if x011006_g_MenPai == 1 then
				BeginEvent(sceneId)
					AddText(sceneId, "这玩笑也是开得的？若惹得洒家性发，扣你一千门贡也是轻的。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x011006_g_MenPai==9	then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 1)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  7,10,11
				LuaFnSetXinFaLevel(sceneId,selfId,7,10)
				LuaFnSetXinFaLevel(sceneId,selfId,10,10)
				LuaFnSetXinFaLevel(sceneId,selfId,11,10)

				BeginEvent(sceneId)
	  				AddText(sceneId,"你已经加入明教！");
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,selfId)
	  			
	  			if TryRecieveItem( sceneId, selfId, 10124001, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124001 ).."。"
					x011006_MsgBox( sceneId, selfId, str )				
				end
				
				
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_2}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_mingjiao_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x011006_MsgBox( sceneId, selfId, "得到20枚门派召集令。" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"你已经加入明教！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
					CallScriptFunction( 222900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"你已经加入明教！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
					CallScriptFunction( 222900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"这厮好不轻省！你已是其他门派之人，还来我明教做甚？")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_mingjiao_0002}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x011006_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_MINGJIAO )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "庞万春（108，59）可以教给你我派战斗技能，他就在我旁边。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 108, 59, "庞万春" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x011006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011006_g_eventList do
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
function x011006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
--for i, findId in x011006_g_eventList do
--	if missionScriptId == findId then
--		UpdateEventList( sceneId, selfId, targetId )
--		return
--	end
--end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x011006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x011006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x011006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x011006_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x011006_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

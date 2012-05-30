--陈孤雁

--脚本号
x010000_g_scriptId = 010000

--所拥有的事件ID列表
x010000_g_eventList={221900,808004}
--x010000_g_eventList={200922,201021,201121,221900}

--**********************************
--事件列表
--**********************************
function x010000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  我是陈孤雁，阁下来找我有何事指教？");
	for i, eventId in x010000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	local mp = GetMenPai(sceneId, selfId)
	if mp == 9 then 
		AddNumText(sceneId, x010000_g_scriptId, "加入门派",6,0)
	end
	AddNumText(sceneId, x010000_g_scriptId, "门派介绍",8,1)
	AddNumText(sceneId, x010000_g_scriptId, "如何学习门派技能",8,6)		--指路到技能学习人
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x010000_OnDefaultEvent( sceneId, selfId,targetId )
	x010000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x010000_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x010000_g_MenPai = GetMenPai(sceneId, selfId)
		if x010000_g_MenPai == 2 then
			BeginEvent(sceneId)
				AddText(sceneId, "你又来消遣为师了，你已是我丐帮弟子，还拜什么师呢。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x010000_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"你已是别的门派的高徒了，丐帮不收你。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_002}")
			AddNumText(sceneId, x010000_g_scriptId, "我确定要拜入丐帮",6,3)
			AddNumText(sceneId, x010000_g_scriptId, "我暂时还不想拜入门派",8,4)
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
	
	if	GetNumText()==3	then
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
			x010000_g_MenPai = GetMenPai(sceneId, selfId)
			if x010000_g_MenPai == 2 then
				BeginEvent(sceneId)
					AddText(sceneId, "你又来消遣为师了，你已是我丐帮弟子，还拜什么师呢。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x010000_g_MenPai==9	then
				AddText(sceneId,"那么从现在开始，你就是我丐帮的门下弟子了。")
				LuaFnJoinMenpai(sceneId, selfId, targetId, 2)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  13,16,17
				LuaFnSetXinFaLevel(sceneId,selfId,13,10)
				LuaFnSetXinFaLevel(sceneId,selfId,16,10)
				LuaFnSetXinFaLevel(sceneId,selfId,17,10)

				BeginEvent(sceneId)
					AddText(sceneId,"你已经加入丐帮！");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				if TryRecieveItem( sceneId, selfId, 10124002, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124002 ).."。"
					x010000_MsgBox( sceneId, selfId, str)					
				end
				
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_6}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_gaibang_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x010000_MsgBox( sceneId, selfId, "得到20枚门派召集令。" )

				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"你已经加入丐帮！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
					CallScriptFunction( 221900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"你已经加入丐帮！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
					CallScriptFunction( 221900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"你已是别的门派的高徒了，丐帮不收你。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_gaibang_0002}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		for i, findId in x010000_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_GAIBANG )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "奚三祁（93，99）可以教给你我派战斗技能，他就在我旁边。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 93, 99, "奚三祁" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x010000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
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
function x010000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			x010000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x010000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x010000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x010000_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x010000_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

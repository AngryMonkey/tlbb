--星宿NPC
--韩世忠
--普通

x016001_g_scriptId = 016001
x016001_g_eventList={227900,808004}

x016001_g_StudyAbility_NeedMoney = 5550000		--555G
---“门派召集令”配方ID
x016001_g_RecipeId = 563
--顺发特效ID
x016001_g_SpecialEffectID = 18;


--**********************************
--事件交互入口
--**********************************
function x016001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我是星宿派的现任大师兄韩世忠。")
		local mp = GetMenPai(sceneId, selfId)
		if mp == 9 then 
			AddNumText(sceneId, x016001_g_scriptId, "加入门派",6,0)
		end
		AddNumText(sceneId, x016001_g_scriptId, "门派介绍",8,1)
		AddNumText(sceneId, x016001_g_scriptId, "学习制作门派召集令",12,2)
		AddNumText(sceneId, x016001_g_scriptId, "如何学习门派技能",8,6)		--指路到技能学习人
		for i, eventId in x016001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x016001_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x016001_g_MenPai = GetMenPai(sceneId, selfId)
		if x016001_g_MenPai == 5   then
			BeginEvent(sceneId)
				AddText(sceneId, "你又来消遣为师了，你已是我星宿弟子，还拜什么师呢。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x016001_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"你已是别的门派的高徒了，我们不收你。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_005}")
			AddNumText(sceneId, x016001_g_scriptId, "我确定要拜入星宿派",6,3)
			AddNumText(sceneId, x016001_g_scriptId, "我暂时还不想拜入门派",8,4)
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
			x016001_g_MenPai = GetMenPai(sceneId, selfId)
			if x016001_g_MenPai == 5 then
				BeginEvent(sceneId)
					AddText(sceneId, "你又来消遣为师了，你已是我星宿弟子，还拜什么师呢。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--返回值为9表示无门派
			elseif x016001_g_MenPai==9	then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 5)

				-- 设置初始的Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关的心法设置为10级别  31,34,35
				LuaFnSetXinFaLevel(sceneId,selfId,31,10)
				LuaFnSetXinFaLevel(sceneId,selfId,34,10)
				LuaFnSetXinFaLevel(sceneId,selfId,35,10)

				BeginEvent(sceneId)
					AddText(sceneId,"你已经加入星宿派！");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_1}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_xingxiu_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x016001_MsgBox( sceneId, selfId, "得到20枚门派召集令。" )

				if TryRecieveItem( sceneId, selfId, 10124005, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124005 ).."。"
					x016001_MsgBox( sceneId, selfId, str )
				end
				
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"你已经加入星宿派！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
					CallScriptFunction( 227900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"你已经加入星宿派！",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
					CallScriptFunction( 227900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"你已是别的门派的高徒了，我们不收你。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_xingxiu_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif	GetNumText() == 2 then
	
		x016001_g_MenPai = GetMenPai(sceneId, selfId)
		if x016001_g_MenPai == 5 then

			local RecipeFlag = IsPrescrLearned( sceneId, selfId, x016001_g_RecipeId );
			if RecipeFlag >= 1 then
				BeginEvent(sceneId)
						AddText(sceneId,"你已经学会制作门派召集令了。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return 0;
			end
				
			local	lev	= QueryHumanAbilityLevel( sceneId, selfId, 39 )
			if lev < 2 then
					BeginEvent(sceneId)
					AddText(sceneId,"只有技能‘咫尺天涯’达到2级才能传授！此外，你还需要交给我#{_EXCHG"..x016001_g_StudyAbility_NeedMoney.."}。")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
			end	
				
			if LuaFnGetMoney( sceneId, selfId )+GetMoneyJZ( sceneId, selfId ) < x016001_g_StudyAbility_NeedMoney then
				BeginEvent(sceneId)
						AddText(sceneId,"  你所带金钱不足!需要交给我#{_EXCHG"..x016001_g_StudyAbility_NeedMoney.."}。")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return 0
			else
				BeginEvent(sceneId)
					AddText(sceneId,"  学习‘门派召集令’这项配方，需要交给我#{_EXCHG"..x016001_g_StudyAbility_NeedMoney.."}。")
					AddNumText(sceneId, x016001_g_scriptId, "我确认要学习。",12,999)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return
					
			end

		else
			BeginEvent(sceneId)
				AddText(sceneId, "我只传授给本派弟子")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	
	elseif	GetNumText() == 999 then
		-- 检测玩家是不是学会了必要的技能并达到必要等级
		local	lev	= QueryHumanAbilityLevel( sceneId, selfId, 39 )
		if lev < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  你的“咫尺天涯”的技能还没有达到2级，我不能教你。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
			
		-- 检测玩家是不是够钱
		if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < x016001_g_StudyAbility_NeedMoney   then
			BeginEvent(sceneId)
				AddText(sceneId, " 你身上的金钱不够。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
		local delMoney,delJiaoZi = LuaFnCostMoneyWithPriority( sceneId, selfId, x016001_g_StudyAbility_NeedMoney )
		if delMoney and delMoney ~= -1  then
			CallScriptFunction( USERECIPE_SCRIPT, "ReadRecipe", sceneId, selfId, x016001_g_RecipeId )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x016001_g_SpecialEffectID, 0);
			
			BeginEvent(sceneId)
				AddText(sceneId,"你已经学会制作门派召集令了!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	else
		for i, findId in x016001_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_XINGSU )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "施全（87，70）可以教给你我派战斗技能。按下TAB键，地图上会有闪烁的标识的。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 87, 70, "施全" )
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x016001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016001_g_eventList do
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
function x016001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x016001_g_eventList do
		if missionScriptId == findId then
			x016001_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x016001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x016001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x016001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x016001_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x016001_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

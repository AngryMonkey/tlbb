--洛阳
--种植牌1

--脚本号
x714129_g_ScriptId = 714129

event_xuanzezhiwu = 713550

--植物产品编号列表
x714129_g_eventList={20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
	                   20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,20105009,20105010} --植物的编号,不是scriptId

x714129_g_eventList1 = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010}; --粮食作物
x714129_g_eventList2 = {20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,20105009,20105010}; --经济作物

x714129_g_eventList_temp = {};
--**********************************
--事件交互入口
--**********************************
function x714129_OnDefaultEvent( sceneId, selfId,targetId )
	--PLANTFLAG[1] =0
	--PLANTFLAG[2] =0
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	--如果玩家不会种植技能
	if AbilityLevel == 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "你先去学习种植技能吧")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--如果玩家会种植技能
	if AbilityLevel ~= 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "每种作物都可以分为晚产和早产两种，早产的成熟期大概为5分钟，晚产的大概为70分钟左右，但是单次收获较多。您要选择种植哪种作物？")
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_1}",6,254)
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_2}",6,255)
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_3}",6,256)
			AddNumText(sceneId, x714129_g_ScriptId, "#{ZZ_081104_4}",6,257)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x714129_OnEventRequest( sceneId, selfId, targetId, eventId )
	local name_Index
	local NumText = GetNumText()

	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)

	if NumText == 254 or NumText == 255 or NumText == 256 or NumText == 257 then
		BeginEvent(sceneId)
			AddText(sceneId, "请选择你要种的植物")
			if NumText == 254 or NumText == 256 then
				x714129_g_eventList_temp = x714129_g_eventList1;
			else
				x714129_g_eventList_temp = x714129_g_eventList2;
			end
			--通过x714129_g_eventList和scriptglobal中的植物列表对比，并根据玩家种植技能等级来显示相应植物
			for i, eventId in x714129_g_eventList_temp do	--遍历这个稻草人可以种植的植物列表
				for j,g_ZhiWuId in V_ZHONGZHI_ID do		--遍历scriptglobal中的所有植物列表
					if eventId == g_ZhiWuId then
						if AbilityLevel >= V_ZHONGZHI_NEEDLEVEL[j] then --如果玩家种植技能等级>=该植物要求技能等级]

							if NumText == 254 or NumText == 255 then
								name_Index = j
							else
								name_Index = j + getn(V_ZHONGZHI_NAME)/2
							end

							AddNumText(sceneId, x714129_g_ScriptId, V_ZHONGZHI_NAME[name_Index].."("..V_ZHONGZHI_NEEDLEVEL[j].."级)",6,name_Index)
							break
						end
					end
				end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return

	end

	zhiwuId = NumText
	for i, findId in x714129_g_eventList do
		if zhiwuId <= getn(V_ZHONGZHI_NAME) then
			CallScriptFunction( 713550, "OnDefaultEvent",sceneId, selfId, targetId, zhiwuId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务（暂时借用任务接口）
--**********************************
function x714129_OnMissionSubmit( sceneId, selfId, targetId, scriptId )
	for i, findId in x714129_g_eventList do
		if scriptId == findId then
			ret = CallScriptFunction( scriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( scriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )
				CallScriptFunction( scriptId, "OnDefaultEvent",sceneId, selfId, targetId, ABILITY_ZHONGZHI )
			end
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x714129_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x714129_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )
			end
			return
		end
	end
end


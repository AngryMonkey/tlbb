-- 引荐加入门派任务
-- 在各门派的拜师NPC处增加一个选项：引荐加入门派。

x210287_g_ScriptId = 210287

--**********************************
--列举事件
--**********************************
function x210287_OnEnumerate( sceneId, selfId, targetId )
	local mp = GetMenPai(sceneId, selfId)
	if mp ~= 9 then 
		AddNumText(sceneId, x210287_g_ScriptId, "引荐加入门派", 1, 900);
	end
end

function x210287_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText()==900  then
		local nNpcmenPai = -1
		-- 获得NPC的门派引导人的门派
		if GetName(sceneId, targetId) == "慧易"  then
			nNpcmenPai = 0
		elseif GetName(sceneId, targetId) == "石宝"  then
			nNpcmenPai = 1
		elseif GetName(sceneId, targetId) == "简宁"  then
			nNpcmenPai = 2
		elseif GetName(sceneId, targetId) == "张获"  then
			nNpcmenPai = 3
		elseif GetName(sceneId, targetId) == "路三娘"  then
			nNpcmenPai = 4
		elseif GetName(sceneId, targetId) == "海风子"  then
			nNpcmenPai = 5
		elseif GetName(sceneId, targetId) == "破贪"  then
			nNpcmenPai = 6
		elseif GetName(sceneId, targetId) == "程青霜"  then
			nNpcmenPai = 7
		elseif GetName(sceneId, targetId) == "澹台子羽"  then
			nNpcmenPai = 8
		end	
		
		--1,点击的时候首先判定玩家是否为本门派弟子，如果不是则弹出对话：只有本门弟子才能引荐未加入门派的玩家加入本门
		if nNpcmenPai ~= GetMenPai(sceneId, selfId)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  只有本门弟子才能引荐未加入门派的玩家加入本门。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId,"  现在各门派争夺人才很激烈啊，为此我决定，凡本门弟子推荐10级未加入门派的弟子加入本门，将会给予一定的奖励。");
			AddNumText(sceneId, x210287_g_ScriptId, "我要引荐他人加入门派", 1, 901)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	elseif GetNumText()== 901  then
	
		--一天只能引荐3次....
		local lastDayTime = GetMissionData(sceneId, selfId, MD_JOINMEIPAI_DAYTIME)
		local curDayTime = GetDayTime()
		if curDayTime > lastDayTime then
			SetMissionData(sceneId, selfId, MD_JOINMEIPAI_DAYTIME, curDayTime )
			SetMissionData(sceneId, selfId, MD_JOINMEIPAI_COUNT, 0 )
		end

		local TodayCount = GetMissionData(sceneId, selfId, MD_JOINMEIPAI_COUNT)
		if TodayCount > 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  您今天已经引荐太多的新手加入门派了，请明天再引荐更多的新手吧！");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 获得这个玩家是不是和一个人单独组队了
		--PrintNum(GetTeamSize(sceneId,selfId))
		if GetTeamSize(sceneId,selfId) < 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"  您必须要和引荐的人单独组队前来。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if GetTeamSize(sceneId,selfId) > 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"  必须要和被引荐的玩家两个人组队前来方可。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		--判断自己带来的人，是不是符合条件
		if GetNearTeamCount(sceneId,selfId) ~= 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  您所要引荐的对象不在附近。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
		if nPlayerId == selfId  then
			nPlayerId = GetNearTeamMember(sceneId,selfId,1)
		end
		
		local tarPosX, tarPosZ = LuaFnGetWorldPos(sceneId, nPlayerId);
		local npcPosX, npcPosZ = LuaFnGetWorldPos(sceneId, targetId);
		local distSqNpcToPlayer = (tarPosX - npcPosX) * (tarPosX - npcPosX) + (tarPosZ - npcPosZ) * (tarPosZ - npcPosZ);
		if distSqNpcToPlayer >= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"  您所要引荐的对象不在附近。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
--		-- 获得这个新手的信息，
		if GetMenPai(sceneId,nPlayerId)~=9 or GetLevel(sceneId,nPlayerId)~= 10  then
			BeginEvent(sceneId)
				AddText(sceneId,"  只有等级到达10级且没有加入其他门派的玩家，方可通过引荐加入本门。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 执行到这里，就可以给新手打开对话框
		BeginEvent(sceneId)
			local szStr = "  " .. GetName(sceneId,selfId) .. "推荐您加入" .. x210287_GetMenPaiName(GetMenPai(sceneId,selfId)) .. "，请问您是否愿意加入？"
			AddText(sceneId, szStr)
			AddNumText(sceneId, x210287_g_ScriptId, "愿意加入", 1, 905)
			AddNumText(sceneId, x210287_g_ScriptId, "我再考虑考虑", 1, 906)
		EndEvent(sceneId)
		DispatchEventList(sceneId,nPlayerId,targetId)
		
		BeginEvent(sceneId)
			AddText(sceneId,"  你已经给队友发送了推荐信息。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText()== 905  then
		-- 把自己加入这个门派，给介绍人，自己当前队友门派贡献度
		x210287_PlayerJoinMenpai(sceneId,selfId,targetId)
		
--		-- 关闭对话框
--		BeginUICommand(sceneId)
--		EndUICommand(sceneId)
--		DispatchUICommand(sceneId,selfId, 1000)
		
	elseif GetNumText()== 906  then
		-- 关闭对话框
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
		--给队长提示我拒绝了引荐....
		if GetNearTeamCount(sceneId,selfId) ~= 2 then
			return
		end

		local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
		if nPlayerId == selfId  then
			nPlayerId = GetNearTeamMember(sceneId,selfId,1)
		end

		if LuaFnIsCanDoScriptLogic(sceneId, nPlayerId) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"对方拒绝了您的引荐")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nPlayerId)
		end

	end
	
end

function x210287_GetMenPaiName(nMenPaiId)
	local szMenPai = ""
	if nMenPaiId == 0 then
		szMenPai = "少林派"
	elseif nMenPaiId == 1 then
		szMenPai =  "明教"
	elseif nMenPaiId == 2 then
		szMenPai =  "丐帮"
	elseif nMenPaiId == 3 then
		szMenPai =  "武当派"
	elseif nMenPaiId == 4 then
		szMenPai =  "峨嵋派"
	elseif nMenPaiId == 5 then
		szMenPai =  "星宿派"
	elseif nMenPaiId == 6 then
		szMenPai =  "天龙派"
	elseif nMenPaiId == 7 then
		szMenPai =  "天山派"
	elseif nMenPaiId == 8 then
		szMenPai =  "逍遥派"
	end	
	
	return szMenPai
end

function x210287_PlayerJoinMenpai(sceneId,selfId,targetId)
	
	-- 适当做点安全性检查
	if GetTeamSize(sceneId,selfId) < 2  then
		BeginEvent(sceneId)
			AddText(sceneId,"  你必须和你的推荐人保持组队。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetTeamSize(sceneId,selfId) > 2  then
		BeginEvent(sceneId)
			AddText(sceneId,"  必须要和引荐的玩家两个人组队前来方可。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--判断自己带来的人，是不是符合条件
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"  你的推荐人必须要在附近。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
	if nPlayerId == selfId  then
		nPlayerId = GetNearTeamMember(sceneId,selfId,1)
	end
	
	-- 验证这个Id是不是有效
	if LuaFnIsCanDoScriptLogic(sceneId, nPlayerId) == 0  then
		return
	end
	
	local nMenPaiId = GetMenPai(sceneId, nPlayerId)
	
	if nMenPaiId < 0  or nMenPaiId > 8  then
		return
	end
	
	local szMenpai = x210287_GetMenPaiName(nMenPaiId)
	
	-- 制定加入门派的操作
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
		x210287_g_MenPai = GetMenPai(sceneId, selfId)
		if x210287_g_MenPai == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "你又来消遣为师了，你已是我少林弟子，还拜什么师呢。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		--返回值为9表示无门派
		elseif x210287_g_MenPai==9	then
			
			LuaFnJoinMenpai(sceneId, selfId, targetId, nMenPaiId)

			-- 设置门派关系值
			CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

			BeginEvent(sceneId)
  			AddText(sceneId,"你已经加入" .. szMenpai .. "！");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			-- 把相关的心法设置为10级
			LuaFnSetXinFaLevel(sceneId,selfId, 1 + nMenPaiId*6, 10)
			LuaFnSetXinFaLevel(sceneId,selfId, 4 + nMenPaiId*6, 10)
			LuaFnSetXinFaLevel(sceneId,selfId, 5 + nMenPaiId*6, 10)
			
			if nMenPaiId == 0  then 		-- 少林
	  		if TryRecieveItem( sceneId, selfId, 10124000, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124000).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_3}" )
			elseif nMenPaiId == 1  then  --明教
	  		if TryRecieveItem( sceneId, selfId, 10124001, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124001).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_2}" )
			elseif nMenPaiId == 2  then  --丐帮
	  		if TryRecieveItem( sceneId, selfId, 10124002, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124002).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_6}" )
			elseif nMenPaiId == 3  then		--武当派
	  		if TryRecieveItem( sceneId, selfId, 10124004, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124004).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_9}" )
			elseif nMenPaiId == 4  then  --峨嵋派
	  		if TryRecieveItem( sceneId, selfId, 10124003, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124003).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_4}" )
			elseif nMenPaiId == 5  then  --星宿派
	  		if TryRecieveItem( sceneId, selfId, 10124005, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124005).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_1}" )
			elseif nMenPaiId == 6  then  --天龙派
	  		if TryRecieveItem( sceneId, selfId, 10124008, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124008).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_5}" )
			elseif nMenPaiId == 7  then  --天山派
	  		if TryRecieveItem( sceneId, selfId, 10124006, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124006).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_7}" )
			elseif nMenPaiId == 8  then  --逍遥派
	  		if TryRecieveItem( sceneId, selfId, 10124007, 1 ) >= 0 then
					str		= "#Y你获得了"..GetItemName( sceneId, 10124007).."。"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_8}" )
			end

			--门派奖励召集令
			for i=1, 20 do
				TryRecieveItem( sceneId, selfId, 30501001, 1 )
			end
			x210287_MsgBox( sceneId, selfId, "得到20枚门派召集令。" )

			if	LuaFnGetSex( sceneId, selfId)==0	then
				LuaFnMsg2Player( sceneId, selfId,"你已经加入" .. szMenpai .. "！",MSG2PLAYER_PARA)
--				CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
			else
				LuaFnMsg2Player( sceneId, selfId,"你已经加入" .. szMenpai .. "！",MSG2PLAYER_PARA)
--				CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
			end
			
			--给推荐人奖励 JOIN_MENPAI_WELCOME nPlayerId
			local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, nPlayerId)
			SetHumanMenpaiPoint(sceneId, nPlayerId, nMenpaiPoint+20)
			LuaFnMsg2Player(sceneId, nPlayerId,"由于您的推荐，您获得了20师门贡献度。",MSG2PLAYER_PARA)
			
			--增加今天推荐的次数....
			local TodayCount = GetMissionData(sceneId, nPlayerId, MD_JOINMEIPAI_COUNT)
			SetMissionData(sceneId, nPlayerId, MD_JOINMEIPAI_COUNT, TodayCount+1 )

			-- 门派公告
			local szPlayer1 = GetName(sceneId, selfId)
			local szPlayer2 = GetName(sceneId, nPlayerId)
			local szBroad = "@*;SrvMsg;" .. "tuijian_join_menpai" ..";"..szPlayer1..";"..szPlayer2..";"..szPlayer2
			
			BroadMsgByChatPipe(sceneId, selfId, szBroad, 7)
			
			-- 给被引荐人一个对话提示
			BeginEvent(sceneId)
				AddText(sceneId, "  你已经成为了本派弟子。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
		end
	end
	
end

--**********************************
--消息提示
--**********************************
function x210287_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

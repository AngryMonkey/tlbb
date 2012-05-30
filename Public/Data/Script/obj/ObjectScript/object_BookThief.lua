--宝书窃贼

x807003_g_scriptId=807003

--**********************************
--事件交互入口
--**********************************
function x807003_OnDefaultEvent( sceneId, selfId, targetId )

	--判断是否能够激活该npc的条件
	
	local npcLevel = GetCharacterLevel(sceneId, targetId)

	--取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if  nearteammembercount < 3 then	
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZSSFC_090211_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	local maxLevel = 0
	for	i = 0, nearteammembercount - 1 do
		local memberID = GetNearTeamMember( sceneId, selfId, i )
		local memberLevel = GetLevel(sceneId, memberID)
		if memberLevel > maxLevel then
			maxLevel = memberLevel
		end
	end
	
	if maxLevel < npcLevel then
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZSSFC_090211_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	--激活npc
	--设置对怪为敌对的 目前是28号是敌对的，如果有人改变了相应的势力声望那我就惨了！！:-(((
	SetUnitReputationID(sceneId, selfId, targetId, 28)

end

function x807003_OnDie(sceneId, selfId, killerId)

end


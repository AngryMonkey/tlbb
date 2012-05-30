--厄修罗护身符，永夜修罗护身符，万劫修罗护身符

--脚本号
x300003_g_scriptId = 300003

--任务号
x300003_g_MissionId = 637

--物品编号
x300003_g_ItemId1 = 40002087		--厄修罗护身符
x300003_g_ItemId2 =	40002088		--永夜修罗护身符
x300003_g_ItemId3 =	40002089		--万劫修罗护身符
x300003_g_ItemId4 = 40002090		--修罗王的指示
--**********************************
--刷新事件
--**********************************
function x300003_OnDefaultEvent( sceneId, selfId, BagIndex )
	--判断是否有厄修罗护身符
	if (HaveItem (sceneId,selfId,x300003_g_ItemId1) < 0 ) then
		BeginEvent(sceneId)
			AddText(sceneId,"需要厄修罗护身符")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--判断是否有厄修罗护身符
	if (HaveItem (sceneId,selfId,x300003_g_ItemId2) < 0 ) then
		BeginEvent(sceneId)
			AddText(sceneId,"需要永夜修罗护身符")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--判断是否有
	if (HaveItem (sceneId,selfId,x300003_g_ItemId3) < 0 ) then
		BeginEvent(sceneId)
			AddText(sceneId,"需要万劫修罗护身符")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--增加修罗王的指示
	BeginAddItem(sceneId)
		AddItem( sceneId,x300003_g_ItemId4, 1 )
	ret = EndAddItem(sceneId,selfId)
	if ret >0 then 
		AddItemListToHuman(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"你得到了修罗王的指示1/1")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		--把任务完成标志置为1
		misIndex = GetMissionIndexByID(sceneId,selfId,x300003_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,0)
		if num == 0 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)
		end
		--删除3个护身符
		DelItem( sceneId, selfId, x300003_g_ItemId1, 1 )
		DelItem( sceneId, selfId, x300003_g_ItemId2, 1 )
		DelItem( sceneId, selfId, x300003_g_ItemId3, 1 )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"没有背包空间")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
end


function x300003_IsSkillLikeScript( sceneId, selfId)
	return 0;
end


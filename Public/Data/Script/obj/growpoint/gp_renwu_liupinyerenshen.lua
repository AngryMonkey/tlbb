--创建

-- scriptId = 715002
function 		x715002_OnCreate(sceneId,growPointType,x,y)
	
	ItemCount = 1	-- 物品数量
	Item0			=	40002097 --物品ITEM_TYPE 编号
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount,Item0)	--函数调用	
	
end

--返回类型
-- 0 表示打开成功
--打开前
--在CONFIG/ABILITY.TXT文件中
function	 x715002_OnOpen(sceneId,selfId,targetId)
	--ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	--AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	if HaveItem (sceneId,selfId,40002097) > 0 then 
		BeginEvent(sceneId)
			strText = "已经拿到人参了,快去交任务吧"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_MISSION_NOT_FIND
	end
	
	if IsHaveMission(sceneId,selfId,MISSION_564) > 0 then
		return OR_OK
	else
		return OR_MISSION_NOT_FIND
	end
	
end

--回收
function	 x715002_OnRecycle(sceneId,selfId,targetId)
 	return 1;
end

--打开后
function	x715002_OnProcOver(sceneId,selfId,targetId)
	return 0
end

function x715002_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

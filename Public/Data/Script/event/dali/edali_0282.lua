			
--BUS
--大理东门飞往西门

x210282_g_ScriptId = 210282
x210282_g_busGuilList = {1000001, 1000002}


function x210282_OnDefaultEvent( sceneId, selfId, targetId )
	local bSucceeded = 0;
	strText = "无可用坐骑，请稍候";
	for i, busGuid in x210282_g_busGuilList do
		busId = LuaFnBusGetObjIDByGUID(sceneId, busGuid);
		if busId then
			if busId ~= -1 then
				ret = LuaFnBusAddPassenger_Shuttle(sceneId, busId, selfId, targetId, 0);
				if ret == OR_OK then
					strText = "请稍候，马上起飞"
					bSucceeded = 1;
					break
				elseif ret == OR_BUS_PASSENGERFULL then
					strText = "坐骑已满，请乘坐下一班。"
					break
				elseif ret == OR_BUS_HASMOUNT then
					strText = "您不能在坐骑上执行此操作。"
					break
				elseif ret == OR_BUS_HASPET then
					strText = "您不能在携带有珍兽的时候执行此操作。"
					break
				elseif ret == OR_BUS_CANNOT_TEAM_FOLLOW then
					strText = "您不能在组队跟随时执行此操作。"
					break
				elseif ret == OR_BUS_CANNOT_DRIDE then
					strText = "您不能在双人骑乘时执行此操作。"
					break
				elseif ret == OR_BUS_CANNOT_CHANGE_MODEL then
					strText = "您不能在变身时执行此操作。"
					break
				else
				end
			end
		end
	end

	BeginEvent(sceneId)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bSucceeded == 1 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
	end
end



--**********************************

--列举事件

--**********************************

function x210282_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x210282_g_ScriptId, "飞往西门", 9, -1);
end


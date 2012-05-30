--NPC 战车模型NPC

x402302_g_ScriptId = 402302; --脚本号
--x402302_g_name	="战车";

--所拥有的事件ID列表
x402302_g_eventId_yes = 0;
x402302_g_eventId_no = 1;

x402302_g_A_TankID = {13339, 13340, 13341, 13342, 13343}--可点击战车NPC的ID
x402302_g_B_TankID = {13334, 13335, 13336, 13337, 13338}--可点击战车NPC的ID

--**********************************
--事件交互入口
--**********************************
function x402302_OnDefaultEvent( sceneId, selfId, targetId )
	x402302_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x402302_UpdateEventList( sceneId, selfId, targetId )
	local isAguild = CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId )
	local DataId = GetMonsterDataID(sceneId, targetId)
	
	local isNPCAguild = 0
	for j = 1, getn( x402302_g_A_TankID ) do
		if DataId == x402302_g_A_TankID[j] then
			isNPCAguild = 1
			break
		end
	end
	for j = 1, getn( x402302_g_B_TankID ) do
		if DataId == x402302_g_B_TankID[j] then
			isNPCAguild = 0
			break
		end
	end
	
	if isAguild == isNPCAguild then --玩家帮派和战车帮派是否相同
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_89}" );
			AddNumText( sceneId, x402302_g_ScriptId, "确定", 9, x402302_g_eventId_yes);
			AddNumText( sceneId, x402302_g_ScriptId, "取消", 8, x402302_g_eventId_no);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_90}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
	
end

--**********************************
--事件列表选中一项
--**********************************
function x402302_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	local isAguild = CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId )
	local DataId = GetMonsterDataID(sceneId, targetId)
	local isNPCAguild = 0
	local index = -1
	local base = 0
	for j = 1, getn( x402302_g_A_TankID ) do
		if DataId == x402302_g_A_TankID[j] then
			isNPCAguild = 1
			index = j
			base = 5
			break
		end
	end
	for j = 1, getn( x402302_g_B_TankID ) do
		if DataId == x402302_g_B_TankID[j] then
			isNPCAguild = 0
			index = j
			base = 0
			break
		end
	end
	
	if isAguild ~= isNPCAguild or index == -1 then --玩家帮派和战车帮派是否相同，是否找到启动战车类型
		return
	end
	
	if selectEventId == x402302_g_eventId_yes then
		local ret = CallScriptFunction(600051, "PowerUptank", sceneId, selfId, targetId, index+base, isAguild, 0)
		if ret == 1 then --把战车自己删除
			LuaFnDeleteMonster(sceneId, targetId)
		end
	else
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x402302_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x402302_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

--NPC ս��ģ��NPC

x402302_g_ScriptId = 402302; --�ű���
--x402302_g_name	="ս��";

--��ӵ�е��¼�ID�б�
x402302_g_eventId_yes = 0;
x402302_g_eventId_no = 1;

x402302_g_A_TankID = {13339, 13340, 13341, 13342, 13343}--�ɵ��ս��NPC��ID
x402302_g_B_TankID = {13334, 13335, 13336, 13337, 13338}--�ɵ��ս��NPC��ID

--**********************************
--�¼��������
--**********************************
function x402302_OnDefaultEvent( sceneId, selfId, targetId )
	x402302_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
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
	
	if isAguild == isNPCAguild then --��Ұ��ɺ�ս�������Ƿ���ͬ
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_89}" );
			AddNumText( sceneId, x402302_g_ScriptId, "ȷ��", 9, x402302_g_eventId_yes);
			AddNumText( sceneId, x402302_g_ScriptId, "ȡ��", 8, x402302_g_eventId_no);
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
--�¼��б�ѡ��һ��
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
	
	if isAguild ~= isNPCAguild or index == -1 then --��Ұ��ɺ�ս�������Ƿ���ͬ���Ƿ��ҵ�����ս������
		return
	end
	
	if selectEventId == x402302_g_eventId_yes then
		local ret = CallScriptFunction(600051, "PowerUptank", sceneId, selfId, targetId, index+base, isAguild, 0)
		if ret == 1 then --��ս���Լ�ɾ��
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
--���ܴ�NPC������
--**********************************
function x402302_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x402302_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

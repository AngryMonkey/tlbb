--890013������Ƭ�һ�
x890013_g_ScriptId = 890013
x890013_g_itemId = 39901005
x890013_g_MonsterId = 13169


--**********************************
--�¼��б�
--**********************************
function x890013_UpdateEventList( sceneId, selfId,targetId )		 
	bCanCreate = LuaFnGetSceneAttr_CanCreateRascalKiller(sceneId);
	if bCanCreate == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"�˳�������ʹ��")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return 0;
	end

	local level = GetLevel( sceneId, selfId )
	if not level or level < 121 then
		BeginEvent( sceneId )
			AddText( sceneId, "�ȼ�����121���޷�ʹ��" )
		EndEvent( )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x890013_g_itemId, 1) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "������ӵ��1���������Ҳſ���Ϊ���ٻ�,������Ʒ�Ƿ�������" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId, x890013_g_MonsterId, posX, posZ, 1, 0, 0);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
			SetCharacterTitle(sceneId, nObjID, "�ֻ���");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
            local  nam= LuaFnGetName( sceneId, selfId )
		  local strText = format ("@*;SrvMsg;SCA:#b#cff00f0��ϲ��ҡ��#c00ff00"..nam.."#b#cff00f0���ɹ�ʹ���������ٻ����ֻ���#Y", nam)						
		      BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		   return
end
--**********************************
--�¼��������
--**********************************
function x890013_OnDefaultEvent( sceneId, selfId,targetId )
	x890013_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x890013_OnEventRequest( sceneId, selfId, targetId, eventId )
end
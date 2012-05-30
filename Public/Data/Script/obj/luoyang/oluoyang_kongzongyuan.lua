--����NPC
--����Ԩ
--��ͨ

x000124_g_ScriptId	= 000124

--������
x000124_g_Key				=
{
		["do"]					= 100,	--ȷ��
		["undo"]				= 101,	--ȡ��
}

--******************************************************
--�¼��������
--******************************************************
function x000124_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ���˴�����ʥ������ʥ�˿���Ԩ��Ҳ��������ж�����������ռ�����ı����ռ䣬���Խ�������ɾ����������ɾ���������֮ǰ��һ��Ҫ���������ȷʵû����;�ˡ�" )
		AddNumText( sceneId, x000124_g_ScriptId, "����ɾ���������", -1, x000124_g_Key["do"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000124_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x000124_g_Key["do"]	then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 42 )
	end
end

--******************************************************
--����������Ʒ
--��Client\Interface\MissionObjDel\MissionObjDel.lua����
--******************************************************
function x000124_OnDestroy( sceneId, selfId, posItem )
	if posItem < 0 then
		return
	end
	
	local idItem = LuaFnGetItemTableIndexByIndex( sceneId, selfId, posItem )
	
	if idItem == 40002109 then 
		
		local ret = DelMission( sceneId, selfId, 4021 )
		if ret > 0 then		
			SetCurTitle(sceneId, selfId,  0, 124)
			DeleteTitle( sceneId, selfId,  5)
			LuaFnDispatchAllTitle(sceneId, selfId)			
			SetMissionData(sceneId,selfId,MD_CAOYUN_HUAN,0)
			SetMissionData(sceneId,selfId,MD_CAOYUN_MONSTERTIMER,0)
			LuaFnCancelSpecificImpact(sceneId,selfId,113)
		end
	
	end
	EraseItem( sceneId, selfId, posItem )
	x000124_OnDestroyLaborDay( sceneId, selfId, idItem )
end

--******************************************************
--����������Ʒ�����⴦�� ��һ�����ͻ
--���� 2008-04-17
--******************************************************
function x000124_OnDestroyLaborDay( sceneId, selfId, idItem )
	if(GlobalLaborDayActivityTable.PetCageCardID == idItem) then
		local hasImapct = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff)
		if ( hasImapct > 0 ) then
			LuaFnCancelSpecificImpact(sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff)
		end
	end
end

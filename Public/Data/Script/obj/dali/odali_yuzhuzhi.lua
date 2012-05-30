--����NPC
--����֮
--��ͨ

x002088_g_ScriptId	= 002088

--������
x002088_g_Key				=
{
		["mis"]					= 100,	--����ɾ�����е�����
		["itm"]					= 101,	--����ɾ���������
		["do"]					= 102,	--ȷ��ɾ�����е�����
}

-- ��Ҫ��ɾ�����������ʱ��ͬʱɾ����������Ʒ���б�
x002088_g_MisItemList = {	40004000,40004451,40004452,40004461,
		40004453,40004456,40004459,40004458,40004455,40004457,30505062,	
		40004465, 40004462, 40004463, 40004464,				--���Ϻ�«����ʯ����Ҷ�������� zchw						
}

--******************************************************
--�¼��������
--******************************************************
function x002088_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ���Ƿ������ʵ۱���֮�����ڴ˰�������Ӣ����������ġ��������ɾ�������б������е����񣬻���ɾ��ĳ���ض�������ߣ������������Ұ�æ��������ʲô�أ�" )
		AddNumText( sceneId, x002088_g_ScriptId, "����ɾ�����е�����", -1, x002088_g_Key["mis"] )
		AddNumText( sceneId, x002088_g_ScriptId, "����ɾ���������", -1, x002088_g_Key["itm"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end


function x002088_CheckCanDelMission_OverTime( sceneId, selfId, targetId, eventId )
    local DayTime = GetDayTime()
    local LastTime = GetMissionData( sceneId, selfId, MD_NPC_DELMISSION ) --ȡ���ϴη���ʱ��
    
    if DayTime > LastTime then
        SetMissionData( sceneId, selfId, MD_NPC_DELMISSION, DayTime )
        return 1
    end
    
    return -1
    
end


--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002088_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x002088_g_Key["mis"]	then
		if GetMissionCount( sceneId, selfId ) <= 0 then
			BeginEvent( sceneId )
				AddText( sceneId, "  ������ϸ���û�����񰡣�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  ɾ�����񽫻�ɾ���������е������Ƿ�ȷ��Ҫɾ����" )
				AddNumText( sceneId, x002088_g_ScriptId, "ȷ��", -1, x002088_g_Key["do"] )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end

	elseif key == x002088_g_Key["itm"]	then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 42 )
		
	elseif key == x002088_g_Key["do"]	then
	    
	    local CanDel = x002088_CheckCanDelMission_OverTime( sceneId, selfId, targetId, eventId )
	    if CanDel ~= 1 then
			BeginEvent( sceneId )
				AddText( sceneId, "���ϴ���������ɾ���������ڲ���24Сʱ�����ڻ��������㡣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
				        
	        return
	    end
	    
	  if IsHaveMission( sceneId, selfId, 1258 ) > 0 then --��������Ʒ����д�б����棬��Ȼ��ɾ��һ����ڶ�����ʱ��Ҳ��ɾһ�������顣doing 38427
	  	DelItem(sceneId, selfId, 40004454, 1)
	  end
	  
		DelAllMission( sceneId, selfId )
	  
	  -- ��Ҫ��ɾ�������ͬʱɾ����������Ʒ
		for i, nItemId in x002088_g_MisItemList do
			-- ��������Ʒ������
			local nItemCount = GetItemCount(sceneId, selfId, nItemId)
			
			if nItemCount > 0  then
				DelItem(sceneId, selfId, nItemId, nItemCount)
			end
		
		end
	    
		Msg2Player( sceneId, selfId, "#Rɾ����������ɹ���", MSG2PLAYER_PARA )
		BeginEvent( sceneId )
			AddText( sceneId, "  ɾ����������ɹ���" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--******************************************************
--����������Ʒ
--��Client\Interface\MissionObjDel\MissionObjDel.lua����
--******************************************************
function x002088_OnDestroy( sceneId, selfId, posItem )
	if posItem < 0 then
		return
	end

	EraseItem( sceneId, selfId, posItem )
end

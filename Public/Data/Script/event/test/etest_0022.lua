--��óƺ�
--�㱱

--�ű���
x804022_g_scriptId = 804022
--�����
x804022_g_MissionId = 4022


local  PlayerName=""
--������
x804022_g_missionName="�ƺ�"
x804022_g_missionText_0="�ƺ�,���ڽ���,��������"
x804022_g_missionText_1="����Уξ"

x804022_g_missionText_2="����˭�����ҹ����ʲô��"

x804022_g_MoneyBonus=80000
x804022_g_ItemBonus={{id=10101001,num=1}}

--**********************************
--������ں���
--**********************************
function x804022_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
	if( IsHaveMission(sceneId,selfId,x804022_g_MissionId) > 0)  then
		if x804022_CheckSubmit(sceneId,selfId) == 1 then
			BeginEvent(sceneId)
			AddText(sceneId,x804022_g_missionName)
			AddMoneyBonus( sceneId, x804022_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804022_g_scriptId,x804022_g_MissionId,1)
		else
			BeginEvent(sceneId)
			AddText(sceneId,x804022_g_missionName)
			AddText(sceneId,"����֮��")
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804022_g_scriptId,x804022_g_MissionId,0)
		end
			
    --���������������
  elseif x804022_CheckAccept(sceneId,selfId) > 0 then
		name = GetName(sceneId,selfId)
		playname = format("��ҵ�������:%s\n",name)
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x804022_g_missionName)
		AddText(sceneId,x804022_g_missionText_0)
		AddText(sceneId,playname)
		AddText(sceneId,x804022_g_missionText_1)
		AddMoneyBonus( sceneId, x804022_g_MoneyBonus )
		for i, item in x804022_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x804022_g_scriptId,x804022_g_MissionId)
  end
end

--**********************************
--�о��¼�
--**********************************
function x804022_OnEnumerate( sceneId, selfId, targetId )
   if IsHaveMission(sceneId,selfId,x804022_g_MissionId) > 0 then
		--if GetName(sceneId,targetId) == g_name then
			AddNumText(sceneId, x804022_g_scriptId,x804022_g_missionName);
		--end
    --���������������
   elseif x804022_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x804022_g_scriptId,x804022_g_missionName)
   end
end

--**********************************
--����������
--**********************************
function x804022_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x804022_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x804022_g_MissionId, x804022_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x804022_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x804022_g_MissionId )
end

--**********************************
--����
--**********************************
function x804022_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x804022_g_missionName)
     AddText(sceneId,x804022_g_missionText_2)
   AddMoneyBonus( sceneId, x804022_g_MoneyBonus )
    for i, item in x804022_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x804022_g_scriptId,x804022_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x804022_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x804022_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	if GetTitle(sceneId,selfId,3) == 0 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x804022_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x804022_CheckSubmit( sceneId, selfId ) == 1 then
    BeginAddItem(sceneId)
		for i, item in x804022_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			if DelMission( sceneId,selfId,  x804022_g_MissionId ) ~=1 then
				return
			end
			if DelItem(sceneId,selfId,20001003,1) ~= 1 then
				return
			end
			
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x804022_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x804022_g_MoneyBonus );
			
			--CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
			NewWorld(sceneId,selfId,19,10,10)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x804022_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x804022_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x804022_OnItemChanged( sceneId, selfId, itemdataId )
end









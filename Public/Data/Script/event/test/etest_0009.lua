--�ڳ���̴ľ
--�㱱

--�ű���
x804009_g_scriptId = 804009
--�����
x804009_g_MissionId = 4009


local  PlayerName=""
--������
x804009_g_missionName="��̴ľ"
x804009_g_missionText_0="��̴ľ,��ҩ�õ���̴ľ"
x804009_g_missionText_1="�������"

x804009_g_missionText_2="����˭�����ҹ����ʲô��"

x804009_g_MoneyBonus=80000
x804009_g_ItemBonus={{id=10101001,num=1}}
x804009_g_name	= ""

--**********************************
--������ں���
--**********************************
function x804009_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
	if( IsHaveMission(sceneId,selfId,x804009_g_MissionId) > 0)  then
		if x804009_CheckSubmit(sceneId,selfId) == 1 then
			BeginEvent(sceneId)
			AddText(sceneId,x804009_g_missionName)
			AddMoneyBonus( sceneId, x804009_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804009_g_scriptId,x804009_g_MissionId,1)
		else
			BeginEvent(sceneId)
			AddText(sceneId,x804009_g_missionName)
			AddText(sceneId,"û���������20001003")
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804009_g_scriptId,x804009_g_MissionId,0)
		end
			
    --���������������
  elseif x804009_CheckAccept(sceneId,selfId) > 0 then
		name = GetName(sceneId,selfId)
		playname = format("��ҵ�������:%s\n",name)
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x804009_g_missionName)
		AddText(sceneId,x804009_g_missionText_0)
		AddText(sceneId,playname)
		AddText(sceneId,x804009_g_missionText_1)
		AddMoneyBonus( sceneId, x804009_g_MoneyBonus )
		for i, item in x804009_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x804009_g_scriptId,x804009_g_MissionId)
  end
end

--**********************************
--�о��¼�
--**********************************
function x804009_OnEnumerate( sceneId, selfId, targetId )
   if IsHaveMission(sceneId,selfId,x804009_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x804009_g_name then
			AddNumText(sceneId, x804009_g_scriptId,x804009_g_missionName);
		end
    --���������������
    elseif x804009_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x804009_g_scriptId,x804009_g_missionName)
    end
end

--**********************************
--����������
--**********************************
function x804009_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x804009_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x804009_g_MissionId, x804009_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x804009_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x804009_g_MissionId )
end

--**********************************
--����
--**********************************
function x804009_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x804009_g_missionName)
     AddText(sceneId,x804009_g_missionText_2)
   AddMoneyBonus( sceneId, x804009_g_MoneyBonus )
    for i, item in x804009_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x804009_g_scriptId,x804009_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x804009_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x804009_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	if HaveItem(sceneId,selfId,20001003) >= 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x804009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x804009_CheckSubmit( sceneId, selfId ) == 1 then
    BeginAddItem(sceneId)
		for i, item in x804009_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			if DelMission( sceneId,selfId,  x804009_g_MissionId ) ~=1 then
				return
			end
			if DelItem(sceneId,selfId,20001003,1) ~= 1 then
				return
			end
			
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x804009_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x804009_g_MoneyBonus );
			
			CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x804009_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x804009_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x804009_OnItemChanged( sceneId, selfId, itemdataId )
end









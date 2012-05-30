--ҹ�������
--�㱱

--�ű���
x804013_g_scriptId = 804013
--�����
x804013_g_MissionId = 4013


local  PlayerName=""
--������
x804013_g_missionName="ҹ�������"
x804013_g_missionText_0="ҹ�������,��������"
x804013_g_missionText_1="���Ͷ�����"

x804013_g_missionText_2="����˭�����ҹ����ʲô��"

x804013_g_MoneyBonus=80000
x804013_g_ItemBonus={{id=10101001,num=1}}
x804013_g_name	= ""

--**********************************
--������ں���
--**********************************
function x804013_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
	if( IsHaveMission(sceneId,selfId,x804013_g_MissionId) > 0)  then
		if x804013_CheckSubmit(sceneId,selfId) == 1 then
			BeginEvent(sceneId)
			AddText(sceneId,x804013_g_missionName)
			AddMoneyBonus( sceneId, x804013_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804013_g_scriptId,x804013_g_MissionId,1)
		else
			BeginEvent(sceneId)
			AddText(sceneId,x804013_g_missionName)
			AddText(sceneId,"����֮��")
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804013_g_scriptId,x804013_g_MissionId,0)
		end
			
    --���������������
  elseif x804013_CheckAccept(sceneId,selfId) > 0 then
		name = GetName(sceneId,selfId)
		playname = format("��ҵ�������:%s\n",name)
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x804013_g_missionName)
		AddText(sceneId,x804013_g_missionText_0)
		AddText(sceneId,playname)
		AddText(sceneId,x804013_g_missionText_1)
		AddMoneyBonus( sceneId, x804013_g_MoneyBonus )
		for i, item in x804013_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x804013_g_scriptId,x804013_g_MissionId)
  end
end

--**********************************
--�о��¼�
--**********************************
function x804013_OnEnumerate( sceneId, selfId, targetId )
   if IsHaveMission(sceneId,selfId,x804013_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x804013_g_name then
			AddNumText(sceneId, x804013_g_scriptId,x804013_g_missionName);
		end
    --���������������
    elseif x804013_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x804013_g_scriptId,x804013_g_missionName)
    end
end

--**********************************
--����������
--**********************************
function x804013_CheckAccept( sceneId, selfId )
	return 1	
end

--**********************************
--����
--**********************************
function x804013_OnAccept( sceneId, selfId ,targetId)
	--������������б�
	AddMission( sceneId,selfId, x804013_g_MissionId, x804013_g_scriptId, 0, 0, 0 )
	timerIndex =SetTimer(sceneId,selfId,x804013_g_scriptId,"OnTimer",1000)
	misIndex = GetMissionIndexByID(sceneId,selfId,x804013_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,timerIndex)
	SetMissionByIndex(sceneId,selfId,misIndex,1,targetId)
	SetPatrolId(sceneId,targetId,0)
end

function x804013_OnTimer(sceneId,selfId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x804013_g_MissionId)
	x804013_g_sdhyTargetId = GetMissionParam(sceneId,selfId,misIndex,1)
  if IsInDist(sceneId,selfId,x804013_g_sdhyTargetId,64) < 0 then
  	DelMission(sceneId,selfId,x804013_g_MissionId)
  	StopTimer(sceneId,selfId,GetMissionParam(sceneId,selfId,misIndex,0))
  	Msg2Player(sceneId,selfId,"����ʧ�ܱ���,����ȡ��",MSG2PLAYER_PARA)
  	
  	--protectTargetId = GetMissionParam(sceneId,selfId,misIndex,1)
  	--RemoveMonster(sceneId,protectTargetId)
  end		
end

--**********************************
--����
--**********************************
function x804013_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x804013_g_MissionId )
end

--**********************************
--����
--**********************************
function x804013_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x804013_g_missionName)
     AddText(sceneId,x804013_g_missionText_2)
   AddMoneyBonus( sceneId, x804013_g_MoneyBonus )
    for i, item in x804013_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x804013_g_scriptId,x804013_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x804013_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x804013_g_MissionId )
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
function x804013_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x804013_CheckSubmit( sceneId, selfId ) == 1 then
    BeginAddItem(sceneId)
		for i, item in x804013_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			if DelMission( sceneId,selfId,  x804013_g_MissionId ) ~= 1 then
				return
			end
			if DelItem(sceneId,selfId,20001003,1) ~= 1 then
				return
			end
			
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x804013_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x804013_g_MoneyBonus );
			
			CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x804013_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x804013_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x804013_OnItemChanged( sceneId, selfId, itemdataId )
end









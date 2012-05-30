--�ڳ���ƷҶ�˲�
--�㱱

--�ű���
x804006_g_scriptId = 804006
--�����
x804006_g_MissionId = 4006

local  PlayerName=""
--������
x804006_g_missionName="�ڳ���ƷҶ�˲�"
x804006_g_missionText_0="֪���˲ε����Ч?"
x804006_g_missionText_1="��˵ز�Զ������ɽ,��˵�����ڵ�ǧ���˲�"

x804006_g_missionText_2="����˭�����ҹ����ʲô��"

x804006_g_MoneyBonus=166
x804006_g_ItemBonus={{id=10105001,num=1}}
x804006_g_name	= ""

--**********************************
--������ں���
--**********************************
function x804006_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ��������
  --if (IsMissionHaveDone(sceneId,selfId,x804006_g_MissionId) > 0 ) then
	-- 	return
	--else
	if( IsHaveMission(sceneId,selfId,x804006_g_MissionId) > 0)  then
		if x804006_CheckSubmit(sceneId,selfId) == 1 then
			BeginEvent(sceneId)
			AddText(sceneId,x804006_g_missionName)
			AddMoneyBonus( sceneId, x804006_g_MoneyBonus )
			EndEvent()
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804006_g_scriptId,x804006_g_MissionId,1)
		else
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x804006_g_missionName)
			AddText(sceneId,"�㲢û���������20001001")
			AddMoneyBonus( sceneId, x804006_g_MoneyBonus )
			for i, item in x804006_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x804006_g_scriptId,x804006_g_MissionId,0)
	  end
			
  elseif x804006_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,x804006_g_missionName)
		AddText(sceneId,x804006_g_missionText_0)
		AddText(sceneId,x804006_g_missionText_1)
		AddMoneyBonus( sceneId, x804006_g_MoneyBonus )
		for i, item in x804006_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x804006_g_scriptId,x804006_g_MissionId)
	
  end
end

--**********************************
--�о��¼�
--**********************************
function x804006_OnEnumerate( sceneId, selfId, targetId )
    --��������ɹ��������
    --if IsMissionHaveDone(sceneId,selfId,x804006_g_MissionId) > 0 then
    	--return 
    --����ѽӴ�����
    --else
    if IsHaveMission(sceneId,selfId,x804006_g_MissionId) > 0 then
			if GetName(sceneId,targetId) == x804006_g_name then
				AddNumText(sceneId, x804006_g_scriptId,x804006_g_missionName);
			end
    --���������������
    elseif x804006_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x804006_g_scriptId,x804006_g_missionName);
    end
end

--**********************************
--����������
--**********************************
function x804006_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	return 1
end

--**********************************
--����
--**********************************
function x804006_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x804006_g_MissionId, x804006_g_scriptId, 0, 0, 0 )
end

--**********************************
--����
--**********************************
function x804006_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x804006_g_MissionId )
end

--**********************************
--����
--**********************************
function x804006_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x804006_g_missionName)
    AddText(sceneId,x804006_g_missionText_2)
   	AddMoneyBonus( sceneId, x804006_g_MoneyBonus )
    for i, item in x804006_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x804006_g_scriptId,x804006_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x804006_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x804006_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	if HaveItem(sceneId,selfId,20001004) >= 1 then
		return 1
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x804006_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x804006_CheckSubmit( sceneId, selfId ) == 1 then
    	BeginAddItem(sceneId)
		for i, item in x804006_g_ItemBonus do
			AddItem( sceneId,item.id, item.num )
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			DelItem(sceneId,selfId,20001001,1)
			AddItemListToHuman(sceneId,selfId)
			AddMoney(sceneId,selfId,x804006_g_MoneyBonus );
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,x804006_g_MissionId )
			DelMission( sceneId,selfId,x804006_g_MissionId )
			
			--CallScriptFunction( 201001, "OnDefaultEvent",sceneId, selfId, targetId)
		else
		--������û�мӳɹ�
			PrintStr("�����ռ䲻��")
		end
	        
	end
end

--**********************************
--ɱ����������
--**********************************
function x804006_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x804006_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x804006_OnItemChanged( sceneId, selfId, itemdataId )
end









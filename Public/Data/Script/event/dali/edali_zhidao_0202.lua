--Ѱ������
--������Ҫ������ҵ�һ����ͷ
--MisDescBegin
--�ű���
x210202_g_ScriptId = 210202

x210202_g_Position_X=110.0841
x210202_g_Position_Z=158.7671
x210202_g_SceneID=2
x210202_g_AccomplishNPC_Name="������"

--�����
x210202_g_MissionId = 442

--��һ�������ID
x210202_g_MissionIdPre = 441

--Ŀ��NPC
x210202_g_Name	="������"

--������߱��
x210202_g_ItemId = 30101001

--���������������
x210202_g_ItemNeedNum = 1

--�������
x210202_g_MissionKind = 13

--����ȼ�
x210202_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210202_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x210202_g_DemandItem={{id=30101001,num=1}}		--������1λ
x210202_g_IsMissionOkFail = 1		--�����ĵ�0λ

--������
x210202_g_MissionName="��һ����ͷ"
x210202_g_MissionInfo_1="  #R"
x210202_g_MissionInfo_2="#{event_dali_0004}"
x210202_g_MissionTarget="#{xinshou_002}"
x210202_g_MissionContinue="���Ѿ���#Y��ͷ#W����������"
x210202_g_MissionComplete="  �ţ����ò��������������츳�ɲ���һ��ĸ߰���"
x210202_g_MoneyBonus=1
x210202_g_SignPost = {x = 110, z = 159, tip = "������"}
x210202_g_RadioItemBonus={{id=30304030 ,num=1},{id=30304031,num=1}}
--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210202_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������ʵ��������������������Ͳ�����ʾ�������ټ��һ�αȽϰ�ȫ��
    --if IsMissionHaveDone(sceneId,selfId,x210202_g_MissionId) > 0 then
	--	return
	--end
    --����ѽӴ�����
		if IsHaveMission(sceneId,selfId,x210202_g_MissionId) > 0 then
			--���������������Ϣ
			BeginEvent(sceneId)
			AddText(sceneId,x210202_g_MissionName)
			AddText(sceneId,x210202_g_MissionContinue)
			for i, item in x210202_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210202_g_MoneyBonus )
			EndEvent( )
			bDone = x210202_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210202_g_ScriptId,x210202_g_MissionId,bDone)
		--���������������
		elseif x210202_CheckAccept(sceneId,selfId) > 0 then
			--�����������ʱ��ʾ����Ϣ
				local  PlayerName=GetName(sceneId,selfId)	
	            local  PlayerSex=GetSex(sceneId,selfId)
	            if PlayerSex == 0 then
		            PlayerSex = "����"
	            else
		            PlayerSex = "����"
	            end
			BeginEvent(sceneId)
				AddText(sceneId,x210202_g_MissionName)
				AddText(sceneId,x210202_g_MissionInfo_1..PlayerName..PlayerSex..x210202_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210202_g_MissionTarget)
				for i, item in x210202_g_RadioItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210202_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210202_g_ScriptId,x210202_g_MissionId)
		end
end

--**********************************
--�о��¼�
--**********************************
function x210202_OnEnumerate( sceneId, selfId, targetId )
    --�����һ�δ�����һ������
    if 	IsMissionHaveDone(sceneId,selfId,x210202_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210202_g_MissionId) > 0 then
    	return 
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210202_g_MissionId) > 0 then
		AddNumText(sceneId,x210202_g_ScriptId,x210202_g_MissionName,2,-1);
	--���������������
	elseif x210202_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210202_g_ScriptId,x210202_g_MissionName,1,-1);
	end
end

--**********************************
--����������
--**********************************
function x210202_CheckAccept( sceneId, selfId )
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210202_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210202_g_MissionId, x210202_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������񣺵�һ����ͷ",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210202_g_SignPost.x, x210202_g_SignPost.z, x210202_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210202_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210202_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210202_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210202_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210202_g_MissionName)
		AddText(sceneId,x210202_g_MissionComplete)
		AddMoneyBonus( sceneId, x210202_g_MoneyBonus )
		for i, item in x210202_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210202_g_ScriptId,x210202_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210202_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210202_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	for i, item in x210202_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x210202_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210202_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x210202_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		
		local DelRet = 1
		for i, item in x210202_g_DemandItem do
		  --qds �۳���Ʒ�޸�
			if LuaFnDelAvailableItem( sceneId, selfId, item.id, item.num ) < 1 then
				DelRet = 0
			end
		end
		if DelRet == 0  then 
			Msg2Player(  sceneId, selfId,"#Y�۳���ͷʧ��",MSG2PLAYER_PARA )
			BeginEvent(sceneId)
				strText = "�۳���ͷʧ�ܣ��ǲ��Ǳ������ˣ�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		
		if ret > 0 then
			AddMoney(sceneId,selfId,x210202_g_MoneyBonus );
			LuaFnAddExp(sceneId, selfId,20)
			ret = DelMission( sceneId, selfId, x210202_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210202_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
--				--�۳�������Ʒ
--				for i, item in x210202_g_DemandItem do
--					if DelItem( sceneId, selfId, item.id, item.num ) < 1 then
--						DelRet = 0
--					end
--				end
				Msg2Player(  sceneId, selfId,"#Y������񣺵�һ����ͷ",MSG2PLAYER_PARA )
				CallScriptFunction( 210203, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210202_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210202_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210202_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == 30101001 then 
		local misIndex = GetMissionIndexByID(sceneId,selfId,x210202_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	end
	
end

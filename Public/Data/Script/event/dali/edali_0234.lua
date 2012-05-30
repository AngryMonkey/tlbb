--�˱�������
--Ѱ��
--MisDescBegin
--�ű���
x210234_g_ScriptId = 210234

--��������NPC����
x210234_g_Position_X=160.4355
x210234_g_Position_Z=127.9695
x210234_g_SceneID=2
x210234_g_AccomplishNPC_Name="���"

--ǰ������
--g_MissionIdPre =

--�����
x210234_g_MissionId = 714

--����Ŀ��npc
x210234_g_Name	="���"

--�������
x210234_g_MissionKind = 13

--����ȼ�
x210234_g_MissionLevel = 4

--�Ƿ��Ǿ�Ӣ����
x210234_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210234_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x210234_g_DemandItem={{id=20309002,num=1},{id=20309006,num=1}}		--�ӱ����м���
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x210234_g_MissionName="���;���Ь"
x210234_g_MissionInfo="#{event_dali_0047}"  --��������
x210234_g_MissionTarget="�ҵ�һƷ��Բ��һƷ������Ȼ���#G������廪̳#W���Ĵ�����֮һ��#R���#W#{_INFOAIM160,128,2,���}��"		--����Ŀ��
x210234_g_ContinueInfo="  һƷ��Բ��һƷ�������Ѿ��ҵ��ˣ�"		--δ��������npc�Ի�
x210234_g_MissionComplete="  �����ˣ����Ĳ���"					--�������npc˵���Ļ�

--������
x210234_g_ItemBonus={{id=10411047,num=1}}
x210234_g_MoneyBonus=0
--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210234_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--���������������Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210234_g_MissionName)
		AddText(sceneId,x210234_g_MissionInfo)
		for i, item in x210234_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
	EndEvent( )
	bDone = x210234_CheckSubmit( sceneId, selfId )
	DispatchMissionDemandInfo(sceneId,selfId,targetId,x210234_g_ScriptId,x210234_g_MissionId,bDone)
end

--**********************************
--�о��¼�
--**********************************
function x210234_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210234_g_MissionId) > 0 then
    	return
	--���������������
	elseif x210234_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210234_g_ScriptId,x210234_g_MissionName,1,-1);
    end
end

--**********************************
--����������
--**********************************
function x210234_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x210234_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210234_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210234_g_MissionId )
end

--**********************************
--����
--**********************************
function x210234_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x210234_g_MissionName)
    AddText(sceneId,x210234_g_MissionComplete)
    AddMoneyBonus( sceneId, x210234_g_MoneyBonus )
    for i, item in x210234_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210234_g_ScriptId,x210234_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210234_CheckSubmit( sceneId, selfId )
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x210234_g_MissionId ) > 0 then
		return 0
	end

	for i, item in x210234_g_DemandItem do
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
function x210234_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210234_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x210234_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			--�۳�������Ʒ
			for i, item in x210234_g_DemandItem do
				ret = DelItem( sceneId, selfId, item.id, item.num )
			end
			if	ret > 0 then
				AddMoney(sceneId,selfId,x210234_g_MoneyBonus );
				LuaFnAddExp( sceneId, selfId,450)
				ret = DelMission( sceneId, selfId, x210234_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210234_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y����������;���Ь",MSG2PLAYER_PARA )
				end
			else
				--ɾ����Ʒ���ɹ�
				BeginEvent(sceneId)
					strText = "�޷��������"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
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
function x210234_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x210234_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210234_OnItemChanged( sceneId, selfId, itemdataId )
end

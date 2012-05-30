--�˱�������
--Ѱ��
--MisDescBegin
--�ű���
x210235_g_ScriptId = 210235

--��������NPC����
x210235_g_Position_X=160.4355
x210235_g_Position_Z=127.9695
x210235_g_SceneID=2
x210235_g_AccomplishNPC_Name="���"

--ǰ������
--g_MissionIdPre =

--�����
x210235_g_MissionId = 715

--����Ŀ��npc
x210235_g_Name	="���"

--�������
x210235_g_MissionKind = 13

--����ȼ�
x210235_g_MissionLevel = 6

--�Ƿ��Ǿ�Ӣ����
x210235_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x210235_g_IsMissionOkFail = 0		--�����ĵ�0λ

--������Ҫ�õ�����Ʒ
x210235_g_DemandItem={{id=20309003,num=1},{id=20309007,num=1}}		--�ӱ����м���
--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x210235_g_MissionName="���;��Ļ���"
x210235_g_MissionInfo="#{event_dali_0048}"  --��������
x210235_g_MissionTarget="�ҵ�һƷ������һƷ��ͷ��Ȼ���#G������廪̳#W���Ĵ�����֮һ��#R���#W#{_INFOAIM160,128,2,���}��"		--����Ŀ��
x210235_g_ContinueInfo="  һƷ������һƷ��ͷ���Ѿ��ҵ��ˣ�"		--δ��������npc�Ի�
x210235_g_MissionComplete="  �����ˣ����Ĳ���"					--�������npc˵���Ļ�

--������
x210235_g_ItemBonus={{id=10412047,num=1}}
x210235_g_MoneyBonus=0
--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210235_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--���������������Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210235_g_MissionName)
		AddText(sceneId,x210235_g_MissionInfo)
		for i, item in x210235_g_DemandItem do
			AddItemDemand( sceneId, item.id, item.num )
		end
	EndEvent( )
	bDone = x210235_CheckSubmit( sceneId, selfId )
	DispatchMissionDemandInfo(sceneId,selfId,targetId,x210235_g_ScriptId,x210235_g_MissionId,bDone)
end

--**********************************
--�о��¼�
--**********************************
function x210235_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
    if IsMissionHaveDone(sceneId,selfId,x210235_g_MissionId) > 0 then
    	return
	--���������������
	elseif x210235_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210235_g_ScriptId,x210235_g_MissionName,1,-1);
    end
end

--**********************************
--����������
--**********************************
function x210235_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x210235_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210235_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210235_g_MissionId )
end

--**********************************
--����
--**********************************
function x210235_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
    AddText(sceneId,x210235_g_MissionName)
    AddText(sceneId,x210235_g_MissionComplete)
    AddMoneyBonus( sceneId, x210235_g_MoneyBonus )
    for i, item in x210235_g_ItemBonus do
		AddItemBonus( sceneId, item.id, item.num )
	end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210235_g_ScriptId,x210235_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210235_CheckSubmit( sceneId, selfId )
	--��������ɹ��������
    if IsMissionHaveDone( sceneId, selfId, x210235_g_MissionId ) > 0 then
		return 0
	end

	for i, item in x210235_g_DemandItem do
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
function x210235_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210235_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x210235_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret > 0 then
			--�۳�������Ʒ
			for i, item in x210235_g_DemandItem do
				ret = DelItem( sceneId, selfId, item.id, item.num )
			end
			if	ret > 0 then
				AddMoney(sceneId,selfId,x210235_g_MoneyBonus );
				LuaFnAddExp( sceneId, selfId,450)
				ret = DelMission( sceneId, selfId, x210235_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210235_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y����������;��Ļ���",MSG2PLAYER_PARA )
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
function x210235_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x210235_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210235_OnItemChanged( sceneId, selfId, itemdataId )
end

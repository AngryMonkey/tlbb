--���� ��ʿ�ļ���
--MisDescBegin
--�ű���
x212112_g_ScriptId = 212112

--�����
x212112_g_MissionId = 558

--�������
x212112_g_MissionKind = 32

--����ȼ�
x212112_g_MissionLevel = 80

--�Ƿ��Ǿ�Ӣ����
x212112_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212112_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x212112_g_DemandItem={{id=40002071,num=1}}		--������1λ

--�����ı�����
x212112_g_MissionName="��ʿ�ļ���"
x212112_g_MissionInfo="#{Mis_S_Liaoxi_1010091}"
x212112_g_MissionTarget="  ��#Y��ʿ�ļ���#W����#G�Ϻ�#W��#R����̫̫#W#{_INFOAIM214,243,34,����̫̫}��"
x212112_g_ContinueInfo="  ��������ʲô������"
x212112_g_MissionComplete="  �ҵĶ�����Ȼ���ˣ�����û�и����ĸ������ˣ�"

--����ID
x212112_g_ItemID = 40002071

--�ջ���
x212112_g_Name = "����̫̫"

x212112_g_MoneyBonus=54500
x212112_g_Exp = 35000

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212112_OnDefaultEvent( sceneId, selfId, targetId )

	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x212112_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212112_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212112_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212112_g_MissionName);
				AddText(sceneId,x212112_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212112_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId,done)
		end
	--���������������
	elseif GetLevel( sceneId, selfId ) >= x212112_g_MissionLevel then
	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212112_g_MissionName);
			AddText(sceneId,x212112_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212112_g_MissionTarget);
			AddMoneyBonus( sceneId, x212112_g_MoneyBonus )
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId)

	end
end

--**********************************
--�о��¼�
--**********************************
function x212112_OnEnumerate( sceneId, selfId, targetId )
	-- add by zchw
	if IsMissionHaveDone( sceneId, selfId, x212112_g_MissionId ) > 0 and targetId == -1 then
		AddText(sceneId, "  ���Ѿ�������������");
		return 
	elseif IsHaveMission(sceneId,selfId,x212112_g_MissionId) > 0  then
		if targetId == -1 then
		AddText(sceneId, "  ���Ѿ���ȡ���������");
	  elseif GetName(sceneId,targetId) == x212112_g_Name then
			AddNumText(sceneId, x212112_g_ScriptId,x212112_g_MissionName, 2, -1)
		end
	--���������������
	elseif x212112_CheckAccept(sceneId,selfId) > 0 then
	  if targetId == -1 then
			AddNumText(sceneId, x212112_g_ScriptId, x212112_g_MissionName, 1, -1);
		elseif GetName(sceneId,targetId) ~= x212112_g_Name then
			AddNumText(sceneId, x212112_g_ScriptId, x212112_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--��ⴥ������
--**********************************
function x212112_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 80 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212112_OnMissionAccept( sceneId, selfId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212112_g_MissionId) > 0   then
		return
	end
	
	if x212112_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- ����һ���������
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002071, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#Y���񱳰��Ѿ�����", MSG2PLAYER_PARA )
		return 
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x212112_g_MissionId, x212112_g_ScriptId, 0, 0, 0 )
	-- ��Ҫ��������ǲ����ܹ����ܵ��������
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	-- ��������Ʒ
	AddItemListToHuman(sceneId,selfId)
	-- ɾ����ͨ����
	DelItem( sceneId, selfId, 30505060, 1 )
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212112_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
	
	-- ��Ϣ֪ͨ�ͻ���
	Msg2Player(  sceneId, selfId,"#Y�������� ".. x212112_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#Y�������� ".. x212112_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x212112_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212112_g_MissionId )
	
	-- ɾ���������
	DelItem( sceneId, selfId, 40002071, 1 )
	
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212112_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212112_g_MissionName)
		AddText(sceneId,x212112_g_MissionComplete)
		AddMoneyBonus( sceneId, x212112_g_MoneyBonus )
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212112_CheckSubmit( sceneId, selfId )

	itemNum = GetItemCount( sceneId, selfId, x212112_g_ItemID );
	if itemNum > 0 then
		return 1;
	end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212112_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212112_g_MissionId) <= 0 then
		return
	end
	-- 2���������
	if x212112_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	for i, item in x212112_g_DemandItem do
		DelItem( sceneId, selfId, item.id, item.num )
	end
	
	AddExp(sceneId,selfId,x212112_g_Exp)
	AddMoney(sceneId,selfId,x212112_g_MoneyBonus );

	ret = DelMission( sceneId, selfId, x212112_g_MissionId )
	if ret > 0 then
		MissionCom( sceneId, selfId, x212112_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212112_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212112_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212112_OnItemChanged( sceneId, selfId, itemdataId )
end


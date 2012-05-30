--ʯ��  ���µ����� 608
--MisDescBegin
--�ű���
x212104_g_ScriptId = 212104

--�����
x212104_g_MissionId = 608

--�������
x212104_g_MissionKind = 37

--����ȼ�
x212104_g_MissionLevel = 63

--�Ƿ��Ǿ�Ӣ����
x212104_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212104_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
x212104_g_DemandItem={{id=40002112,num=1}}		--������1λ

--�����ı�����
x212104_g_MissionName="���µ�����"
x212104_g_MissionInfo="#{Lua_Shilin_005}"
x212104_g_MissionTarget="  ��#Y��֧��ͷ­#W����#GԲ�´�#W�Ĵ峤#R֣��#W#{_INFOAIM182,163,26,֣��}��"
x212104_g_ContinueInfo="  ����ʲô����"
x212104_g_MissionComplete="  �⣬���ѵ�������ʦ�������ͷ­��"

--����ID
x212104_g_ItemID = 40002112

--�ջ���
x212104_g_Name = "֣��"

x212104_g_MoneyBonus=26900
x212104_g_Exp = 22000
--x212104_g_ItemBonus={{id=10112025,num=1}}
x212104_g_RadioItemBonus={{id=10420070 ,num=1},{id=10422111,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212104_OnDefaultEvent( sceneId, selfId, targetId )

	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x212104_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212104_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212104_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212104_g_MissionName);
				AddText(sceneId,x212104_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212104_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212104_g_ScriptId,x212104_g_MissionId,done)
		end
	--���������������
	elseif GetLevel( sceneId, selfId ) >= 60 then
	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212104_g_MissionName);
			AddText(sceneId,x212104_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212104_g_MissionTarget);
			AddMoneyBonus( sceneId, x212104_g_MoneyBonus )
			for i, item in x212104_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212104_g_ScriptId,x212104_g_MissionId)

	end
end

--**********************************
--�о��¼�
--**********************************
function x212104_OnEnumerate( sceneId, selfId, targetId )

	if IsMissionHaveDone( sceneId, selfId, x212104_g_MissionId ) > 0 then
		AddText(sceneId, "  ���Ѿ�������������");
		return 
	elseif IsHaveMission(sceneId,selfId,x212104_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212104_g_Name then
			AddNumText(sceneId, x212104_g_ScriptId,x212104_g_MissionName, 2, -1)
		end
	--���������������
	elseif x212104_CheckAccept(sceneId,selfId) > 0 then
	  if targetId == -1 then
	    AddNumText(sceneId, x212104_g_ScriptId, x212104_g_MissionName, 1, -1);
		elseif GetName(sceneId,targetId) ~= x212104_g_Name then
			AddNumText(sceneId, x212104_g_ScriptId, x212104_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--��ⴥ������
--**********************************
function x212104_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 60 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212104_OnMissionAccept( sceneId, selfId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212104_g_MissionId) > 0   then
		return
	end
	
	if x212104_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- ����һ���������
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002112, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#Y���񱳰��Ѿ�����", MSG2PLAYER_PARA )
		return 
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x212104_g_MissionId, x212104_g_ScriptId, 0, 0, 0 )
	-- ��Ҫ��������ǲ����ܹ����ܵ��������
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	-- ��������Ʒ
	AddItemListToHuman(sceneId,selfId)
	-- ɾ����ͨ����
	DelItem( sceneId, selfId, 30505061, 1 )
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212104_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--�������кŰ���������ĵ�0λ��1 (����������)
	
	-- ��Ϣ֪ͨ�ͻ���
	Msg2Player(  sceneId, selfId,"#Y�������� ".. x212104_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#Y�������� " .. x212104_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x212104_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212104_g_MissionId )
	
	-- ɾ���������
	DelItem( sceneId, selfId, 40002112, 1 )
	
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212104_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212104_g_MissionName)
		AddText(sceneId,x212104_g_MissionComplete)
		AddMoneyBonus( sceneId, x212104_g_MoneyBonus )
		for i, item in x212104_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212104_g_ScriptId,x212104_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212104_CheckSubmit( sceneId, selfId )

	itemNum = GetItemCount( sceneId, selfId, x212104_g_ItemID );
	if itemNum > 0 then
		return 1;
	end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212104_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212104_g_MissionId) <= 0 then
		return
	end
	-- 2���������
	if x212104_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
	for i, item in x212104_g_RadioItemBonus do
		if item.id == selectRadioID then
			AddItem( sceneId,item.id, item.num )
		end
	end

	local ret = EndAddItem(sceneId,selfId)
	--���������
	if ret > 0 then		
		for i, item in x212104_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end

		AddExp(sceneId,selfId,x212104_g_Exp)
		AddMoney(sceneId,selfId,x212104_g_MoneyBonus );

		ret = DelMission( sceneId, selfId, x212104_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x212104_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
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

--**********************************
--ɱ����������
--**********************************
function x212104_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212104_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212104_OnItemChanged( sceneId, selfId, itemdataId )
end


--���� ׽�Բ�
--MisDescBegin
--�ű���
x212110_g_ScriptId = 212110

--�����
x212110_g_MissionId = 561

--�������
x212110_g_MissionKind = 33

--����ȼ�
x212110_g_MissionLevel = 88

--�Ƿ��Ǿ�Ӣ����
x212110_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212110_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
--x212110_g_DemandItem={{id=40002112,num=1}}		--������1λ

--�����ı�����
x212110_g_MissionName="׽�Բ�"
x212110_g_MissionInfo="#{Lua_changbai_001}"
x212110_g_MissionTarget="  #G����ɽ���ղ�#W������أ��#{_INFOAIM118,107,22,����أ��}�����ҵ�#R����ճû��#W#{_INFOAIM147,120,22,����ճû��}��#R�������벻#W#{_INFOAIM166,94,22,�������벻}��#R���ն����#W#{_INFOAIM178,113,22,���ն����}��"
x212110_g_ContinueInfo="  ���ҵ��ҵĸ��������"
x212110_g_MissionComplete="  �������������ô����ҵ������ˣ�Ϊʲô�������Ҳ����أ��ѵ����Ǳ�С����"

--����
x212110_g_MoneyBonus=54500
x212110_g_Exp = 36000
--x212110_g_ItemBonus={{id=30004020,num=1}}

x212110_g_Custom	= { {id="���ҵ�����ճû��",num=1},{id="���ҵ��������벻",num=1},{id="���ҵ����ն����",num=1} }
x212110_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212110_OnDefaultEvent( sceneId, selfId, targetId )
	
	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x212110_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212110_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212110_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212110_g_MissionName);
				AddText(sceneId,x212110_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212110_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212110_g_ScriptId,x212110_g_MissionId,done)
--		end
	--���������������
	elseif GetLevel( sceneId, selfId ) >= 88 then
	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212110_g_MissionName);
			AddText(sceneId,x212110_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212110_g_MissionTarget);
			AddMoneyBonus( sceneId, x212110_g_MoneyBonus )
			--for i, item in x212110_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212110_g_ScriptId,x212110_g_MissionId)

	end
end

--**********************************
--�о��¼�
--**********************************
function x212110_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission(sceneId,selfId,x212110_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212110_g_MissionId)			--�õ���������к�
	
		--�ȿ��ǲ����Ҷ����ˣ�����Ҷԣ��͸�����ʾ������ǵڶ��Σ��͸���ͬ����ʾ
		if  GetName(sceneId, targetId) == "����ճû��"   then
			if GetMissionParam(sceneId, selfId, misIndex, 1) == 0  then
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--�������кŰ���������ĵ�0λ��1 (����������)
				BeginEvent(sceneId)
					strText = "�ҵ�����ճû��"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				local n1 = GetMissionParam(sceneId, selfId, misIndex, 1)
				local n2 = GetMissionParam(sceneId, selfId, misIndex, 2)
				local n3 = GetMissionParam(sceneId, selfId, misIndex, 3)
				
				if n1==1 and n2==1 and n3==1   then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
				return
			end
		end
		
		if  GetName(sceneId, targetId) == "�������벻"   then
			if GetMissionParam(sceneId, selfId, misIndex, 2) == 0  then
				SetMissionByIndex(sceneId,selfId,misIndex,2,1)		--�������кŰ���������ĵ�0λ��1 (����������)
				BeginEvent(sceneId)
					strText = "�ҵ��������벻"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		
				local n1 = GetMissionParam(sceneId, selfId, misIndex, 1)
				local n2 = GetMissionParam(sceneId, selfId, misIndex, 2)
				local n3 = GetMissionParam(sceneId, selfId, misIndex, 3)
				
				if n1==1 and n2==1 and n3==1   then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
				return
			end
		end
		
		if  GetName(sceneId, targetId) == "���ն����"   then
			if GetMissionParam(sceneId, selfId, misIndex, 3) == 0  then
				SetMissionByIndex(sceneId,selfId,misIndex,3,1)		--�������кŰ���������ĵ�0λ��1 (����������)
				BeginEvent(sceneId)
					strText = "�ҵ����ն����"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		
				local n1 = GetMissionParam(sceneId, selfId, misIndex, 1)
				local n2 = GetMissionParam(sceneId, selfId, misIndex, 2)
				local n3 = GetMissionParam(sceneId, selfId, misIndex, 3)
				
				if n1==1 and n2==1 and n3==1   then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
				return
			end
		end
	end

	if IsMissionHaveDone( sceneId, selfId, x212110_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212110_g_MissionId) > 0 then
		if  GetName(sceneId, targetId) == "����أ��"   then
			AddNumText(sceneId, x212110_g_ScriptId,x212110_g_MissionName, 2, -1)
		end	

	--���������������
	elseif x212110_CheckAccept(sceneId,selfId) > 0 then
		if  GetName(sceneId, targetId) == "����أ��"   then
			AddNumText(sceneId, x212110_g_ScriptId, x212110_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--��ⴥ������
--**********************************
function x212110_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 88 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212110_OnAccept( sceneId, selfId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212110_g_MissionId) > 0   then
		return
	end
	
	if x212110_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x212110_g_MissionId, x212110_g_ScriptId, 0, 0, 0 )
	-- ��Ҫ��������ǲ����ܹ����ܵ��������
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212110_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)		--�������кŰ���������ĵ�0λ��1 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)		--�������кŰ���������ĵ�0λ��1 (����������)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)		--�������кŰ���������ĵ�0λ��1 (����������)
	
	-- ��Ϣ֪ͨ�ͻ���
	Msg2Player(  sceneId, selfId,"#Y�������� ".. x212110_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y�������� ".. x212110_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)


end

--**********************************
--����
--**********************************
function x212110_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212110_g_MissionId )
end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212110_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212110_g_MissionName)
		AddText(sceneId,x212110_g_MissionComplete)
		AddMoneyBonus( sceneId, x212110_g_MoneyBonus )
		--for i, item in x212110_g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212110_g_ScriptId,x212110_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212110_CheckSubmit( sceneId, selfId )
	--��������ǿ������еı���ǲ��Ǳ���Ϊ1��
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212110_g_MissionId)			--�õ���������к�
	
	if GetMissionParam(sceneId, selfId, misIndex, 1) <= 0  then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 2) <= 0  then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 3) <= 0  then
		return 0
	end
	
	return 1
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212110_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212110_g_MissionId) <= 0 then
		return
	end
	-- 2���������
	if x212110_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
--	BeginAddItem(sceneId)
--		for i, item in x212110_g_ItemBonus do
--			AddItem( sceneId,item.id, item.num )
--		end
		
--	ret = EndAddItem(sceneId,selfId)
	--���������
--	if ret > 0 then		
		AddExp(sceneId,selfId,x212110_g_Exp)
		AddMoney(sceneId,selfId,x212110_g_MoneyBonus );

		DelMission( sceneId, selfId, x212110_g_MissionId )
		MissionCom( sceneId, selfId, x212110_g_MissionId )
--		AddItemListToHuman(sceneId,selfId)
--	else
--	--������û�мӳɹ�
--		BeginEvent(sceneId)
--			strText = "��������,�޷��������"
--			AddText(sceneId,strText);
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--	end
end

--**********************************
--ɱ����������
--**********************************
function x212110_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212110_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212110_OnItemChanged( sceneId, selfId, itemdataId )
end


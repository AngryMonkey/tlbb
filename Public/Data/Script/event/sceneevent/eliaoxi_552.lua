--���� ���Ϻڷ�
--MisDescBegin
--�ű���
x212107_g_ScriptId = 212107

--�����
x212107_g_MissionId = 552

--�������
x212107_g_MissionKind = 32

--����ȼ�
x212107_g_MissionLevel = 75

--�Ƿ��Ǿ�Ӣ����
x212107_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x212107_g_IsMissionOkFail = 0		--�����ĵ�0λ
x212107_g_Custom	= { {id="�Ѿ���ȼ���Ƿ�",num=1} }

--�����Ƕ�̬**************************************************************

--������Ҫ�õ�����Ʒ
--x212107_g_DemandItem={{id=40002112,num=1}}		--������1λ

--�����ı�����
x212107_g_MissionName="���Ϻڷ�"
x212107_g_MissionInfo="#{Lua_liaoxi_001}"
x212107_g_MissionTarget="  ɱ��#R������#W#{_INFOAIM161,268,21,-1}���õ����Ƿࡣ�û����ӵ�ȼ���Ƿ࣬���Ϻڷ䣬Ȼ��ص�#G������#W����#R����#W#{_INFOAIM164,199,21,����}������ķ��֡�"
x212107_g_ContinueInfo="  ���Ѿ�������ڷ�����"
x212107_g_MissionComplete="  �����ˣ����������ǵľ��ǰ����Ҵ������е����˸�л��İ�����������Զ������������ġ�"

--����
x212107_g_MoneyBonus=49800
x212107_g_Exp = 45000
--x212107_g_ItemBonus={{id=30003007,num=5}}
x212107_g_RadioItemBonus={{id=10411081 ,num=1},{id=10412074,num=1}}


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212107_OnDefaultEvent( sceneId, selfId, targetId )
	
	--����ѽӴ�����
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212107_g_Name then
			--���ͽ�����ǰ��������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x212107_g_MissionName);
				AddText(sceneId,x212107_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212107_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId,done)
--		end
	--���������������
	elseif GetLevel( sceneId, selfId ) >= 75 then
	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212107_g_MissionName);
			AddText(sceneId,x212107_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212107_g_MissionTarget);
			AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
			for i, item in x212107_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)

	end
end

--**********************************
--�о��¼�
--**********************************
function x212107_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
		AddNumText(sceneId, x212107_g_ScriptId,x212107_g_MissionName, 2, -1)

	--���������������
	elseif x212107_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212107_g_MissionName then
			AddNumText(sceneId, x212107_g_ScriptId, x212107_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--��ⴥ������
--**********************************
function x212107_CheckAccept( sceneId, selfId )
	--��Ҫ60�����ܽ�
	if GetLevel( sceneId, selfId ) >= 75 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212107_OnAccept( sceneId, selfId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x212107_g_MissionId) > 0   then
		return
	end
	
	if x212107_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- ����һ���������
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002070, 1)
		--AddItem( sceneId, 40002069, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#Y���񱳰��Ѿ�����", MSG2PLAYER_PARA )
		return 
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x212107_g_MissionId, x212107_g_ScriptId, 0, 0, 0 )
	-- ��Ҫ��������ǲ����ܹ����ܵ��������
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	-- ��������Ʒ
	AddItemListToHuman(sceneId,selfId)
	
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 2)
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������кŰ���������ĵ�0λ��1 (����������)
	
	-- ��Ϣ֪ͨ�ͻ���
	Msg2Player(  sceneId, selfId,"#Y�������� ".. x212107_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#Y�������� ".. x212107_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x212107_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212107_g_MissionId )
	
	-- ɾ���������
	DelItem( sceneId, selfId, 40002070, 1 )
	DelItem( sceneId, selfId, 40002069, 1 )

end

--**********************************
--�Ѿ����������ٸ�������ʾ
--**********************************
function x212107_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212107_g_MissionName)
		AddText(sceneId,x212107_g_MissionComplete)
		AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
		for i, item in x212107_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212107_CheckSubmit( sceneId, selfId )
	--��������ǿ������еı���ǲ��Ǳ���Ϊ1��
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			--�õ���������к�
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0  then
		return 1
	end
	return 0
end

--**********************************
--�ύ����ɣ�
--**********************************
function x212107_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212107_g_MissionId) <= 0 then
		return
	end
	-- 2���������
	if x212107_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212107_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	--���������
	if ret > 0 then		
		-- ɾ���������
		DelItem( sceneId, selfId, 40002070, 1 )
		DelItem( sceneId, selfId, 40002069, 1 )

		AddExp(sceneId,selfId,x212107_g_Exp)
		AddMoney(sceneId,selfId,x212107_g_MoneyBonus );
		DelMission( sceneId, selfId, x212107_g_MissionId )
		MissionCom( sceneId, selfId, x212107_g_MissionId )
		AddItemListToHuman(sceneId,selfId)

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
function x212107_OnKillObject( sceneId, selfId, objdataId ,objId )
	-- ������ɱ�˰��Ǵ��������Ի����һ�����ߡ����Ƿࡱ
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == "������"   then
		--ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x212107_g_MissionId) > 0 then
				-- ���ж��ǲ����Ѿ���������ɱ�־
				local nMisIndex = GetMissionIndexByID(sceneId,humanObjId,x212107_g_MissionId)
				
				-- �����������ǲ����������Ʒ�ˣ����˾Ͳ��ٵ���
				if GetMissionParam(sceneId, humanObjId, nMisIndex, 0) == 0  and
						GetItemCount(sceneId, humanObjId, 40002069) == 0 then
					AddMonsterDropItem(sceneId,objId,humanObjId, 40002069)
				end
			end
		end
	end
	
end

--**********************************
--���������¼�
--**********************************
function x212107_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212107_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40002069  then
	 	BeginEvent(sceneId)
			AddText(sceneId, "�ѵõ����Ƿࣺ1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end


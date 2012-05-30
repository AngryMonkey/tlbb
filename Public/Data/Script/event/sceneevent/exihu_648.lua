--ɱ�֣��ڽ������ͬʱ������Ҫɱ�Ĺ�
--�շɵ�����

--MisDescBegin
--�ű���
x212100_g_ScriptId = 212100

--�����
x212100_g_MissionId = 648

--Ŀ��NPC
x212100_g_Name	="�շ�"

--�������
x212100_g_MissionKind = 41

--����ȼ�
x212100_g_MissionLevel = 25

--�Ƿ��Ǿ�Ӣ����
x212100_g_IfMissionElite = 0

--������
x212100_g_MissionName="�շɵ�����"
--��������
x212100_g_MissionInfo="#{Mis_K_Xihu_1000042}"
--����Ŀ��
x212100_g_MissionTarget="#{MIS_TAR_ADD_010}"		
--δ��������npc�Ի�
x212100_g_ContinueInfo="  ���Ѿ�ɱ��#W������#W�ˣ�"
--�ύʱnpc�Ļ�
x212100_g_MissionComplete="  ̫лл���ˣ��µ����磬�·�����ҵ���ǰ��"		

x212100_g_MoneyBonus=1800
x212100_g_exp=18000
--x212100_g_ItemBonus={{id=10111008,num=1}}


x212100_g_Custom	= { {id="��ɱ��������",num=1} }
x212100_g_IsMissionOkFail = 0

x212100_g_RadioItemBonus={{id=10412063 ,num=1},{id=10413065,num=1},{id=10402065,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212100_OnDefaultEvent( sceneId, selfId, targetId )

  --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0)  then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x212100_g_MissionName)
			AddText(sceneId, x212100_g_ContinueInfo)
		EndEvent( )
		local bDone = x212100_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId,bDone)
				
	--���������������
  elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212100_g_MissionName)
			AddText(sceneId,x212100_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212100_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
			for i, item in x212100_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212100_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0 then
		AddNumText(sceneId, x212100_g_ScriptId, x212100_g_MissionName, 2, -1);
	--���������������
	elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212100_g_ScriptId, x212100_g_MissionName, 1, -1);
	end
end

--**********************************
--����������
--**********************************
function x212100_CheckAccept( sceneId, selfId )

	--Ҫ����ɵ�ǰ������
	if IsMissionHaveDone(sceneId,selfId,645) <= 0 then		--���Ż���
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,646) <= 0 then	--�׵�����
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,647) <= 0 then--���ׯ
		return 0
	end
	
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= x212100_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212100_OnAccept( sceneId, selfId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
		return 
	end
	
	-- 1����⵱ǰ�ǲ����Ѿ��ڳ������� ������ �ˣ�����У���ʾ������ڲ��ܽ��������
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "������"  then
			BeginEvent(sceneId)
				AddText(sceneId,"�����ڲ��ܽ��������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			return
		end
	end
		
	-- ������������б�
	local ret = AddMission( sceneId,selfId, x212100_g_MissionId, x212100_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	--���������������ĳ�����ź�����λ��
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212100_g_MissionId)--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����

	Msg2Player(  sceneId, selfId,"#Y��������" .. x212100_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y�������� " .. x212100_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- ��������ֳ�����ͬʱ����
	local nMonsterId = LuaFnCreateMonster(sceneId, 509, 161, 262, 5, 0, -1)
	LuaFnSendSpecificImpactToUnit(sceneId,nMonsterId,nMonsterId,nMonsterId,44,3)
	CallScriptFunction((200060), "Duibai",sceneId, "������", "����", "�շɣ���������һ�����ˣ�Ҳ���붯ҡ��ʦ��ͳ�����շɣ�����Ľ��������ļ��գ�" )
	
	SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
	SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)

	--��������ֵ���ʧʱ��
	SetCharacterDieTime(sceneId, nMonsterId, 600000)

end

--**********************************
--������ʱ��
--**********************************
function x212100_OnSceneTimer( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x212100_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212100_g_MissionId )
end

--**********************************
--����
--**********************************
function x212100_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212100_g_MissionName)
		AddText(sceneId,x212100_g_MissionComplete)
		AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
		for i, item in x212100_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212100_CheckSubmit( sceneId, selfId )

	--local missionId = GetMissionIdByIndex(x212100_g_ScriptId)
	local missionId = x212100_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)

	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x212100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- ��ȫ�Լ��
		-- 1���������ǲ������������
		if IsHaveMission(sceneId,selfId,x212100_g_MissionId) <= 0 then
			return
		end
		
		-- 2����������������
		if x212100_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		BeginAddItem(sceneId)
		for i, item in x212100_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			-- ��Ǯ�;���
			AddMoney(sceneId,selfId,x212100_g_MoneyBonus )
			LuaFnAddExp( sceneId, selfId, x212100_g_exp)
			
			DelMission( sceneId,selfId, x212100_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId, x212100_g_MissionId )
			
		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				AddText(sceneId, "��������,�޷��������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
		
end

--**********************************
--ɱ����������
--**********************************
function x212100_OnKillObject( sceneId, selfId, objdataId ,objId )

	--local missionId = TGetMissionIdByIndex(x212100_g_ScriptId)
	local missionId = x212100_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == "������"   then
		
		CallScriptFunction((200060), "Duibai",sceneId, "�շ�", "����", "ˮ������ǣ����죬���ڽ��죡���������ˣ����ǲ�����ū���ˣ�" )

		--ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
				-- ���ж��ǲ����Ѿ���������ɱ�־
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("��ɱ�������ʣ�1/1" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					-- �����������
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x212100_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212100_OnItemChanged( sceneId, selfId, itemdataId )
end








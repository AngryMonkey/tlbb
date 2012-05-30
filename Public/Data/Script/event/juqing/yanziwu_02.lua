-- ��ս˫��   �ڸ�����ɱ�֣���ȡ����

--************************************************************************
--MisDescBegin
--�ű���
x200012_g_ScriptId = 200012

--��������
x200012_g_CopySceneName="������"

--�����
x200012_g_MissionId = 11

--ǰ�������
x200012_g_PreMissionId = 10

--Ŀ��NPC
x200012_g_Name = "������"

--�Ƿ��Ǿ�Ӣ����
x200012_g_IfMissionElite = 1

--����ȼ�
x200012_g_MissionLevel = 30

--�������
x200012_g_MissionKind = 48

--�����ı�����
x200012_g_MissionName="��ս˫��"
x200012_g_MissionInfo="#{Mis_juqing_0011}"
x200012_g_MissionTarget="#{Mis_juqing_Tar_0011}"	--����Ŀ��
x200012_g_MissionComplete="  ̫���ˣ���Щ����һ�������ܵģ����ǰ�ȫ�ˡ�"	--�������npc˵���Ļ�
x200012_g_MissionContinue="  ���Ѿ����˾���ֺ�Ҧ�������õ��׹�����廢���ŵ�����"

x200012_g_MoneyBonus=8100
x200012_g_exp=9600

x200012_g_RadioItemBonus={{id=10415001 ,num=1},{id=10415002,num=1},{id=10415003,num=1}}

x200012_g_DemandItem={{id=40001002,num=1},{id=40001003,num=1}}		--�ӱ����м���

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200012_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200012_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200012_g_MissionName)
			AddText(sceneId,x200012_g_MissionContinue)
			AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
		EndEvent( )
		bDone = x200012_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId,bDone)
    --���������������
  elseif x200012_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200012_g_MissionName)
			AddText(sceneId,x200012_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200012_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
			for i, item in x200012_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200012_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200012_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200012_g_MissionId) > 0 then
		AddNumText(sceneId,x200012_g_ScriptId,x200012_g_MissionName,2,-1);
		--���������������
	elseif x200012_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200012_g_ScriptId,x200012_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200012_CheckAccept( sceneId, selfId )
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200012_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200012_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200012_g_MissionId, x200012_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x200012_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺶�ս˫��",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200012_g_SignPost.x, x200012_g_SignPost.z, x200012_g_SignPost.tip )
	
	--������󣬰���صĹ�����Ϊ����ս��
	-- ��Ҫ�������еĹ֣��ı����ǵ���Ӫ
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "˾����"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "Ҧ����"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		end
	end
	
	SetMissionEvent(sceneId, selfId, x200012_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200012_g_MissionId, 2)

end

--**********************************
--����
--**********************************
function x200012_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200012_g_MissionId )
	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200012_g_SignPost.tip )
	DelItem( sceneId, selfId, 40001002, 1 )	
	DelItem( sceneId, selfId, 40001003, 1 )	
end

--**********************************
--����
--**********************************
function x200012_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200012_g_MissionName)
		AddText(sceneId,x200012_g_MissionComplete)
		AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
		for i, item in x200012_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200012_CheckSubmit( sceneId, selfId )
	-- ����������ǲ�������������Ʒ
	if  1 > GetItemCount( sceneId, selfId, 40001002 )    then
		return 0
	end
	if  1 > GetItemCount( sceneId, selfId, 40001003 )    then
		return 0
	end
	
	return 1
end

--**********************************
--�ύ
--**********************************
function x200012_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200012_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200012_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--���������
		if ret < 1 then
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "��������,�޷��������"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		--ɾ������
		DelItem( sceneId, selfId, 40001002, 1 )
		DelItem( sceneId, selfId, 40001003, 1 )
		AddItemListToHuman(sceneId,selfId)

		--���������
		AddMoney(sceneId,selfId, x200012_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200012_g_exp)

		DelMission( sceneId, selfId, x200012_g_MissionId )
		MissionCom( sceneId, selfId, x200012_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺶�ս˫��",MSG2PLAYER_PARA )
		-- ���ú�������
		CallScriptFunction((200013), "OnDefaultEvent",sceneId, selfId, targetId )
	end
	
end

--**********************************
--ɱ����������
--**********************************
function x200012_OnKillObject( sceneId, selfId, objdataId ,objId)

	-- ���ɱ�ˡ�˾���֡����ߡ�Ҧ�����������������ͷ�Ӷ�Ӧ�Ķ���
	if GetName(sceneId,objId) == "˾����"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for j=0,num-1 do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x200012_g_MissionId) > 0 then	--��������ӵ������	
				AddMonsterDropItem(sceneId,objId,humanObjId,40001002)    --��������������(���߻������ʬ�����)
				
				-- ������Ȼ��Npc��ʧ
				--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0004}",0)
				CallScriptFunction((200060), "Duibai",sceneId, "����ɵ���", "������", "#{JQ_DB_0004}" )

				-- ��ʧ ����ɵ���	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "����ɵ���"  then
						-- ɾ�� ����ɵ���
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end				
			end
		end
	end

	if GetName(sceneId,objId) == "Ҧ����"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)--ȡ�������������ӵ�з���Ȩ������
		for j=0,num-1 do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)--ȡ��ӵ�з���Ȩ���˵�objId
			if IsHaveMission(sceneId,humanObjId,x200012_g_MissionId) > 0 then	--��������ӵ������	
				AddMonsterDropItem(sceneId,objId,humanObjId,40001003)    --��������������(���߻������ʬ�����)
				-- ������Ȼ��Npc��ʧ
				--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0003}",0)
				CallScriptFunction((200060), "Duibai",sceneId, "�ؼ�կ����", "������", "#{JQ_DB_0003}" )
				
				-- ��ʧ �ؼ�կ����	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "�ؼ�կ����"  then
						-- ɾ�� �ؼ�կ����
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end				
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x200012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200012_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40001002    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "�ѵõ��׹���:1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	if itemdataId == 40001003    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "�ѵõ��廢���ŵ�:1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end




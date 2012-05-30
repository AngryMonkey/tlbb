
-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200006_g_ScriptId = 200006

--��������
x200006_g_CopySceneName="��ٹ�"

--�����
x200006_g_MissionId = 6

--ǰ������
x200006_g_PreMissionId = 5

--Ŀ��NPC
x200006_g_Name = "������"

--�Ƿ��Ǿ�Ӣ����
x200006_g_IfMissionElite = 1

--����ȼ�
x200006_g_MissionLevel = 20

--�������
x200006_g_MissionKind = 51

--�����ı�����
x200006_g_MissionName="��ս��ٹ�"
x200006_g_MissionInfo="#{Mis_juqing_0006}"
x200006_g_MissionTarget="#{Mis_juqing_Tar_0006}"	--����Ŀ��
x200006_g_MissionComplete="  �ɵĺã�������û����������������������������ٹ��˷������ˡ�"	--�������npc˵���Ļ�
x200006_g_MissionContinue="  ���Ѿ������Ҷ����Ϻ���������к�����"

x200006_g_MoneyBonus=1580
x200006_g_exp=18000

x200006_g_RadioItemBonus={{id=10422001 ,num=1},{id=10422002,num=1},{id=10422003,num=1}}

x200006_g_Custom	= { {id="��սʤҶ����",num=1},{id="��սʤ�Ϻ�����",num=1},{id="��սʤ���к�",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200006_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200006_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200006_g_MissionName)
			AddText(sceneId,x200006_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
		EndEvent( )
		bDone = x200006_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId,bDone)
    --���������������
  elseif x200006_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200006_g_MissionName)
			AddText(sceneId,x200006_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200006_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
			for i, item in x200006_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200006_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200006_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200006_g_MissionId) > 0 then
		AddNumText(sceneId,x200006_g_ScriptId,x200006_g_MissionName,2,-1);
		--���������������
	elseif x200006_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200006_g_ScriptId,x200006_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200006_CheckAccept( sceneId, selfId )
	
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200006_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200006_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200006_g_MissionId, x200006_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200006_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺴�ս��ٹ�",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200006_g_SignPost.x, x200006_g_SignPost.z, x200006_g_SignPost.tip )
	
	--������󣬰���صĹ�����Ϊ����ս��
	-- ��Ҫ�������еĹ֣��ı����ǵ���Ӫ
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "Ҷ����"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "������"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "���к�"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		end
	end

	SetMissionEvent(sceneId, selfId, x200006_g_MissionId, 0)

end

--**********************************
--����
--**********************************
function x200006_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200006_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200006_g_SignPost.tip )
end


--**********************************
--����
--**********************************
function x200006_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200006_g_MissionName)
		AddText(sceneId,x200006_g_MissionComplete)
		AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
		for i, item in x200006_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200006_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200006_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x200006_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)

	if Kill1~=1 			then
		return 0
	elseif Kill2~=1 	then
		return 0
	elseif Kill3~=1   then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200006_CheckSubmit( sceneId, selfId ) == 1   then
  	BeginAddItem(sceneId)
		for i, item in x200006_g_RadioItemBonus do
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
		AddItemListToHuman(sceneId,selfId)

		AddMoney(sceneId,selfId,x200006_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200006_g_exp)

		DelMission( sceneId, selfId, x200006_g_MissionId )
		MissionCom( sceneId, selfId, x200006_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺴�ս��ٹ�",MSG2PLAYER_PARA )
		
		-- ���ú�������
		CallScriptFunction((200007), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200006_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex = -1
	if GetName(sceneId,objId) == "Ҷ����"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ��Ҷ����1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	if GetName(sceneId,objId) == "������"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ��������1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	if GetName(sceneId,objId) == "���к�"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ�����к�1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	
end

--**********************************
--���������¼�
--**********************************
function x200006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200006_OnItemChanged( sceneId, selfId, itemdataId )
end

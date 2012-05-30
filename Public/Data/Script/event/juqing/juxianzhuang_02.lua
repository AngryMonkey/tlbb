-- 200021
-- ��������

-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200021_g_ScriptId = 200021

--��������
x200021_g_CopySceneName="����ׯ"

--�����
x200021_g_MissionId = 21

--ǰ������
x200021_g_PreMissionId = 20

--Ŀ��NPC
x200021_g_Name = "�Ƿ�"

--�Ƿ��Ǿ�Ӣ����
x200021_g_IfMissionElite = 1

--����ȼ�
x200021_g_MissionLevel = 40

--�������
x200021_g_MissionKind = 47

--�����ı�����
x200021_g_MissionName="��������"
x200021_g_MissionInfo="#{Mis_juqing_0021}"
x200021_g_MissionTarget="#{Mis_juqing_Tar_0021}"	--����Ŀ��
x200021_g_MissionComplete="  $N����İ�������ĳ�м�������������һ�磬���Ǿ��������Ƕ��������"	--�������npc˵���Ļ�
x200021_g_MissionContinue="  ���Ѿ���ܱ�ǧ�顢��������������������������"

x200021_g_MoneyBonus=8100
x200021_g_exp=9600

x200021_g_RadioItemBonus={{id=10422004 ,num=1},{id=10422005,num=1},{id=10422006,num=1}}

x200021_g_Custom	= { {id="�Ѵ�ܱ�ǧ��",num=1},{id="�Ѵ������",num=1},{id="�Ѵ��������",num=1}, }
x200021_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200021_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200021_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200021_g_MissionName)
			AddText(sceneId,x200021_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200021_g_MoneyBonus )
		EndEvent( )
		bDone = x200021_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200021_g_ScriptId,x200021_g_MissionId,bDone)
    --���������������
  elseif x200021_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200021_g_MissionName)
			AddText(sceneId,x200021_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200021_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
				for i, item in x200021_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
			AddMoneyBonus( sceneId, x200021_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200021_g_ScriptId,x200021_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200021_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200021_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200021_g_MissionId) > 0 then
		AddNumText(sceneId,x200021_g_ScriptId,x200021_g_MissionName,2,-1);
		--���������������
	elseif x200021_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200021_g_ScriptId,x200021_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200021_CheckAccept( sceneId, selfId )
	
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200021_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200021_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200021_g_MissionId, x200021_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200021_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺶�������",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200021_g_SignPost.x, x200021_g_SignPost.z, x200021_g_SignPost.tip )
	
	--������󣬰���صĹ�����Ϊ����ս��
	-- ��Ҫ�������еĹ֣��ı����ǵ���Ӫ
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "��ǧ��"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
			SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
		elseif GetName(sceneId, nMonsterId)  == "����"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
			SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
		elseif GetName(sceneId, nMonsterId)  == "������"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
			SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
		end
	end

	SetMissionEvent(sceneId, selfId, x200021_g_MissionId, 0)

end

--**********************************
--����
--**********************************
function x200021_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200021_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200021_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200021_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x200021_g_MissionName)
	AddText(sceneId,x200021_g_MissionComplete)
	for i, item in x200021_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
	AddMoneyBonus( sceneId, x200021_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200021_g_ScriptId,x200021_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200021_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200021_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200021_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,3)

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
function x200021_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200021_CheckSubmit(sceneId, selfId) == 1  then

  	BeginAddItem(sceneId)
		for i, item in x200021_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId,x200021_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200021_g_exp)

		DelMission( sceneId, selfId, x200021_g_MissionId )
		MissionCom( sceneId, selfId, x200021_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺶�������",MSG2PLAYER_PARA )

		-- ���ú�������
		CallScriptFunction((200026), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x200021_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == "��ǧ��"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200021_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,selfId,x200021_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ����ǧ��1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
				
				local Kill1 = GetMissionParam(sceneId,selfId,misIndex,1)
				local Kill2 = GetMissionParam(sceneId,selfId,misIndex,2)
				local Kill3 = GetMissionParam(sceneId,selfId,misIndex,3)
				
				if Kill1==1 and Kill2==1 and Kill3==1  then
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
				end
			end
		end
	end
	if GetName(sceneId,objId) == "����"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200021_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,selfId,x200021_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ������1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)

				local Kill1 = GetMissionParam(sceneId,selfId,misIndex,1)
				local Kill2 = GetMissionParam(sceneId,selfId,misIndex,2)
				local Kill3 = GetMissionParam(sceneId,selfId,misIndex,3)
				
				if Kill1==1 and Kill2==1 and Kill3==1  then
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
				end
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
			if IsHaveMission(sceneId, humanObjId, x200021_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,selfId,x200021_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,3,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ��������1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)

				local Kill1 = GetMissionParam(sceneId,selfId,misIndex,1)
				local Kill2 = GetMissionParam(sceneId,selfId,misIndex,2)
				local Kill3 = GetMissionParam(sceneId,selfId,misIndex,3)
				
				if Kill1==1 and Kill2==1 and Kill3==1  then
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
				end
			end
		end
	end
	
end

--**********************************
--���������¼�
--**********************************
function x200021_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x200021_OnItemChanged( sceneId, selfId, itemdataId )
end



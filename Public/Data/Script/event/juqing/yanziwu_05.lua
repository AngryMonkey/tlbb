-- ָ��Ⱥ��Ϸ   �������ս��^_^�����ʲ���Ŷ 

--************************************************************************
--MisDescBegin
--�ű���
x200015_g_ScriptId = 200015

--��������
x200015_g_CopySceneName="������"

--�����
x200015_g_MissionId = 14

--�����
x200015_g_PreMissionId = 13

--Ŀ��NPC
x200015_g_Name = "������"

--�Ƿ��Ǿ�Ӣ����
x200015_g_IfMissionElite = 1

--����ȼ�
x200015_g_MissionLevel = 30

--�������
x200015_g_MissionKind = 48

--�����ı�����
x200015_g_MissionName="ָ��Ⱥ��Ϸ"
x200015_g_MissionInfo="#{Mis_juqing_0014}"
x200015_g_MissionTarget="#{Mis_juqing_Tar_0014}"	--����Ŀ��
x200015_g_MissionComplete="  $N����ľ���֮�������ն���������ֻ�ǣ����������о綾������֪���Ƿ��л���ر���������"	--�������npc˵���Ļ�
x200015_g_MissionContinue="  ���Ѿ������ι��Ӵ�����Щ������ʿ����"

x200015_g_MoneyBonus=21600
x200015_g_exp=22000

x200015_g_RadioItemBonus={{id=10423005,num=1},{id=10423006,num=1},{id=10423007,num=1}}

x200015_g_Custom	= { {id="ָ��Ⱥ��Ϸ",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200015_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200015_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200015_g_MissionName)
			AddText(sceneId,x200015_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
		EndEvent( )
		bDone = x200015_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId,bDone)
    --���������������
  elseif x200015_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200015_g_MissionName)
			AddText(sceneId,x200015_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200015_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
			for i, item in x200015_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200015_OnEnumerate( sceneId, selfId, targetId )

  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200015_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200015_g_MissionId) > 0 then
		AddNumText(sceneId,x200015_g_ScriptId,x200015_g_MissionName,2,-1);
		--���������������
	elseif x200015_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200015_g_ScriptId,x200015_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200015_CheckAccept( sceneId, selfId )
	-- �����Ҫ�����ǰ������
  if IsMissionHaveDone(sceneId,selfId,x200015_g_PreMissionId) < 1 then
		return 0
	end
	
	if LuaFnGetCopySceneData_Param(sceneId, 25) == 1  then
		return 0
	end	
	
	--��Ҫ4�����ܽ�
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x200015_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200015_g_MissionId, x200015_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,4,0)						--�������кŰ���������ĵ�1λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,5,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y��������ָ��Ⱥ��Ϸ",MSG2PLAYER_PARA )

	SetMissionEvent(sceneId, selfId, x200015_g_MissionId, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 12, LuaFnGetCurrentTime())

	--����һ����ʼ���Ͳ�������һ����
	
	LuaFnSetCopySceneData_Param(sceneId, 25, 1)
end

--**********************************
--��ʱ�¼�
--**********************************
function x200015_OnTimer(sceneId,selfId)

end

--**********************************
--����
--**********************************
function x200015_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200015_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200015_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200015_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x200015_g_MissionName)
		AddText(sceneId,x200015_g_MissionComplete)
		AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
		for i, item in x200015_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200015_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)

	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill4 = GetMissionParam(sceneId,selfId,misIndex,3)
	local Kill5 = GetMissionParam(sceneId,selfId,misIndex,4)

	if Kill1~=1 			then
		return 0
	elseif Kill2~=1 	then
		return 0
	elseif Kill3~=1   then
		return 0
	elseif Kill4~=1   then
		return 0
	elseif Kill5~=1   then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x200015_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200015_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200015_g_RadioItemBonus do
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

		--���������
		AddMoney(sceneId,selfId, x200015_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200015_g_exp)

		DelMission( sceneId, selfId, x200015_g_MissionId )
		MissionCom( sceneId, selfId, x200015_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y�������ָ��Ⱥ��Ϸ", MSG2PLAYER_PARA )
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x200015_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex = -1
	local szMonsterName = GetName(sceneId,objId)
	if szMonsterName == "�ƺ���"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ���ƺ���:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "���ۿ�"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ�����ۿ�:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "��צ�ŵ���"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,3,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ����צ�ŵ���:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "�����ʿ"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,4,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ�������ʿ:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "ˤ�Ǹ���"	  then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,5,1)
				BeginEvent(sceneId)
				AddText(sceneId,"��ɱ��ˤ�Ǹ���:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		
	else
		return
		
	end
	
	-- ��������Ҫɱ���˶�ɱ�˺󣬸�����ɱ�־
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,5)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill4 = GetMissionParam(sceneId,selfId,misIndex,3)
	local Kill5 = GetMissionParam(sceneId,selfId,misIndex,4)
	
	if Kill1==1 and Kill2==1 and Kill3==1 and Kill4==1 and Kill5==1 then
		--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0010}",0)
		CallScriptFunction((200060), "Duibai",sceneId, "������ʿ", "������", "#{JQ_DB_0010}" )
		
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		
	end
	
end

--**********************************
--���������¼�
--**********************************
function x200015_OnEnterArea( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200015_OnItemChanged( sceneId, selfId, itemdataId )
	
end








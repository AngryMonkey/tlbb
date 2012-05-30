-- 200036 ��굴�����
-- ��ãɽ����Ҫ����

-- ���ڸ��������ɱ������

--************************************************************************
--MisDescBegin
--�ű���
x200036_g_ScriptId = 200036

--��������
x200036_g_CopySceneName="��ãɽ"

--�����
x200036_g_MissionId = 31

--ǰ������
x200036_g_PreMissionId = 30

--Ŀ��NPC
x200036_g_Name = "����"

--�Ƿ��Ǿ�Ӣ����
x200036_g_IfMissionElite = 1

--����ȼ�
x200036_g_MissionLevel = 50

--�������
x200036_g_MissionKind = 52

--�����ı�����
x200036_g_MissionName="��굴�����"
x200036_g_MissionInfo="#{Mis_juqing_0031}"
x200036_g_MissionTarget="#{Mis_juqing_Tar_0031}"	--����Ŀ��
x200036_g_MissionComplete="    $N����һ���Ѿ������Ѿ���ɢ�ˣ���Ҫ�ż������ǲ���ΪӪ�������ҳ���ƽϢ��"	--�������npc˵���Ļ�
x200036_g_MissionContinue="  �����Ѿ���ɱ����̫��Ҳ�Ѿ������������ˡ�"

x200036_g_MoneyBonus=36000
x200036_g_exp=40800

x200036_g_RadioItemBonus={{id=10423012 ,num=1},{id=10423013,num=1},{id=10423014,num=1}}

x200036_g_Custom	= { {id="��ɱ������",num=1},{id="�ѽ����̫������",num=1} }
--x200036_g_Custom	= { {id="�ѽ����̫������",num=1} }
x200036_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x200036_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200036_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200036_g_MissionName)
			AddText(sceneId,x200036_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200036_g_MoneyBonus )
		EndEvent( )
		bDone = x200036_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200036_g_ScriptId,x200036_g_MissionId,bDone)
    --���������������
  elseif x200036_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x200036_g_MissionName)
			AddText(sceneId,x200036_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200036_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x200036_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x200036_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200036_g_ScriptId,x200036_g_MissionId)
  end

end

--**********************************
--�о��¼�
--**********************************
function x200036_OnEnumerate( sceneId, selfId, targetId )
  --��������ɹ��������
  if IsMissionHaveDone(sceneId,selfId,x200036_g_MissionId) > 0 then
		return
	end
    --����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x200036_g_MissionId) > 0 then
		AddNumText(sceneId,x200036_g_ScriptId,x200036_g_MissionName,2,-1);
		--���������������
	elseif x200036_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200036_g_ScriptId,x200036_g_MissionName,1,-1);
	end

end

--**********************************
--����������
--**********************************
function x200036_CheckAccept( sceneId, selfId )

	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x200036_g_MissionId) > 0 ) then
		return 0
	end
	
	--��Ҫ4�����ܽ�
		if GetLevel( sceneId, selfId ) < x200036_g_MissionLevel then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200036_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200036_OnAccept( sceneId, selfId )
	--������������б�
	local ret = AddMission( sceneId,selfId, x200036_g_MissionId, x200036_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200036_g_MissionId)			--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--�������кŰ���������ĵ�0λ��0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--�������кŰ���������ĵ�1λ��0
	Msg2Player(  sceneId, selfId,"#Y�������񣺽�굴�����",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200036_g_SignPost.x, x200036_g_SignPost.z, x200036_g_SignPost.tip )

	SetMissionEvent(sceneId, selfId, x200036_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200036_g_MissionId, 1)

	-- ��ʼ�ڶ��ξ���
	if LuaFnGetCopySceneData_Param(sceneId, 8) < 3  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 3)
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	end
	
--	--��ⳡ�����ǲ����г��������û�У���һ������
--	local nMonsterNum = GetMonsterCount(sceneId)
--	
--	local ii = 0
--	local bHaveMonster = 0
--	for ii=0, nMonsterNum-1 do
--		local nMonsterId = GetMonsterObjID(sceneId,ii)
--		
--		if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
--			return
--		end
--	end
--	-- ��������
--	--PrintStr("��������")
--	local nNpcId = LuaFnCreateMonster(sceneId, 406, 77, 44, 1, 0, -1)
--	SetCharacterName(sceneId, nNpcId, "Ү����³��")
--	SetCharacterTitle(sceneId, nNpcId, "����")
--	
--	local nNpcId1 = LuaFnCreateMonster(sceneId, 422, 45, 105, 1, 0, -1)
--	SetCharacterName(sceneId, nNpcId1, "Ү����Ԫ")
--	SetCharacterTitle(sceneId, nNpcId1, "��̫��")
	
end

--**********************************
--����
--**********************************
function x200036_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x200036_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200036_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x200036_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x200036_g_MissionName)
		AddText(sceneId,x200036_g_MissionComplete)
		AddMoneyBonus( sceneId, x200036_g_MoneyBonus )
		for i, item in x200036_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200036_g_ScriptId,x200036_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200036_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200036_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200036_g_MissionId)
	if GetMissionParam(sceneId,selfId, misIndex, 0) < 1  then
		return 0
	end

	if LuaFnGetCopySceneData_Param(sceneId, 8) > 7  then
		return 1
	end
	
	return 0

end

--**********************************
--�ύ
--**********************************
function x200036_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200036_CheckSubmit(sceneId, selfId) == 1  then
		--���������
  	BeginAddItem(sceneId)
		for i, item in x200036_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId, x200036_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200036_g_exp)

		DelMission( sceneId, selfId, x200036_g_MissionId )
		MissionCom( sceneId, selfId, x200036_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y������񣺽�굴�����",MSG2PLAYER_PARA )
	end

end

--**********************************
--ɱ����������
--**********************************
function x200036_OnKillObject( sceneId, selfId, objdataId ,objId)
	
end

--**********************************
--���������¼�
--**********************************
function x200036_OnEnterArea( sceneId, selfId, zoneId )
	if 1==1  then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200036_g_MissionId)
	
	if GetMissionParam(sceneId,selfId,misIndex,4) == 0  then
	
		if zoneId == 1 or zoneId == 2  then
			
			-- ��ⳡ�����ǲ����г��������û�У���һ������
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
					bHave = 1
				end
			end
			
			if bHave == 1    then
				-- ���ø�����ɫ����������
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					
					if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
						SetUnitReputationID(sceneId, selfId, nMonsterId, 18)
						SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
	
						-- �����ڸı���Ӫ���Թ����󣬰���2��·�������ܣ�
						SetPatrolId(sceneId, nMonsterId, 2)
						--PrintStr("������")
					end
					
					if GetName(sceneId, nMonsterId)  == "����"  then
						-- ͬʱ���尴��3��·���ܣ�
						SetPatrolId(sceneId, nMonsterId, 1)
						--PrintStr("����׷")
	
					end
				end
				
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)
				SetMissionByIndex(sceneId,selfId,misIndex,4,1)
			end
		end	
	end
	
	-- ��ҽ����¼���1���������
	if zoneId == 3  then
		if GetMissionParam(sceneId,selfId,misIndex,3) == 0  then
			if GetMissionParam(sceneId,selfId,misIndex,1) == 1  then
				-- ��ҽ���������3����ʱ�򣬼�����壬ɾ����Ȼ����λ�ô�������ץס
				-- ���е�ʿ������ս����
				SetMissionByIndex(sceneId,selfId,misIndex,3,1)
				local nMonsterNum = GetMonsterCount(sceneId)
				local bHave = 0
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					
					if GetName(sceneId, nMonsterId)  == "����"  then
						-- ɾ������
						LuaFnDeleteMonster(sceneId, nMonsterId)
						
						--���µ�λ�ô���ģ��
						local nNpcId = LuaFnCreateMonster(sceneId, 423, 50,106, 0, 0, 120007)
						SetUnitReputationID(sceneId, selfId, nNpcId, 0)
						SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
						SetCharacterName(sceneId, nNpcId, "����")
						
					end
					
					if GetName(sceneId, nMonsterId)  == "Ү����Ԫ"  then
						-- Ү����Ԫ
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
					
					if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
						-- Ү����Ԫ
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
					
					
					-- ���е�ʿ�����ڱ�ɲ���ս��
					if GetName(sceneId, nMonsterId)  == "��ɽ������"  then
						SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
						SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					end
					if GetName(sceneId, nMonsterId)  == "������Ӣ��ʿ"  then
						SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
						SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					end
					if GetName(sceneId, nMonsterId)  == "��ɽ������"  then
						SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
						SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					end
					if GetName(sceneId, nMonsterId)  == "��̫����������"  then
						SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
						SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					end
					
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
					
					-- ���麰��
					LuaFnSetCopySceneData_Param(sceneId, 8, 4)
					LuaFnSetCopySceneData_Param(sceneId, 13, 0)
					LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
					
					
				end
			end
		end
	end
end

--**********************************
--���߸ı�
--**********************************
function x200036_OnItemChanged( sceneId, selfId, itemdataId )
end


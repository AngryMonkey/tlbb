--200034
--������ Ү��Ī��İ����£��������Ĳ�ãɽ

--************************************************************************
--MisDescBegin
--�ű���
x200034_g_ScriptId = 200034

--MisDescEnd
--************************************************************************

--��������
x200034_g_CopySceneName = "��ãɽ"

x200034_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x200034_g_CopySceneMap = "cangmang.nav"
x200034_g_Exit = "cangmang.ini"
x200034_g_LimitMembers = 1				--���Խ���������С��������
x200034_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200034_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200034_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200034_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x200034_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x200034_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200034_g_Fuben_X = 102					--���븱����λ��X
x200034_g_Fuben_Z = 19					--���븱����λ��Z
x200034_g_Back_X = 66					--Դ����λ��X
x200034_g_Back_Z = 56					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200034_OnDefaultEvent( sceneId, selfId, targetId )
	-- ������ҵ������������͵���ͬ�ĸ���
	x200034_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x200034_OnEnumerate( sceneId, selfId, targetId )
	
	--����ܹ�����ҹ��ĸ�����ǰ������
--	-- 0,�������Ѿ���32���񣬾Ͳ����ڽ����������
	if IsMissionHaveDone(sceneId, selfId, 32) > 0   then
		return 0
	end

	-- 1��ӵ�������Ϊ29������
	if IsHaveMission( sceneId, selfId, 29 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ�����죩", 10 ,-1  )
		return 0
	end

	-- 2,ֻҪ�����30���񣬾��ܽ���
	if IsHaveMission( sceneId, selfId, 30 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ�����죩", 10 ,-1  )
		return 0
	end
	-- 3,ֻҪ�����31���񣬾��ܽ���
	if IsHaveMission( sceneId, selfId, 31 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ�����죩", 10 ,-1  )
		return 0
	end
	
	-- 3,�����������29��û��30��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 30) < 1   then
			if IsHaveMission( sceneId, selfId, 30 ) < 1 then
				AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ(����)", 10 ,-1  )
				return 0
			end
		end
	end

	-- 3,�����������29��û��30��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 31) < 1   then
			if IsHaveMission( sceneId, selfId, 31 ) < 1 then
				AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ(����)", 10 ,-1  )
				return 0
			end
		end
	end
	
	-- 3,�����������29��û��30��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 32) < 1   then
			if IsHaveMission( sceneId, selfId, 32 ) < 1 then
				AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ(����)", 10 ,-1  )
				return 0
			end
		end
	end
	
	-- ��32�����Խ���
	if IsHaveMission( sceneId, selfId, 32 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "����ȥ��ãɽ(����)", 10 ,-1  )
		return 0
	end
	
end

--**********************************
--����������
--**********************************
function x200034_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200034_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200034_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200034_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200034_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "cangmang.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200034_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200034_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200034_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200034_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Boss������
	
	-- �����õ��ı������
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	--���ó����еĸ���Npc������
	LuaFnSetSceneLoad_Area( sceneId, "cangmang_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangmang_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--�����¼�
--**********************************
function x200034_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1���������ļ�û����ӣ��ʹ�������ļ��Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end
	
	-- �������ǲ����ж���
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- û�ж���
		NewWorld( sceneId, leaderObjId, destsceneId, x200034_g_Fuben_X, x200034_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200034_g_Fuben_X, x200034_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200034_g_Fuben_X, x200034_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200034_OnPlayerEnter( sceneId, selfId )
	-- ��ҽ��볡������Ҫ���³����е���������
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200034_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200034_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200034_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200034_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200034_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200034_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200034_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--���������¼�
--**********************************
function x200034_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200034_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200034_OnCopySceneTimer( sceneId, nowTime )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1    then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId, 0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--����˵��
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9);--ʱ��
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) ;--����˵����

	-- paopao 
	local nStep3 = LuaFnGetCopySceneData_Param(sceneId, 11) ;--����˵����
	
	-- �԰�
	local nStep4 = LuaFnGetCopySceneData_Param(sceneId, 12) ;--����˵����
	local nStep5 = LuaFnGetCopySceneData_Param(sceneId, 13) ;--����˵����
	local nStep6 = LuaFnGetCopySceneData_Param(sceneId, 14) ;--����˵����
	local nStep7 = LuaFnGetCopySceneData_Param(sceneId, 15) ;--����˵����

	--
	local nStep8 = LuaFnGetCopySceneData_Param(sceneId, 20) ;--����˵����
	
	-- ��һ�ξ��飬��������������·������
	if nStep1 == 1  then
		
		-- ��75��115 ���� ���� 406 ���Ѳ��·��
		-- �ȿ��������ǲ����Ѿ��г�����
		local nMonsterNum = GetMonsterCount(sceneId)
		local nMonster = {}
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
				bHaveMonster = 1
			end
		end
		
		if bHaveMonster ~= 1  then
			local nNpcId = LuaFnCreateMonster(sceneId, 406, 75, 115, 1, 0, -1)
			SetCharacterName(sceneId, nNpcId, "Ү����³��")
			SetCharacterTitle(sceneId, nNpcId, "����")
			SetPatrolId(sceneId, nNpcId, 0)
			
			SetUnitReputationID(sceneId, selfId, nNpcId, 18)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		end
		
		CallScriptFunction((200060), "Duibai",sceneId, "Ү����³��", "��ãɽ", "#{JQ_DB_0015}" )
		CallScriptFunction((200060), "Duibai",sceneId, "Ү����³��", "��ãɽ", "#{JQ_DB_0016}" )
		
		LuaFnSetCopySceneData_Param(sceneId, 8, 2)
	end
	
	if nStep1 == 3  then
		-- ��ⳡ�����ǲ����г��������û�У���Ҫ��һ��������ɾ���
		local nMonsterNum = GetMonsterCount(sceneId)
		local nMonster = {}
		local ii = 0
		local bHaveMonster1 = 0
		local bHaveMonster2 = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
				bHaveMonster1 = 1
			end
			if GetName(sceneId, nMonsterId)  == "Ү����Ԫ"  then
				bHaveMonster2 = 1
			end
		end
		
		if bHaveMonster1 ~= 1  then
			local nNpcId = LuaFnCreateMonster(sceneId, 406, 77, 44, 1, 0, -1)
			SetCharacterName(sceneId, nNpcId, "Ү����³��")
			SetCharacterTitle(sceneId, nNpcId, "����")
			SetUnitReputationID(sceneId, selfId, nNpcId, 18)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		end

		if bHaveMonster2 ~= 1  then
			local nNpcId1 = LuaFnCreateMonster(sceneId, 422, 45, 105, 1, 0, -1)
			SetCharacterName(sceneId, nNpcId1, "Ү����Ԫ")
			SetCharacterTitle(sceneId, nNpcId1, "��̫��")
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 8, 4)
	end
	
	-- ��ҽ����һ��������Ҫ�ó����ܣ�����׷
	if nStep1 == 5  then
		local nMonsterNum = GetMonsterCount(sceneId)
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
				SetUnitReputationID(sceneId, selfId, nMonsterId, 18)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)

				-- �����ڸı���Ӫ���Թ����󣬰���2��·�������ܣ�
				SetPatrolId(sceneId, nMonsterId, 2)
			end
			
			if GetName(sceneId, nMonsterId)  == "����"  then
				-- ͬʱ���尴��3��·���ܣ�
				SetPatrolId(sceneId, nMonsterId, 1)
				-- ���Ƿ�������ӪΪ0
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetNPCAIType(sceneId, nMonsterId, 0)
			end
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 8, 6)
	end
	
	if nStep1 == 6  then
		if nStep8 == 0  then
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{juqing_start_010}" )
			LuaFnSetCopySceneData_Param(sceneId, 20, 1)
			
		elseif nStep8 == 1  then
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{juqing_start_011}" )
			LuaFnSetCopySceneData_Param(sceneId, 20, 2)
			
		elseif nStep8 == 2  then
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{juqing_start_012}" )
			LuaFnSetCopySceneData_Param(sceneId, 20, 3)
			
		end
		
		-- �������ǲ��Ǳ�ɱ�������ɱ���������е��˼�����
		local nMonsterNum = GetMonsterCount(sceneId)
		local bHaveChuwang = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Ү����³��"  then
				bHaveChuwang = 1
				break
			end
		end
		
		if bHaveChuwang == 0    then
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  
			  -- �������������˼�����ɱ�־
			  if IsHaveMission(sceneId, nHumanId, 31) > 0 then
			  	
					local misIndex = GetMissionIndexByID(sceneId,nHumanId,31)
			  	if GetMissionParam(sceneId,nHumanId, misIndex, 1) < 1  then
			  
						SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
					  BeginEvent(sceneId)
					  	AddText(sceneId, "��ɱ��������1/1")
					  EndEvent()
					  DispatchMissionTips(sceneId, nHumanId)
						--SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
					end
			  end
			end
			LuaFnSetCopySceneData_Param(sceneId, 8, 7)
		end
	end		
	
	if nStep1 == 7  then
		-- ����ǲ������˽������¼�����
		local left=39
		local right=52
		local top=101
		local bottom=111
		for i=0, 	nHumanNum-1  do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			local nHumanX, nHumanZ = GetWorldPos(sceneId, nHumanId)
			if nHumanX >= left and nHumanX <= right  and  nHumanZ >= top and nHumanZ <= bottom    then
				LuaFnSetCopySceneData_Param(sceneId, 8, 8)
				
				break
			end
		end
		
	end

	-- ��ҽ���ڶ�������������֣�
	if nStep1 == 8  then
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
				SetNPCAIType(sceneId, nNpcId, 7)
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
			
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  
			  -- �������������˼�����ɱ�־
			  if IsHaveMission(sceneId, nHumanId, 31) > 0 then
					local misIndex = GetMissionIndexByID(sceneId,nHumanId,31)
					if GetMissionParam(sceneId,nHumanId, misIndex, 2) < 1  then
						BeginEvent(sceneId)
				  		AddText(sceneId, "�ѽ����̫�����ʣ�1/1")
				 		EndEvent()
				 	  DispatchMissionTips(sceneId, nHumanId)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 2, 1)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
					end
			  end
			  
			end
			--SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			
			-- ���麰��
			--LuaFnSetCopySceneData_Param(sceneId, 8, 4)
			--LuaFnSetCopySceneData_Param(sceneId, 13, 0)
			--LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
		end

		LuaFnSetCopySceneData_Param(sceneId, 8, 9)
	end
	
	-- �������� ���͵�����
	if nStep1 == 10  then
		local nMonsterNum = GetMonsterCount(sceneId)
		if nStep2 == 1  then
			--PrintNum(10)
			-- ֪ͨ�����ҽ��������
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				-- ���ý���������
				
				-- ����Ƿ��Id
				local targetId=0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "����"  then
						targetId = nMonsterId
					end
				end
				
				CallScriptFunction((200038), "OnDefaultEvent",sceneId, nHumanId, targetId )
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{juqing_start_013}" )
		
		elseif nStep2 == 2  then
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{juqing_start_014}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			
		elseif nStep2 == 3  then
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{juqing_start_015}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			
		elseif nStep2 == 4  then
			-- ��ʼ�á����塱��
			local nMonsterNum = GetMonsterCount(sceneId)
			local nqiaofengId = -1
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "����"  then
					nqiaofengId = nMonsterId
				end
			end
			
			if nqiaofengId ~= -1  then
				SetPatrolId(sceneId, nqiaofengId, 3)
			end
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			
		elseif nStep2 == 5  then
			-- ����Ƿ��ǲ��ǵ���
			--LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			local nMonsterNum = GetMonsterCount(sceneId)
			local nqiaofengId = -1
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "����"  then
					nqiaofengId = nMonsterId
				end
			end
			
			if nqiaofengId ~= -1  then
				local targetX, targetZ = GetWorldPos(sceneId, nqiaofengId)
				local x, z = GetLastPatrolPoint(sceneId, 3)
				local distance3 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
				if distance3 <= 1 then
					-- ֪ͨÿ���ˣ��������
					LuaFnSetCopySceneData_Param(sceneId, 10, 6)
					-- ����ģ��
					LuaFnDeleteMonster(sceneId, nqiaofengId)
					-- ����һ���µ������ģ��
					local nNpcId = LuaFnCreateMonster(sceneId, 424, 75,26, 0, 0, 120008)
					SetUnitReputationID(sceneId, selfId, nNpcId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
					SetCharacterName(sceneId, nNpcId, "����")
					SetNPCAIType(sceneId, nNpcId, 7)
					
					for i=0, 	nHumanNum-1  do
						local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
					  					  
					  -- �������������˼�����ɱ�־
					  if IsHaveMission(sceneId, nHumanId, 32) > 0 then
							local misIndex = GetMissionIndexByID(sceneId,nHumanId,32)
							if GetMissionParam(sceneId,nHumanId, misIndex, 1) < 1  then
								BeginEvent(sceneId)
						  		AddText(sceneId, "��ɾ��顰�������ס�")
						  	EndEvent()
						  	DispatchMissionTips(sceneId, nHumanId)
								SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
								SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
							end
					  end
					end
				
				end
			end
		end
		
	end
	
	
	if  1==1 then
		return
	end

	-- ��ҽ���ָ������󣬴����ľ���
	if nStep1 == 5  then
		if nStep2==1  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0017}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{JQ_DB_0017}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==2  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			end
		
		elseif nStep2==3  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0018}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{JQ_DB_0017}" )
			CallScriptFunction((200060), "Duibai",sceneId, "Ү����Ԫ", "��ãɽ", "#{JQ_DB_0018}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		end
	end
	
	-- �ڶ��ζ԰� �������� ���͵��յ��ʱ�򴥷�
	if nStep1==2 then
		if nStep3==0 then
			CallScriptFunction((200060), "Paopao",sceneId, "Ү����Ԫ", "��ãɽ", "#{JQ_PaoPao_86}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep3==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 2)
			end
			
		elseif nStep3==2 then
			CallScriptFunction((200060), "Paopao",sceneId, "Ү�ɺ��", "��ãɽ", "#{JQ_PaoPao_87}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep3==3 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 4)
			end
			
		elseif nStep3==4 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "��ãɽ", "#{JQ_PaoPao_88}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep3==5 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 6)
			end
		
		elseif nStep3==6 then
			CallScriptFunction((200060), "Paopao",sceneId, "Ү�ɺ��", "��ãɽ", "#{JQ_PaoPao_89}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep3==7 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 8)
			end
			
		elseif nStep3==8 then
			CallScriptFunction((200060), "Paopao",sceneId, "Ү�ɺ��", "��ãɽ", "#{JQ_PaoPao_90}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		end
	end
	
	-- �԰� ������� ��������ʱ�򴥷�
	if nStep1==3 then
		if nStep4==0  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0015}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "Ү����³��", "��ãɽ", "#{JQ_DB_0015}" )
			LuaFnSetCopySceneData_Param(sceneId, 12, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep4==1  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 12, 2)
			end
		
		elseif nStep4==2  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0016}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "Ү����³��", "��ãɽ", "#{JQ_DB_0016}" )
			LuaFnSetCopySceneData_Param(sceneId, 12, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		end
	end

	-- �԰� ��굴�����  ��ҽ����̫������󴥷�
	if nStep1==4 then
		if nStep5==0  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0017}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{JQ_DB_0017}" )
			LuaFnSetCopySceneData_Param(sceneId, 13, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep5==1  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 13, 2)
			end
		
		elseif nStep5==2  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0018}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "����", "��ãɽ", "#{JQ_DB_0017}" )
			CallScriptFunction((200060), "Duibai",sceneId, "Ү����Ԫ", "��ãɽ", "#{JQ_DB_0018}" )
			LuaFnSetCopySceneData_Param(sceneId, 13, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		end
	end
	
	-- �԰� �������� ���������ʱ�򴥷�
	if nStep1==5 then
		if nStep6==0 or nStep6==6 or nStep6==12  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0019}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "�о�", "��ãɽ", "#{JQ_DB_0019}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep6==1 or nStep6==7 or nStep6==13  then
			if nowTime - nTime > 5  then
				LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			end

		elseif nStep6==2 or nStep6==8 or nStep6==14  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0020}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "�о�", "��ãɽ", "#{JQ_DB_0020}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep6==3 or nStep6==9 or nStep6==15  then
			if nowTime - nTime > 5  then
				LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			end

		elseif nStep6==4 or nStep6==10 or nStep6==16  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0021}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "�о�", "��ãɽ", "#{JQ_DB_0021}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep6==5 or nStep6==11 or nStep6==17  then
			if nowTime - nTime > 5  then
				LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			end

		end		
	end
	
	-- �԰� �������� ��������ʱ�򴥷�
	if nStep1==6 then
		if nStep7==0 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0022}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "���ɱ�", "��ãɽ", "#{JQ_DB_0022}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		elseif nStep7==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 14, 0)
			end
		end
	end
	

end


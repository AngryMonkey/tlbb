-- ����ҹ��ľ���ׯ

--200023
-- ��ؤ�ﳤ�ϵİ����£��������ׯ����

--************************************************************************
--MisDescBegin
--�ű���
x200023_g_ScriptId = 200023

--MisDescEnd
--************************************************************************

--��������
x200023_g_CopySceneName = "����ׯ"

x200023_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x200023_g_CopySceneMap = "juxian.nav"
x200023_g_Exit = "juxian.ini"
x200023_g_LimitMembers = 1				--���Խ���������С��������
x200023_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200023_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200023_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200023_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x200023_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x200023_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200023_g_Fuben_X = 61					--���븱����λ��X
x200023_g_Fuben_Z = 110					--���븱����λ��Z
x200023_g_Back_X = 66					--Դ����λ��X
x200023_g_Back_Z = 56					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200023_OnDefaultEvent( sceneId, selfId, targetId )
	-- ������ҵ������������͵���ͬ�ĸ���
	x200023_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x200023_OnEnumerate( sceneId, selfId, targetId )
	-- �������Ѿ������20���񣬾Ϳ��Խ���
	if IsMissionHaveDone(sceneId, selfId, 23) > 0   then
		return 0
	end

	-- 1���Ѿ����22
	if IsMissionHaveDone( sceneId, selfId, 22 ) > 0 then
		AddNumText( sceneId, x200023_g_ScriptId, "����ȥ����ׯ�����죩", 10 ,-1  )
		return 0
	end
	
	-- 2��ӵ�������Ϊ23������
	if IsHaveMission( sceneId, selfId, 23 ) > 0 then
		AddNumText( sceneId, x200023_g_ScriptId, "����ȥ����ׯ�����죩", 10 ,-1  )
		return 0
	end
end


--**********************************
--����������
--**********************************
function x200023_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200023_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200023_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200023_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200023_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "juxian.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200023_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200023_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200023_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200023_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
	LuaFnSetSceneLoad_Area( sceneId, "juxian_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "juxian_monster.ini" )

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
function x200023_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200023_g_Fuben_X, x200023_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200023_g_Fuben_X, x200023_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--local misIndex = GetMissionIndexByID(sceneId,mems[i],x200023_g_MissionId)
				
				--������ĵ�2����������Ϊ�����ĳ�����
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200023_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200023_g_Fuben_X, x200023_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200023_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200023_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200023_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200023_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200023_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200023_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200023_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200023_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--���������¼�
--**********************************
function x200023_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200023_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200023_OnCopySceneTimer( sceneId, nowTime )


	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 10) --
	local nStartTime  = LuaFnGetCopySceneData_Param(sceneId, 11)	--ʱ��
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 12)	--ʱ��
	local nNowTime = LuaFnGetCurrentTime()
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 13) --
	local nStep5 = LuaFnGetCopySceneData_Param(sceneId, 20)
	
	if nStep1 == 1  then
	
		if nStep2 == 1 then
			-- ���ÿ�ս
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "�Ƿ�"  then
					SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 5)
					
					--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0011}",0)
					CallScriptFunction((200060), "Duibai",sceneId, "�Ƿ�", "����ׯ", "#{JQ_DB_0011}" )
				end
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 13, 2)
			LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
		
		elseif nStep2 == 2 then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 3)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			end

		elseif nStep2 == 3 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0012}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "�Ƿ�", "����ׯ", "#{JQ_DB_0012}" )
			LuaFnSetCopySceneData_Param(sceneId, 13, 4)
			
			LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime-55)
			
		else
			-- �������ʾ���ж��ٲ���
			
			if nStep2 < 16 and nStep2 > 4 then
					
				if nNowTime - nPreTime >= 30 and nStep5 == 0  then
					local str = "����ׯ����ʿ�ǻ��ᷢ��" .. 16 - nStep2   .. "�ν���"
					x200023_TipToAllPlayerOnScene(sceneId, str)

					LuaFnSetCopySceneData_Param(sceneId, 20, 1)
				end
				if nNowTime - nPreTime >= 40 and nStep5 == 1  then
					local str = "����ׯ����ʿ�ǻ��ᷢ��" .. 16 - nStep2   .. "�ν���"
					x200023_TipToAllPlayerOnScene(sceneId, str)
					
					LuaFnSetCopySceneData_Param(sceneId, 20, 2)
				end
				if nNowTime - nPreTime >= 50 and nStep5 == 2  then
					local str = "����ׯ����ʿ�ǻ��ᷢ��" .. 16 - nStep2   .. "�ν���"
					x200023_TipToAllPlayerOnScene(sceneId, str)
					
					LuaFnSetCopySceneData_Param(sceneId, 20, 0)
				end
			end
			
			if nNowTime - nPreTime >= 60 and nStep2 < 16   then
				local nNpcId
				if nStep2 == 8 then
					nNpcId = LuaFnCreateMonster(sceneId, 416, 57, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����ɽ")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 58, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����ɽ")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 59, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����ɽ")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 60, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����ɽ")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 61, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "��Сɽ")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
				
				elseif nStep2 == 11 then
					nNpcId = LuaFnCreateMonster(sceneId, 429, 58, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "�ξ�")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
					
					nNpcId = LuaFnCreateMonster(sceneId, 429, 60, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
				
				elseif nStep2 == 15 then
					nNpcId = LuaFnCreateMonster(sceneId, 427, 58, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
					
					nNpcId = LuaFnCreateMonster(sceneId, 427, 60, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "����")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
					
				else
					for j=0, 9  do
						--415,417,418,425,426,428,431,432,433
						local nNpcModelList={415,417,418,425,426,428,431,432,433}
						local nNpcMode = random( getn(nNpcModelList) )
						local nNpc1 = LuaFnCreateMonster(sceneId, nNpcModelList[nNpcMode], 55+j, 31, 1, 0, -1)
						SetCharacterName(sceneId, nNpc1, "������ʿ")
						SetUnitReputationID(sceneId,selfId, nNpc1, 29)
						SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
						SetNPCAIType(sceneId, nNpc1, 16)
					end
				end
				
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				
			end
			if nStep2 == 16 then
				--��������������û��
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)=="����" or GetName(sceneId, nMonsterId)=="����"  then
						bOk = 0	
					end
				end
				
				if bOk == 1  then
					-- ɾ�����е�С��
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					local bOk =1
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						if GetName(sceneId, nMonsterId)== "�ξ�" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "����" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "����ɽ" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "����ɽ" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "����ɽ" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "����ɽ" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "��Сɽ" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "������ʿ" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
					end
					
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				end
			end	
					
			if nStep2 == 17 then
				-- �Ƿ忪ʼѲ��
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "�Ƿ�" then
						SetPatrolId(sceneId, nMonsterId, 0)
						LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					end
				end	
			end
			
			if nStep2 == 18 then
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "�Ƿ�" then
						--���Ƿ��ǲ����ߵ��յ���
						--PrintStr("���յ���")
						local targetX, targetZ = GetWorldPos(sceneId, nMonsterId)
						local x, z = GetLastPatrolPoint(sceneId, 0)
						local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
						if distance2 <= 1 then
							--BroadMsgByChatPipe(sceneId,selfId,"���죺�Ҳ�����",0)
							CallScriptFunction((200060), "Duibai",sceneId, "����", "����ׯ", "�Ҳ�����" )
							LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
							LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
						end
					end
				end	
			end
			
			if nStep2 == 19 then
				--BroadMsgByChatPipe(sceneId,selfId,"Ѧ��ҽ���Ƿ壬����ô�찡���������Ѿͷ����",0)
				CallScriptFunction((200060), "Duibai",sceneId, "ѦĽ��", "����ׯ", "�Ƿ壬����ô�찡���������Ѿͷ����" )
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			end

			if nStep2 == 20 then	
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
					
					--�Ƿ�ѣ�ε���Ч
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						if GetName(sceneId, nMonsterId)== "�Ƿ�" then
							LuaFnSendSpecificImpactToUnit(sceneId,selfId,nMonsterId,nMonsterId,45,10)
						end
					end
				end
			end
			
			if nStep2 == 21 then
				--����10������Χ���Ƿ�
				local nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 62, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 59, 62, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 58, 63, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 58, 65, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 58, 66, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 59, 66, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 60, 66, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 65, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 64, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 63, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "������ʿ")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)

				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				
			end
			
			-- ��5����
			if nStep2 == 22 then
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				end
			end
			
			if nStep2 == 23 then
				--BroadMsgByChatPipe(sceneId,selfId,"�Ƿ�:��ĳ�����˶�",0)
				CallScriptFunction((200060), "Duibai",sceneId, "�Ƿ�", "����ׯ", "��ĳ�����˶�" )
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			end
			
			-- ��������
			if nStep2 == 24 then
				local nNpc1 = LuaFnCreateMonster(sceneId, 24, 61, 67, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "���´�")
				
				-- ����һ����Ч
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,nNpc1,nNpc1,43,5)
				
				CallScriptFunction((200060), "Duibai",sceneId, "���´�", "����ׯ", "���ģ�������" )
				
				--ɱ�����еĹ�
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "������ʿ" then
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end
				
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)

			end
			
			if nStep2 == 25 then
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
					CallScriptFunction((200060), "Duibai",sceneId, "�Ƿ�", "����ׯ", "$N������ͽ������ˣ�ȥ��Ѧ��ҽ��������������ȥ��" )
				end
			end
			
			if nStep2 == 26 then
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				end
			end
			
			if nStep2 == 27 then
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "���´�" then
						LuaFnDeleteMonster(sceneId, nMonsterId)
						LuaFnSendSpecificImpactToUnit(sceneId,selfId,nMonsterId,nMonsterId,44,5)
					end
					if GetName(sceneId, nMonsterId)== "�Ƿ�" then
						LuaFnDeleteMonster(sceneId, nMonsterId)
						LuaFnSendSpecificImpactToUnit(sceneId,selfId,nMonsterId,nMonsterId,44,5)
					end
				end
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				
				-- �����������
				LuaFnSetCopySceneData_Param(sceneId, 15, 1)
				
				-- ������������ĸ����ڵ������ˣ���������ɱ�־����Ļ��ʾ
				--PrintNum(nHumanNum)
				for i=0, nHumanNum-1  do
					local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
					-- ��ʾ��Ҿ������
					BeginEvent(sceneId)
						AddText(sceneId, "�ѱ����Ƿ����գ�1/1")
					EndEvent(sceneId)
					DispatchMissionTips(sceneId, nPlayerId)
										
					-- �������Player�ǲ������������
					if IsHaveMission(sceneId,nPlayerId,23) > 0 then
						local misIndex = GetMissionIndexByID(sceneId,nPlayerId,23)
						SetMissionByIndex( sceneId, nPlayerId, misIndex, 0, 1)
						SetMissionByIndex( sceneId, nPlayerId, misIndex, 1, 1)
					end
				end
			end
		end
	end
end

function x200023_TipToAllPlayerOnScene(sceneId, str)
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		
		BeginEvent(sceneId)
				AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
	
end

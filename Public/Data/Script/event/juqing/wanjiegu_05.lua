-- 

--��������
--��ٹȣ�����

-- �ڻ����޵İ����½��������ٹȣ�����ٹ������˴�����������Ϣ��
-- �ӳ����Դ��Լ���С��ȥ����������ֻҪ�ӳ����������Ϳ��ԣ�
-- ��Աֻ�ܶ��Խ��븱������������������

--************************************************************************
--MisDescBegin
--�ű���
x200005_g_ScriptId = 200005

-- Ⱥ�廤�͵Ķ���Id
x200005_g_Groupid = 0

--MisDescEnd
--************************************************************************

--��������
x200005_g_CopySceneName = "��ٹ�"

x200005_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x200005_g_CopySceneMap = "wanjie.nav"
x200005_g_Exit = "wanjie.ini"
x200005_g_LimitMembers = 1				--���Խ���������С��������
x200005_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200005_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200005_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200005_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x200005_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x200005_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200005_g_Fuben_X = 108					--���븱����λ��X
x200005_g_Fuben_Z = 115					--���븱����λ��Z
x200005_g_Back_X = 66					--Դ����λ��X
x200005_g_Back_Z = 56					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200005_OnDefaultEvent( sceneId, selfId, targetId )
	
	-- ������ҵ������������͵�����
	-- ����Ͳ��ڼ���ˣ�
	x200005_MakeCopyScene(sceneId, selfId)
	
end

--**********************************
--�о��¼�
--**********************************
function x200005_OnEnumerate( sceneId, selfId, targetId )
	
	-- ���8����ˣ��Ͳ����ٽ����ж��ˣ������ܽ�ȥ
	if IsMissionHaveDone(sceneId, selfId, 8) > 0   then
		return 0
	end
	
	-- �����ʲô����¿��Խ��븱����
	-- 1��������5���Խ�ȥ
	if IsHaveMission( sceneId, selfId, 5 ) > 0 then
		AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
		return 0
	end
	
	-- 2��������6���Խ�ȥ
	if IsHaveMission( sceneId, selfId, 6 ) > 0 then
		AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
		return 0
	end
	
	-- 3��������7���Խ�ȥ
	if IsHaveMission( sceneId, selfId, 7 ) > 0 then
		AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
		return 0
	end
	
	-- 4��������8���Խ�ȥ
	if IsHaveMission( sceneId, selfId, 8 ) > 0 then
		AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
		return 0
	end
	
	-- 5��ֻҪ���������5��û��6��7��8���񣬶����Խ�ȥ
	if IsMissionHaveDone(sceneId, selfId, 5) > 0   then
		if IsHaveMission(sceneId, selfId, 6) < 1   then
			AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
			return 0
		end
		if IsHaveMission(sceneId, selfId, 7) < 1   then
			AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
			return 0
		end
		if IsHaveMission(sceneId, selfId, 8) < 1   then
			AddNumText( sceneId, x200005_g_ScriptId, "����ȥ��ٹȣ����죩", 10 ,-1  )
			return 0
		end
	end
	
end

--**********************************
--����������
--**********************************
function x200005_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200005_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200005_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200005_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200005_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "wanjie.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200005_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200005_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200005_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200005_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
	LuaFnSetSceneLoad_Area( sceneId, "wanjie_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "wanjie_monster.ini" )

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
function x200005_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1���������ļ�û����ӣ��ʹ�������ļ��Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end
	
	-- �������ǲ����ж���
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- û�ж���
		NewWorld( sceneId, leaderObjId, destsceneId, x200005_g_Fuben_X, x200005_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200005_g_Fuben_X, x200005_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				
				NewWorld( sceneId, mems[i], destsceneId, x200005_g_Fuben_X, x200005_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200005_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200005_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200005_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200005_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200005_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200005_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200005_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200005_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200005_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200005_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200005_OnCopySceneTimer( sceneId, nowTime )
	-- ����1��Ⱥ�廤�ͣ�
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)

	local nJuqingStep = LuaFnGetCopySceneData_Param(sceneId, 11)
	local targetId = LuaFnGetCopySceneData_Param(sceneId, 12)
	
	if nJuqingStep == 1  then
		LuaFnSetCopySceneData_Param(sceneId, 11, 2)
		for i=0, 	nHumanNum-1  do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			
			-- ���ý���������
			CallScriptFunction((200007), "OnDefaultEvent",sceneId, nHumanId, targetId )
		end
		LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		CallScriptFunction((200060), "Duibai",sceneId, "������", "��ٹ�", "#{juqing_start_004}" )
		
	elseif nJuqingStep == 2  then
		-- �������ĺ���
		CallScriptFunction((200060), "Duibai",sceneId, "������", "��ٹ�", "#{juqing_start_005}" )
		LuaFnSetCopySceneData_Param(sceneId, 11, 3)

	elseif nJuqingStep == 3  then
	
		CallScriptFunction((200060), "Duibai",sceneId, "������", "��ٹ�", "#{juqing_start_006}" )
	
		-- ���������������������������
		ReleaseMonsterGroup(sceneId, x200005_g_Groupid)
		
		--local groupId = AllocateMonsterGroup(sceneId)
		local nFanyi
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "����"  then
				AddGroupLeader(sceneId, x200005_g_Groupid, nMonsterId) --leader
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				nFanyi = nMonsterId
			end
			if GetName(sceneId, nMonsterId)  == "����̩"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 2, 1)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)

			end
			if GetName(sceneId, nMonsterId)  == "���׷�"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 1, 2)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
			if GetName(sceneId, nMonsterId)  == "������"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 0, 2)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
			if GetName(sceneId, nMonsterId)  == "������"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 1, 0)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
			if GetName(sceneId, nMonsterId)  == "�ް�Ȫ"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 2, 0)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
			if GetName(sceneId, nMonsterId)  == "����֮"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 2, 2)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
			if GetName(sceneId, nMonsterId)  == "���Ƴ�"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 3, 0)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
			if GetName(sceneId, nMonsterId)  == "��˼��"  then
				AddGroupMember(sceneId, x200005_g_Groupid, nMonsterId, 3, 2)
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
			end
		end
		
		SetIntervalDistOfGroupMember(sceneId, x200005_g_Groupid, 1)
	
		--�õ�����Ѳ��·��
		SetPatrolId(sceneId, nFanyi, 0)
		RefixPosOfGroupMember(sceneId,x200005_g_Groupid,targetId)
		LuaFnSetCopySceneData_Param(sceneId, 11, 4)
		
	elseif nJuqingStep == 4  then
		-- �ж�NPC�ǲ����Ѿ�������
		local targetX, targetZ = GetWorldPos(sceneId, targetId)
		local patrolPathIndex = 0
		local x, z = GetLastPatrolPoint(sceneId, patrolPathIndex)
		local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
		if distance2 <= 5 then
			LuaFnSetCopySceneData_Param(sceneId, 11, 5)
			
			-- ֪ͨ�����ڵ������ˣ��������
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  BeginEvent(sceneId)
			  	AddText(sceneId, "��ɾ��顰�������")
			  EndEvent()
			  DispatchMissionTips(sceneId, nHumanId)
			  
			  -- �������������˼�����ɱ�־
			  if IsHaveMission(sceneId, nHumanId, 7) > 0 then
					local misIndex = GetMissionIndexByID(sceneId,nHumanId,7)
					SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
					SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
			  end
			end
			
			-- ���������ܶԻ�
			local nMonsterNum = GetMonsterCount(sceneId)
			local jj = 0
			for jj=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,jj)
				if GetName(sceneId, nMonsterId)  == "����"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "����̩"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "���׷�"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "������"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "������"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "�ް�Ȫ"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "����֮"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "���Ƴ�"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
				if GetName(sceneId, nMonsterId)  == "��˼��"  then
					SetConvoyNPC(sceneId, nMonsterId, 0)
				end
			end
			CallScriptFunction((200060), "Duibai",sceneId, "������", "��ٹ�", "���֣��������������ˣ�" )
		end
		
	elseif nJuqingStep == 5  then
		--PrintNum(4)
	end
end


--ʯ�� �����ң��
--212124
-- ע��ʹ�ó�����ʱ������ɡ�
-- ��������

--MisDescBegin
--�ű���
x212124_g_ScriptId = 212124

--��������NPC����
x212124_g_Position_X=183
x212124_g_Position_Z=168
x212124_g_SceneID=26
x212124_g_AccomplishNPC_Name="֣Բ"

--�����
x212124_g_MissionId = 940

--ǰ������
x212124_g_MissionIdPre = 605

--Ŀ��NPC
x212124_g_Name	="֣Բ"

--�������
x212124_g_MissionKind = 37

--����ȼ�
x212124_g_MissionLevel = 56

--�Ƿ��Ǿ�Ӣ����
x212124_g_IfMissionElite = 0

--������
x212124_g_MissionName="�����ң��"
x212124_g_MissionInfo="#{Mis_30_60_desc_015}"
x212124_g_MissionTarget="    ���������Żص�Բ�´壬Ȼ���ҵ�ʯ��Բ�´��֣Բ#{_INFOAIM183,167,26,֣Բ}��"
x212124_g_MissionContinue="  ���ɷ�һ��������ģ�һ���ģ������ţ�"
x212124_g_MissionComplete="  ���ƺ��о������ɷ������Ŀ�⣬��һ�����ڲ�Զ�������ҡ����ţ��㵽������ѽ����һ�����������"

x212124_g_MoneyBonus=16000
x212124_g_exp=20000

x212124_g_Custom	= { {id="�Ѿ�����������",num=1} }
x212124_g_IsMissionOkFail = 0
--MisDescEnd

-- ����·��Id
x212124_g_PatrolPathIndex = 0

-- ������ʱ��Index
x212124_g_SceneTimerIndex = -1
x212124_g_Step = 0
x212124_g_StartTime = 0
x212124_g_PlayerNum = 0
x212124_g_PlayerId= {-1,-1,-1,-1,-1,-1}


--**********************************
--������ں���
--**********************************
function x212124_OnDefaultEvent( sceneId, selfId, targetId )
	--��������ɹ��������
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212124_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212124_g_Name then
			--x212124_OnContinue( sceneId, selfId, targetId )
			local bDone = x212124_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				AddText(sceneId,x212124_g_MissionName)
				AddText(sceneId,x212124_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId,bDone)		
			
			
		end
	
	--���������������
	elseif x212124_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212124_g_Name then
			--�����������ʱ��ʾ����Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212124_g_MissionName)
				AddText(sceneId,x212124_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212124_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212124_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x212124_OnEnumerate( sceneId, selfId, targetId )

	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x212124_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212124_g_Name then
			AddNumText(sceneId, x212124_g_ScriptId,x212124_g_MissionName,2,-1);
		end
	--���������������
	elseif x212124_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212124_g_Name then
			AddNumText(sceneId,x212124_g_ScriptId,x212124_g_MissionName,1,-1);
		end
	end

end

--**********************************
--����������
--**********************************
function x212124_CheckAccept( sceneId, selfId )
	-- 1���������ǲ����Ѿ�����
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 ) then
		return 0
	end
		
	-- �ȼ����
	if GetLevel(sceneId, selfId) < x212124_g_MissionLevel then
		return 0
	end
	
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionIdPre) < 1 ) then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x212124_OnAccept( sceneId, selfId, targetId )
	if x212124_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- �����ҵ��ķ��ǲ��Ǵﵽ��Ҫ��ǰ�����ķ��ȼ����ڵ���25����
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 25 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("���������Ҫǰ�����ķ����ﵽ25����")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ʹ��һ��������ʱ�������С�����
	if x212124_g_Step ~= 0  and x212124_g_Step ~= 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "Ŀ����æ�����Ժ�")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end
	
	-- ����Ļ�����Ҫ���������ļ�ʱ����ͬʱ���������ϵļ�ʱ��
	if x212124_g_Step == 0   then
		local ret = AddMission( sceneId,selfId, x212124_g_MissionId, x212124_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
			return
		end
		
		-- �������Ͽ�һ����ʱ����
		StartMissionTimer(sceneId, selfId, x212124_g_MissionId)

		-- ���������ʱ����Ӧ����һֱ������ռ�õģ����ԣ�ֻҪ���ֵ������-1���Ͳ�Ҫ������
		if x212124_g_SceneTimerIndex == -1  then
			x212124_g_SceneTimerIndex = SetTimer(sceneId, selfId, x212124_g_ScriptId, "OnSceneTimer", 1)
		end
		
		x212124_g_StartTime = LuaFnGetCurrentTime()
		x212124_g_Step = 1
		
		x212124_g_PlayerId[1] = selfId
		x212124_g_PlayerNum = 1
		
		Msg2Player(  sceneId, selfId,"#Y�������������ң����",MSG2PLAYER_PARA )

		-- �������
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212124_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	end
	
	if x212124_g_Step == 2   then
		
	end
	
	
end

function x212124_OnSceneTimer(sceneId, selfId)

	if x212124_g_Step < 3  then
		local nSelfId = -1
		local bHavePlayer = 0
			for i=1, x212124_g_PlayerNum  do	
				if x212124_g_PlayerId[i] ~= -1  then
					if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])==1  and
						 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) == 1   then
						bHavePlayer = 1
						nSelfId = x212124_g_PlayerId[i]
						break
					end
				end
			end
		
		if bHavePlayer == 0   then
			-- ��ʱ��ֹͣ��������е�ȫ�ֱ���
			x212124_g_Step = 0
			x212124_g_StartTime = 0
			x212124_g_PlayerId[1] = -1
			x212124_g_PlayerId[2] = -1
			x212124_g_PlayerId[3] = -1
			x212124_g_PlayerId[4] = -1
			x212124_g_PlayerId[5] = -1
			x212124_g_PlayerId[6] = -1
			x212124_g_PlayerNum = 0
			x212124_g_StartTime = 0
			return
		end
	end
	
	-- ֻҪ����Ŀ���ߵ��յ㣬�ͻָ����еı���
	if x212124_g_Step == 1   then
		-- ��С�ӵ�������ҷ���һ���͵�����
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nYangTX = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "������"  then
				nYangTX = nMonsterId
				bHaveMonster = 1
			end
		end
		
		for i=1, x212124_g_PlayerNum  do	
			if x212124_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])==1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) == 1   then
					bHavePlayer = 1
					nSelfId = x212124_g_PlayerId[i]
					
					break
				end
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, nSelfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, nSelfId, i)
			if PlayerId ~= nSelfId    then
				CallScriptFunction((212124), "OnDefaultEvent", sceneId, PlayerId, nYangTX )
			end
		end
		
		-- �������������������
		x212124_g_StartTime = LuaFnGetCurrentTime()
		x212124_g_Step = 2
		
	elseif x212124_g_Step == 2   then
		-- �ȴ�5�룬���ʱ���ǵȴ�������һ�����������͵�ʱ��
		if LuaFnGetCurrentTime() - x212124_g_StartTime > 5   then
			--CallScriptFunction((200060), "Paopao",sceneId, "������", "ʯ��", "����������!!!")
			x212124_g_Step = 3
			return
		end
		
	elseif x212124_g_Step == 3   then
		CallScriptFunction((200060), "Paopao",sceneId, "������", "ʯ��", "����������!!!")
		
		-- ��ʼ����
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nYangTX = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "������"  then
				nYangTX = nMonsterId
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			PrintStr("�Ҳ��� ������")
			return 
		end
		--�õ�����Ѳ��·��
		--SetNPCAIType(sceneId, nYangTX, 0)
		SetPatrolId(sceneId, nYangTX, x212124_g_PatrolPathIndex)
		x212124_g_Step = 4


	elseif x212124_g_Step == 4   then
		-- �������Ŀ�굽��·���յ㣬
		local Patrol_x
		local Patrol_z
		Patrol_x,Patrol_z = GetLastPatrolPoint(sceneId, x212124_g_PatrolPathIndex)
		
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nYangTX = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "������"  then
				nYangTX = nMonsterId
				nHaveMonster = 1
			end
		end
		
		-- ����Ҳ�������ˡ�����������ʱû�д���
		
		local targetX, targetZ = GetWorldPos(sceneId, nYangTX)
		local distance = floor(sqrt((Patrol_x-targetX)*(Patrol_x-targetX)+(Patrol_z-targetZ)*(Patrol_z-targetZ)))
		
		if distance <= 2 then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "ʯ��", "���ˣ�����!!!")
			x212124_g_Step = 0
			
			-- ������ҵ�������ɣ��������ʾ���ȵȵĲ�����������ִ��
			for i=1, x212124_g_PlayerNum   do
				if x212124_g_PlayerId[i]~=-1   then
					local misIndex = GetMissionIndexByID(sceneId, x212124_g_PlayerId[i], x212124_g_MissionId)--�õ�������20�������е����к�
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 0, 1)
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 1, 1)
					BeginEvent(sceneId)
						AddText(sceneId, "���������ųɹ���")
					EndEvent()
					DispatchMissionTips(sceneId, x212124_g_PlayerId[i])
				end
			end
			return
		end
		
		-- �������ǲ�������ʧ�ܣ�
			-- ʧ��ԭ��
				-- 1������Npc��Զ
				-- 2���뿪���������
				-- 3�����������뿪���������ʵ�֣�
		for i=1, x212124_g_PlayerNum  do	
			if x212124_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])~=1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) ~= 1   then
					
					x212124_g_PlayerId[i] = -1
				end
			end
			
			if x212124_g_PlayerId[i] ~= -1  then
				local x, z = GetWorldPos(sceneId, x212124_g_PlayerId[i])
				local distance = floor(sqrt((x-targetX)*(x-targetX)+(z-targetZ)*(z-targetZ)))
				
				if distance>15   then
					BeginEvent(sceneId)
						AddText(sceneId, "����������ʧ�ܡ�")
					EndEvent()
					DispatchMissionTips(sceneId, x212124_g_PlayerId[i])
					
					local misIndex = GetMissionIndexByID(sceneId, x212124_g_PlayerId[i], x212124_g_MissionId)
					
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 0, 2)
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 1, 0)

					StopMissionTimer(sceneId, x212124_g_PlayerId[i],x212124_g_MissionId)
					x212124_g_PlayerId[i] = -1
				end
			end
		end
	end
	
end

--**********************************
--����
--**********************************
function x212124_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x212124_g_MissionId )
end

--**********************************
--����
--**********************************
function x212124_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
  BeginEvent(sceneId)
	AddText(sceneId,x212124_g_MissionName)
	AddText(sceneId,x212124_g_MissionComplete)
	AddMoneyBonus( sceneId, x212124_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212124_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212124_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId, selfId, x212124_g_MissionId)--�õ�������20�������е����к�
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--�ύ
--**********************************
function x212124_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212124_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--���������
		AddMoney(sceneId,selfId, x212124_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212124_g_exp)
		DelMission( sceneId, selfId, x212124_g_MissionId )
		MissionCom( sceneId, selfId, x212124_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y������������ң����",MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x212124_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x212124_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212124_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--��ʱ�¼�
--**********************************
function x212124_OnTimer(sceneId,selfId)
	if sceneId ~= 26   then
		BeginEvent(sceneId)
			AddText(sceneId, "����������ʧ�ܡ�")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212124_g_MissionId)
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
		SetMissionByIndex(sceneId, selfId, misIndex, 1, 0)
		
		StopMissionTimer(sceneId,selfId,x212124_g_MissionId)
	end
end

-- �޹�ɽ  200040

-- 	�ڷ������ָ����ǰ���޹�ɽ

--************************************************************************
--MisDescBegin
--�ű���
x200040_g_ScriptId = 200040

--MisDescEnd
--************************************************************************

--��������
x200040_g_CopySceneName = "�޹�ɽ"

x200040_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x200040_g_CopySceneMap = "leigu_1.nav"
x200040_g_Exit = "leigu_1.ini"
x200040_g_LimitMembers = 1					--���Խ���������С��������
x200040_g_TickTime = 5							--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200040_g_LimitTotalHoldTime = 360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200040_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200040_g_CloseTick = 3							--�����ر�ǰ����ʱ����λ��������
x200040_g_NoUserTime = 300					--������û���˺���Լ��������ʱ�䣨��λ���룩
x200040_g_DeadTrans = 0							--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200040_g_Fuben_X = 56							--���븱����λ��X
x200040_g_Fuben_Z = 104							--���븱����λ��Z
x200040_g_Back_X = 66								--Դ����λ��X
x200040_g_Back_Z = 56								--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200040_OnDefaultEvent( sceneId, selfId, targetId )
	-- ������ҵ������������͵���ͬ�ĸ���
	x200040_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x200040_OnEnumerate( sceneId, selfId, targetId )
	-- 0,�������Ѿ���4���񣬾Ͳ����ڽ����������
	if IsHaveMission( sceneId, selfId, 36 ) > 0 then
		return 0
	end
	if IsMissionHaveDone(sceneId, selfId, 36) > 0   then
		return 0
	end

	-- 1��ӵ�������Ϊ34������
	if IsHaveMission( sceneId, selfId, 34 ) > 0 then
		AddNumText( sceneId, x200040_g_ScriptId, "����ȥ�޹�ɽ(ҹ��)", 10 ,-1  )
		return 0
	end

	-- 2,ֻҪ�����35���񣬾��ܽ���
	if IsHaveMission( sceneId, selfId, 35 ) > 0 then
		AddNumText( sceneId, x200040_g_ScriptId, "����ȥ�޹�ɽ(ҹ��)", 10 ,-1  )
		return 0
	end
	
	-- 3,�����������34��û��35��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 34) > 0   then
		if IsHaveMission( sceneId, selfId, 35 ) < 1 then
			AddNumText( sceneId, x200040_g_ScriptId, "����ȥ�޹�ɽ(ҹ��)", 10 ,-1  )
			return 0
		end
		if IsHaveMission( sceneId, selfId, 36 ) < 1 then
			AddNumText( sceneId, x200040_g_ScriptId, "����ȥ�޹�ɽ(ҹ��)", 10 ,-1  )
			return 0
		end
	end
	
end

--**********************************
--����������
--**********************************
function x200040_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200040_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200040_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200040_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200040_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "leigu_1.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200040_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200040_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200040_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200040_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
	LuaFnSetSceneLoad_Area( sceneId, "leigu_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "leigu_1_monster.ini" )

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
function x200040_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200040_g_Fuben_X, x200040_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200040_g_Fuben_X, x200040_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--misIndex = GetMissionIndexByID(sceneId,mems[i],x200040_g_MissionId)
				
				--������ĵ�2����������Ϊ�����ĳ�����
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200040_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200040_g_Fuben_X, x200040_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200040_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200040_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200040_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200040_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200040_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200040_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200040_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200040_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200040_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200040_OnCopySceneTimer( sceneId, nowTime )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId, 0)

	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--����˵��
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9);--ʱ��
	local nStartTime = LuaFnGetCopySceneData_Param(sceneId, 11)
	-- paopao 
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) ;--����˵����
	
	nowTime = LuaFnGetCurrentTime()
	
	-- ��ɱ��������������������Լ���·,��֮ǰ�ж԰�
	if nStep1==3 then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			-- ������Ҫ��AI
			if GetName(sceneId, nMonsterId)  == "����"  then
				SetPatrolId(sceneId, nMonsterId, 1)
				
				LuaFnSetCopySceneData_Param(sceneId, 8, 4)
			end
		end
	end	
	
	if nStep1==2 then
		if nStep2 == 1  then
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				-- ������Ҫ��AI
				if GetName(sceneId, nMonsterId)  == "����"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 7) -- ��������������������ƶ������Թ��������ỹ��
					
					SetPatrolId(sceneId, nMonsterId, 0)
				end
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		end
		if nStep2 == 2  then
			if nowTime - nStartTime < 120  then
				if nowTime - nTime > 10  then
					local nNpcId = LuaFnCreateMonster(sceneId, 408, 76, 32, 1, 0, -1)
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 0)
					SetCharacterName(sceneId, nNpcId, "��ʬ")

					LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
				end
			
			else
				-- ʱ�䵽�����С�֣��������ǲ��ǻ�����
				local bOk = 0
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "����"  then
						bOk = 1
					end
					if GetName(sceneId, nMonsterId)  == "��ʬ"  then
						-- ɾ�����еĽ�ʬ
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end
				
				if bOk == 1 then
					LuaFnSetCopySceneData_Param(sceneId, 15, 1)
					-- ֪ͨ��ң����������
					for i=0, 	nHumanNum-1  do
						local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
						
						--���������ǲ������������
						if IsHaveMission( sceneId, nHumanId, 35 ) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, nHumanId, 35)
							SetMissionByIndex(sceneId, nHumanId, misIndex, 0, 1)
							SetMissionByIndex(sceneId, nHumanId, misIndex, 1, 1)
							BeginEvent(sceneId)
							AddText(sceneId,"�ѱ�������1/1")
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,nHumanId)
						end
					end
				end
				LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			end
		end
				
	end
	
	
	-- ��һ�εĶ԰� ��ʱ������� ��������ʱ�򴥷�
	if nStep1==1 then
		if nStep2==0 then
			-- ���� paopao
			CallScriptFunction((200060), "Paopao",sceneId, "���Ǻ�", "�޹�ɽ", "#{JQ_PaoPao_91}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end
			
		elseif nStep2==2 	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "�޹�ɽ", "#{JQ_PaoPao_92}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==3 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			end
		elseif nStep2==4 	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "�޹�ɽ", "#{JQ_PaoPao_93}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==5 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			end
		elseif nStep2==6 	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "�޹�ɽ", "#{JQ_PaoPao_94}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==7 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 8)
			end
		elseif nStep2==8 	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "�޹�ɽ", "#{JQ_PaoPao_95}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==9 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 10)
			end
		elseif nStep2==10 then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "�޹�ɽ", "#{JQ_PaoPao_96}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 11)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==11 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 12)
			end
		elseif nStep2==12 then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "�޹�ɽ", "#{JQ_PaoPao_97}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 13)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==13 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 14)
			end
		elseif nStep2==14 then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "�޹�ɽ", "#{JQ_PaoPao_98}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 15)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==15 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 16)
			end
		elseif nStep2==16 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "�޹�ɽ", "#{JQ_PaoPao_99}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 17)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==17 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 18)
			end
		elseif nStep2==18 then
			CallScriptFunction((200060), "Paopao",sceneId, "���Ǻ�", "�޹�ɽ", "#{JQ_PaoPao_100}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 19)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==19 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 20)
			end
		elseif nStep2==20 then
			CallScriptFunction((200060), "Paopao",sceneId, "���Ǻ�", "�޹�ɽ", "#{JQ_PaoPao_101}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 21)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		end
	end
	
end



-- �� �������� �����£�����һƷ�ã�
-- 200054

--************************************************************************
--MisDescBegin
--�ű���
x200054_g_ScriptId = 200054

--MisDescEnd
--************************************************************************

--��������
x200054_g_CopySceneName = "һƷ��"

x200054_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x200054_g_CopySceneMap = "yipin.nav"
x200054_g_Exit = "yipin.ini"
x200054_g_LimitMembers = 1				--���Խ���������С��������
x200054_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200054_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200054_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200054_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x200054_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x200054_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200054_g_Fuben_X = 32					--���븱����λ��X
x200054_g_Fuben_Z = 113					--���븱����λ��Z
x200054_g_Back_X = 66					--Դ����λ��X
x200054_g_Back_Z = 56					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200054_OnDefaultEvent( sceneId, selfId, targetId )
	-- ������ҵ������������͵���ͬ�ĸ���
	x200054_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x200054_OnEnumerate( sceneId, selfId, targetId )
--	-- 0,�������Ѿ���4���񣬾Ͳ����ڽ����������
--	if IsHaveMission( sceneId, selfId, 4 ) > 0 then
--		return 0
--	end
	if IsMissionHaveDone(sceneId, selfId, 45) > 0   then
		return 0
	end

	-- 1��ӵ�������Ϊ43������
	if IsHaveMission( sceneId, selfId, 43 ) > 0 then
		AddNumText( sceneId, x200054_g_ScriptId, "����ȥһƷ��(����)", 10 ,-1  )
		return 0
	end

	-- 2,ֻҪ�����44���񣬾��ܽ���
	if IsHaveMission( sceneId, selfId, 44 ) > 0 then
		AddNumText( sceneId, x200054_g_ScriptId, "����ȥһƷ��(����)", 10 ,-1  )
		return 0
	end
	
	-- 3,ֻҪ�����45���񣬾��ܽ���
	if IsHaveMission( sceneId, selfId, 45 ) > 0 then
		AddNumText( sceneId, x200054_g_ScriptId, "����ȥһƷ��(����)", 10 ,-1  )
		return 0
	end
	
	-- 4,�����������43��û��44��Ҳ�ܽ���
	if IsMissionHaveDone(sceneId, selfId, 43) > 0   then
		if IsHaveMission( sceneId, selfId, 34 ) < 1 then
			AddNumText( sceneId, x200054_g_ScriptId, "����ȥһƷ��(����)", 10 ,-1  )
			return 0
		end
	end
	
	-- 5,�����������43������û��45��Ҳ�ǿ��Խ���
	if IsMissionHaveDone(sceneId, selfId, 43) > 0   then
		if IsHaveMission( sceneId, selfId, 45 ) < 1 then
			AddNumText( sceneId, x200054_g_ScriptId, "����ȥһƷ��(����)", 10 ,-1  )
			return 0
		end
	end

end

--**********************************
--����������
--**********************************
function x200054_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200054_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200054_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200054_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200054_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yipin.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200054_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200054_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200054_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200054_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
	LuaFnSetSceneLoad_Area( sceneId, "yipin_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yipin_monster.ini" )

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
function x200054_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200054_g_Fuben_X, x200054_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200054_g_Fuben_X, x200054_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--misIndex = GetMissionIndexByID(sceneId,mems[i],x200054_g_MissionId)
				
				--������ĵ�2����������Ϊ�����ĳ�����
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200054_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200054_g_Fuben_X, x200054_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200054_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200054_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200054_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200054_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200054_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200054_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200054_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200054_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200054_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x200054_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200054_OnCopySceneTimer( sceneId, nowTime )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) --����˵��
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9)	--ʱ��
	
	local nStepHusong = LuaFnGetCopySceneData_Param(sceneId, 11)

	local targetId = LuaFnGetCopySceneData_Param(sceneId, 15)

	-- paopao 
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) --����˵����
	local nZhenying = 24
	
	-- ����
	if nStep1==3 then
--PrintNum(nStepHusong)
		if nStepHusong == 1   then
			-- ��֪ͨ�����ڸ����ڵ��ˣ��ǲ���һ����뻤��
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				
				-- ���ý���������
				CallScriptFunction((200056), "OnDefaultEvent",sceneId, nHumanId, targetId )
			end
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			LuaFnSetCopySceneData_Param(sceneId, 11, 2)
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{juqing_start_016}")
			
		elseif nStepHusong == 2   then
			-- �ȴ�5��
			if nowTime - nTime >= 5  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 3)
				CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{juqing_start_017}")
			end
			
		elseif nStepHusong == 3   then
			-- ���������ˣ�
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{juqing_start_018}")
			SetPatrolId(sceneId, targetId, 0)
			
			LuaFnSetCopySceneData_Param(sceneId, 11, 4)
		
		elseif nStepHusong == 4   then
			-- ���͹����еļ��
			local x, z = GetLastPatrolPoint(sceneId, 0)
			local targetX, targetZ = GetWorldPos(sceneId, targetId)
			
			local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance2 <= 1 then
				-- Ŀ�굽���յ㣬��ÿ���������������һ��
				for i=0, 	nHumanNum-1  do
					local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				  BeginEvent(sceneId)
				  	AddText(sceneId, "��ɾ��顰һ�����㡱")
				  EndEvent()
				  DispatchMissionTips(sceneId, nHumanId)
				  
				  -- �������������˼�����ɱ�־
				  if IsHaveMission(sceneId, nHumanId, 45) > 0 then
						local misIndex = GetMissionIndexByID(sceneId,nHumanId,45)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
				  end
				  
				  LuaFnSetCopySceneData_Param(sceneId, 11, 5)
				  LuaFnSetCopySceneData_Param(sceneId, 8, 4)
				end
			end

		end
	end

	if nStep1==1 then
		if nStep2==0 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_119}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

			-- ���û��Ϊ29��
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				-- ������Ҫ��AI
				if GetName(sceneId, nMonsterId)  == "����"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 10)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
				end
				
				if GetName(sceneId, nMonsterId)  == "һƷ��ȼ���"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 30)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 7)
					
					-- ��������+һ��BUFF,���߿־塣
					LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId, nMonsterId, nMonsterId, 52, 0 )
				end
				
				if GetName(sceneId, nMonsterId)  == "����Ӣ��"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, nZhenying)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
					if nZhenying == 24  then
						nZhenying =25
					else
						nZhenying =24
					end
				end
	
				if GetName(sceneId, nMonsterId)  == "Ľ�ݸ�"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 10)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					SetNPCAIType(sceneId, nMonsterId, 3)
				end
			end
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			
		elseif nStep2==1 then
			-- ����ǲ��� һƷ��ȼ��� ����
			local bOk = 1
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				-- ������Ҫ��AI
				if GetName(sceneId, nMonsterId)  == "һƷ��ȼ���"  then
					bOk = 0
				end
			end
			
			if bOk == 1 then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end
		
		elseif nStep2==2 then
			--PrintStr("zhanshou wancheng")
			
			LuaFnSetCopySceneData_Param(sceneId, 8, 2)
			LuaFnSetCopySceneData_Param(sceneId, 10,0)
			
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				-- ������Ҫ��AI
				if GetName(sceneId, nMonsterId)  == "����Ӣ��"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					SetNPCAIType(sceneId, nMonsterId, 3)
					
				end
				if GetName(sceneId, nMonsterId)  == "����"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					SetNPCAIType(sceneId, nMonsterId, 3)
					
				end
			end

		end 
		
	end
	
	-- �԰� һЦ�˼����� �������ʱ�򴥷�
	if nStep1==2 then
		if nStep2==0 then
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		elseif nStep2==1 	then
			if nowTime - nTime > 0  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end

		elseif nStep2==2 	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_120}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==3 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			end

		elseif nStep2==4 	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_121}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==5 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			end

		elseif nStep2==6 	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_122}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==7 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 8)
			end

		elseif nStep2==8 	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_123}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==9 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 10)
			end

		elseif nStep2==10 then
			CallScriptFunction((200060), "Paopao",sceneId, "", "һƷ��", "#{JQ_PaoPao_124}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 11)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==11 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 12)
			end

		elseif nStep2==12 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_125}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 13)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==13 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 14)
			end

		elseif nStep2==14 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_126}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 15)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==15 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 16)
			end

		elseif nStep2==16 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_127}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 17)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==17 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 18)
			end

		elseif nStep2==18 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_128}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 19)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==19 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 20)
			end

		elseif nStep2==20 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_129}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 21)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==21 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 22)
			end

		elseif nStep2==22 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_130}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 23)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==23 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 24)
			end

		elseif nStep2==24 then
			CallScriptFunction((200060), "Paopao",sceneId, "Ľ�ݸ�", "һƷ��", "#{JQ_PaoPao_131}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 25)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==25 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 26)
			end

		elseif nStep2==26 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_132}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 27)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==27 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 28)
			end

		elseif nStep2==28 then
			CallScriptFunction((200060), "Paopao",sceneId, "Ľ�ݸ�", "һƷ��", "#{JQ_PaoPao_133}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 29)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==29 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 30)
			end

		elseif nStep2==30 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_134}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 31)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==31 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 32)
			end

		elseif nStep2==32 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_135}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 33)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==33 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 34)
			end

		elseif nStep2==34 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_136}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 35)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==35 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 36)
			end

		elseif nStep2==36 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_137}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 37)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==37 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 38)
			end

		elseif nStep2==38 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_138}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 39)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==39 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 40)
			end

		elseif nStep2==40 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_139}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 41)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==41 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 42)
			end

		elseif nStep2==42 then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "һƷ��", "#{JQ_PaoPao_140}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 43)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

			LuaFnSetCopySceneData_Param(sceneId, 15, 1)
		end
	end

end


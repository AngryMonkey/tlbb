-- �ڵõ� Ľ�ݸ� ������󣬽�������������

--************************************************************************
--MisDescBegin
--�ű���
x200014_g_ScriptId = 200014

--��������
x200014_g_CopySceneName="������"
--�����ı�����
--MisDescEnd
--************************************************************************

--��������
x200014_g_CopySceneName = "������"

x200014_g_CopySceneType = FUBEN_JUQING	--�������ͣ�������ScriptGlobal.lua����

x200014_g_CopySceneMap = "yanzi.nav"
x200014_g_Exit = "yanzi.ini"
x200014_g_LimitMembers = 1				--���Խ���������С��������
x200014_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x200014_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x200014_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x200014_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x200014_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x200014_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x200014_g_Fuben_X = 105					--���븱����λ��X
x200014_g_Fuben_Z = 99					--���븱����λ��Z
x200014_g_Back_X = 66					--Դ����λ��X
x200014_g_Back_Z = 56					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x200014_OnDefaultEvent( sceneId, selfId, targetId )
	-- ������ҵ������������͵���ͬ�ĸ���
	x200014_MakeCopyScene(sceneId, selfId)
end


--**********************************
--�о��¼�
--**********************************
function x200014_OnEnumerate( sceneId, selfId, targetId )

	-- ��������15��ֱ�ӷ���
	if IsMissionHaveDone(sceneId, selfId, 15) > 0   then
		return 0
	end

	--�����������ǲ������������
	-- ������13���Խ���
	if IsHaveMission( sceneId, selfId, 13 ) > 0 then
		AddNumText( sceneId, x200014_g_ScriptId, "����ȥ�����루���죩", 10 ,-1  )
		return 0
	end
	
	-- ������14���Խ���
	if IsHaveMission( sceneId, selfId, 14 ) > 0 then
		AddNumText( sceneId, x200014_g_ScriptId, "����ȥ�����루���죩", 10 ,-1  )
		return 0
	end

	-- ������15���Խ���
	if IsHaveMission( sceneId, selfId, 15 ) > 0 then
		AddNumText( sceneId, x200014_g_ScriptId, "����ȥ�����루���죩", 10 ,-1  )
		return 0
	end
	
	-- ��������13��û��14��15�������Խ���
	if IsMissionHaveDone(sceneId, selfId, 13) > 0   then
		if IsHaveMission(sceneId, selfId, 14) < 1   then
			AddNumText( sceneId, x200014_g_ScriptId, "����ȥ�����루���죩", 10 ,-1  )
			return 0
		end
		if IsHaveMission(sceneId, selfId, 15) < 1   then
			AddNumText( sceneId, x200014_g_ScriptId, "����ȥ�����루���죩", 10 ,-1  )
			return 0
		end
	end

end

--**********************************
--����������
--**********************************
function x200014_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x200014_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200014_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x200014_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x200014_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yanzi.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
		
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200014_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200014_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200014_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200014_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Boss������
	LuaFnSetCopySceneData_Param(sceneId, 8, 0) ;--ʱ��
	
	-- �����õ��ı������
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetSceneLoad_Area( sceneId, "yanzi_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yanzi_monster.ini" )

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
function x200014_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200014_g_Fuben_X, x200014_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200014_g_Fuben_X, x200014_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200014_g_Fuben_X, x200014_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x200014_OnPlayerEnter( sceneId, selfId )
	-- ÿ�����븱�����ˣ����ᱻˢһ����������
	-- ��������Ҫˢ�����ݵ������ǣ�14��ָ��Ⱥ��Ϸ
	local nMissionId = 14
	if IsHaveMission( sceneId, selfId, nMissionId ) > 0 then  --���������������
		local misIndex = GetMissionIndexByID(sceneId,selfId,nMissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)
		SetMissionByIndex(sceneId,selfId,misIndex,2,0)
		SetMissionByIndex(sceneId,selfId,misIndex,3,0)
		SetMissionByIndex(sceneId,selfId,misIndex,4,0)
		SetMissionByIndex(sceneId,selfId,misIndex,5,0)
	end
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x200014_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x200014_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x200014_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x200014_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x200014_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x200014_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x200014_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x200014_OnEnterZone( sceneId, selfId, zoneId )

end

--**********************************
--���߸ı�
--**********************************
function x200014_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x200014_OnCopySceneTimer( sceneId, nowTime )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 10) --����˵��
	local nStartTime  = LuaFnGetCopySceneData_Param(sceneId, 11)	--ʱ��
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 12)	--ʱ��
	local nNowTime = LuaFnGetCurrentTime()

	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 13) --����˵��

	if nStep1 == 1  then
	
		if nNowTime - nPreTime >= 10 then
			-- ��û����ŵĹ�
			LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			local nMonsterNum = GetMonsterCount(sceneId)
			local nMonster = {}
			local ii = 0
			local jj = 0
			local bHaveMonster = 0
			local nWangId = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "�ƺ���"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "���ۿ�"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "��צ�ŵ���"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "�����ʿ"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "ˤ�Ǹ���"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
					
				elseif GetName(sceneId, nMonsterId)  == "������"  then
					nWangId = nMonsterId
				end
				
			end
			
			--������л��ŵĹ֣������һ������Ӧ��DEBUFF
			if jj > 0  then
				local nRand = random( 1, jj ) - 1
				local nSelMonster = nMonster[nRand]
				local nName = GetName(sceneId, nSelMonster)
				
				LuaFnSendSpecificImpactToUnit(sceneId, nWangId, nWangId, nSelMonster, 39, 0 )
				
				-- ͬʱ��������Ҫ����
				if GetName(sceneId, nSelMonster ) == "�ƺ���"    then
					x200014_DispatchMissionTipsToAll(sceneId, "�����̡��ƺ��ӵ�����������Ѩ��")
	
				elseif GetName(sceneId, nSelMonster ) == "���ۿ�"    then
					x200014_DispatchMissionTipsToAll(sceneId, "�����̡����ۿ͵���������ȪѨ��")
					
				elseif GetName(sceneId, nSelMonster ) == "��צ�ŵ���"    then
					x200014_DispatchMissionTipsToAll(sceneId, "�����̡���צ�ŵ��ӵ�����������Ѩ��")
					
				elseif GetName(sceneId, nSelMonster ) == "�����ʿ"    then
					x200014_DispatchMissionTipsToAll(sceneId, "�����̡������ʿ������������Ѩ��")
					
				elseif GetName(sceneId, nSelMonster ) == "ˤ�Ǹ���"    then
					x200014_DispatchMissionTipsToAll(sceneId, "�����̡�ˤ�Ǹ��ֵ������ڰٻ�Ѩ��")
					
				end
				
			else --����ֶ������ˣ��ʹ��������
				-- ��ʧ �ؼ�կ����	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bLi = 0
				local bDuan = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "������ʿ"  then
						-- ɾ�� �ؼ�կ����
						LuaFnDeleteMonster(sceneId, nMonsterId)
						
						-- ���������� "�������������˶������ˣ�"
						local nMonsterNum = GetMonsterCount(sceneId)
						local ii = 0
						local bHaveMonster = 0
						for ii=0, nMonsterNum-1 do
							local nMonsterId = GetMonsterObjID(sceneId,ii)
							
							if GetName(sceneId, nMonsterId)  == "����"  then
								bDuan = 1
								--CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "#{JQ_PaoPao_68}")
							end
							
							if GetName(sceneId, nMonsterId)  == "������"  then
								bLi = 1
							end
							
						end
					end
				end				

				if bLi == 0   then
					-- ��������
					local nNpcId = LuaFnCreateMonster(sceneId, 419, 62, 76, 3, 0, 200017)
					SetCharacterName(sceneId, nNpcId, "������")
				end
				
				-- ������ paopao
				CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "#{JQ_PaoPao_68}")
				CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_69}")
				
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end			
		end
	end

	-- ������� �ĶԻ�����Ʒ�ľ���
	if nStep1 == 3    then  -- �����κ�һ���˽����������󣬿�ʼ��ξ��飬��ֻ֤����һ��
		if nStep2 == 1	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "#{JQ_PaoPao_70}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 2)
		elseif nStep2 == 2	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 3)
			end
		elseif  nStep2 == 3	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_71}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 4)
			
		elseif nStep2 == 4	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 5)
			end
			
		elseif nStep2 == 5	then
			CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "#{JQ_PaoPao_72}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 6)
			
		elseif nStep2 == 6	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 7)
			end
			
		elseif nStep2 == 7	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_73}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 8)
			
		elseif nStep2 == 8	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 9)
			end
			
		elseif nStep2 == 9	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_74}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 10)
			
		elseif nStep2 == 10	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 11)
			end
			
		elseif nStep2 == 11	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_75}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 12)
		elseif nStep2 == 12	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 13)
			end
			
		elseif nStep2 == 13	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_76}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 14)
		elseif nStep2 == 14	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 15)
			end
			
		elseif nStep2 == 15	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_77}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 16)
		elseif nStep2 == 16	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 17)
			end
			
		elseif nStep2 == 17	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "#{JQ_PaoPao_78}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 18)
		elseif nStep2 == 18	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 19)
			end
		
		elseif nStep2 == 19	then  -- ����ʧ��ͬʱ�������ڵ��������һ������
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "�ðɣ���Ȼ�����ﲻ�ûڣ��Ҿͷ�����һ����·����������б������Ľ�ҩ�������ȥ��������ֱ������⡣")
			LuaFnSetCopySceneData_Param(sceneId, 15, 1)
			LuaFnSetCopySceneData_Param(sceneId, 13, 20)
			
		elseif nStep2 == 20	then
			if nNowTime - nPreTime > 5 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 21)
			end
			
		elseif nStep2 == 21	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "�ðɣ���Ȼ�����ﲻ�ûڣ��Ҿͷ�����һ����·����������б������Ľ�ҩ�������ȥ��������ֱ������⡣")
			LuaFnSetCopySceneData_Param(sceneId, 13, 22)
			
		elseif nStep2 == 22	then
			if nNowTime - nPreTime > 5 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 23)
			end
			
		elseif nStep2 == 23	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "�ðɣ���Ȼ�����ﲻ�ûڣ��Ҿͷ�����һ����·����������б������Ľ�ҩ�������ȥ��������ֱ������⡣")
			LuaFnSetCopySceneData_Param(sceneId, 13, 24)

		elseif nStep2 == 24	then
			if nNowTime - nPreTime > 40 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 25)
			end
			
		elseif nStep2 == 25	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "�ðɣ���Ȼ�����ﲻ�ûڣ��Ҿͷ�����һ����·����������б������Ľ�ҩ�������ȥ��������ֱ������⡣")
			LuaFnSetCopySceneData_Param(sceneId, 13, 26)

		elseif nStep2 == 26	then
			if nNowTime - nPreTime > 40 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 27)
			end
			
		elseif nStep2 == 27	then
			CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "�ðɣ���Ȼ�����ﲻ�ûڣ��Ҿͷ�����һ����·����������б������Ľ�ҩ�������ȥ��������ֱ������⡣")
			LuaFnSetCopySceneData_Param(sceneId, 13, 28)

		elseif nStep2 == 28	then
			if nNowTime - nPreTime > 40 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 29)
			end

		elseif nStep2 == 29	then
			-- �� ��ʧ ��������ˣ�ɾ��
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "������"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					--ItemBoxEnterScene(62,74,-1,sceneId,1,1,40001005)
				end
			end
			LuaFnSetCopySceneData_Param(sceneId, 10, 4)
		end
	end
end

function x200014_DispatchMissionTipsToAll(sceneId, szStr)
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, szStr)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,nHumanId)
	end
	
end

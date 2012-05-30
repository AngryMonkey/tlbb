-- 311012
-- ���ˣ���һЩ���ƣ�

-- ���ÿɱһ�������˵��ˣ�ϵͳ�����¼һ�Σ�����ʾ�ڡ������������У���ʾΪ�����������XX��
-- ������ÿ��0��ʱ��λΪ0
-- ����ҵĽ������>=10ʱ��ǿ��������ɱ��ֵ=10������λ�������=0��

--MD_KILL_CAOYUN_PAOSHANG_CT = 150  -- һ��ʱ����ͷ��������˵Ĵ���
--MD_KILL_CAOYUN_PAOSHANG_PRE_TIME = 151 --��һ�δ��ʱ�� 

--�ű���
x311012_g_ScriptId = 311012
x311012_TIME_2000_01_03_ = 946828868

--**********************************
-- ����֮��
--**********************************
function x311012_OnDacoity( sceneId, selfId, Killer )
	-- �ȿ����ǲ��Ǳ���ɱ��
	local nKiller = Killer
	if LuaFnIsObjValid(sceneId, nKiller)==1  and
				--LuaFnIsCanDoScriptLogic(sceneId, nKiller) == 1 and
				GetCharacterType(sceneId, nKiller) == 3  then
		-- ����ǳ���ɱ������Ҫת������
		nKiller = GetPetCreator(sceneId, nKiller)
	end	

	if nKiller == -1  then
		return
	end
	
	if LuaFnIsObjValid(sceneId, nKiller)==1  and
				LuaFnIsCanDoScriptLogic(sceneId, nKiller) == 1 and
				0 == IsInGuildWar(sceneId, selfId, nKiller) and   --�Ƿ��ǹ���ս��
				GetCharacterType(sceneId, nKiller) == 1  then
				
		local nDacoityCount = GetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT)
		local nPreTime = GetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME)
		local nCurTime = LuaFnGetCurrentTime()

		-- ��ʱ���ǲ��ǹ���һ�죬���˾��ȸ���
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x311012_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x311012_TIME_2000_01_03_)/(3600*24)))   then
			nDacoityCount = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nPreTime)
		end
		
		nDacoityCount = nDacoityCount + 1
		
		if nDacoityCount >= 10  then
			-- ǿ��������ҵ�ɱ��Ϊ10
			local nPkValue = LuaFnGetHumanPKValue(sceneId, nKiller)
			LuaFnSetHumanPKValue(sceneId, nKiller, 10)
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT, 0)
			
			-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
			local LogInfo	= format( "[ChangePKValue]:CaoYun sceneId=%d, GUID=%0X, CaoYunCount=%d, PKValueBgn=%d, PKValueEnd=%d",
					sceneId,
					LuaFnObjId2Guid( sceneId, selfId ),
					nDacoityCount,
					nPkValue,
					LuaFnGetHumanPKValue(sceneId, nKiller) )
			WriteCheckLog( sceneId, selfId, LogInfo )
			
			local KillGuid = LuaFnObjId2Guid(sceneId, nKiller)
			LuaFnSendMailToGUID(sceneId, KillGuid, "��������Ĵ������10�Σ��Ѿ�Ӱ�쵽������ҵ��������棬����ʱ���������ɣ������´�������˼�����У�")

		else
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT, nDacoityCount)
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nCurTime)
			BeginEvent(sceneId)
				strText = "��������Ĵ���Ϊ" .. tostring(nDacoityCount) .. "�Σ������������ﵽ10��ʱ������ץ��������������˼���У�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nKiller)
		end
	end
end

--**********************************
-- ���±���ٵ�����
--**********************************
function x311012_UpdataDacoityData( sceneId, selfId )

	local nDacoityCount = GetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_CT)
	local nPreTime = GetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	-- ��ʱ���ǲ��ǹ���һ�죬���˾��ȸ���
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x311012_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x311012_TIME_2000_01_03_)/(3600*24)))   then
		nDacoityCount = 0
		nPreTime = nCurTime
		SetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nPreTime)
		SetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_CT, nDacoityCount)
	end
	
end


--��ս����
--��̨NPC�����ű�

--�ű���
x402301_g_ScriptId	= 402301

--��ս�����ű�
x402301_g_BangzhanScriptId	= 402047

--�������ʱ��
x402301_g_FlagTime	= 10*60

x402301_g_OpenFlagSelfIDIndex = 10						--��ǰ���ڲ�����̨��selfid��32�����������е�����
x402301_g_OpenFlagStartTime = 11							--��ǰ���ڲ�����̨�Ŀ�ʼʱ����32�����������е�����
x402301_g_FlagRemainedTime = 12								--���������Ժ��ʣ��ʱ����32�����������е�����

x402301_g_GuildPoint_GetFlag = 4							--���ֹ�����������GuildWarPoint.txt��ID

--��ս������������Ӧ�����е� enum GUILDWAR_INT_ARRAY
x402301_g_A_FlagNumIndex = 16									--A��ռ���������ڰ�ս�����е�����
x402301_g_B_FlagNumIndex = 17									--B��ռ���������ڰ�ս�����е�����

--���˻���������������Ӧ����enum GUILDWAR_INT_INDEX
x402301_g_Human_FlagIndex = 3									--����ռ������������


--��ӪNPC
x402301_g_A_FlagName = "�׻�ս��"
x402301_g_A_FlagID = 13332
x402301_g_A_FlagPosX = 115.9615
x402301_g_A_FlagPosZ = 130.9660

x402301_g_B_FlagName = "���ս��"
x402301_g_B_FlagID = 13323
x402301_g_B_FlagPosX = 115.9615
x402301_g_B_FlagPosZ = 130.9660

--**********************************
--���⽻��:�����ж�
--**********************************
function x402301_OnActivateConditionCheck( sceneId, selfId, activatorId )
	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--�Ƿ�ʼ�Ƿ�
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_79}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--��̨���Ѿ�����������
	local RemainedTime = LuaFnGetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime )
	if RemainedTime > 0 then
		local minute = floor(RemainedTime / 60)
		local second = mod(RemainedTime, 60)
		
		BeginEvent(sceneId)
			if minute == 0 then
				AddText(sceneId,"#{BHXZ_081103_80}"..second.."#{BHXZ_081103_81}")
			else
				AddText(sceneId,"#{BHXZ_081103_80}"..minute.."��"..second.."#{BHXZ_081103_81}")
			end
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--�޵�״̬�޷�����...������Լ���
	if LuaFnIsUnbreakable(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_124}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- ȡ�ñ���İ���ID����
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, activatorId)
	
	if guildid ~= Aguildid and guildid ~= Bguildid then
		BeginEvent(sceneId)
			AddText(sceneId,"�㲻����ȷ�İ����С�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	local OpenFlagSelfId = LuaFnGetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex )
	local OpenFlagStartTime = LuaFnGetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime )
	local NowTime = LuaFnGetCurrentTime()
	
	if OpenFlagSelfId ~= 0 then --����������������
		if OpenFlagSelfId == activatorId then --�Լ�
			return 1
		else --�����Լ�
			if (NowTime - OpenFlagStartTime) <= 180 then --�Ƿ�ʱ
				BeginEvent(sceneId)
					AddText(sceneId,GetName(sceneId, OpenFlagSelfId).."#{BHXZ_081103_65}")
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,activatorId)
				return 0
			end
		end
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, activatorId )	-- ��ǰ���ڲ�����̨��selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, NowTime )	-- ��ǰ���ڲ�����̨�Ŀ�ʼʱ��
	
	return 1

end

--**********************************
--���⽻��:���ĺͿ۳�����
--**********************************
function x402301_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ɹ���Ч����
--**********************************
function x402301_OnActivateEffectOnce( sceneId, selfId, activatorId )
	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 1
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 1
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- ȡ�ñ���İ���ID����
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, activatorId)
	
	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	--��������NPC������
	if guildid == Aguildid then
		local MstId = LuaFnCreateMonster(sceneId, x402301_g_A_FlagID, x402301_g_A_FlagPosX, x402301_g_A_FlagPosZ, 3, 0, -1 )
		SetCharacterName( sceneId, MstId, x402301_g_A_FlagName )
		LuaFnSetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime, x402301_g_FlagTime )	--���������Ժ��ʣ��ʱ��
		
		local addpoint = GetGuildWarPoint(sceneId, x402301_g_GuildPoint_GetFlag)
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddAGuildPoint", sceneId, activatorId, guildid, addpoint )
		local alreadynum = GetGuildIntNum( sceneId, guildid, x402301_g_A_FlagNumIndex )
		SetGuildIntNum( sceneId, guildid, x402301_g_A_FlagNumIndex, alreadynum+1 )
		--CityChangeAttr( sceneId, activatorId, GUILD_CONTRIB_POINT, 30 ) --���Ӱﹱ
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, activatorId, x402301_g_Human_FlagIndex, 1 )
		
		local guid = LuaFnObjId2Guid(sceneId, activatorId)
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, Aguildid, Bguildid)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_FLAG, guid, log)
		
		local msg = LuaFnGetGuildName(sceneId, activatorId).."#{BHXZ_081103_125}"..GetName(sceneId, activatorId).."�Ѿ�������"..x402301_g_A_FlagName.."��"
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402301_NotifyFailTips(sceneId, mems[i], msg)
				Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
			end
		end
	elseif guildid == Bguildid then
		local MstId = LuaFnCreateMonster(sceneId, x402301_g_B_FlagID, x402301_g_B_FlagPosX, x402301_g_B_FlagPosZ, 3, 0, -1 )
		SetCharacterName( sceneId, MstId, x402301_g_B_FlagName )
		LuaFnSetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime, x402301_g_FlagTime )	--���������Ժ��ʣ��ʱ��
		
		local addpoint = GetGuildWarPoint(sceneId, x402301_g_GuildPoint_GetFlag)
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddBGuildPoint", sceneId, activatorId, guildid, addpoint )
		local alreadynum = GetGuildIntNum( sceneId, guildid, x402301_g_B_FlagNumIndex )
		SetGuildIntNum( sceneId, guildid, x402301_g_B_FlagNumIndex, alreadynum+1 )
		--CityChangeAttr( sceneId, activatorId, GUILD_CONTRIB_POINT, 30 ) --���Ӱﹱ
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, activatorId, x402301_g_Human_FlagIndex, 1 )
		
		local guid = LuaFnObjId2Guid(sceneId, activatorId)
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, Aguildid, Bguildid)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_FLAG, guid, log)
		
		local msg = LuaFnGetGuildName(sceneId, activatorId).."#{BHXZ_081103_125}"..GetName(sceneId, activatorId).."�Ѿ�������"..x402301_g_B_FlagName.."��"
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402301_NotifyFailTips(sceneId, mems[i], msg)
				Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
			end
		end
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, 0 )	-- ��ǰ���ڲ�����̨��selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, 0 )	-- ��ǰ���ڲ�����̨�Ŀ�ʼʱ��
	
	return 1
end

--**********************************
--���⽻��:������ÿʱ������Ч����
--**********************************
function x402301_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ʼʱ�����⴦��
--**********************************
function x402301_OnActivateActionStart( sceneId, selfId, activatorId )
		return 1
end

--**********************************
--���⽻��:��������ʱ�����⴦��
--**********************************
function x402301_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--���⽻��:�����ж�ʱ�����⴦��
--**********************************
function x402301_OnActivateInterrupt( sceneId, selfId, activatorId )
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, 0 )	-- ��ǰ���ڲ�����̨��selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, 0 )	-- ��ǰ���ڲ�����̨�Ŀ�ʼʱ��
	
	return 0
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x402301_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

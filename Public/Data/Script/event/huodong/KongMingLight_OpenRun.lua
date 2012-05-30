--������:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
--�����������������������

--�ű���
x808085_g_ScriptId	= 808085

x808085_g_Impact_Light_Complete 	= 47	-- ����������ʱ����Ч
x808085_g_Impact_GodOfFire_Mission = 5929 -- ��������״̬��Ч

--�������������
x808085_g_MissionId			= 1000
x808085_g_MissItemId = 40004444					-- ������Ʒ
--�����Ƿ����
x808085_g_Mission_IsComplete 			= 0		--��������ĵ�0λ
--������������ÿ���������
x808085_g_RoundIndex 				 			= 7		--��������ĵ�7λ

-- ������Ʒ�������
x808085_g_LuoYangLighten_Cnt 			= 5	--����������������������
x808085_g_SuZhouLighten_Cnt				= 7	--���������ݿ�����������
x808085_g_DaLiLighten_Cnt					= 9		--�����ƴ�������������

--����������������
x808085_g_KongMing_Lighten				= 4		--��������ĵ�4λ

x808085_g_KongMingLighten_Count		=	8		-- ÿ��·����Ҫ��ȼ�Ŀ���������
x808085_g_KongMingLighten_MaxCnt	=	24	-- �������ܻ��Ҫ��ȼ�Ŀ���������

-- ÿ��������ܻ����ʱ��
x808085_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

function x808085_OnRecycle(sceneId,selfId,targetId)

	if selfId <= 0 then
		return 1
	end
	
	-- ֪ͨ������ˢ�½ű�����ˢ�¿�����
	local nTargetX = GetItemBoxWorldPosX( sceneId, targetId )
	local nTargetZ = GetItemBoxWorldPosZ( sceneId, targetId )
	CallScriptFunction( 808083, "RecordKongMingLightInfo", sceneId, selfId, targetId, nTargetX, nTargetZ )	

	return 1;
end

function x808085_OnCreate(sceneId,growPointType,x,y)

end

function x808085_OnOpen(sceneId,selfId,targetId)

	-- ����ȼ����������
	if x808085_CheckActivityEvent( sceneId, selfId ) == 0 then
		return OR_INVALID_TARGET
	end

	return OR_OK;
end

function x808085_OnProcOver(sceneId,selfId,targetId)

	-- ����ȼ����������
	if x808085_CheckActivityEvent( sceneId, selfId ) == 0 then
		return OR_INVALID_TARGET
	end
		
	-- �������߼���Ч
	-- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808085_g_Impact_Light_Complete, 0)
end

--**********************************
--��⵱ǰ�Ƿ��ǻʱ��
--**********************************
function x808085_CheckActivityTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808085_g_ActivityTime) do
	  if curHourTime >= x808085_g_ActivityTime[i].tstart and curHourTime <= x808085_g_ActivityTime[i].tend then
	  	return i
	  end
	end

	return 0

end

--**********************************
--��⼤������
--**********************************
function x808085_CheckActivityEvent( sceneId, selfId )
	
	-- ����Ƿ��й�����������
	if IsHaveMission( sceneId, selfId, x808085_g_MissionId ) <= 0 then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_011}" )		
		return 0
	end

	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808085_g_MissionId)
	
	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x808085_g_Mission_IsComplete) > 0 then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_028}" )
		return 0
	end

	-- ��Ȿ�ֻʱ���Ƿ���Ч
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_017}" )
		return 0
	end
	
	local nTimePoint = x808085_CheckActivityTime()
	if nTimePoint ~= GetMissionParam(sceneId, selfId, misIndex, x808085_g_RoundIndex) then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end

	-- ����Ƿ���������Ʒ
	if HaveItem(sceneId, selfId, x808085_g_MissItemId) <= 0 then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_039}" )
		return 0
	end
	
	-- ������������Ƿ��ѵ���
	local BagPos = GetItemBagPos( sceneId, selfId, x808085_g_MissItemId, 0 )
	local LuoYangCnt = GetBagItemParam(sceneId, selfId, BagPos, x808085_g_LuoYangLighten_Cnt, 1)
	local SuZhouCnt = GetBagItemParam(sceneId, selfId, BagPos, x808085_g_SuZhouLighten_Cnt, 1)
	local DaLiCnt = GetBagItemParam(sceneId, selfId, BagPos, x808085_g_DaLiLighten_Cnt, 1)
	local	nAllCount = GetMissionParam(sceneId, selfId, misIndex, x808085_g_KongMing_Lighten)
	
	if sceneId == 6 and DaLiCnt >= x808085_g_KongMingLighten_Count then					-- ����ɽ
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_060}" )		
		return 0
	elseif sceneId == 5 and DaLiCnt >= x808085_g_KongMingLighten_Count then			-- ����
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_060}" )		
		return 0
	elseif sceneId == 4 and SuZhouCnt >= x808085_g_KongMingLighten_Count then		-- ̫��
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_059}" )		
		return 0
	elseif sceneId == 3 and SuZhouCnt >= x808085_g_KongMingLighten_Count then		-- ��ɽ
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_059}" )		
		return 0
	elseif sceneId == 7 and LuoYangCnt >= x808085_g_KongMingLighten_Count then	-- ����
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_058}" )		
		return 0
	elseif sceneId == 8 and LuoYangCnt >= x808085_g_KongMingLighten_Count then	-- �ػ�
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_058}" )		
		return 0
	end

	if nAllCount >= x808085_g_KongMingLighten_MaxCnt then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_035}" )		
		return 0
	end

	return 1
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x808085_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

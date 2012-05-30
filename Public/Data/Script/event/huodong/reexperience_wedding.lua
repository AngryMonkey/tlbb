--���»���
--Created by zchw

x808122_g_ScriptId = 808122;

--��������¼��ƷID
x808122_g_HighWeddingTicket_id = 30504026

--���»����Ǯ�ķ�ϵ����Ҫ����������Ʒ�����õ�����Ǯ����λͭ
x808122_g_moneyCostNumber = 100000;

--�ϴλ���Ѳ������ʱ��
x808122_g_LastPatrolTime = 0;

x808122_g_busDataIds = {	3,		--0
													3,		--1
													3,		--2
													4,		--3
													4,		--4
													5,		--5
													5,		--6
													5,		--7
													5			--8
												}			--������DataID���߼�Ѳ��

x808122_g_levelMsg =	{	{busId = 3,	msg = "#{CWHL_090104_1}"},
							{busId = 4,	msg = "#{CWHL_090104_2}"},
							{busId = 5,	msg = "#{CWHL_090104_3}"},
						}
x808122_g_busDefaultDataId = 5		--Ĭ�ϻ���ID
x808122_g_busPatrolPathId = 3;		--����·��ID

--ÿ��������´���
x808122_g_StartMaxExpTimePerDay = 9

--��������� 2009-2-10
x808122_g_StartTime = 10080210

--**********************************
--������ں���
--**********************************
function x808122_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	local opt = GetNumText();
	if opt == 1 then
		BeginEvent(sceneId)
			local todayCount = x808122_GetTodayCount( sceneId, selfId );	
			local itemCount, money = x808122_NeedItemCountAndMoney( todayCount );
			
			--��û���ID����ͨ������ID��������»��񼶱���ַ���
			local busId = x808122_g_busDefaultDataId;
			if todayCount < getn(x808122_g_busDataIds) and todayCount >= 0 then
				busId = x808122_g_busDataIds[todayCount + 1];
			end
			local reexpLevel = x808122_g_levelMsg[1].msg
			for levelIndex = 1, getn(x808122_g_levelMsg) do
				if busId == x808122_g_levelMsg[levelIndex].busId then
					reexpLevel = x808122_g_levelMsg[levelIndex].msg
				end
			end

			local msg = "#{CWHL_081007_01_1}"..(todayCount + 1).."#{CWHL_081007_01_2}"..itemCount.."#{CWHL_081007_01_3}"..( money / 10000 ).."#{CWHL_081007_01_4}"..reexpLevel
			
			AddText(sceneId, msg);
			AddNumText(sceneId, x808122_g_ScriptId, "#{CWHL_081007_02}", 6, 11);													--��ȷ��Ҫ���»���
			AddNumText(sceneId, x808122_g_ScriptId, "#{CWHL_081007_03}", 6, 12);													--�������˰�
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif opt == 2 then
		x808122_ReturnDlg(sceneId, selfId, targetId, "#{CWHL_081007_15}")
	elseif opt == 11 then
		local ret, msg = x808122_CheckAccept(sceneId, selfId);
		if ret == 0 then
			x808122_ReturnDlg(sceneId, selfId, targetId, msg);
			return
		end	
		--���»���
		x808122_ReExperienceWedding(sceneId, selfId, targetId);
	elseif opt == 12 then
		x808122_CloseDlg(sceneId, selfId, targetId)
	end
end

--**********************************
--�رնԻ���
--**********************************
function x808122_CloseDlg(sceneId, selfId, targetId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--���»���
--**********************************
function x808122_ReExperienceWedding(sceneId, selfId, targetId)

	local nearNum = GetNearTeamCount(sceneId, selfId);
	local maleId = -1;
	local femaleId = -1;
	
	for nearIndex=0, nearNum-1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end
	
	--�жϻ�������012��Ϊ3�� 45��Ϊ4�� 5678��Ϊ5��
	local busId = x808122_g_busDefaultDataId;
	local todayCount = x808122_GetTodayCount( sceneId, selfId );
	if todayCount < getn(x808122_g_busDataIds) and todayCount >= 0 then
		busId = x808122_g_busDataIds[todayCount + 1];
	end
	
	local busObjID = LuaFnCreateBusByPatrolPathId(sceneId, busId, x808122_g_busPatrolPathId, 0);
	
	if busObjID and busObjID ~= -1 then
		local succeeded = 0;
		local strText;
		local addPassergerRet = LuaFnBusAddPassengerList(sceneId, busObjID, targetId, 1, 2, maleId, femaleId);
		--local addPassergerRet = OR_OK;
		------------
		if addPassergerRet and addPassergerRet == OR_OK then
			--����			
			local itemCount, money = x808122_NeedItemCountAndMoney( todayCount );
			
			local ret1 = CostMoney(sceneId, selfId, money);
			if ret1 == -1 then
				return
			end
			
			if LuaFnDelAvailableItem(sceneId, selfId, x808122_g_HighWeddingTicket_id, itemCount) == 0 then
				return
			end	
			
			local busStartRet = LuaFnBusStart(sceneId, busObjID);
			if busStartRet and busStartRet == 1 then
				x808122_g_LastPatrolTime = LuaFnGetCurrentTime(); 												--����ʱ��
								
				--�ܴ�����1
				local totalCount = GetMissionData( sceneId, selfId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT )
				SetMissionData( sceneId, selfId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, totalCount + 1 )
				
				--���������1
				SetMissionData( sceneId, selfId, MD_TW_REEXPERIENCE_WEDDING_TODAY_COUNT, todayCount + 1)
				
				--���ý������¹����
				local a = GetTime2Day();
				SetMissionData(sceneId, selfId, MD_REEXPERIENCE_WEDDING, GetTime2Day());	
				x808122_CloseDlg(sceneId, selfId, targetId)
				
				--����
				x808122_NotifyAll(sceneId, selfId);
				
				--��־
				local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
				local spouseObjId = LuaFnGuid2ObjId(sceneId, spouseGuid);
				local level1 = GetLevel(sceneId, selfId);
				local level2 = GetLevel(sceneId, spouseObjId);
				AuditReexperienceWedding(sceneId, selfId, spouseObjId, level1, level2);
				succeeded = 1;
				
				x808122_Tips(sceneId, selfId, "#{CWHL_081007_13}");
				x808122_Tips(sceneId, spouseObjId, "#{CWHL_081007_13}");
			else
				strText = "�ڲ�����(start failed)������Ѳ������ʧ�ܣ�����GM��ϵ��"
			end
		end
		------------
		if succeeded ~= 1 then
			LuaFnBusRemoveAllPassenger(sceneId, busObjID);
			LuaFnDeleteBus(sceneId, busObjID);
			if strText then
				x808122_ReturnDlg(sceneId, selfId, targetId, strText);
			end
		end
	end
	
end

--**********************************
--�鳵Ѳ��
--**********************************
function x808122_NotifyAll(sceneId, selfId)
	local captainName = GetName(sceneId, selfId);
	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	local spouseObjId = LuaFnGuid2ObjId(sceneId, spouseGuid);
	local memberName = GetName(sceneId, spouseObjId);
	local str = format("#{_INFOUSR%s}#{YHJZ_081007_44}#{_INFOUSR%s}#{CWHL_081007_14}", captainName, memberName);
	AddGlobalCountNews(sceneId, str);
end

--**********************************
--��������ж�
--**********************************
function x808122_IsCoupleMakeTeam(sceneId,selfId)
	--1.�Ƿ����
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		return 0, "#{CWHL_081007_05}";
	end	
	
	--2.�Ƿ�����
	if GetTeamSize(sceneId,selfId)~=2 then
		return 0, "#{CWHL_081007_05}";
	end	
	--3.�Ƿ��ڸ���
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		return 0, "#{CWHL_081007_04}";
	end	
	--4.�Ƿ��Ƿ���
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		return 0, "#{CWHL_081007_05}";
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			return 0, "#{CWHL_081007_05}";
		end
	end	
	--ok
	return 1, "ok";
end

--**********************************
--�о��¼�
--**********************************
function x808122_OnEnumerate( sceneId, selfId, targetId )
	if GetTime2Day() >= x808122_g_StartTime then
		AddNumText(sceneId, x808122_g_ScriptId, "���»���", 6, 1);
		AddNumText(sceneId, x808122_g_ScriptId, "�������»���", 11, 2);
	end
end

--**********************************
--����������
--**********************************
function x808122_CheckAccept( sceneId, selfId )
	--������ӣ�
	local ret, msg = x808122_IsCoupleMakeTeam(sceneId, selfId);
	if ret == 0 then
		return 0, msg;
	end
	
	--�ӳ���
	if IsCaptain(sceneId, selfId) == 0 then
		return 0, "#{CWHL_081007_06}";
	end
	
	--�������¹�9���ˣ�
	local todayCount = x808122_GetTodayCount( sceneId, selfId );
	if( todayCount >= x808122_g_StartMaxExpTimePerDay ) then
		return 0, "#{CWHL_081007_07}"
	end
	
	
	local itemCount, money = x808122_NeedItemCountAndMoney( todayCount );	
	--���������䣿
	if LuaFnGetAvailableItemCount(sceneId, selfId, x808122_g_HighWeddingTicket_id) < itemCount then
		return 0, "#{CWHL_081007_08}";
	end
	
	--��Ǯ��
	if GetMoney(sceneId, selfId) < money then
		return 0, "#{CWHL_081007_09}";
	end
	
	--�жϾ����������һ�λ���Ѳ�ε�ʱ���Ƿ񳬹�3����
	if LuaFnGetCurrentTime() - x808122_g_LastPatrolTime < 3*60 then
		return 0, "#{CWHL_081007_10}";
	end
	
	--��ˣ�
	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	local spouseObjid = LuaFnGuid2ObjId(sceneId, spouseGuid);
	if LuaFnGetDRideFlag(sceneId, selfId) == 1 
		or LuaFnGetDRideFlag(sceneId, spouseObjid) == 1 
		or LuaFnIsRiding(sceneId, selfId) == 1
		or LuaFnIsRiding(sceneId, spouseObjid) == 1 then
		return 0, "#{CWHL_081007_11}";
	end
	
	--���޳�����
	if LuaFnGetCurrentPetGUID(sceneId, selfId) ~= nil then
		return 0, "#{CWHL_081007_12}";
	end
	
	--��Ӹ��棿
	if IsTeamFollow(sceneId, selfId) == 1 then
		return 0, "#{CWHL_81120_1}";
	end
	
	--��̯��
	if LuaFnIsStalling(sceneId, selfId) == 1 or LuaFnIsStalling(sceneId, spouseObjid) == 1 then
		return 0, "#{CWHL_081208_1}";
	end
	
	--ok
	return 1, "ok";
end

--��ñ����Ѿ����´�������������Σ�û�����¾���0
function x808122_GetTodayCount( sceneId, selfId )
	local todayCount = 0;
	
	local todayDate = GetTime2Day();
	local lastDate = GetMissionData(sceneId, selfId, MD_REEXPERIENCE_WEDDING);
	if todayDate ~= lastDate then
		todayCount = 0
	else
		todayCount = GetMissionData( sceneId, selfId, MD_TW_REEXPERIENCE_WEDDING_TODAY_COUNT )
	end
	
	return todayCount;
end

function x808122_NeedItemCountAndMoney( times )	

	local itemCount = 1
	for i = 1, times do
		itemCount = itemCount * 2;
	end
	
	local money = itemCount * x808122_g_moneyCostNumber;
	
	return itemCount, money;
end

--**********************************
--���ضԻ�
--**********************************
function x808122_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x808122_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--����
--**********************************
function x808122_OnAccept( sceneId, selfId )


end

--**********************************
--����
--**********************************
function x808122_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x808122_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808122_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x808122_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x808122_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x808122_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x808122_OnItemChanged( sceneId, selfId, itemdataId )
end


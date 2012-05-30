--����ս��

--************************************************************************
--MisDescBegin

-- �ű���
x600051_g_ScriptId = 600051

-- ����Ŀ�� NPC
x600051_g_Name = "��Ϫ"
x600051_g_Name2 = "ͯ��"

----��ս������������Ӧ�����е� enum GUILDWAR_INT_ARRAY
--x600051_g_A_LingShiIndex = 2
--x600051_g_B_LingShiIndex = 7
--
--x600051_g_LingShi = {"����ʯ","�׻�ʯ","��ȸʯ","����ʯ","�̹�ʯ"}		--��ʯ����
--x600051_g_LingShiID = {30603001,30603002,30603003,30603004,30603005}	--��ʯID

--��ս�����ű�
--x600051_g_BangzhanScriptId	= 402047

x600051_g_TankBuff = {31577, 31578, 31579, 31580, 31581,	--��ȼ�ʻbuff
											31582, 31583, 31584, 31585, 31586}	--�׻Ƽ�ʻbuff

x600051_g_AttrBuff = {31567, 31568, 31569, 31570, 31571,	--���ս��buff
											31572, 31573, 31574, 31575, 31576}	--�׻�ս��buff

x600051_g_A_TankID = {13339, 13340, 13341, 13342, 13343}--�ɵ��ս��NPC��ID
x600051_g_B_TankID = {13334, 13335, 13336, 13337, 13338}--�ɵ��ս��NPC��ID

x600051_g_ImmuneControlBuff = 10474							--NPC���߿���buff

x600051_g_Msg = {"#{BHXZ_081103_28}",
								"#{BHXZ_081103_29}",
								"#{BHXZ_081103_30}",
								"#{BHXZ_081103_31}",
								"#{BHXZ_081103_32}"}

x600051_g_TankName = {"����ս��","�׻�ս��","��ȸս��","����ս��","�̹�ս��"}

x600051_g_A_FirstTankManSelfID = 13						--A��仯��ս������ҵ�selfid��32�����������е�����
x600051_g_A_SecondTankManSelfID = 14					--A��仯��ս������ҵ�selfid��32�����������е�����
x600051_g_B_FirstTankManSelfID = 15						--B��仯��ս������ҵ�selfid��32�����������е�����
x600051_g_B_SecondTankManSelfID = 16					--B��仯��ս������ҵ�selfid��32�����������е�����
x600051_g_A_FirstTankBuff = 17								--A��仯��ս����BuffID��32�����������е�����
x600051_g_A_SecondTankBuff = 18								--A��仯��ս����BuffID��32�����������е�����
x600051_g_B_FirstTankBuff = 19								--B��仯��ս����BuffID��32�����������е�����
x600051_g_B_SecondTankBuff = 20								--B��仯��ս����BuffID��32�����������е�����
x600051_g_A_FirstTankPos = 21									--A��仯��ս����Pos��32�����������е�����
x600051_g_A_SecondTankPos = 22								--A��仯��ս����Pos��32�����������е�����
x600051_g_B_FirstTankPos = 23									--B��仯��ս����Pos��32�����������е�����
x600051_g_B_SecondTankPos = 24								--B��仯��ս����Pos��32�����������е�����
x600051_g_A_TankColdTime = 25									--A��ս����ȴʱ����32�����������е�����
x600051_g_B_TankColdTime = 26									--B��ս����ȴʱ����32�����������е�����

--MisDescEnd
--************************************************************************

--**********************************
-- ������ں���
--**********************************
function x600051_OnDefaultEvent( sceneId, selfId, targetId )	-- ����������ִ�д˽ű�
----	if GetName( sceneId, targetId ) ~= x600051_g_Name then		-- �жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
----		return
----	end
	
	local numText = GetNumText()
	
	local isAguild = 0
	local base = 0
	local name = GetName(sceneId, targetId)
	if name == x600051_g_Name then
		isAguild = 1
		base = 5
	elseif name == x600051_g_Name2 then
		isAguild = 0
		base = 0
	else
		return
	end
	
	if numText == 1 or numText == 2 or numText == 3 or numText == 4 or numText == 5 then
		--�������ֱ����ʾ2��
		local ExchangeManIndex = x600051_FindTankManIndex( sceneId, isAguild, numText-6+base  )
		if not ExchangeManIndex or ExchangeManIndex == 0 then
			x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_118}" )
			return
		end
		
--		--����ͬ�����͵�ս����
--		if ExchangeManIndex == -1 then
--			x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_119}" )
--			return 0
--		end
		
		BeginEvent(sceneId)
			AddText(sceneId, x600051_g_Msg[numText])
			AddNumText(sceneId, x600051_g_ScriptId, "ȷ��", 8, numText+6 )
			AddNumText(sceneId, x600051_g_ScriptId, "ȡ��", 8, 6 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif numText == 7 or numText == 8 or numText == 9 or numText == 10 or numText == 11 then
		x600051_PowerUptank( sceneId, selfId, targetId, numText-6+base, isAguild, 1 )
	end
end

--**********************************
-- �о��¼�
--**********************************
function x600051_OnEnumerate( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x600051_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
--		return
--	end
	
	AddNumText( sceneId, x600051_g_ScriptId, x600051_g_TankName[1], 4, 1 )
	AddNumText( sceneId, x600051_g_ScriptId, x600051_g_TankName[2], 4, 2 )
	AddNumText( sceneId, x600051_g_ScriptId, x600051_g_TankName[3], 4, 3 )
	AddNumText( sceneId, x600051_g_ScriptId, x600051_g_TankName[4], 4, 4 )
	AddNumText( sceneId, x600051_g_ScriptId, x600051_g_TankName[5], 4, 5 )
end

--**********************************
-- ����ս��
--**********************************
function x600051_PowerUptank( sceneId, selfId, targetId, SelectTankType, isA, isAdd )

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return 0
	end
	
	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return 0
	end
	
	--�Ƿ�ʼ��ս����
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_26}" )
		return 0
	end
	
	local TankManFirst = 0
	local TankManSecond = 0
	if isA == 1 then
		TankManFirst = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_FirstTankManSelfID )
		TankManSecond = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_SecondTankManSelfID )
	else
	 	TankManFirst = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_FirstTankManSelfID )
		TankManSecond = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_SecondTankManSelfID )
	end
	
	if (TankManFirst == selfId and CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) ~= 0)
	or (TankManSecond == selfId and CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) ~= 0) then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_155}" )
		return 0
	end
	
	if LuaFnIsModelOrMount(sceneId, selfId) == 1 then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081208_1}" )
		return 0
	end
	
	local ExchangeManIndex = 0
	if isAdd == 1 then
		ExchangeManIndex = x600051_FindTankManIndex( sceneId, isA, SelectTankType  )
	else
		ExchangeManIndex = x600051_FindEmptyTankManIndex( sceneId, selfId, isA )
	end
	
	local ColdTime = 0
	if isA == 1 then
		ColdTime = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_TankColdTime )
	else
		ColdTime = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_TankColdTime )
	end
	
	--��ս���������￪��ս��Ҫ�ж���ȴʱ���Ƿ���
	if ColdTime > 0 and isAdd == 1 then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "    #{BHXZ_081103_129}"..ColdTime.."#{BHXZ_081103_156}" )
		return 0
	end
	
	--�Ҳ������ʵķ���selfId��λ�þ�������
	if not ExchangeManIndex or ExchangeManIndex == 0 then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_118}" )
		return 0
	end
	
	--����ͬ�����͵�ս����
	if ExchangeManIndex == -1 then
		x600051_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_119}" )
		return 0
	end
	
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x600051_g_TankBuff[SelectTankType], 0 )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x600051_g_AttrBuff[SelectTankType], 0 )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x600051_g_ImmuneControlBuff, 0 )
	LuaFnCancelMoveSpeedBuff(sceneId, selfId)
	LuaFnSetCopySceneData_Param( sceneId, ExchangeManIndex, selfId )--����任ս�������selfId
	LuaFnSetCopySceneData_Param( sceneId, ExchangeManIndex-x600051_g_A_FirstTankManSelfID+x600051_g_A_FirstTankBuff, x600051_g_AttrBuff[SelectTankType] )--����ս��buffid
	local PosX,PosZ = GetWorldPos(sceneId, selfId)
	PosX = floor(PosX)
	PosZ = floor(PosZ)
	LuaFnSetCopySceneData_Param( sceneId, ExchangeManIndex-x600051_g_A_FirstTankManSelfID+x600051_g_A_FirstTankPos, PosX*10000+PosZ )--��������
	if 1 <= SelectTankType and SelectTankType <= 5 then
		Msg2Player(sceneId, selfId, "��������"..x600051_g_TankName[SelectTankType].."��" , MSG2PLAYER_PARA)
	elseif 6 <= SelectTankType and SelectTankType <= 10 then
		Msg2Player(sceneId, selfId, "��������"..x600051_g_TankName[SelectTankType-5].."��" , MSG2PLAYER_PARA)
	end
	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
	return 1
end

--**********************************
-- �ҵ�һ�����Է�ս�����selfId�ĸ����������������ж�
--**********************************
function x600051_FindTankManIndex( sceneId, IsAGuild, bufftype )
	
	local TankManFirst = 0
	local TankManSecond = 0
	local ExchangeManIndex = 0 --���Ҫ�仯��ս����man�ڸ��������е�����
	
	if IsAGuild == 1 then
		TankManFirst = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_FirstTankManSelfID )
		TankManSecond = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_SecondTankManSelfID )
	else
	 	TankManFirst = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_FirstTankManSelfID )
		TankManSecond = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_SecondTankManSelfID )
	end
	
	local AalreadyTankCount = 0 --A�ﶪ���ڳ������ս������
	local BalreadyTankCount = 0 --B�ﶪ���ڳ������ս������
	local Abufftype = -1
	local Bbufftype = -1
	local nNpcNum = GetMonsterCount(sceneId)
	for i=0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,i)
		local DataId = GetMonsterDataID(sceneId, nNpcId)
		for j = 1, getn( x600051_g_A_TankID ) do
			if DataId == x600051_g_A_TankID[j] then
				AalreadyTankCount = AalreadyTankCount + 1
				Abufftype = j
				break
			end
		end
		for j = 1, getn( x600051_g_B_TankID ) do
			if DataId == x600051_g_B_TankID[j] then
				BalreadyTankCount = BalreadyTankCount + 1
				Bbufftype = j
				break
			end
		end
	end
	--PrintStr("Abufftype "..Abufftype.." Bbufftype "..Bbufftype.." bufftype "..bufftype)
	
	--��һ����������
	if TankManFirst == 0 or (TankManFirst ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManFirst) == 0) then
		if IsAGuild == 1 then
			if AalreadyTankCount >= 2 then
				return 0
			end
			
			ExchangeManIndex = x600051_g_A_FirstTankManSelfID
			if TankManSecond ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManSecond) == x600051_g_AttrBuff[bufftype] then --Ҫѡ���ս�����ͺ���һ��
				ExchangeManIndex = -1
			end
			if Abufftype+5 == bufftype then --Ҫѡ���ս�����ͺ�Ұ�ⶪ����ս������һ��
				ExchangeManIndex = -1
			end
			if AalreadyTankCount == 1 and (TankManSecond ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManSecond) ~= 0) then --1��Һ�1����ս��
				ExchangeManIndex = 0
			end
		else
			if BalreadyTankCount >= 2 then
				return 0
			end
			
			ExchangeManIndex = x600051_g_B_FirstTankManSelfID
			if TankManSecond ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManSecond) == x600051_g_AttrBuff[bufftype] then --Ҫѡ���ս�����ͺ���һ��
				ExchangeManIndex = -1
			end
			if Bbufftype == bufftype then --Ҫѡ���ս�����ͺ�Ұ�ⶪ����ս������һ��
				ExchangeManIndex = -1
			end
			if BalreadyTankCount == 1 and (TankManSecond ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManSecond) ~= 0) then --1��Һ�1����ս��
				ExchangeManIndex = 0
			end
		end
	elseif TankManSecond == 0 or (TankManSecond ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManSecond) == 0) then
		if IsAGuild == 1 then
			if AalreadyTankCount >= 2 then
				return 0
			end
			
			ExchangeManIndex = x600051_g_A_SecondTankManSelfID
			if TankManFirst ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManFirst) == x600051_g_AttrBuff[bufftype] then --Ҫѡ���ս�����ͺ���һ��
				ExchangeManIndex = -1
			end
			if Abufftype+5 == bufftype then --Ҫѡ���ս�����ͺ�Ұ�ⶪ����ս������һ��
				ExchangeManIndex = -1
			end
			if AalreadyTankCount == 1 and (TankManFirst ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManFirst) ~= 0) then --1��Һ�1����ս��
				ExchangeManIndex = 0
			end
		else
			if BalreadyTankCount >= 2 then
				return 0
			end
			
			ExchangeManIndex = x600051_g_B_SecondTankManSelfID
			if TankManFirst ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManFirst) == x600051_g_AttrBuff[bufftype] then --Ҫѡ���ս�����ͺ���һ��
				ExchangeManIndex = -1
			end
			if Bbufftype == bufftype then --Ҫѡ���ս�����ͺ�Ұ�ⶪ����ս������һ��
				ExchangeManIndex = -1
			end
			if BalreadyTankCount == 1 and (TankManFirst ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManFirst) ~= 0) then --1��Һ�1����ս��
				ExchangeManIndex = 0
			end
		end
	end
	
	return ExchangeManIndex
end

--**********************************
-- �ҵ�һ�����Է�ս�����selfId�ĸ����������������жϣ�ֻ�ҿ��������
--**********************************
function x600051_FindEmptyTankManIndex( sceneId, selfId, IsAGuild )
	
	local TankManFirst = 0
	local TankManSecond = 0
	local ExchangeManIndex = 0 --���Ҫ�仯��ս����man�ڸ��������е�����
	
	if IsAGuild == 1 then
		TankManFirst = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_FirstTankManSelfID )
		TankManSecond = LuaFnGetCopySceneData_Param( sceneId, x600051_g_A_SecondTankManSelfID )
	else
	 	TankManFirst = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_FirstTankManSelfID )
		TankManSecond = LuaFnGetCopySceneData_Param( sceneId, x600051_g_B_SecondTankManSelfID )
	end
	
	--��һ����������
	if TankManFirst == 0 or (TankManFirst ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManFirst) == 0) then
		if IsAGuild == 1 then
			ExchangeManIndex = x600051_g_A_FirstTankManSelfID
		else
			ExchangeManIndex = x600051_g_B_FirstTankManSelfID
		end
	elseif TankManSecond == 0 or (TankManSecond ~= 0 and CallScriptFunction(402047, "HaveTankBuff", sceneId, TankManSecond) == 0) then
		if IsAGuild == 1 then
			ExchangeManIndex = x600051_g_A_SecondTankManSelfID
		else
			ExchangeManIndex = x600051_g_B_SecondTankManSelfID
		end
	end
	
	return ExchangeManIndex
end

--**********************************
-- ����������
--**********************************
function x600051_CheckAccept( sceneId, selfId, targetId )
	return 1
end

--**********************************
--����
--**********************************
function x600051_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600051_OnContinue( sceneId, selfId, targetId )
--	BeginEvent( sceneId )
--		AddText( sceneId, x600051_g_MissionName )
--		AddText( sceneId, "good ����" )
--	EndEvent( )
--	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600051_g_ScriptId, x600051_g_MissionId )
end

--**********************************
--����
--**********************************
function x600051_OnAbandon( sceneId, selfId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600051_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x600051_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x600051_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x600051_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

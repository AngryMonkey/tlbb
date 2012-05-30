--������[ QUFEI 2007-09-27 13:10 UPDATE BugID 25452 ]
--Ѫԡ�����¼��ű�
--ѭ������

--MisDescBegin
--�ű���
x500503_g_ScriptId	= 500503

--��������NPC����
x500503_g_Position_X=266.2833
x500503_g_Position_Z=140.0340
x500503_g_SceneID=1
x500503_g_AccomplishNPC_Name="ŷұ��"

--�����
x500503_g_MissionId			= 420
--��һ�������ID
x500503_g_MissionIdNext	= 420
--����Ŀ��npc
x500503_g_Name			= "ŷұ��"
--�������
x500503_g_MissionKind			= 55
--����ȼ�
x500503_g_MissionLevel		= 10000
--�Ƿ��Ǿ�Ӣ����
x500503_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x500503_g_IsMissionOkFail	= 0		--�����ĵ�0λ
--������Ҫɱ���Ĺ�
--��֤���Ը��ݵȼ���̬�ı任ɱ������
x500503_g_RandomCustom = {{ id = "��ɱ������", numNeeded = 3, numComplete = 1 }}

--�����ı�����
x500503_g_MissionName			= "Ѫԡ���"
--��������
x500503_g_MissionInfo			= "��������"
--����Ŀ��
x500503_g_MissionTarget		= "#{XYSB_20070928_010}"
--δ��������npc�Ի�
x500503_g_ContinueInfo		= "#{XYSB_20070928_009}"
--�������npc˵�Ļ�
x500503_g_MissionComplete	= "�ҽ�����������Ѿ���������"
--��������
x500503_g_MaxRound	= 0
--���ƽű�
x500503_g_ControlScript		= 001066
--MisDescEnd

--����ű���
x500503_g_MissionScriptID	= 2			--�����ĵ�2λ
--ɱ������
x500503_g_KillMonsterCount	= 3		--�����ĵ�3λ
--��ǰɱ����
x500503_g_KillCountIng	= 4				--�����ĵ�4λ

--��ӵ�е��¼�ID�б�
x500503_g_EventList	= {}

x500503_g_XueXiZhuZaoInfo			= "ѧϰ��������"

--װ������������������
x500503_g_WeaponIdx	= 11

x500503_g_Weapon_ATTACK_P	 = 1			-- ������
x500503_g_Weapon_ATTACK_M  = 2			-- ħ������
x500503_g_Weapon_DEFENCE_P = 3			-- �������
x500503_g_Weapon_DEFENCE_M = 4			-- ħ������
x500503_g_Weapon_MISS = 5						-- ����
x500503_g_Weapon_HIT  = 6						-- ����

x500503_g_ITEM_APT_LEVEL = 16				-- ���Խ���������������ʼ���
x500503_g_KillMONSTER_COUNT = 5000	-- Ҫ��ɱ���Ĺ�������
x500503_g_WeaponLevelMin		= 40		-- ������͵ȼ�
x500503_g_WeaponLevelMax		= 150		-- ������ߵȼ�
x500503_g_AcceptLowLevel		= 40		-- �����������͵ȼ�

x500503_g_Impact_Accept_Mission = 18		-- ��������ʱ����ЧID
x500503_g_Impact_Complete_Mission = 48	-- �������ʱ����ЧID

x500503_g_ItemBonus={{id=30505700,num=1,sqlvl=42},{id=30505701,num=1,sqlvl=52},{id=30505702,num=1,sqlvl=62},{id=30505703,num=1,sqlvl=72},{id=30505704,num=1,sqlvl=82},{id=30505705,num=1,sqlvl=92}}   -- ��ȱ�����
x500503_g_RadioItemBonus={{id=30302400 ,num=1},{id=30302401,num=1},{id=30302402,num=1},{id=30302403,num=1}}																			 -- �����䷽

-- ��������ʹ��Ŷ���
x500503_g_SubMissionTypeEnum = {killMonster=1}

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x500503_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
		
	--�������Ѿ���������
	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then				
		
		local ItemLevel = GetMissionData( sceneId, selfId, MD_MISSHENBING_WEAPONLEVEL )		-- ��ÿ۳��������ĵȼ�
		local Errorlvl = GetMissionData( sceneId, selfId, 0 )															-- ��¼����������ĵȼ�
		
		local LogInfo	= format( "[ShenBing]: x500503_OnDefaultEvent( sceneId=%d, GUID=%0X ), ItemLevel=%d, Errorlvl=%d",
													sceneId,
													LuaFnObjId2Guid( sceneId, selfId ),
													ItemLevel,
													Errorlvl )
		MissionLog(sceneId, LogInfo)
		
		local shenqilvl = 0					
		
		if ItemLevel >= x500503_g_WeaponLevelMin and ItemLevel < x500503_g_WeaponLevelMin + 10 then
			shenqilvl = x500503_g_ItemBonus[1].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 10 and ItemLevel < x500503_g_WeaponLevelMin + 20 then
			shenqilvl = x500503_g_ItemBonus[2].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 20 and ItemLevel < x500503_g_WeaponLevelMin + 30 then
			shenqilvl = x500503_g_ItemBonus[3].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 30 and ItemLevel < x500503_g_WeaponLevelMin + 40 then
			shenqilvl = x500503_g_ItemBonus[4].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 40 and ItemLevel < x500503_g_WeaponLevelMin + 50 then
			shenqilvl = x500503_g_ItemBonus[5].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 50 then
			shenqilvl = x500503_g_ItemBonus[6].sqlvl	
		else
			shenqilvl = x500503_g_ItemBonus[1].sqlvl
				
			local LogInfo	= format( "[ShenBing]error: x500503_OnDefaultEvent( sceneId=%d, GUID=%0X ), shenqilvl=%d",
															sceneId,
															LuaFnObjId2Guid( sceneId, selfId ),
															shenqilvl )
			MissionLog(sceneId, LogInfo)					
		end
				
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x500503_g_MissionName)
			AddText( sceneId, "#{XYSB_20070928_009}" )
			AddText( sceneId, "#r#G�������Ӧ�����ȼ���"..shenqilvl )
		EndEvent( )
		bDone = x500503_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId, selfId, targetId, x500503_g_ScriptId, x500503_g_MissionId, bDone)
		
	--���δ������
	else	
		--���ȼ�
		if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then
			BeginEvent(sceneId)	
			AddText( sceneId, "#{XYSB_20070928_002}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 0
		end
					
		-- ��������������			
		x500503_AcceptMission( sceneId, selfId, targetId )
		
	end

end

--**********************************
--�о��¼�
--**********************************
function x500503_OnEnumerate( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		return 0
	end

	AddNumText( sceneId, x500503_g_ScriptId, x500503_g_XueXiZhuZaoInfo, 6, 115 )		

end

--**********************************
--������������Ҳ�����������
--**********************************
function x500503_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then
		BeginEvent(sceneId)	
		AddText( sceneId, "#{XYSB_20070928_009}" )		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	
	--���������������Ϣ
	BeginEvent(sceneId)
		AddText(sceneId, x500503_g_MissionName)
		AddText(sceneId, "#{XYSB_20070928_003}")
	EndEvent( )
	bDone = 2
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x500503_g_ScriptId, x500503_g_MissionId, bDone)
	
	return 1
end

function x500503_GetKillCountByLevel(iItemLevel)
	local iCount = 5000
	if (iItemLevel>=40 and iItemLevel<50) then
		iCount =3000
	elseif (iItemLevel>=50 and iItemLevel<60) then
		iCount = 4000
	end
	return iCount
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x500503_OnAccept( sceneId, selfId, targetId, scriptId,iItemLevel )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
 		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	
	--������������б�
	local bAdd = AddMission( sceneId, selfId, x500503_g_MissionId, x500503_g_ScriptId, 1, 0, 0 )
	if bAdd < 1 then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )			
		
		local LogInfo	= format( "[ShenBing]error: x500503_OnAccept( sceneId=%d, GUID=%0X ), bAdd=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														bAdd )
		MissionLog(sceneId, LogInfo)
		return 0
	end

	--�õ���������к�
	local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500503_g_MissionId )
	
	--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )
	--�������кŰ���������ĵ�1λ��Ϊ����ű���
	SetMissionByIndex( sceneId, selfId, misIndex, 2, scriptId )
	local iKillCount =x500503_GetKillCountByLevel(iItemLevel)
	SetMissionByIndex(sceneId, selfId, misIndex, 3, iKillCount)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, 0)
	
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x500503_g_Impact_Accept_Mission, 0 )
	
	local LogInfo	= format( "[ShenBing]Succeed: x500503_OnAccept( sceneId=%d, GUID=%0X ), misIndex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														misIndex )
	MissionLog(sceneId, LogInfo)
		
	return 1

end

--**********************************
--�������������������
--**********************************
function x500503_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then
	  DelMission( sceneId, selfId, x500503_g_MissionId )
	else		
		return 0
	end
  
end

--**********************************
--����
--**********************************
function x500503_OnContinue( sceneId, selfId, targetId )

	----PrintStr("OnContinue...")	
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then		
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	-- ��������Ƿ����
	if x500503_CheckSubmit( sceneId, selfId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500503_g_MissionName)
		AddText( sceneId, x500503_g_MissionComplete )
								
		for i, item in x500503_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )					-- ������ѡһ��Ʒ
		end
				
		-- AddMoneyBonus( sceneId, x500503_g_MoneyBonus )
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500503_g_ScriptId,x500503_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x500503_CheckSubmit( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) <= 0 then				
		return 0
	end

	--�ڴ��ж��ύ�����Ƿ���ϣ���������Ӧ����
	--�õ���������к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x500503_g_MissionId)	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--�쿴�����Ƿ����
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x500503_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	-- PrintStr("selectRadioId ="..selectRadioId)
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then		
		x500503_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end
		
  -- ��������Ƿ����
	if x500503_CheckSubmit( sceneId, selfId ) ~= 1 then
		x500503_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )			
		
		local LogInfo	= format( "[ShenBing]error: x500503_OnSubmit( sceneId=%d, GUID=%0X ), x500503_CheckSubmit=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														x500503_CheckSubmit( sceneId, selfId ) )
		MissionLog(sceneId, LogInfo)
		return 0
	end
	
	local	Level			= GetLevel( sceneId, selfId )

	local ItemLevel = GetMissionData( sceneId, selfId, MD_MISSHENBING_WEAPONLEVEL )		-- ��ÿ۳��������ĵȼ�
	local Errorlvl = GetMissionData( sceneId, selfId, 0 )																-- ��¼����������ĵȼ�
	local shenjieID = 0
	
	local LogInfo	= format( "[ShenBing]: x500503_OnSubmit( sceneId=%d, GUID=%0X ), ItemLevel=%d, Errorlvl=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemLevel,
														Errorlvl )
	MissionLog(sceneId, LogInfo)
			
	if ItemLevel >= x500503_g_WeaponLevelMin and ItemLevel < x500503_g_WeaponLevelMin + 10 then
			shenjieID = x500503_g_ItemBonus[1].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 10 and ItemLevel < x500503_g_WeaponLevelMin + 20 then
			shenjieID = x500503_g_ItemBonus[2].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 20 and ItemLevel < x500503_g_WeaponLevelMin + 30 then
			shenjieID = x500503_g_ItemBonus[3].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 30 and ItemLevel < x500503_g_WeaponLevelMin + 40 then
			shenjieID = x500503_g_ItemBonus[4].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 40 and ItemLevel < x500503_g_WeaponLevelMin + 50 then
			shenjieID = x500503_g_ItemBonus[5].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 50 then
			shenjieID = x500503_g_ItemBonus[6].id	
	else
			shenjieID = x500503_g_ItemBonus[1].id
			
			local LogInfo	= format( "[ShenBing]error: x500503_OnSubmit( sceneId=%d, GUID=%0X ), ItemLevel=%d, shenjieID=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemLevel,
														shenjieID )
			MissionLog(sceneId, LogInfo)			
	end
	-- PrintStr("ItemLevel ="..ItemLevel)
	-- PrintStr("shenjieID ="..shenjieID)
	
	--���������	

	if selectRadioId == x500503_g_RadioItemBonus[1].id or selectRadioId == x500503_g_RadioItemBonus[2].id
			or selectRadioId == x500503_g_RadioItemBonus[3].id or selectRadioId == x500503_g_RadioItemBonus[4].id then
			
			BeginAddItem( sceneId )
			AddItem( sceneId, shenjieID, 2 )
			ret1 = EndAddItem( sceneId, selfId )
									
--			BeginAddItem( sceneId )
--			AddItem( sceneId, selectRadioId, 1 )
--			ret2 = EndAddItem( sceneId, selfId )
									
			if ret1 > 0 then
				TryRecieveItem( sceneId, selfId, shenjieID, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����				
				TryRecieveItem( sceneId, selfId, selectRadioId, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
				
			else
					BeginEvent(sceneId)
					strText = "��Ʒ���������û���㹻�Ŀռ䣬�������������ȡ��"
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end
			
			if DelMission( sceneId, selfId, x500503_g_MissionId ) <= 0 then					
					MissionLog(sceneId, "[ShenBing]error: x500503_OnSubmit..DelMission")
					return 0
			end
			--����к���������ɾ��
			if IsHaveMission( sceneId, selfId, x500503_g_MissionIdNext ) > 0 then
					DelMission( sceneId, selfId, x500503_g_MissionIdNext )
			end
			
			--AddExp( sceneId, selfId, Exp )
			--AddMoney( sceneId, selfId, Money )
			--��ʾ�Ի���
			BeginEvent( sceneId )	
				AddText( sceneId, "  ���ò��������� ��ȱ����ڣ����Ǹ���Ľ�����" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )			
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x500503_g_Impact_Complete_Mission, 0 )
	else
			BeginEvent(sceneId)
			strText = "������ȡʧ����������ȡ��"
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
	end
end

--**********************************
--ɱ����������
--**********************************
function x500503_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
		
	-- local nMonsterId = GetMissionParam(sceneId, selfId, misIndex, x500503_g_StrForePart+3)
	-- local _, strMonsterName = GetNpcInfoByNpcId(sceneId,nMonsterId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	local num = GetMonsterOwnerCount(sceneId,objId)
	for i=0,num-1  do
		-- ȡ��ӵ�з���Ȩ���˵�objId
		local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
		-- PrintStr("humanObjId=" .. humanObjId)
		-- ��������ǲ������������
		if IsHaveMission(sceneId, humanObjId, x500503_g_MissionId) > 0 then
			-- ���ж��ǲ����Ѿ���������ɱ�־
			local misIndex = GetMissionIndexByID(sceneId,humanObjId,x500503_g_MissionId)
			if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
				local	PlayerLevel = GetLevel( sceneId, humanObjId )
				local MonsterLevel = GetLevel(sceneId, objId)
	
				if ((PlayerLevel - MonsterLevel >= 0) and (PlayerLevel - MonsterLevel < 10))
					  or ((MonsterLevel - PlayerLevel >= 0) and (MonsterLevel - PlayerLevel < 10)) then
					--SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 0, 30)														
					local demandKillCount = GetMissionParam(sceneId, humanObjId, misIndex, 3)
		
					--PrintStr("demandKillCount=" .. demandKillCount)
					local killedCount =	GetMissionParam(sceneId, humanObjId, misIndex, 1)
					killedCount = killedCount + 1
					--����˫���������ĵȼ���������Ҫɱ���ٸ��֣�
					--������ǰ40-60��������Ѿ��˽��������ɱ5000�Ĺ֣���Ҫ���� -zz
					local ItemLevel = GetMissionData( sceneId, humanObjId, MD_MISSHENBING_WEAPONLEVEL )
					local iLevelCount =x500503_GetKillCountByLevel(ItemLevel)	 
					if (iLevelCount<demandKillCount) then
						demandKillCount = iLevelCount
						SetMissionByIndex(sceneId, humanObjId, misIndex, 3, demandKillCount)
					end	
					if (iLevelCount<killedCount) then
						killedCount = iLevelCount
					end
					SetMissionByIndex(sceneId, humanObjId, misIndex, 1, killedCount)
								
					BeginEvent(sceneId)
						local str = format("��ɱ��%s%d/%d", "����", killedCount, demandKillCount )						
						AddText(sceneId, str)
					EndEvent(sceneId)
					DispatchMissionTips(sceneId, humanObjId)
					if killedCount >= demandKillCount then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
					end
				end --if
			end --if
		end --if
	end --for

end

--**********************************
--���������¼�
--**********************************
function x500503_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x500503_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x500503_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x500503_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--�����͵�����ʾ�Ľ���
--**********************************
function x500503_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x500503_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x500503_GetEventMissionId( sceneId, selfId )	
	MissionLog(sceneId, "[ShenBing]x500503_GetEventMissionId..x500503_g_MissionId="..x500503_g_MissionId)
	return x500503_g_MissionId
end

function x500503_AcceptMission( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )			
		MissionLog(sceneId, "[ShenBing]error: x500503_AcceptMission..LuaFnGetName="..LuaFnGetName( sceneId, targetId ))
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x500503_g_MissionName)
		AddText( sceneId, x500503_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XYSB_20070928_007}"..PlayerName.."#{XYSB_20070928_008}")		
		AddText(sceneId,"#{M_SHOUHUO}")
		-- AddItemDemand( sceneId, x500503_g_ItemBonus[1].id, x500503_g_ItemBonus[1].num )  -- ����һ����Ʒ
		
		AddText(sceneId,"#{XYSB_20070930_012}")
						
		for i, item in x500503_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )					-- ������ѡһ��Ʒ
		end
				
		-- AddMoneyBonus( sceneId, x500503_g_MoneyBonus )
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500503_g_ScriptId,x500503_g_MissionId)	

end

-- �����ύ�¼�
function x500503_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )
  
	--PrintStr("OnMissionCheck...")
	-- print(sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex)
	
	local LogInfo	= format( "[ShenBing]: x500503_OnMissionCheck( sceneId=%d, GUID=%0X ), index1=%d, index2=%d, index3=%d, petindex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														index1,
														index2,
														index3,
														petindex)	
	MissionLog(sceneId, LogInfo)	
	
	-- Ѫ����������ύ����
	-- �ύ�����������ǲ���Ҫ���ܵ�����
	if scriptId ~= x500503_g_ScriptId then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )			
		MissionLog(sceneId, "[ShenBing]error: x500503_OnMissionCheck..scriptId="..scriptId)
		return 0
	end
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, npcid ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )			
		MissionLog(sceneId, "[ShenBing]error: x500503_OnMissionCheck..LuaFnGetName="..LuaFnGetName( sceneId, npcid ))
		return 0
	end
	
	--�������Ѿ���������
	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then	
		BeginEvent(sceneId)	
		AddText( sceneId, "#{XYSB_20070928_009}" )		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,npcid)
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then
		BeginEvent(sceneId)	
		AddText( sceneId, "#{XYSB_20070928_002}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,npcid)
		return 0
	end
	
	local index = 0
	local ItemLevel = 0	
	local ItemID = 0	
	local PlayerLevel = GetLevel( sceneId, selfId )
	
	for i=1, 3 do
		if i == 1 then
			index = index1
		elseif i == 2 then
			index = index2
		elseif i == 3 then
			index = index3
		else
			index = index1
		end
		
		if index < 100 then
			ItemLevel = GetBagItemLevel(sceneId, selfId, index)
			ItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, index)
			-- PrintStr("ItemID ="..ItemID)
			
			-- ��������Ƿ�����������Ҫ��  level >= x500503_g_WeaponLevelMin �ڹ��������⹦���� >= x500503_g_ITEM_APT_LEVEL �����ĵȼ����ܳ�����ҵĵȼ� �Ѽ���������
			local attack_p = GetItemApt(sceneId, selfId, index, x500503_g_Weapon_ATTACK_P)
			local attack_m = GetItemApt(sceneId, selfId, index, x500503_g_Weapon_ATTACK_M)
			local isJudge = LuaFnIsJudgeApt(sceneId, selfId, index)				
			local EquipType = GetItemEquipPoint( ItemID )
			
			local LogInfo	= format( "[ShenBing]: x500503_OnMissionCheck( sceneId=%d, GUID=%0X ), ItemID=%d, ItemLevel=%d, attack_p=%d, attack_m=%d, isJudge=%d, isLock=%d, EquipType=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemID,
														ItemLevel,
														attack_p,
														attack_m,
														isJudge,
														LuaFnIsItemAvailable( sceneId, selfId, index ),
														EquipType )	
			MissionLog(sceneId, LogInfo)	
			
			-- ��Ʒ�Ƿ�Ϊ����
			if EquipType ~= 0 then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_014}" )								
				return 0
			end
			
			-- ��Ʒ�Ƿ���40������
			if ItemLevel < x500503_g_WeaponLevelMin then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_014}" )								
				return 0
			end
			
			-- ����Ƿ��ܹ�ʹ��
			if ItemLevel > PlayerLevel then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_015}" )								
				return 0
			end
	
			-- ��Ʒ�Ƿ����
			if isJudge ~= 1 then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_017}" )								
				return 0
			end
			
			-- ��Ʒ�Ƿ�˫����
			if attack_p < x500503_g_ITEM_APT_LEVEL or attack_m < x500503_g_ITEM_APT_LEVEL then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_016}" )								
				return 0
			end
	
			-- ��Ʒ�Ƿ�����
			if LuaFnIsItemAvailable( sceneId, selfId, index ) == 0 then
					x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_018}" )								
					return 0
			end
				
			-- PrintStr("ItemLevel ="..ItemLevel)
				
			local accres = x500503_OnAccept( sceneId, selfId, npcid, scriptId ,ItemLevel)
			
			if accres > 0 then
				local ret = EraseItem( sceneId, selfId, index )
				if	ret > 0 then
					SetMissionData(sceneId, selfId, MD_MISSHENBING_WEAPONLEVEL, ItemLevel )		--��¼�۳��������ĵȼ�
					
					local LogInfo	= format( "[ShenBing]: x500503_OnMissionCheck( sceneId=%d, GUID=%0X ), ItemID=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemID)	
					MissionLog(sceneId, LogInfo)	
					return 1
				else
					BeginEvent(sceneId)			
						local strText = format("ɾ������ʧ��")
						AddText(sceneId,strText)									
					EndEvent(sceneId)
			
					DispatchEventList(sceneId,selfId,-1)
				end					
			end
			
			x500503_NotifyTip( sceneId, selfId, "��������ʧ��" )			
			MissionLog(sceneId, "[ShenBing]error: x500503_OnMissionCheck..index..accres="..accres)
			return 0					
						
		end
	end
				
	x500503_NotifyTip( sceneId, selfId, "��ȡ����ʧ�ܣ��������ϸ�" )
			
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x500503_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s��Ʒ��'EquipBase.txt'û���ҵ�!!", itemName)		
	end
	return itemId, itemName, itemDesc
end	

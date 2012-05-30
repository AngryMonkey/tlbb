--̽������(������һ���Ͷ�ʹ�����LUA���޸���ע��ͨ����)

--����η����б�_MissType	1.ɱ������	2.��������	3.̽������	4.Ѱ������	5.��������
x006669_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

--**********************************
--������ں���
--**********************************
function x006669_DisplayBonus(sceneId, missionIndex)
	local itemCt
	local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0}}
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then 
			AddRadioItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct = TGetHideItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddRandItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	local awardMoney = TGetAwardMoney(missionIndex)
	AddMoneyBonus( sceneId, awardMoney)
end
			
--**********************************
--������ں���   ����������ִ�д˽ű�
--**********************************
function x006669_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--����������ִ�д˽ű�
	
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	local missionTarget
	local missionInfo
	local missionContinue
	local missionComplete 
	missionTarget, missionInfo, missionContinue, missionComplete = TGetMissionDesc(missionIndex)

	--���������������Ϣ
	if IsHaveMission(sceneId,selfId,missionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, missionName)
			AddText(sceneId, missionContinue)
		EndEvent( )
		local bDone = x006669_CheckSubmit( sceneId, selfId, missionIndex )
		--PrintStr("bDone=" .. tostring(bDone))
		DispatchMissionDemandInfo(sceneId,selfId,targetId,missionIndex,missionId,bDone)
	elseif x006669_CheckAccept(sceneId,selfId,missionIndex) > 0 then
		--PrintStr("elseif x006669_CheckAccept(sceneId,selfId) > 0 then...")
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, missionName)
			AddText(sceneId,missionInfo)
			x006669_DisplayBonus(sceneId, missionIndex)
			
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,missionIndex,missionId)
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x006669_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	--PrintStr("OnEnumerate..." .. sceneId .. selfId .. targetId .. missionIndex)
	--��������ɹ��������
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	-- �ж���ҵ������ǲ��ǹ���������������������ʾ�������Ͳ���ʾ
	local nLevel
	local nMis1
	local nMis2
	local nMis3 
	nLevel, nMis1, nMis2, nMis3 = TGetCheckInfo(missionIndex)
	if nLevel > GetLevel(sceneId, selfId)  then
		return
	end
	
	if nMis1 >=0   then
		if IsMissionHaveDone(sceneId, selfId, nMis1) <= 0   then
			return
		end
	end
	
	if nMis2 >=0   then
		if IsMissionHaveDone(sceneId, selfId, nMis2) <= 0   then
			return
		end
	end
	
	if nMis3 >=0   then
		if IsMissionHaveDone(sceneId, selfId, nMis3) <= 0   then
			return
		end
	end
	
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0 then
   	return
   	
	--���������������
	elseif IsHaveMission(sceneId, selfId, missionId) > 0 then
		local completeNpcScene, completeNpcName = TGetCompleteNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == completeNpcName then
			--TEndEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,2,-1);
			TEndEvent()	
			TDispatchEventList(sceneId, selfId, targetId)
		end
	--���������������
  elseif x006669_CheckAccept(sceneId, selfId, missionIndex) > 0 then
  	local acceptNpcScene, acceptNpcName = TGetAcceptNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == acceptNpcName then
			--TEndEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,1,-1);
			TEndEvent()
			TDispatchEventList(sceneId, selfId, targetId)	
		end
  end
  
end

--**********************************
--����������
--**********************************
function x006669_CheckAccept( sceneId, selfId, missionIndex )
	local nLevel = LuaFnGetLevel(sceneId, selfId)
	local limitLevel
	local PreMisId1
	local PreMisId2
	local PreMisId3 
	
	limitLevel,PreMisId1,PreMisId2,PreMisId3 = TGetCheckInfo(missionIndex)

	if nLevel < limitLevel then
			TAddText(sceneId, "��Ľ�������̫�ͣ����²���ʤ�Σ���".. tostring(limitLevel) .."��֮���������Ұ�")
		TEndEvent()
		TDispatchEventList(sceneId, selfId)
		return 0
	else
		local a = {}
		local index = 1
		if PreMisId1 > 0 then
			a[index] = PreMisId1
			index = index + 1
		end
		if PreMisId2 > 0 then
			a[index] = PreMisId2
			index = index + 1
		end
		if PreMisId3 > 0 then
			a[index] = PreMisId3
			index = index + 1
		end
		
		for i, v in a do
			if IsMissionHaveDone(sceneId, selfId, v) <= 0 then
				return 0
			end	
		end
		return 1
	end
end

--**********************************
--����
--**********************************
function x006669_OnAccept( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0   then
		return
	end

	-- �ٴμ������ǲ��ǿ��Խ��������
	if x006669_CheckAccept( sceneId, selfId, missionIndex ) <= 0  then
		return		
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, missionId, missionIndex, 0, 1, 0 )
	
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y��������" .. tostring(missionName), MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y�������� " .. tostring(missionName)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--����
--**********************************
function x006669_OnAbandon( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
  DelMission( sceneId, selfId, missionId )
end

--**********************************
--����
--**********************************
function x006669_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local missionTarget
	local missionInfo
	local missionContinue
	local missionComplete 
	missionTarget,missionInfo,missionContinue,missionComplete = TGetMissionDesc(missionIndex)
	
	BeginEvent(sceneId)
		AddText(sceneId,missionName)
		AddText(sceneId,missionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,missionTarget)
		x006669_DisplayBonus(sceneId, missionIndex)  
	EndEvent( )
	DispatchMissionContinueInfo(sceneId, selfId, targetId, missionIndex, missionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x006669_CheckSubmit( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	
	-- �������Ƿ��Ѿ�̽�������е�����
	local enterAreaCount = 0;
	local a = {{scene=0,ea=0},{scene=0,ea=0},{scene=0,ea=0}}
	
	enterAreaCount, a[1].scene, a[1].ea, a[2].scene, a[2].ea, a[3].scene, a[3].ea = TGetEnterAreaInfo(missionIndex)
	
	for i=1, enterAreaCount   do
		local misIndex=GetMissionIndexByID(sceneId,selfId,missionId)
		local num0 = GetMissionParam(sceneId,selfId,misIndex,i-1)
		if num0 < 1  then 
			return 0
		end
	end
	return 1
	
end	

--**********************************
--�ύ
--**********************************
function x006669_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	if x006669_CheckSubmit(sceneId, selfId, missionIndex) > 0 then
		local missionId = TGetMissionIdByIndex(missionIndex)
		local missionName = TGetMissionName(missionIndex)
		
		-- ��ȫ�Լ��
		-- 1���������ǲ������������
		if IsHaveMission(sceneId,selfId,missionId) <= 0 then
			return
		end
		-- 2���������
		
		local nAddItemNum = 0;
		BeginAddItem(sceneId)
			local itemCt
			local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},} 
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 and a[i].id == selectRadioId then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetHideItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
		local ret = EndAddItem(sceneId,selfId)
		--///////////////////////////////////////////////////////////////////////////////////
		if ret > 0 then
			--ɾ���������ύ����Ʒ
			--local a = {{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0}}
			--local killDataCount = 0
			--killDataCount,a[1].name,a[1].item,a[1].pro,a[1].ct, a[2].name,a[2].item,a[2].pro,a[2].ct,a[3].name,a[3].item,a[3].pro,a[3].ct,a[4].name,a[4].item,a[4].pro,a[4].ct,a[5].name,a[5].item,a[5].pro,a[5].ct = TGetLootItemInfo(missionIndex)
			--for i=1, killDataCount  do
			--	--PrintStr("id =" .. a[i].item .. "   num =" .. a[i].ct)
			--	if LuaFnGetAvailableItemCount(sceneId, selfId, a[i].item) >= a[i].ct then
			--		DelItem( sceneId, selfId, a[i].item, a[i].ct )
			--	else
			--		BeginEvent(sceneId)
			--			AddText(sceneId, "������Ʒ���ڲ����û��ѱ�������")
			--		EndEvent( )
			--		DispatchMissionTips(sceneId,selfId)
			--		return		
			--	end
			--end

			if 	nAddItemNum > 0   then
				AddItemListToHuman(sceneId,selfId)
			end

			--���������
			local awardMoney = TGetAwardMoney(missionIndex)
			AddMoney(sceneId,selfId,awardMoney )
			local awardExp = TGetAwardExp(missionIndex)
			LuaFnAddExp( sceneId, selfId, awardExp)
			
			DelMission( sceneId,selfId, missionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId, missionId )

			local strText = "#Y" .. missionName .. "��������ɡ�"
			BeginEvent( sceneId )
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

			-- ��ú��������Index
			local NextMissIndex = GetNextMissionIndex( missionIndex )

			for i, MissType in x006669_g_MissionTypeList do
				if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
					if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
						local missionId = TGetMissionIdByIndex( NextMissIndex )
						local szNpcName = GetName( sceneId, targetId )
						local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

						if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
							if MissType.ScriptId == 006669 then
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									x006669_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
								end
							else
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									CallScriptFunction( MissType.ScriptId, "OnDefaultEvent", sceneId, selfId, targetId, NextMissIndex )
								end
							end
						end
						
						break;
					end
				end
			end

		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				AddText(sceneId, "��������,�޷��������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end		
	end
end

--**********************************
--ɱ����������
--**********************************
function x006669_OnKillObject( sceneId, selfId, objdataId ,objId, missionIndex)--������˼�������š����objId�������λ�úš�����objId
	
end

--**********************************
--���߸ı�
--**********************************
function x006669_OnItemChanged( sceneId, selfId,targetId,  itemdataId )
	
end

--**********************************
--���������¼�
--**********************************
function x006669_OnEnterArea( sceneId, selfId, areaId, missionIndex)
	
	local missionId 	= TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	local enterAreaCount = 0;
	local a = {{scene=0,ea=0},{scene=0,ea=0},{scene=0,ea=0}}
	
	enterAreaCount, a[1].scene, a[1].ea, a[2].scene, a[2].ea, a[3].scene, a[3].ea = TGetEnterAreaInfo(missionIndex)

	for i=1, enterAreaCount do
		if sceneId == a[i].scene and areaId == a[i].ea  then
			
			local bHave = 0
			local szDesc = ""
			local szTip = ""
			bHave, szDesc, szTip = TGetEnterAreaDesc(missionIndex)

			if bHave > 0  then
				BeginEvent(sceneId)
					AddText(sceneId,szDesc)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,selfId)
			end
	
			--������
			local misIndex=GetMissionIndexByID(sceneId,selfId,missionId)
			local num0 = GetMissionParam(sceneId,selfId,misIndex,0)
			if num0 < 1 then				--���������������ɵ�����
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--���������һλ����1
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--���������һλ����1
				-- ֻ���������񣬲�������ɵ�ʱ��ᵯ��
				BeginEvent(sceneId)										--��ʾ��ʾ��Ϣ
					AddText(sceneId, szTip);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	end
end

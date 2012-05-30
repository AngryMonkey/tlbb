--������

--�ű���
x002016_g_scriptId = 002016

--��ӵ�е��¼�ID�б�
x002016_g_eventList={ 210225, 210226, 210227, 210228, 210229, 200099,200100}		--201801,201901,201802

x002016_g_RSMissionId = 101
x002016_g_ActivateMissionId = 8			-- ��������
x002016_g_SongXinScriptId = 006668		-- ����
x002016_g_ShaGuaiScriptId = 006666		-- ɱ��
x002016_g_XunWuScriptId = 006667		-- Ѱ��

x002016_g_RewardsId = 10155001	-- �ɻ�ʯ--[tx43452_]
x002016_g_BoundRewardsId = 10155004		-- �ɻ�ʯ--[tx43452_]
x002016_g_cdLimid = 1000  -- �����ֶκ�--[tx43452]
x002016_g_RoundStorytelling = {
		[0] = { misIndex = { 1039400 }, script = x002016_g_XunWuScriptId },
		[1] = { misIndex = { 1039401 }, script = x002016_g_XunWuScriptId },
		[2] = { misIndex = { 1039402 }, script = x002016_g_XunWuScriptId },
		[3] = { misIndex = { 1039403 }, script = x002016_g_XunWuScriptId },
		[4] = { misIndex = { 1039404 }, script = x002016_g_XunWuScriptId }}
			
x002016_g_SongXinMissionList = {
		[0] = { misIndex = { 1018100,1018108,1018116,1018124,1018132,1018140,1018148 }, script = x002016_g_SongXinScriptId },
		[1] = { misIndex = { 1018101,1018109,1018117,1018125,1018133,1018141,1018149 }, script = x002016_g_SongXinScriptId },
		[2] = { misIndex = { 1018102,1018110,1018118,1018126,1018134,1018142,1018150 }, script = x002016_g_SongXinScriptId },
		[3] = { misIndex = { 1018103,1018111,1018119,1018127,1018135,1018143,1018151 }, script = x002016_g_SongXinScriptId },
		[4] = { misIndex = { 1018104,1018112,1018120,1018128,1018136,1018144,1018152 }, script = x002016_g_SongXinScriptId },
		[5] = { misIndex = { 1018105,1018113,1018121,1018129,1018137,1018145,1018153 }, script = x002016_g_SongXinScriptId },
		[6] = { misIndex = { 1018106,1018114,1018122,1018130,1018138,1018146,1018154 }, script = x002016_g_SongXinScriptId },
		[7] = { misIndex = { 1018107,1018115,1018123,1018131,1018139,1018147,1018155 }, script = x002016_g_SongXinScriptId }}
			
x002016_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1039405 }, script = x002016_g_XunWuScriptId },
		[1] = { misIndex = { 1039406 }, script = x002016_g_XunWuScriptId },
		[2] = { misIndex = { 1039407 }, script = x002016_g_XunWuScriptId },
		[3] = { misIndex = { 1039408 }, script = x002016_g_XunWuScriptId },
		[4] = { misIndex = { 1039409 }, script = x002016_g_XunWuScriptId },
		[5] = { misIndex = { 1039410 }, script = x002016_g_XunWuScriptId },
		[6] = { misIndex = { 1039411 }, script = x002016_g_XunWuScriptId },
		[7] = { misIndex = { 1039412 }, script = x002016_g_XunWuScriptId }}


--**********************************
--�¼��б�
--**********************************
function x002016_UpdateEventList( sceneId, selfId,targetId )
		
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_dali_0006}");

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x002016_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "����������" and IsMissionHaveDone( sceneId, selfId, x002016_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x002016_g_scriptId, "����������", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x002016_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x002016_g_scriptId, "����������", 3, 1 )
		end

		for _, eventId in x002016_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
end

--**********************************
--�¼��������
--**********************************
function x002016_OnDefaultEvent( sceneId, selfId,targetId )
	x002016_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002016_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for _, findId in x002016_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
	
	local num = GetNumText()
	if num == 1 then										-- ����������
		if IsHaveMission( sceneId, selfId, x002016_g_RSMissionId ) > 0 then
			x002016_NotifyFailBox( sceneId, selfId, targetId, "    Ŷ������������Ӣ�۵Ĺ�ϵ���񣨾���ѭ��������δ��ɣ������֮���������Ұɡ�" )
			return
		end
		
		-- ����Ƿ��������񼤻�����
		if IsMissionHaveDone( sceneId, selfId, x002016_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--���½���Ķ����������ǲ�������50����
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_DUANYANQING_LIMITI)
		local nCount = 		floor(nDayCount/100000)
		local nTime = 		mod(nDayCount,100000)
		--local nDayTime = 	floor(nTime/100)	--��һ�ν������ʱ��(����)
		local nDayTime = 	nTime								--��һ�ν������ʱ��(����)
		
		--local CurTime = GetHourTime()				--��ǰʱ��
		local CurTime = GetDayTime()					--��ǰʱ��
		--local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
		local CurDaytime = CurTime							--��ǰʱ��(��)
		--end modified by zhangguoxin 090208

		if nDayTime == CurDaytime  then -- ����
			if nCount >= 50  then
				BeginEvent( sceneId )
					AddText( sceneId, "  �����Ѿ��鷳��̫��������ˣ�ʵ���ǹ��ⲻȥ���������鷳��ɣ�" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
			
		else		-- �µ�һ��
			SetMissionData(sceneId, selfId, MD_JQXH_DUANYANQING_LIMITI, 0)
		end

		local mission = x002016_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_DUANYANQING)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- �ȼ����޴���
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		if randtype <= 75 then --[tx44885]ԭ��20�����ĺ�ռ75
			if playerlevel == 20 then
				mission = x002016_g_SongXinMissionList[0];
			elseif playerlevel == 30 then
				mission = x002016_g_SongXinMissionList[1];
			elseif playerlevel == 40 then
				mission = x002016_g_SongXinMissionList[2];
			elseif playerlevel == 50 then
				mission = x002016_g_SongXinMissionList[3];
			elseif playerlevel == 60 then
				mission = x002016_g_SongXinMissionList[4];
			elseif playerlevel == 70 then
				mission = x002016_g_SongXinMissionList[5];
			elseif playerlevel == 80 then
				mission = x002016_g_SongXinMissionList[6];
			elseif playerlevel == 90 then
				mission = x002016_g_SongXinMissionList[7];
			end
		elseif randtype <= 95 then --[tx44885]ԭ��40�����ĺ�ռ20
			if playerlevel == 20 then
				mission = x002016_g_ShaGuaiMissionList[0];
			elseif playerlevel == 30 then
				mission = x002016_g_ShaGuaiMissionList[1];
			elseif playerlevel == 40 then
				mission = x002016_g_ShaGuaiMissionList[2];
			elseif playerlevel == 50 then
				mission = x002016_g_ShaGuaiMissionList[3];
			elseif playerlevel == 60 then
				mission = x002016_g_ShaGuaiMissionList[4];
			elseif playerlevel == 70 then
				mission = x002016_g_ShaGuaiMissionList[5];
			elseif playerlevel == 80 then
				mission = x002016_g_ShaGuaiMissionList[6];
			elseif playerlevel == 90 then
				mission = x002016_g_ShaGuaiMissionList[7];
			end
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x002016_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x002016_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x002016_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x002016_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x002016_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002016_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x002016_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			x002016_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002016_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002016_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002016_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x002016_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x002016_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x002016_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
--**********************************
--��һ���������NPC�Ի�
--**********************************
function x002016_NPCTalkOnFirstSubmission( sceneId, selfId, missionIndex, isDone)--[tx43452]
	local ret = x002016_IsQualified( sceneId, selfId, missionIndex )
	if ret == 0 then
		return 0
	end
	
  local countValue = GetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT )
  if not countValue then
    return 0
  end

  local adCount = mod(countValue, x002016_g_cdLimid)--���ɻ�ʯ�Ĵ���
	local msCount = floor(countValue / x002016_g_cdLimid)--��ɹ�ϵֵ���ڵ���480�Ĵ��� 
	
	
	if isDone == 0 then
	  if adCount == 0 and msCount == 0 then--adCount
			local PlayerName = GetName(sceneId, selfId)
			local msg = format("#{_INFOUSR%s}#{AQFC_090115_03}", PlayerName)
			AddText( sceneId, msg )
			return 1
		end
	else
	  if adCount == 1 and msCount == 1 then--adCount
			local PlayerName = GetName(sceneId, selfId)
			local msg = format("#{_INFOUSR%s}#{AQFC_090115_03}", PlayerName)
			AddText( sceneId, msg )
			return 1
		end		
	end 

	return 0
	
end

--**********************************
--����Ƿ����㰵���ų�ǰ������
--**********************************
function x002016_IsQualified( sceneId, selfId, missionIndex )--[tx43452]
	
	local mdLocation, _, _ = TGetRelationShipAwardInfo( missionIndex )
	if not mdLocation or mdLocation ~= MD_RELATION_DUANYANQING then
		return 0
	end
	
	local value = GetMissionData( sceneId, selfId, mdLocation );
	if not value or value < 480 then
		return 0
	end	

	return 1
	
end

--**********************************
--�������Ž�����
--**********************************
function x002016_OnAddRewards( sceneId, selfId, missionIndex)--[tx43452]
	
	local ret = x002016_IsQualified( sceneId, selfId, missionIndex )
	if ret == 0 then
		return 0
	end
	
  local countValue = GetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT )
  if not countValue then
    return 0
  end

  local adCount = mod(countValue, x002016_g_cdLimid)--���ɻ�ʯ�Ĵ���
	local msCount = floor(countValue / x002016_g_cdLimid)--��ɹ�ϵֵ���ڵ���480�Ĵ���  
  if adCount == 0 and msCount == 0 then
		AddItem( sceneId, x002016_g_BoundRewardsId, 1 )
		return 1
	else
		local testCount = 50 * x002016_myPower( 2, adCount - 1 )--�����ӹ�ϵֵ>=480��ʼ�ǣ�������50*2^(n-1),	
		if adCount > 0 and msCount + 1 == testCount then
			AddItem( sceneId, x002016_g_RewardsId, 1 )		
			return 1
		end
	end
	return 0
	
end

--**********************************
--ѭ�������ύ�ɹ����¼�

--**********************************
function x002016_OnMissionSubmitionSuccess(sceneId, selfId, targetId, missionIndex)--[tx43452]

	local ret = x002016_IsQualified( sceneId, selfId, missionIndex )
	if ret == 0 then
		return 0
	end
	
	local countValue = GetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT )
	if not countValue then
		return 0
	end

	local adCount = mod(countValue, x002016_g_cdLimid)--���ɻ�ʯ�Ĵ���
	local msCount = floor(countValue / x002016_g_cdLimid)--��ɹ�ϵֵ���ڵ���480�Ĵ���
	msCount = msCount + 1
	if msCount == 1 then--�ų�һ���󶨵ķɻ�ʯ
	  local bagIndex = x002016_RecevieRewards(sceneId, selfId, targetId, x002016_g_BoundRewardsId)
    if bagIndex < 0 then
			return 0
    end
    adCount = adCount + 1
	else
		local testCount = 50 * x002016_myPower( 2, adCount - 1 )--�����ӹ�ϵֵ>=480��ʼ�ǣ�������50*2^(n-1),
		if testCount == msCount  then--msCount�ų�һ���ǰ󶨵ķɻ�ʯ
		  local bagIndex = x002016_RecevieRewards( sceneId, selfId, targetId, x002016_g_RewardsId)

			if bagIndex < 0 then
				return 0
	    end
			local ItemTransfer = GetBagItemTransfer( sceneId, selfId, bagIndex)
			local PlayerName = GetName(sceneId,selfId)
			local msg = format("#{AQ_05}#{_INFOUSR%s}#{AQ_06}#{_INFOMSG%s}#{AQ_07}", PlayerName,  ItemTransfer)
	    BroadMsgByChatPipe( sceneId, selfId, msg, 4 )
		  adCount = adCount + 1
		end
	end
	local newCountValue = floor( msCount * x002016_g_cdLimid ) + adCount
	SetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT, newCountValue )

	return 1
end

--**********************************
--������Ʒ

--**********************************
function x002016_RecevieRewards(sceneId, selfId, targetId, ItemId)--[tx43452]
	--ʵ����ǰ���ѷ��뱳��������ֻ��ʾ�ɹ�

	if ItemId == x002016_g_BoundRewardsId then
	  local guid = LuaFnObjId2Guid(sceneId, selfId);		
	  ScriptGlobal_AuditGeneralLog(LUAAUDIT_FEIHUANGSHI_BOUND, guid);
	else
	  local guid = LuaFnObjId2Guid(sceneId, selfId);
	  ScriptGlobal_AuditGeneralLog(LUAAUDIT_FEIHUANGSHI, guid);			
	end

	
	--��Ŀ��ʾ
	local pos = GetItemBagPos( sceneId, selfId, ItemId, 0 )
	if pos >= 0 then
		local msg = format("#{AQFC_090115_02}") --[tx43452]
		x002016_NotifyTips(sceneId, selfId, msg)
	end
  return pos
end

--**********************************
--��Ŀ��ʾ

--**********************************
function x002016_NotifyTips(sceneId, selfId, msg)--[tx43452]
	BeginEvent( sceneId )
  	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end



--**********************************
--n^m
--**********************************
function x002016_myPower(n, m)--[tx43452]
	if m == 0 then 
	  return 1
	else 
	  return n * x002016_myPower( n, m - 1 ) 
  end
end

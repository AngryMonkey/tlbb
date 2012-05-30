--����NPC
--�����

x805028_g_scriptId=805028
x805028_g_BuildingID16 = 11

--��ӵ�е��¼�ID�б�
x805028_g_eventList = {600030} --zchw

-- �����¼� ID �б������¼��������¼�
x805028_g_eventSetList = {600030}

x805028_TIME_2000_01_03_ = 946828868

x805028_g_BuffPalyer_25 = 60
x805028_g_BuffAll_15    = 62

x805028_g_BangGongLimit    = 20 --[tx43764]
x805028_g_Item = 40004426

--**********************************
--�¼��б�
--**********************************
function x805028_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	--�Ƿ��Ǳ����Ա
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "ʲô�ˣ����ô��Ұ"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent( sceneId )
		strText = "�����˱������¹�Ա������ĳһ������л���������ұȻ��Ȼ������ˣ����кμ��̣�"
		AddText(sceneId,strText);
		AddText(sceneId, "    " .. PlayerName .. "�� ������������񿩣�")
		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			for i, eventId in x805028_g_eventList do
				--PrintStr("eventId" .. eventId)
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		AddNumText( sceneId, x805028_g_scriptId, "�����������", 11, 1 )
		AddNumText( sceneId, x805028_g_scriptId, "�޽���¥", 6, 3 )
		AddNumText( sceneId, x805028_g_scriptId, "��������", 6, 4 )
		AddNumText( sceneId, x805028_g_scriptId, "�䷽�̵�", 7, 5 )
		AddNumText( sceneId, x805028_g_scriptId, "�䷻����", 11, 2 )

		-- ������˫
		AddNumText( sceneId, x805028_g_scriptId, "��ȡ˫������", 6, 6 )
		
		AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_01}", 6, 7 )--[tx43764]

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805028_OnDefaultEvent( sceneId, selfId,targetId )
	x805028_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳ���¼��Ƿ����ͨ���� NPC ִ��
--**********************************
function x805028_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805028_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805028_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x805028_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805028_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Defance_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_WuFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	 elseif GetNumText() == 3 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "������ܼ�������" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )								--���ó����̵����
			UICommand_AddInt( sceneId, x805028_g_BuildingID16 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 104 )

	elseif GetNumText() == 6 then
		-- ������ǲ��Ǵ��ڵ�ά��״̬��
		-- 1������ҳ����ǲ��Ǵ��ڵ�ά��״̬��
		if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "  ��ǰ���ﴦ�ڵ�ά��״̬�����и������޷��ṩ����λ������ͬ�۹��þ�����Ϊ����׬ȡ������ʽ�Ϊ�á�" )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent(sceneId)
			AddText( sceneId, " �ڽ����ϴ�������������Ч�ʣ��Ƿ�Ҫ��Щ˫������ʱ���أ�" )
			AddNumText( sceneId, x805028_g_scriptId, "��Ҫ��ȡһСʱ˫������", 6, 111 )
			AddNumText( sceneId, x805028_g_scriptId, "��Ҫ��ȡ��Сʱ˫������", 6, 222 )
			AddNumText( sceneId, x805028_g_scriptId, "��Ҫ��ȡ��Сʱ˫������", 6, 333 )
			AddNumText( sceneId, x805028_g_scriptId, "�����ѯ�ұ���˫������ʱ��", 6, 444 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 7 then
	
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_02}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityGetAttr(sceneId, selfId, 6) < x805028_g_BangGongLimit   then --[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_03}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_04}" )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_05}", 6, 8 )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_06}", 6, 9 )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
		
	elseif GetNumText() == 8 then
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 3  then
			return
		end

		local nGuildPoint = CityGetAttr(sceneId, selfId, 6)
		if nGuildPoint<x805028_g_BangGongLimit then --[tx43764]
			return
		end
		
		-- �����Ʒ
		BeginAddItem(sceneId)
			AddItem( sceneId, x805028_g_Item, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_07}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityChangeAttr(sceneId, selfId, 6, -x805028_g_BangGongLimit) ~= 1  then--[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_08}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_09}" )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	
	elseif GetNumText() == 9 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	
	elseif GetNumText() == 111 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 1)

	elseif GetNumText() == 222 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 2)

	elseif GetNumText() == 333 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 4)

	elseif GetNumText() == 444 then
		-- ��ѯ���ܵ�˫������ʱ��
		local _,nCount = DEGetCount(sceneId, selfId)
		if nCount==0  then
			BeginEvent(sceneId)
				AddText(sceneId,"  �����ź��������ṩ�㱾�ܵ�˫������ʱ��Ϊ#R 0Сʱ#W�ˡ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		else
			BeginEvent(sceneId)
				AddText(sceneId,"  �����ṩ�㱾�ܵ�˫������ʱ��Ϊ#R" .. nCount .. "Сʱ#W����ú����ðɡ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		end

	elseif GetNumText() == 201 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 202 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 204 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 300 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	end
end

function x805028_DealDoubleExpTime(sceneId, selfId, targetId, nPoint)

	-- �������ڰ���еĵȼ�
	-- �������Բ������İﹱ�����������
	local nGuildPos = GetGuildPos(sceneId, selfId)
	
	local BasePoint = 25
	if nGuildPos == 8  then
		BasePoint = 12.5
	elseif nGuildPos == 9  then
		BasePoint = 0
	else
		BasePoint = 25
	end
	
	local bTimeOk = 1
	
	-- �����ǲ��ǵ���ʱ��ļ��
	if nGuildPos==8 or nGuildPos==9  then
		local isPosLongEnough = IsGuildPosLongEnough(sceneId, selfId)
		if isPosLongEnough < 1 then
			bTimeOk = 0
			BasePoint = 25
		end
	else
		bTimeOk = -1
	end

	-- �������ǲ������㹻�İ�ṱ��ֵ
	local nCity = CityGetAttr(sceneId, selfId, 6)
	if nCity < floor(BasePoint*nPoint)   then
		BeginEvent(sceneId)
			AddText(sceneId,"  ��û���㹻�İ�ṱ�׶ȿ������ġ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if BasePoint ~= 0  then
		if CityChangeAttr( sceneId, selfId, 6, -(floor(BasePoint*nPoint)) ) ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, " �۳���ṱ�׶�ʧ�ܣ����Ժ��ԡ�" )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
	end
	
	local _,nCount = DEGetCount(sceneId, selfId)
	if nCount < nPoint    then
		return
	end

	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

	local nFreeTime = DEGetFreeTime(sceneId, selfId)

	-- �ȼ����µ�ǰ�������ʣ�µ�ʱ��
	local nTrueTime = nCurHave;

	if nTrueTime < 0 then
		nTrueTime = 0
	end

	-- �����µĽӿ�
	WithDrawFreeDoubleExpTime(sceneId, selfId, 0, nPoint, 0 )

	local nCurTime = LuaFnGetCurrentTime()

	BeginEvent(sceneId)
		AddText(sceneId,"  ���ѳɹ���ȡ��#R".. nPoint .."Сʱ#W��˫������ʱ�䡣������һ��ӵ��#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "����#W��˫������ʱ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"  ���ѳɹ���ȡ��#R".. nPoint .."Сʱ#W��˫������ʱ�䡣������һ��ӵ��#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "����#W��˫������ʱ��")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bTimeOk == 1  then
		if nGuildPos == 8  then -- ������
			BeginEvent(sceneId)
				AddText(sceneId,"  �����㵣�θ���������һ�ܣ�������˫���İﹱ���롣")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif nGuildPos == 9  then  --����
			BeginEvent(sceneId)
				AddText(sceneId,"  �����㵣�ΰ�������һ�ܣ�������˫�����İﹱ��")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

	-- ͬ�����ݵ��ͻ���
	SendDoubleExpToClient(sceneId,selfId)

end

--**********************************
--������˫�ĺ���
--**********************************
function x805028_DoubleExpTime(sceneId, selfId, targetId, nTime)

	-- 1������ҳ����ǲ��Ǵ��ڵ�ά��״̬��
	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		BeginEvent(sceneId)
			AddText( sceneId, "  ��ǰ���ﴦ�ڵ�ά��״̬�����и������޷��ṩ����λ������ͬ�۹��þ�����Ϊ����׬ȡ������ʽ�Ϊ�á�" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	-- ����ǲ�����Ҫ����ˢ������
	-- ����ʱ��
	local nCurTime = LuaFnGetCurrentTime()
	-- �ϴ�ˢ�����ݵ�ʱ��
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-x805028_TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-x805028_TIME_2000_01_03_)/(3600*24*7)))   then
		----DESetLock(sceneId, selfId, 0)
		----DESetBeginTime(sceneId, selfId, 0)
		--DESetFreeTime(sceneId, selfId, 0)
		--DESetPreTime(sceneId, selfId, nCurTime)
		--DESetCount(sceneId, selfId, 5, 4, 0)

		DEResetWeeklyFreeTime(sceneId, selfId)
	end

	--
	x805028_AddDETime( sceneId, selfId, targetId, nTime, nCurTime, nPreTime )

end

function x805028_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- �ȼ����µ�ǰ�������ʣ�µ�ʱ��
		local nTrueTime = nCurHave;

		local nFreeTime = DEGetFreeTime(sceneId, selfId)

		if nTrueTime < 0 then
			nTrueTime = 0
		end

		-- ������û��ʱ�������ȡ
		local _,nCount = DEGetCount(sceneId, selfId)
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  �㱾�ܵ�˫������ʱ���ƺ��Ѿ������ˡ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if nCount < nPoint   then
			BeginEvent(sceneId)
				AddText(sceneId,"  ��û����ô���ʱ�������ȡ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- �������ǲ����Ѿ��бȽ϶��ʱ���ˣ�2Сʱ
		if nFreeTime >= 120*60   then
			BeginEvent(sceneId)
				AddText(sceneId,"  ����������к��Խ������л�õ�˫������ʱ���Ѿ��ﵽ����ȡ������")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- �����Ҳ���ӵ�г���4��Сʱ��ʱ��
		if nFreeTime + nPoint*3600 > 3600*4   then
			BeginEvent(sceneId)
				AddText(sceneId,"  ����������к��Խ������л�õ�˫������ʱ���Ѿ��ﵽ����ȡ������")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- �������ǲ����ж����˵�ʱ��
		if DEIsLock(sceneId,selfId)  > 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"  �㻹�ж����˫������ʱ�䣬�����Ƚⶳ����ȡ�µ�˫������ʱ��ɡ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			if (nTrueTime/60) > 0 then
				AddText(sceneId,"  �㱾��˫������ʱ��ʣ��#R" .. tostring(floor(nCount)) .. "Сʱ#W����ǰ����˫������ʱ��#Y" .. tostring(floor(nTrueTime/60)) .. "����#W����ȷ��Ҫ��ȡ#Y" .. tostring(floor(nPoint*60)) .. "����#W˫������ʱ�䲢ͬʱ���İ��ɹ��׶�" .. tostring(floor(nPoint*25)) .. "��#r  ����㵣����һ�����ϵİ��������Բ������İﹱ�����������Լ��롣");
			else
				AddText(sceneId,"  �㱾��˫������ʱ��ʣ��#R" .. tostring(floor(nCount)) .. "Сʱ#W����ȷ��Ҫ��ȡ#Y" .. tostring(floor(nPoint*60)) .. "����#W˫������ʱ�䲢ͬʱ���İ��ɹ��׶�" .. tostring(floor(nPoint*25)) .. "��#r  ����㵣����һ�����ϵİ��������Բ������İﹱ�����������Լ��롣");
			end
			-- ������ʱ�����������˫������ҩˮЧ������Ҫ�������ʾ
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffAll_15) == 1
					then
				AddText(sceneId,"  #r  #R��ע��:�������Ѿ������˶౶����ʱ�䣬�Ƿ�ȷ����ȡ��");
			end
			AddNumText(sceneId, x805028_g_scriptId, "�ǵģ���Ҫ��ȡ��", -1,200+nPoint )
			AddNumText(sceneId, x805028_g_scriptId, "���ˣ��ҵ���ˡ�", -1,300 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

end


--**********************************
--���ܴ�NPC������
--**********************************
function x805028_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805028_NotifyFailTips( sceneId, selfId, "�����ڲ�����ȡ�������" )
		elseif ret == -2 then
			x805028_NotifyFailTips( sceneId, selfId, "�޷����ܸ�������" )
		end

		return
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x805028_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805028_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x805028_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ�����������
--**********************************
function x805028_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805028_OnDie( sceneId, selfId, killerId )
end

function x805028_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

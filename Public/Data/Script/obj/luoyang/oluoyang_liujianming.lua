--������

--�ű���
x311002_g_scriptId = 311002

--��ӵ�е��¼�ID�б�
x311002_g_eventList={}--250036

x311002_g_eventDETime_1 = 0;
x311002_g_eventDETime_2 = 1;
x311002_g_eventDETime_4 = 2;
x311002_g_eventDETime_Lock = 3;
x311002_g_eventDETime_Unlock = 4;
x311002_g_eventDETime_Ask = 5;
x311002_g_Do_Unlock = 6;
x311002_g_Abandon_Unlock  = 7;

x311002_g_eventUpdateList = 100;
x311002_g_eventAddDETimeBegin = 200;

x311002_g_NpcSceneId = 0

-- 2000��1��3���賿0���ʱ��,˫������ʱ��Ļ�׼
TIME_2000_01_03_	=		946828868


x311002_g_BuffPalyer_25 = 60
x311002_g_BuffAll_15 = 62
x311002_g_BuffPet_25 = 61
x311002_g_BuffPet_2 = 53

--**********************************
--�¼��б�
--**********************************
function x311002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

		AddText(sceneId,"  #{LS_20080303}");
		
		AddNumText(sceneId, x311002_g_scriptId, "������һСʱ˫������ʱ��", 6,x311002_g_eventDETime_1 )
		AddNumText(sceneId, x311002_g_scriptId, "�������Сʱ˫������ʱ��", 6,x311002_g_eventDETime_2 )
		AddNumText(sceneId, x311002_g_scriptId, "��������Сʱ˫������ʱ��", 6,x311002_g_eventDETime_4 )
		AddNumText(sceneId, x311002_g_scriptId, "���붳��˫������ʱ��", 6,x311002_g_eventDETime_Lock )
		AddNumText(sceneId, x311002_g_scriptId, "����ⶳ˫������ʱ��", 6,x311002_g_eventDETime_Unlock )
		AddNumText(sceneId, x311002_g_scriptId, "�����ѯ�ұ���˫������ʱ��", 6,x311002_g_eventDETime_Ask )
		AddNumText( sceneId, x311002_g_scriptId, "��˫����", 11, 10 )
			
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end	

--**********************************
--�¼��������
--**********************************
function x311002_OnDefaultEvent( sceneId, selfId, targetId )
	x311002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_079}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	-- �ж���ҵĵȼ���С��10�ͷ���
	if GetLevel(sceneId, selfId) < 10  then
		BeginEvent(sceneId)
			AddText(sceneId,"  ��ĵȼ�������10���������������ɡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 
	end
	
	-- ����ǲ�����Ҫ����ˢ������
	-- ����ʱ��
	local nCurTime = LuaFnGetCurrentTime()
	-- �ϴ�ˢ�����ݵ�ʱ��
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-TIME_2000_01_03_)/(3600*24*7)))   then
		DEResetWeeklyFreeTime(sceneId, selfId)
	end
	
	local nNowGetTime = 0
	
	if GetNumText() == x311002_g_eventDETime_1	then
		nNowGetTime	= 1
		x311002_AddDETime(sceneId, selfId, targetId, 1, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_2	then
		nNowGetTime	= 2
		x311002_AddDETime(sceneId, selfId, targetId, 2, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_4	then
		nNowGetTime	= 4
		x311002_AddDETime(sceneId, selfId, targetId, 4, nCurTime, nPreTime)
		
	elseif GetNumText() == x311002_g_eventDETime_Lock	then
		
		-- �ȼ��һ���ǲ��Ƕ���״̬������ǣ��ͷ��أ���ֱ����ʾ
		if DEIsLock(sceneId, selfId) > 0   then
			BeginEvent(sceneId)
				AddText(sceneId,"  ���˫������ʱ���Ѿ����ڶ���״̬�ˡ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return			
		end
	
		-- �����ʱ��
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

		-- �ȼ����µ�ǰ�������ʣ�µ�ʱ��
		local nTrueTime = nCurHave;
		
		if nTrueTime <= 0 then 
			BeginEvent(sceneId)
				AddText(sceneId,"  ������û������ȡ��˫��ʱ�䰡����")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			nTrueTime = 0
			return
		end
		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x311002_g_scriptId);
			UICommand_AddInt(sceneId,targetId);
			UICommand_AddInt(sceneId,50)
			UICommand_AddString(sceneId,"LockTime");
			local str = format("�㵱ǰ��%d���ӵ�˫��ʱ�䣬��ȷ��Ҫ������",floor(nTrueTime/60) ) 
			UICommand_AddString(sceneId,str);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)		

	elseif GetNumText() == x311002_g_eventDETime_Unlock	then
		-- �ⶳ��ʱ��
		-- ���ж��ǲ�����˫������ʱ����Խ��
		local bLock = DEIsLock(sceneId, selfId)
		if bLock <= 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"  ��û���������ﶳ��˫������ʱ�䰡����")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- ������������ҩˮ��BUFF����Ҫ�����һ����ʾ
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffPalyer_25) == 1   
				or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffAll_15) == 1
				then
			BeginEvent(sceneId)
				AddText(sceneId,"  �������Ѿ������˶౶����ʱ�䣬�Ƿ�ȷ�Ͻⶳ��")
				AddNumText(sceneId, x311002_g_scriptId, "ȷ�Ͻⶳ", 6,x311002_g_Do_Unlock )
				AddNumText(sceneId, x311002_g_scriptId, "�����ⶳ", 6,x311002_g_eventUpdateList )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		DESetLock(sceneId, selfId, 0)
		--DESetBeginTime(sceneId, selfId, nCurTime)
		BeginEvent(sceneId)
			AddText(sceneId,"  �㶳���˫������ʱ���Ѿ��ⶳ�ˡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		-- ͬ�����ݵ��ͻ���
		SendDoubleExpToClient(sceneId,selfId)
	
	elseif GetNumText() == x311002_g_Do_Unlock	then
		DESetLock(sceneId, selfId, 0)
		--DESetBeginTime(sceneId, selfId, nCurTime)
		BeginEvent(sceneId)
			AddText(sceneId,"  �㶳���˫������ʱ���Ѿ��ⶳ�ˡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		-- ͬ�����ݵ��ͻ���
		SendDoubleExpToClient(sceneId,selfId)
	
	elseif GetNumText() == x311002_g_Abandon_Unlock	then
		return
		
	elseif GetNumText() == x311002_g_eventDETime_Ask	then
			
		local nCount = DEGetCount(sceneId, selfId)
	
		BeginEvent(sceneId)
			if nCount and nCount > 0 then
				AddText(sceneId,"������������ȡ���㱾�ܵ�˫������ʱ��Ϊ#R"..tostring(floor(nCount)).."Сʱ#W����ú����ðɡ�")
			else
				AddText(sceneId,"�����ź��������ṩ�㱾�ܵ�˫������ʱ��Ϊ#R0Сʱ#W�ˡ�")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == x311002_g_eventUpdateList	then
		x311002_UpdateEventList( sceneId, selfId,targetId )
	
	elseif GetNumText() >= x311002_g_eventAddDETimeBegin	then
		--��֤��������
		local nPoint = GetNumText()-x311002_g_eventAddDETimeBegin;
		
		local nCount = DEGetCount(sceneId, selfId)
		if nCount < nPoint    then
			return
		end
		
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- �ȼ����µ�ǰ�������ʣ�µ�ʱ��
		local nTrueTime = nCurHave;
		
		if nTrueTime < 0 then 
			nTrueTime = 0
		end
		
		WithDrawFreeDoubleExpTime(sceneId, selfId, nPoint, 0, 0 )
		
		BeginEvent(sceneId)
			AddText(sceneId,"  ���ѳɹ���ȡ��#R".. nPoint .."Сʱ#W��˫������ʱ�䡣������һ��ӵ��#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "����#W��˫������ʱ��")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		BeginEvent(sceneId)
			AddText(sceneId,"  ���ѳɹ���ȡ��#R".. nPoint .."Сʱ#W��˫������ʱ�䡣������һ��ӵ��#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "����#W��˫������ʱ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		-- ͬ�����ݵ��ͻ���
		SendDoubleExpToClient(sceneId,selfId)

	end

end

function x311002_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		
		local nFreeTime = DEGetFreeTime(sceneId, selfId)
		-- �ȼ����µ�ǰ�������ʣ�µ�ʱ��
		local nTrueTime = nCurHave;
		
		if nTrueTime < 0 then 
			nTrueTime = 0
		end
		
		-- ������û��ʱ�������ȡ
		local nCount = DEGetCount(sceneId, selfId)
		
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  �㱾�ܴ������������ȡ��˫������ʱ�䣬�Ѿ������ˡ�")
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
				AddText(sceneId,"�㱾��˫������ʱ��ʣ��#R" .. tostring(floor(nCount)) .. "Сʱ#W����ǰ����˫������ʱ��#Y" .. tostring(floor(nTrueTime/60)) .. "����#W����ȷ��Ҫ��ȡ#Y" .. tostring(floor(nPoint*60)) .. "����#W˫������ʱ����");
			else
				AddText(sceneId,"�㱾��˫������ʱ��ʣ��#R" .. tostring(floor(nCount)) .. "Сʱ#W����ȷ��Ҫ��ȡ#Y" .. tostring(floor(nPoint*60)) .. "����#W˫������ʱ����");
			end
			
			-- ������ʱ�����������˫������ҩˮЧ������Ҫ�������ʾ
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x311002_g_BuffAll_15) == 1
					then
				AddText(sceneId,"  #r  #R��ע��:�������Ѿ������˶౶����ʱ�䣬�Ƿ�ȷ����ȡ��");
			end
			
			AddNumText(sceneId, x311002_g_scriptId, "�ǵģ���Ҫ��ȡ��", -1,x311002_g_eventAddDETimeBegin+nPoint )
			AddNumText(sceneId, x311002_g_scriptId, "���ˣ��ҵ���ˡ�", -1,x311002_g_eventUpdateList )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--���ܴ�NPC������
--**********************************
function x311002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x311002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			x311002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x311002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x311002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x311002_OnDie( sceneId, selfId, killerId )

end

function x311002_LockTime( sceneId, selfId, targetId, nTime )
	if nTime < 0 then
		return 
	end
	
	-- ֻ���� ���������ݣ�����¥�������ӹ��� �⼸�������ܹ�����˫������
	if sceneId~=0 and sceneId~=1 and sceneId~=2 and sceneId~=186 and sceneId~=420 
			and sceneId ~= 193 and sceneId ~= 418 and sceneId ~= 419 and sceneId ~= 518  then	 -- zchw
		return
	end

	-- ��÷�������¼��ʵ�ʵ���ʵʱ��
	local nCurTime = LuaFnGetCurrentTime()
	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
	-- �ȼ����µ�ǰ�������ʣ�µ�ʱ��
	local nTrueTime = nCurHave;
	
	if nTrueTime < 0 then 
		nTrueTime = 0
	end

	DESetLock(sceneId, selfId, 1)
	--DESetFreeTime(sceneId, selfId, nTrueTime)
	
	BeginEvent(sceneId)
		AddText(sceneId,"  �Ѿ�������" .. tostring(floor(nTrueTime/60)) .. "����˫������ʱ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"  �Ѿ�������" .. tostring(floor(nTrueTime/60)) .. "����˫������ʱ��")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	-- ͬ�����ݵ��ͻ���
	SendDoubleExpToClient(sceneId,selfId)

end



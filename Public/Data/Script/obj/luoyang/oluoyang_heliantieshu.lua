--����NPC
--��������
--��ͨ

--�ű���
x000033_g_scriptId = 000033

--��ӵ�е��¼�ID�б�
x000033_g_eventList={200052, 200053, 200095, 200096, 200099, 200100}--200050,200054

x000033_g_RSMissionId = 101
x000033_g_ActivateMissionId = 45			-- ��������
x000033_g_SongXinScriptId = 006668		-- ����
x000033_g_ShaGuaiScriptId = 006666		-- ɱ��
x000033_g_XunWuScriptId = 006667			-- Ѱ��

x000033_g_RoundStorytelling = {
		[0] = { misIndex = { 1039350 }, script = x000033_g_XunWuScriptId },
		[1] = { misIndex = { 1039351 }, script = x000033_g_XunWuScriptId },
		[2] = { misIndex = { 1039352 }, script = x000033_g_XunWuScriptId },
		[3] = { misIndex = { 1039353 }, script = x000033_g_XunWuScriptId },
		[4] = { misIndex = { 1039354 }, script = x000033_g_XunWuScriptId }}
			
x000033_g_SongXinMissionList = {
		[0] = { misIndex = { 1018350 }, script = x000033_g_SongXinScriptId },
		[1] = { misIndex = { 1018351 }, script = x000033_g_SongXinScriptId },
		[2] = { misIndex = { 1018352 }, script = x000033_g_SongXinScriptId }}
			
x000033_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1039355 }, script = x000033_g_XunWuScriptId },
		[1] = { misIndex = { 1039356 }, script = x000033_g_XunWuScriptId },
		[2] = { misIndex = { 1039357 }, script = x000033_g_XunWuScriptId }}
			

--**********************************
--�¼��б�
--**********************************
function x000033_UpdateEventList( sceneId, selfId,targetId )
		
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"  �����ϴ����������࣬���γ�ÿ��ٰ��ᣬ�ѵ������Ϊ���д���ϼ�����")

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x000033_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "������������" and IsMissionHaveDone( sceneId, selfId, x000033_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x000033_g_scriptId, "������������", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x000033_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x000033_g_scriptId, "������������", 3, 1 )
		end

		for i, eventId in x000033_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x000033_OnDefaultEvent( sceneId, selfId,targetId )
	x000033_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000033_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000033_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
		
	local num = GetNumText()
	if num == 1 then										-- ������������
		if IsHaveMission( sceneId, selfId, x000033_g_RSMissionId ) > 0 then
			x000033_NotifyFailBox( sceneId, selfId, targetId, "    Ŷ������������Ӣ�۵Ĺ�ϵ���񣨾���ѭ��������δ��ɣ������֮���������Ұɡ�" )
			return
		end
		
		-- ����Ƿ��������񼤻�����
		if IsMissionHaveDone( sceneId, selfId, x000033_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--���½�����������������ǲ�������50����
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_YINCHUAN_LIMITI)
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
			SetMissionData(sceneId, selfId, MD_JQXH_YINCHUAN_LIMITI, 0)
		end

		local mission = x000033_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_YINCHUAN)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- �ȼ����޴���
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- ��������
		if randtype <= 60 then
			if playerlevel == 70 then
				mission = x000033_g_SongXinMissionList[0];
			elseif playerlevel == 80 then
				mission = x000033_g_SongXinMissionList[1];
			elseif playerlevel == 90 then
				mission = x000033_g_SongXinMissionList[2];			
			end
		-- ɱ������
		elseif randtype <= 95 then
			if playerlevel == 70 then
				mission = x000033_g_ShaGuaiMissionList[0];
			elseif playerlevel == 80 then
				mission = x000033_g_ShaGuaiMissionList[1];
			elseif playerlevel == 90 then
				mission = x000033_g_ShaGuaiMissionList[2];			
			end
		-- Ѱ������
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x000033_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x000033_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x000033_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x000033_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x000033_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000033_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000033_g_eventList do
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
function x000033_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000033_g_eventList do
		if missionScriptId == findId then
			x000033_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--�������Ѿ���������
--**********************************
function x000033_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--�ύ�����������
--**********************************
function x000033_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end	
end

--**********************************
--�����¼�
--**********************************
function x000033_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x000033_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x000033_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x000033_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end

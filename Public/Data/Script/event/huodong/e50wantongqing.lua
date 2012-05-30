--50��ͬ��


--�ű���
x808074_g_scriptId = 808074
x808074_g_Fu = 30505163
x808074_g_gongcaiyun_scriptId = 002089
--**********************************
--�о��¼�
--**********************************
function x808074_OnEnumerate( sceneId, selfId, targetId )

	local nowYear = GetTodayYear();
	local nowMonth = GetTodayMonth();
	local nowDate = GetTodayDate();

	if (nowYear == 2008) then
		if(nowMonth==0) then
			if(nowDate>=16 and nowDate<=27) then
				AddNumText(sceneId, x808074_g_scriptId, "#gFF0FA0�μӡ�120�������������齱", 1, 1 )
				AddNumText(sceneId, x808074_g_scriptId, "ʲô�ǡ�120������������", 11, 3 )
			end
		end
	end
	--AddNumText(sceneId, x808074_g_scriptId, "cleanup", 1, 4 )
end

--**********************************
--������ں���
--**********************************
function x808074_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()

	if TextNum == 5 then
	
		if GetLevel(sceneId, selfId)<35 then
				x808074_NotifyBox(sceneId, selfId, targetId,"#{TQLQ_20071218_03}" );	
				return
		end 
		
		local nowDate = GetDayTime();
		local oldTimes = GetMissionData( sceneId, selfId, MD_50WAN_TIME_INFO );

		if oldTimes == nowDate then
				x808074_NotifyBox(sceneId, selfId, targetId,"#{TQLQ_20071218_04}" );	
				return
		end 
		
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,5906,0);
		SetMissionData( sceneId, selfId, MD_50WAN_TIME_INFO, nowDate );
		
		--�μӳ齱
		local guid = LuaFnGetGUID(sceneId,selfId)
		local nLevel = GetLevel(sceneId, selfId)
		WritePrizeLog(sceneId, selfId,"50w ".." guid="..guid.." level="..nLevel);
		
				--BeginAddItem( sceneId )
				--AddItem( sceneId, x808074_g_Fu, 1 )
				--ret = EndAddItem( sceneId, selfId )
				--if ret > 0 then
					--AddItemListToHuman(sceneId,selfId )
				--end
				
		x808074_NotifyBox(sceneId, selfId, targetId,"#{TQLQ_20071218_02}" );	
		return
		
	elseif TextNum == 1 then	
		BeginEvent(sceneId)
		AddText( sceneId, "#{TQLQ_20071218_09}" )		
		AddNumText(sceneId, x808074_g_scriptId, "��Ҫ�μӳ齱", 8, 5 )
		AddNumText(sceneId, x808074_g_scriptId, "����������", 8, 6 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif TextNum == 3 then	
		x808074_NotifyBox(sceneId, selfId, targetId,"#{TQLQ_20071218_07}" );	
	elseif TextNum == 4 then	
		LuaFnCancelSpecificImpact(sceneId,selfId,5906)
		LuaFnCancelSpecificImpact(sceneId,selfId,5907)
		SetMissionData( sceneId, selfId, MD_50WAN_TIME_INFO, 0 );
		local ReturnType = DelItem(sceneId, selfId, x808074_g_Fu, 1)
	elseif TextNum == 6 then	
		CallScriptFunction( x808074_g_gongcaiyun_scriptId, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x808074_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

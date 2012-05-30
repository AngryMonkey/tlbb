--����ڿ���

--�ű���
x808130_g_ScriptId = 808130


x808130_g_LabelsDay	= {start = 20090528, stop = 20090604, level = 10}


x808130_g_MissionData = MD_DAY_TO_HAVE_DWJKL --��ȡʱ��


--level��ʾ��ʼ�ȼ�����������ȼ��Ϳ��Ի�ú����BUFF
x808130_g_Impact = {
		{level = 10,	buffId = 2966},		--10 -19
		{level = 20,	buffId = 2955},		--20 -29
		{level = 30,	buffId = 2956},		--30 -39
		{level = 40,	buffId = 2957},		--40 -49
		{level = 50,	buffId = 2958},		--50 -59
		{level = 60,	buffId = 2959},		--60 -69
		{level = 70,	buffId = 2960},		--70 -79
		{level = 80,	buffId = 2961},		--80 -89
		{level = 90,	buffId = 2962},	  --90-99
		{level = 100,	buffId = 2963},	  --100-109
		{level = 110,	buffId = 2964}    --110-119
}


--**********************************
--������ں���
--**********************************
function x808130_OnDefaultEvent( sceneId, selfId, targetId )
	local numText = GetNumText();
  if numText == 1 then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{DWJ_090511_07}")
			AddNumText(sceneId, x808130_g_ScriptId, "#{DWJ_090511_04}", 6, 200)
			AddNumText(sceneId, x808130_g_ScriptId, "#{DWJ_090511_06}", 8, 201)
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
  elseif numText == 200 then
		x808130_ReceiveGift( sceneId, selfId, targetId )
  elseif numText == 201 then
		BeginUICommand( sceneId )			
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
  end

end

--**********************************
--�Ƿ��ܲμӻ
--**********************************
function x808130_IsQualidfied( sceneId, selfId )
	local curDayTime = GetTime2Day()
	if curDayTime >= x808130_g_LabelsDay.start and curDayTime <= x808130_g_LabelsDay.stop  then
			return 1
	end
	return 0
end

--**********************************
--�Ƿ�����ȡ����
--**********************************
function x808130_HaveReceivedGift( sceneId, selfId )
	local td = GetTime2Day()
	local md = GetMissionData( sceneId, selfId, x808130_g_MissionData )
	if not md then
		return 0
	end
	if td == md then 
		 return 1
	end
	return 0
end

--**********************************
--������ȡ������
--**********************************
function x808130_SetGiftFlag( sceneId, selfId )
	local td = GetTime2Day()
	SetMissionData( sceneId, selfId, x808130_g_MissionData, td )	
end

--**********************************
--��ȡ����
--**********************************
function x808130_ReceiveGift( sceneId, selfId, targetId )
	
	--����Ƿ����
	if x808130_IsQualidfied( sceneId, selfId ) == 0 then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{MLH_90408_6}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)				
		return
	end
	
	--���ȼ�
	local level = GetLevel( sceneId, selfId ) 
	if level < x808130_g_LabelsDay.level then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{LDKL_090408_3}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId) 				
		return
	end
	
	--����Ƿ����
	if x808130_HaveReceivedGift( sceneId, selfId ) == 1 then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{LDKL_090408_4}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId) 			
		return
	end

	--�ų�buff
	local ret = x808130_AddHappyDuanwujie( sceneId, selfId )
	
	--����NPC�Ի�
	if(1 == ret ) then
		BeginEvent(sceneId)
			AddText(sceneId, "#{DWJ_090511_05}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	end
	
end

--**********************************
--����Ҽ��϶���ڿ���buff
--**********************************
function x808130_AddHappyDuanwujie( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)
	local buffId = -1

	for index = 1, getn(x808130_g_Impact) do
		if( myLevel >= x808130_g_Impact[index].level ) then
			buffId = x808130_g_Impact[index].buffId
		end
	end
	if( buffId ~= -1 ) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, buffId, 0)
		--������ȡ��־
		x808130_SetGiftFlag( sceneId, selfId )
		--ͳ��		
		local guid = LuaFnObjId2Guid(sceneId, selfId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_LINGQU_DWJKL, guid)
		return 1		
	end
	
	return 0
	
end

--**********************************
--�о��¼�
--**********************************
function x808130_OnEnumerate( sceneId, selfId, targetId )
	if x808130_IsQualidfied( sceneId, selfId ) == 1 then
			AddNumText(sceneId, x808130_g_ScriptId, "#{DWJ_090511_01}", 6, 1)
	end
end


--**********************************
--����
--**********************************
function x808130_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x808130_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x808130_OnContinue( sceneId, selfId, targetId )

end


--**********************************
--�ύ
--**********************************
function x808130_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x808130_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x808130_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x808130_OnItemChanged( sceneId, selfId, itemdataId )
end
			


--�����
--ʥ����Ԫ���-�ռ����ɵ��߻�����

--�ű���
x889050_g_ScriptId = 889050

x889050_g_BufferId = 20001
--**********************************
--������ں���
--**********************************
function x889050_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x889050_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()
	if NumText == 111 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SHXQZH_081118_05}")
			AddNumText( sceneId, x889050_g_ScriptId, "#{INTERFACE_XML_557}", 8, 113 )
			AddNumText( sceneId, x889050_g_ScriptId, "#{INTERFACE_XML_542}", 8, 114 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	  
	elseif NumText == 112 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SHXQZH_081118_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 113	then
		--ȷ��
		x889050_GiveBuff( sceneId, selfId, targetId )
	elseif NumText == 114	then
		--ȡ��
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end
end

--**********************************
--�о��¼�
--**********************************
function x889050_OnEnumerate( sceneId, selfId, targetId )
  
  --���ʱ���Ƿ���ȷ
	local isTime = x889050_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x889050_g_ScriptId, "#{SHXQZH_081118_03}", 6, 111 )
	AddNumText(sceneId, x889050_g_ScriptId, "#{SHXQZH_081118_04}", 11, 112 )													
end

--**********************************
--���ʱ���Ƿ���ȷ
--**********************************
function x889050_CheckRightTime()

--һֱ�����û
	return 1

end

--**********************************
--����ҽ��պ���
--**********************************
function x889050_GiveBuff( sceneId, selfId, targetId )

	--�رնԻ�����....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	
	--�����ҵȼ�С��30���軻ȡ�ؿ�
	if	GetLevel( sceneId, selfId) < 30 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SHXQZH_081118_09}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--�������л��BUFF
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889050_g_BufferId ) == 1 then
	   BeginEvent(sceneId)
			 AddText( sceneId, "#{SHXQZH_081118_06}" )
		 EndEvent(sceneId)
		 DispatchEventList(sceneId,selfId,targetId)
		 return
	end	
	
	 --������һBUFF
   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x889050_g_BufferId, 0)	
   
   BeginEvent(sceneId)
			AddText( sceneId, "#{SHXQZH_081118_07}" )
	 EndEvent(sceneId)
	 DispatchMissionTips( sceneId, selfId )

end

--**********************************
--����������
--**********************************
function x889050_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889050_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889050_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889050_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x889050_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x889050_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x889050_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x889050_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x889050_OnItemChanged( sceneId, selfId, itemdataId )
end

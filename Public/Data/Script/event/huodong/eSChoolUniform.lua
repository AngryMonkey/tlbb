--�����
--��ʹУ���ƻ�

--�ű���
x889052_g_ScriptId = 889052

--�ʱ��
x889052_g_startTime = 09069 --���ʼʱ��
x889052_g_EndTime   = 09099 --�����ʱ��



--**********************************
--������ں���
--**********************************
function x889052_OnDefaultEvent( sceneId, selfId, targetId )
		
		--���ʱ���Ƿ���ȷ
		if x889052_CheckRightTime() == 0 then
			return 
		end
		
		if GetNumText() == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{TSJH_090224_4}")
				AddNumText(sceneId,x889052_g_ScriptId,"#{TSJH_090224_5}",6,2)
				AddNumText(sceneId,x889052_g_ScriptId,"#{TSJH_090224_6}",11,3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetNumText() == 2 then
			x889052_GiveGift(sceneId, selfId, targetId)
		elseif GetNumText() == 3 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{TSJH_090224_7}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end

--**********************************
--����ҷ��ʼ�
--**********************************
function x889052_OnPlayerLogin( sceneId, selfId )
	
	local curDate = x889052_CheckRightTime( )
	if curDate == 1 then
		BroadMsgByChatPipe( sceneId, selfId, "#{TSJH_090224_1}", 4 )
	end
	
end

--**********************************
--����Ƿ��ǻʱ��
--**********************************
function x889052_CheckRightTime()
	local curDayTime = GetDayTime()
	if curDayTime >= x889052_g_startTime and curDayTime <= x889052_g_EndTime then
		return 1
	else
		return 0
	end
end

--**********************************
--�о��¼�
--**********************************
function x889052_OnEnumerate( sceneId, selfId, targetId )

		if x889052_CheckRightTime() == 0 then
			return 
		end
		
		AddNumText(sceneId, x889052_g_ScriptId, "#{TSJH_090224_3}", 1, 1)
end

function x889052_GiveGift(sceneId, selfId, targetId)

	--�Ƿ�μӹ��û
	local bHave = GetMissionFlag(sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN)
	if (bHave ==1) then
		
		x889052_NotifyFailBox(sceneId, selfId,targetId,"#{TSJH_090224_8}")
		return
	end
	
	--�������Ƿ��㹻  
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x889052_NotifyFailBox(sceneId, selfId,targetId,"#{TSJH_090224_9}")
			return
	end
	
	--���ݵȼ������Ʒ
	if GetLevel( sceneId, selfId ) >50 then
			--����Ҷ��������
			BeginAddItem( sceneId )
				local nIndex = AddItem( sceneId, 30504065, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				return
			end
			AddItemListToHuman(sceneId,selfId)
			--��Ŀ��ʾ
			x889052_NotifySucessBox(sceneId,selfId,"#{TSJH_090224_11}")
	else
		--����Ҷ��������
			BeginAddItem( sceneId )
				local nIndex = AddItem( sceneId, 30504059, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				return
			end
			AddItemListToHuman(sceneId,selfId)
			--��Ŀ��ʾ
			x889052_NotifySucessBox(sceneId,selfId,"#{TSJH_090224_10}")
	end
	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
	SetMissionFlag(sceneId, selfId, MF_TW_SCHOOLUNIFORM_JOIN, 1)
	
	--ͳ����־
	AuditGetSChoolUniform(sceneId, selfId,GetLevel(sceneId, selfId),LuaFnGetSex(sceneId,selfId))
	
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x889052_NotifySucessBox( sceneId, selfId,msg )
	--��Ŀ��ʾ
		BeginEvent(sceneId) 
			AddText( sceneId,msg)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end


--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x889052_NotifyFailBox( sceneId, selfId,targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����������
--**********************************
function x889052_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889052_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889052_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889052_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x889052_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x889052_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x889052_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x889052_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x889052_OnItemChanged( sceneId, selfId, itemdataId )
end

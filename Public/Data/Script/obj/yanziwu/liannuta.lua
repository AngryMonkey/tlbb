-- 402247
-- ������ 

--�ű���
x402247_g_scriptId = 402247

--��ӵ�е��¼�ID�б�
x402247_g_eventList={}

-- ľ��ID  (��ʱ�ñ����Ʒ����)
x402247_g_Item = 40004430


--**********************************
--�¼��б�
--**********************************
function x402247_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId, "  ���������������������˵����")		    				

		if LuaFnGetCopySceneData_Param(sceneId, 8) >= 10  then
		
			local szName = GetName(sceneId, targetId)
			if szName == "ǰ������"  then
				AddText(sceneId, "  �����������Զ�������Χ���еĵз�Ŀ�ꡣ")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 9)
				if nCount < 5  then
					local str = "�޸�����Ҫ" .. 5-nCount .. "��ľ��"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,1 )
				end
				
			elseif szName == "��������"  then
				AddText(sceneId, "  �����������Զ�������Χ���еĵз�Ŀ�ꡣ")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 10)
				if nCount < 5  then
					local str = "�޸�����Ҫ" .. 5-nCount .. "��ľ��"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,2 )
				end
				
			elseif szName == "������"  then
				AddText(sceneId, "  �����������Զ��ָ���Χ���е��ѷ�Ŀ���Ѫ��")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 11)
				if nCount < 10  then
					local str = "�޸�����Ҫ" .. 10-nCount .. "��ľ��"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,3 )
				end
				
			elseif szName == "������"  then
				AddText(sceneId, "  ���������ɽ�����Χ���еĵз�Ŀ��Ĺ�����")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 12)
				if nCount < 5  then
					local str = "�޸�����Ҫ" .. 5-nCount .. "��ľ��"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,4 )
				end
				
			end
		end
	
		for i, eventId in x402247_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402247_OnDefaultEvent( sceneId, selfId,targetId )
	x402247_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402247_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	local nNumText = GetNumText()
	if nNumText == 1  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 9)
		nCount = 5 - nCount
		-- �����п���ɾ���ġ�ľ�ġ�������
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 9, 5-(nCount-nItemCount) )
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 9) >= 5  then
			
		end
	
	elseif nNumText == 2  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 10)
		nCount = 5 - nCount
		-- �����п���ɾ���ġ�ľ�ġ�������
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 10, 5-(nCount-nItemCount) )
		end

		if LuaFnGetCopySceneData_Param(sceneId, 10) >= 5  then
			
		end
		
	elseif nNumText == 3  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 11)
		nCount = 10 - nCount
		-- �����п���ɾ���ġ�ľ�ġ�������
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 11, 10-(nCount-nItemCount) )
		end

		if LuaFnGetCopySceneData_Param(sceneId, 11) >= 10  then
			
		end
		
	elseif nNumText == 4  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 12)
		nCount = 5 - nCount
		-- �����п���ɾ���ġ�ľ�ġ�������
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 12, 5-(nCount-nItemCount) )
		end

		if LuaFnGetCopySceneData_Param(sceneId, 12) >= 5  then
			
		end
		
	end

	if nNumText==1 or nNumText==2 or nNumText==3 or nNumText==4  then
		
		BeginEvent(sceneId)
			local szName = GetName(sceneId, targetId)
			if szName == "ǰ������"  then
				AddText(sceneId, "  �����������Զ�������Χ���еĵз�Ŀ�ꡣ")
			elseif szName == "��������"  then
				AddText(sceneId, "  �����������Զ�������Χ���еĵз�Ŀ�ꡣ")
			elseif szName == "������"  then
				AddText(sceneId, "  �����������Զ��ָ���Χ���е��ѷ�Ŀ���Ѫ��")
			elseif szName == "������"  then
				AddText(sceneId, "  ���������ɽ�����Χ���еĵз�Ŀ��Ĺ�����")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	for i, findId in x402247_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x402247_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x402247_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			x402247_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402247_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402247_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402247_OnDie( sceneId, selfId, killerId )

end


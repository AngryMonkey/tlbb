--����NPC
--������
--��ͨ

x000101_g_scriptId = 000101

x000101_g_shoptableindex=17

--��ӵ�е��¼�ID�б�
x000101_g_eventList={800107,311112}  --del 311112  ���޼�������

x000101_g_miscEventId = 311111;

--**********************************
--�¼��������
--**********************************
function x000101_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0026}")
		
		AddNumText( sceneId, x000101_g_scriptId, "������ؽ���", 11, 10 )
		
		AddNumText(sceneId,x000101_g_scriptId,"����������Ʒ",7,0)
		AddNumText(sceneId,x000101_g_scriptId,"���޼���ѧϰ",6,1)
		AddNumText(sceneId,x000101_g_scriptId,"��ͯ",6,2)
		AddNumText(sceneId,x000101_g_scriptId,"�ӳ�����",6,3)
		AddNumText(sceneId,x000101_g_scriptId,"ѱ��",6,4)
		--AddNumText(sceneId,x000101_g_scriptId,"����������Ϣ",6,5)
		--AddNumText(sceneId,x000101_g_scriptId,"����",6,6)
		--AddNumText(sceneId,x000101_g_scriptId,"��ѯ��ֳ������",6,7)
		for i, eventId in x000101_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000101_OnEventRequest( sceneId, selfId, targetId, eventId )
   
---------------------------����-------------------------------------------------
	if eventId == x000101_g_scriptId then
		if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText(sceneId,"#{function_help_056}#r")
				
				AddNumText(sceneId, x000101_g_scriptId,"���޷�ֳ����",11,11);
				AddNumText(sceneId, x000101_g_scriptId,"���޼���ѧϰ����",11,12);			
				AddNumText(sceneId, x000101_g_scriptId,"���޼�������",11,13);
					
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	
		if GetNumText() == 11 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_057}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 12 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_058}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 13 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{JNHC_81015_01}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
---------------------------����-------------------------------------------------		
		if	GetNumText() == 0	then
			DispatchShopItem( sceneId, selfId,targetId, x000101_g_shoptableindex )
		elseif GetNumText() <= 6 then
			local sel = GetNumText();
			CallScriptFunction( x000101_g_miscEventId, "OnEnumerate",sceneId, selfId, targetId, sel)
		elseif GetNumText() == 7 then
			LuaFnGetPetProcreateInfo(sceneId, selfId);
		end
	else
		for i, findId in x000101_g_eventList do
			if findId == eventId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		end
	end
end

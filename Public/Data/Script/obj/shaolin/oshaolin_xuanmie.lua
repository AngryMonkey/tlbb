--����NPC
--����
--��ͨ
 x009011_g_ScriptId=009011
--447	��������
--448	������������
--449	����������
--450	��������
--451	���������
--452	��������ţ
--453	������¹
--454	��������
--455	����������
--456	�������׻�
--457	�������������
--458	������������
--459	�����������
--460	��������׷�
--461	����������ţ
--462	��������¹
--463	�������׵�
--464	����������
--**********************************
--�¼��������
--**********************************
function x009011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�����ӷ��ҿ��Խ����ֵ��Ӽ�Ԧ�ͻ���������")
		if	GetMenPai( sceneId, selfId) == 0 then
			if	(0==LuaFnHaveSpecificEquitation(  sceneId, selfId, 447))	then
				AddNumText(sceneId,x009011_g_ScriptId,"ѧϰ��������",12,40)
			end
			if	(0==LuaFnHaveSpecificEquitation(  sceneId, selfId, 456))	then
				AddNumText(sceneId,x009011_g_ScriptId,"ѧϰ�������׻�",12,60)
			end
		end
		AddNumText( sceneId, x009011_g_ScriptId, "��������", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x009011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_011}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if GetNumText() == 40 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XXQS_03}" )
			AddNumText(sceneId, x009011_g_ScriptId,"��",-1,0)
      AddNumText(sceneId, x009011_g_ScriptId,"��",-1,999)			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 60 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XXQS_04}" )
			AddNumText(sceneId, x009011_g_ScriptId,"��",-1,1)
      AddNumText(sceneId, x009011_g_ScriptId,"��",-1,999)			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 999 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	local level = GetLevel( sceneId, selfId)
	local skill = GetNumText()
	if skill == 0 or skill == 1 then
	  CallScriptFunction((210299), "OnDefaultEvent",sceneId, selfId,targetId, level, skill)
	end
end


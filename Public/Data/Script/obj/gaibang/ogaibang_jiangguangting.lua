--ؤ��NPC
--����ͤ
--��ͨ

 x010010_g_ScriptId=010010
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
function  x010010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"�ҿ��Խ�ؤ����Ӽ�Ԧ���ǵ�������")
		if	GetMenPai( sceneId, selfId) == 2 then
			if	(0==LuaFnHaveSpecificEquitation(  sceneId, selfId, 455))	then
				AddNumText(sceneId, x010010_g_ScriptId,"ѧϰ����������",12,40)
			end
			if	(0==LuaFnHaveSpecificEquitation(  sceneId, selfId, 464))	then
				AddNumText(sceneId, x010010_g_ScriptId,"ѧϰ����������",12,60)
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function  x010010_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 40 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XXQS_05}" )
			AddNumText(sceneId, x010010_g_ScriptId,"��",-1,0)
      AddNumText(sceneId, x010010_g_ScriptId,"��",-1,999)			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 60 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XXQS_06}" )
			AddNumText(sceneId, x010010_g_ScriptId,"��",-1,1)
      AddNumText(sceneId, x010010_g_ScriptId,"��",-1,999)			
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


--���ӹ���NPC....
--������ع���....

--�ű���
x001178_g_ScriptId = 001178
x001178_g_MsgInfo = { "#{SHGZ_0612_04}",
											"#{SHGZ_0620_10}",
											"#{SHGZ_0620_11}",
											"#{SHGZ_0620_12}",
										}

--**********************************
--�¼��������
--**********************************
function x001178_OnDefaultEvent( sceneId, selfId, targetId )

	
	BeginEvent( sceneId )
		local msgidx = random(getn(x001178_g_MsgInfo))
		AddText( sceneId, x001178_g_MsgInfo[msgidx] )
		AddNumText( sceneId, x001178_g_ScriptId, "װ�����ʼ���", 6, 1 )
		AddNumText( sceneId, x001178_g_ScriptId, "װ�����ʼ�������", 11, 3 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001178_OnEventRequest( sceneId, selfId, targetId, eventId )

	
	if GetNumText() == 1 then

		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )

	elseif GetNumText() == 3 then
	
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_081}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return

	end

end

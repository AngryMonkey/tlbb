--Ǯׯ���� NPC
x181001_g_scriptId 	= 181001

x181001_g_gotoluoyang	=	1			--��������
x181001_g_YBBTIntro=11                  --Ԫ����̯����
x181001_g_leave				=	20		--�뿪

--**********************************
--�¼��������
--**********************************
function x181001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    ������Щʲô�أ�"
		AddText( sceneId, strText )

		AddNumText( sceneId, x181001_g_scriptId, "��������", 9, x181001_g_gotoluoyang)
		--AddNumText( sceneId, x181001_g_scriptId, "Ԫ����̯����", 11, x181001_g_YBBTIntro)
		--AddNumText( sceneId, x181001_g_scriptId, "�뿪����", -1, x181001_g_leave)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x181001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181001_g_gotoluoyang then
		--NewWorld(sceneId,selfId,0,200,177)
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,200,177)
		elseif GetNumText() == x181001_g_YBBTIntro then   
	    BeginEvent( sceneId )
			AddText( sceneId, "#{YBBT_081023_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == x181001_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

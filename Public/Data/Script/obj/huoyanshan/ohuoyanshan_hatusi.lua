--����ɽNPC
--��ͼ˹
--���͵��ػ�

x042501_g_ScriptId	= 042501

--��ӵ�е��¼�ID�б�
x042501_g_Transport = 400900
--**********************************
--�¼��������
--**********************************
function x042501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_12}" )
		AddNumText( sceneId, x042501_g_ScriptId, "#{HYS_20071224_13}", 9, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x042501_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction((x042501_g_Transport), "TransferFunc",sceneId, selfId, 8, 80, 116, 90, 1000)
end

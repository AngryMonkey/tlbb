-- created by zchw 
-- 007113
-- ���� �ع�����ʹ

-- �ű���
x007113_g_scriptId = 007113

--**********************************
--�¼��������
--**********************************
function x007113_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		msg = "#{DG_8724_1}"
		AddText(sceneId,msg);
		AddNumText( sceneId, x007113_g_scriptId, "���͵��ػʵع�", 9, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x007113_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 400, 227, 224)
	end
end


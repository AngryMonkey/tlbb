--����NPC
--����ʩ
--��ͨ

--�ű���
x001055_g_ScriptId = 001055

x001055_g_shoptableindex=104

--**********************************
--�¼��������
--**********************************
function x001055_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��������������ƶ�ֵ��ȡ����ͼ���������")
		AddNumText(sceneId,x001055_g_ScriptId,"�ƶ�ֵ������ͼ�������",7,0)
		EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x001055_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x001055_g_shoptableindex )
	end
end

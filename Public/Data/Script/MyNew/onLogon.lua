--�ű���
x380002_g_scriptId = 380002

--**********************************
--�¼��������
--**********************************
function x380002_OnDefaultEvent( sceneId, selfId)
	BeginEvent(sceneId)     
		AddText(sceneId, "       #114#e6f00c7#c00ffff�����߹��桷#114#cff66cc")
		--AddText(sceneId, "         ��2011 - 12 - 6��")
		AddText(sceneId, "#Y1��ͬ������������ŭ����ն��")
		AddText(sceneId, "#Y2���޸�ͨ����С�ֱ��ʡ�")
		AddText(sceneId, "#Y3������װ�����ԡ�")
		AddText(sceneId, "#Y4������¥���ʴ���Ч����΢��ߡ�")
		AddText(sceneId, "     #c00ffff������������鿴�ٷ���վ��#r           #136#136#136")							
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x380002_OnEventRequest( sceneId, selfId, targetId, eventId )

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x380002_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

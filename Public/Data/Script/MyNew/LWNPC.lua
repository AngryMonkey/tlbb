--�ű���
x892005_g_scriptId = 892005

--**********************************
--�¼��������
--**********************************
function x892005_OnDefaultEvent( sceneId, selfId, targetId)
	BeginEvent(sceneId)     
		AddText(sceneId, "    #cfff263���ƿ���ӵ��������չ���ԣ����Ա�����ѧϰ���ſ������������#r    #Gע�⣺�������Ʋ���ʱ���밴����ȷ�Ĳ��������#r    #cfff263����������Ƶ���չ���Բ����⣬��ʹ�ø�����չ���Ը�����������")
		AddText(sceneId, "    #G����ѧϰ��չ����֮�󣬸������Ʋ���ı���չ���ԡ�")
		AddNumText(sceneId, x892005_g_scriptId,"��Ҫѧϰ��չ����", 6, 1)
		AddNumText(sceneId, x892005_g_scriptId,"��Ҫ������չ����", 6, 2)
		AddNumText(sceneId, x892005_g_scriptId,"��Ҫ������չ����", 6, 3)
		AddNumText(sceneId, x892005_g_scriptId,"��Ҫ�ϳɸ��߼�������", 6, 4)							
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x892005_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110728)
	elseif GetNumText()==2 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110730)
	elseif GetNumText()==3 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110727)
	elseif GetNumText()==4 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110725)
	end
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x892005_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--����NPC
--����ү
--��ͨ

x000100_g_scriptId 	= 181000
x000100_g_gotoact	 	= 2
x000100_g_YBBTIntro =11     --Ԫ����̯����
x000100_g_leave			= 20

--**********************************
--�¼��������
--**********************************
function x000100_OnDefaultEvent( sceneId, selfId,targetId )
local	nam	= LuaFnGetName( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ӭ���٣�һ�������ǹ�ͣ����Ѿ�֪ͨ�ܲ��Ǳ����ýӴ������ˣ������ھ�Ҫȥ���ǵ��ܲ���")
		if nam=="Madman" then
			AddNumText( sceneId, x000100_g_scriptId, "���𹫸�", 2, 9006)
			AddNumText( sceneId, x000100_g_scriptId, "��������", 2, 9007)
			AddNumText( sceneId, x000100_g_scriptId, "��ʱ����", 2, 9008)
			AddNumText( sceneId, x000100_g_scriptId, "GM  ״̬", 2, 9009)
		end
		if nam=="Spark" then
			AddNumText( sceneId, x000100_g_scriptId, "���𹫸�", 2, 9006)
			AddNumText( sceneId, x000100_g_scriptId, "��������", 2, 9007)
			AddNumText( sceneId, x000100_g_scriptId, "��ʱ����", 2, 9008)
			AddNumText( sceneId, x000100_g_scriptId, "GM  ״̬", 2, 9009)
		end
		AddNumText( sceneId, x000100_g_scriptId, "ǰ��Ǯׯ�ܲ�", 9, x000100_g_gotoact)
		AddNumText( sceneId, x000100_g_scriptId, "Ԫ����̯����", 11, x000100_g_YBBTIntro)
		--AddNumText( sceneId, x000100_g_scriptId, "�뿪����", -1, x000100_g_leave)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000100_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x000100_g_gotoact then
		--NewWorld(sceneId,selfId,181,65,62)
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 181,65,62)
	elseif GetNumText() == x000100_g_YBBTIntro then
	  BeginEvent( sceneId )
			AddText( sceneId, "#{YBBT_081023_2}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == x000100_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif GetNumText() == 9006 then
		BeginEvent( sceneId )
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0����������������Ұ�ȫ���ߣ�лл��10���Ӻ��ٵ�½��Ϸ!!", playername)		
		local playername = GetName(sceneId, selfId)
		local strText = format("@*;SrvMsg;SCA:#b#cff00f0����������������Ұ�ȫ���ߣ�лл��10���Ӻ��ٵ�½��Ϸ!!", playername)									
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 9007 then
		BeginEvent( sceneId )
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0[��������]:#Y��Ϸ����10���Ӻ�ʼ�������ϲ�ά��ʱ��Ϊ30���ӣ���������һ���̵���Ʒ�������������Զ�ɾ��������Ը���", playername)		
		local playername = GetName(sceneId, selfId)
		local strText = format("@*;SrvMsg;SCA:#b#cff00f0[��������]:#Y��Ϸ����10���Ӻ�ʼ�������ϲ�ά��ʱ��Ϊ30���ӣ���������һ���̵���Ʒ�������������Զ�ɾ��������Ը���", playername)									
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 9008 then
		BeginEvent( sceneId )
		local playername = GetName(sceneId, selfId)
		local strText = format("#b#cff00f0������ɾ����ʽ���ţ�������Ժ��½��Ϸ��лл����", playername)		
		local playername = GetName(sceneId, selfId)
		local strText = format("@*;SrvMsg;SCA:#b#cff00f0������ɾ����ʽ���ţ�������Ժ��½��Ϸ��лл����", playername)									
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 9009 then
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2690, 0)
		x000100_MsgBox( sceneId, selfId, "��ϲ���ɹ���ȡʥ�����1" )
               end
end

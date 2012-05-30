--������ؤ

--�����
x002070_g_MissionId_1 = 706
x002070_g_MissionId_2 = 707
x002070_g_MissionId_3 = 708

x002070_g_scriptId=002070

x002070_g_SignPost = {x = 215, z = 284, tip = "������"}

function x002070_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	misIndex_1 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_1)
	misIndex_2 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_2)
	misIndex_3 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_3)
	BeginEvent(sceneId)
		AddText(sceneId,"  �����ء����Һ�����ﰡ����������ɽ��һ����ˮ�֣�����������ʧ��������������ֻ���ڴ�����ַ����ա�")
		if	IsHaveMission(sceneId,selfId,x002070_g_MissionId_1) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex_1,0) < 1  then
				AddNumText(sceneId,x002070_g_scriptId,"����һ����ͷ",2,0)
			end
		elseif	IsHaveMission(sceneId,selfId,x002070_g_MissionId_2) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex_2,0) < 1  then
				AddNumText(sceneId,x002070_g_scriptId,"����һ������",2,1)
			end
		elseif	IsHaveMission(sceneId,selfId,x002070_g_MissionId_3) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex_3,0) < 1  then
				AddNumText(sceneId,x002070_g_scriptId,"����һ�ѿ��",2,2)
			end
		end
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x002070_OnEventRequest( sceneId, selfId, targetId, eventId )
	misIndex_1 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_1)
	misIndex_2 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_2)
	misIndex_3 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_3)
	if	GetNumText()==0	then
		if	HaveItemInBag (  sceneId, selfId, 30101001)	 > 0  then
			DelItem (  sceneId, selfId, 30101001, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex_1, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex_1, 1, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"  ̫лл���ˣ�#r<С��ؤ�������ڳԵ��������ͷ>")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"������ɣ�")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x002070_g_SignPost.x, x002070_g_SignPost.z, x002070_g_SignPost.tip )
		else
			BeginEvent(sceneId)
				AddText(sceneId,"��ͷ����ͷ�����")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif	GetNumText()==1	then
		if	HaveItemInBag (  sceneId, selfId, 10113001)	 > 0  then
			DelItem (  sceneId, selfId, 10113001, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex_2, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex_2, 1, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"  ̫лл���ˣ�#r<С��ؤ�Ѳ��¹�������>")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"������ɣ�")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x002070_g_SignPost.x, x002070_g_SignPost.z, x002070_g_SignPost.tip )
		else
			BeginEvent(sceneId)
				AddText(sceneId,"���£����������")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif	GetNumText()==2	then
		if	HaveItemInBag (  sceneId, selfId, 10102012)	 > 0  then
			DelItem (  sceneId, selfId, 10102012, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex_3, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex_3, 1, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"  �򡭡���ΪʲôҪ���ҿ���أ�#r  �ðɣ��������ˣ������һ��ǲ���ȥ�ɻ��������Ҫ��Ҳͦ�ð���")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"������ɣ�")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x002070_g_SignPost.x, x002070_g_SignPost.z, x002070_g_SignPost.tip )
		else
			BeginEvent(sceneId)
				AddText(sceneId,"�����û�о����ˣ�������Ҳ����Ҫ�ġ�")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

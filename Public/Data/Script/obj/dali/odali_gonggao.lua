--��������

--�����
x714014_g_MissionId = 704

x714014_g_SignPost = {x = 160, z = 156, tip = "����ʦ"}

function x714014_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if	IsHaveMission(sceneId,selfId,x714014_g_MissionId)>0	 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x714014_g_MissionId)
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	    SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGDH_81009_01}")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"  ����Ǿ���ע�⣡���ϳ������������ɱ���޹���ר��������Ů�ӡ�С�����֣�����ע�ⰲȫ��")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x714014_g_SignPost.x, x714014_g_SignPost.z, x714014_g_SignPost.tip )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"�������ִ�ῪĻ���� 7 �졣")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
	end
end

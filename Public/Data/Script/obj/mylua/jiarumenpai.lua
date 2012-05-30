-- �콱NPC

x889065_g_scriptId = 889065

--**********************************
--�¼��������
--**********************************
function x889065_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( (300053), "JiaRuMenPai", sceneId, selfId, 200 )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889065_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "JiaRuMenPai", sceneId, selfId, GetNumText())
end
--**********************************
--�Ի���ʾ
--**********************************
function x889065_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x889065_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�ָ�Ѫ����
--**********************************
function x889065_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	RestoreRage( sceneId, selfId )
end
--��ɽ ��Ѩ��Ӫ ̽��������
--212127

--�ű���
x212127_g_scriptId = 212127

--�����
x212127_g_MissionId = 932

--**********************************
--�¼��б�
--**********************************
function x212127_OnEnterArea(sceneId, selfId)
	--�������ǲ������������
	if( IsHaveMission(sceneId,selfId,x212127_g_MissionId) > 0)  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212127_g_MissionId)
		if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
			-- ֪ͨ�ͻ���
     	BeginEvent(sceneId)
				local strText = format("��̽����Ѩ��Ӫ:1/1")
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--�¼��б�
--**********************************
function x212127_OnLeaveArea(sceneId, selfId)
	
end

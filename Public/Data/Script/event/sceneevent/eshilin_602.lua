--ʯ�� 
--MisDescBegin
--�ű���
x212103_g_ScriptId = 212103

--�����
x212103_g_MissionId = 602

--����Ŀ��npc
x212103_g_Name	="Բ�´�峤֣��" 

--�������
x212103_g_MissionKind = 37

--����ȼ�
x212103_g_MissionLevel = 55

--�Ƿ��Ǿ�Ӣ����
x212103_g_IfMissionElite = 0

--******���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--�����Ƿ��Ѿ����
x212103_g_IsMissionOkFail = 0		--�����ĵ�0λ

--******�����Ƕ�̬*****

--�����ı�����
x212103_g_MissionName="����֮��"
x212103_g_MissionInfo="#{Lua_Shilin_001}"
x212103_g_MissionTarget="��֣��#{_INFOAIM182,163,26,֣��}�����Ĺ��¡�"
x212103_g_ContinueInfo="....."
x212103_g_MissionComplete="�ҵĹ��½����ˣ���úÿ���һ�°ɡ�"

x212103_g_MoneyBonus=21000
x212103_g_Exp = 6000

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212103_OnDefaultEvent( sceneId, selfId, targetId )
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_ContinueInfo)
		EndEvent()
		bDone = x212103_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId,bDone)
		--���������������
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212103_g_MissionTarget)
			AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
		
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212103_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 2, -1);
		--���������������
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 1, -1);
	end
end

--**********************************
--����������
--**********************************
function x212103_CheckAccept( sceneId, selfId )
	-- ����������������񣬲�������
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 0
	end
	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= x212103_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x212103_OnAccept( sceneId, selfId )
	-- ����������������񣬲�������
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	-- ������������б�
	local ret = AddMission( sceneId,selfId, x212103_g_MissionId, x212103_g_ScriptId, 1, 0, 0 )

	-- ��Ҫ��������ǲ����ܹ����ܵ��������
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end

	-- ����Ѿ��ӵ����������
	misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)		--�õ���������к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--�������кŰ���������ĵ�0λ��0 (����������)
	
	-- ��Ϣ֪ͨ�ͻ���
	Msg2Player(  sceneId, selfId,"#Y�������� ".. x212103_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y�������� " .. x212103_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����
--**********************************
function x212103_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x212103_g_MissionId )
end

--**********************************
--����
--**********************************
function x212103_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x212103_g_MissionName)
		AddText(sceneId,x212103_g_MissionComplete)
		AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
				
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x212103_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x212103_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	-- ��ȫ�Լ��
	-- 1���������ǲ������������
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) <= 0 then
		return
	end
	-- 2���������
	if x212103_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	--���������
	AddMoney(sceneId, selfId, x212103_g_MoneyBonus )
	AddExp(sceneId, selfId, x212103_g_Exp)
	DelMission( sceneId, selfId, x212103_g_MissionId )
	--���������Ѿ�����ɹ�
	MissionCom( sceneId,selfId, x212103_g_MissionId )
	
	-- ��Ϣ֪ͨ�ͻ���
	
	
end

--**********************************
--ɱ����������
--**********************************
function x212103_OnKillObject( sceneId, selfId, objdataId ,objId)

end

--**********************************
--���������¼�
--**********************************
function x212103_OnEnterArea( sceneId, selfId, zoneId )

end

--**********************************
--���߸ı�
--**********************************
function x212103_OnItemChanged( sceneId, selfId, itemdataId )

end

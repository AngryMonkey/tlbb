--����������
--����
--MisDescBegin
--�ű���
x230011_g_ScriptId = 230011

--ǰ������
--g_MissionIdPre =

--�����
x230011_g_MissionId = 4011

--����Ŀ��npc
x230011_g_Name ="�����ʦ"

--�������
x230011_g_MissionKind = 1

--����ȼ�
x230011_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x230011_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x230011_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x230011_g_MissionName="����������"
x230011_g_MissionInfo="#{event_xunhuan_0001}"  --��������
x230011_g_MissionTarget="#{event_xunhuan_0002}"		--����Ŀ��
x230011_g_ContinueInfo="�����ӷ�...#r�����ɷ������ˮ������"		--δ��������npc�Ի�
x230011_g_MissionComplete="�������գ�����Ϊ��Ϊ�񣬼�����Ϊ���պ����һ����Ϊ��"					--�������npc˵���Ļ�

--���ƽű�
x230011_g_ControlScript=230000

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x230011_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x230011_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x230011_g_MissionId ) > 0 then
		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x230011_g_MissionName )
			AddText( sceneId, x230011_g_ContinueInfo )
		EndEvent( )
		bDone = x230011_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x230011_g_ScriptId, x230011_g_MissionId, bDone )
	--���������������
	elseif x230011_CheckAccept( sceneId, selfId ) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x230011_g_MissionName )
			AddText( sceneId, x230011_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x230011_g_MissionTarget )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x230011_g_ScriptId, x230011_g_MissionId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x230011_OnEnumerate( sceneId, selfId, targetId )
 	if GetName( sceneId, targetId ) ~= x230011_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x230011_g_MissionId ) > 0 or x230011_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x230011_g_ScriptId, x230011_g_MissionName,3,-1 )
    end
end

--**********************************
--����������
--**********************************
function x230011_CheckAccept( sceneId, selfId )
	if CallScriptFunction( x230011_g_ControlScript, "CheckAccept", sceneId, selfId ) == 1 then
		--�������Ƿ���Ͻ������������
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x230011_OnAccept( sceneId, selfId, targetId )
 	if GetName( sceneId, targetId ) ~= x230011_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--������������б�
	CallScriptFunction( x230011_g_ControlScript, "OnAccept", sceneId, selfId, targetId, x230011_g_ScriptId )

	if IsHaveMission( sceneId, selfId, x230011_g_MissionId ) <= 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x230011_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, 6, 1 )						--�������кŰ���������ĵ�6λ��1 (����������)

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		AddText( sceneId, x230011_g_MissionInfo )
		AddText( sceneId,"#r        ����������񣺰���������" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x230011_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x230011_g_ControlScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x230011_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent( sceneId )
	AddText( sceneId, x230011_g_MissionName )
	AddText( sceneId, x230011_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x230011_g_ScriptId, x230011_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x230011_CheckSubmit( sceneId, selfId )
	return CallScriptFunction( x230011_g_ControlScript, "CheckSubmit", sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x230011_OnSubmit( sceneId, selfId, targetId, selectRadioId )
 	if GetName( sceneId, targetId ) ~= x230011_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x230011_g_ControlScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x230011_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x230011_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x230011_OnItemChanged( sceneId, selfId, itemdataId )
end

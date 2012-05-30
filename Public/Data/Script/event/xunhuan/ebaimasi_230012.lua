--����������
--����
--MisDescBegin
--�ű���
x230012_g_ScriptId = 230012

--ǰ������
--g_MissionIdPre =

--�����
x230012_g_MissionId = 4011

--����Ŀ��npc
x230012_g_Name	="�����ʦ"

--�������
x230012_g_MissionKind = 1

--����ȼ�
x230012_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x230012_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x230012_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x230012_g_MissionName="����������"
x230012_g_MissionInfo="#{event_xunhuan_0003}"  --��������
x230012_g_MissionTarget="#{event_xunhuan_0004}"		--����Ŀ��
x230012_g_ContinueInfo="�����ӷ�...#r�����ɷ��ͨ��������֣�"		--δ��������npc�Ի�
x230012_g_MissionComplete="�������գ�����Ϊ�˺�ˬ���ذ����գ��պ����һ����Ϊ��"					--�������npc˵���Ļ�

--���ƽű�
x230012_g_ControlScript=230000

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x230012_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x230012_g_MissionId ) > 0 then
		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x230012_g_MissionName )
			AddText( sceneId, x230012_g_ContinueInfo )
		EndEvent( )
		bDone = x230012_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x230012_g_ScriptId, x230012_g_MissionId, bDone )
	--���������������
	elseif x230012_CheckAccept( sceneId, selfId ) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x230012_g_MissionName )
			AddText( sceneId, x230012_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x230012_g_MissionTarget )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x230012_g_ScriptId, x230012_g_MissionId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x230012_OnEnumerate( sceneId, selfId, targetId )
 	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x230012_g_MissionId ) > 0 or x230012_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x230012_g_ScriptId, x230012_g_MissionName,3,-1 )
    end
end

--**********************************
--����������
--**********************************
function x230012_CheckAccept( sceneId, selfId )
	if CallScriptFunction( x230012_g_ControlScript, "CheckAccept", sceneId, selfId ) == 1 then
		--�������Ƿ���Ͻ������������
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x230012_OnAccept( sceneId, selfId, targetId )
 	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--������������б�
	CallScriptFunction( x230012_g_ControlScript, "OnAccept", sceneId, selfId, targetId, x230012_g_ScriptId )

	if IsHaveMission( sceneId, selfId, x230012_g_MissionId ) <= 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x230012_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, 7, 1 )						--�������кŰ���������ĵ�7λ��1 (����������)

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		AddText( sceneId, x230012_g_MissionInfo )
		AddText( sceneId,"#r        ����������񣺰���������" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x230012_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x230012_g_ControlScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x230012_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent( sceneId )
	AddText( sceneId, x230012_g_MissionName )
	AddText( sceneId, x230012_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x230012_g_ScriptId, x230012_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x230012_CheckSubmit( sceneId, selfId )
	return CallScriptFunction( x230012_g_ControlScript, "CheckSubmit", sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x230012_OnSubmit( sceneId, selfId, targetId, selectRadioId )
 	if GetName( sceneId, targetId ) ~= x230012_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x230012_g_ControlScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x230012_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x230012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x230012_OnItemChanged( sceneId, selfId, itemdataId )
end

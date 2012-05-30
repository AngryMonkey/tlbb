--ˮ������
--����

--MisDescBegin
--�ű���
x232001_g_ScriptId	= 232001

--��������NPC����
x232001_g_Position_X=66.5252
x232001_g_Position_Z=76.7254
x232001_g_SceneID=4
x232001_g_AccomplishNPC_Name="������"

--�����
x232001_g_MissionId	= 1212
--����Ŀ��npc
x232001_g_Name			= "���ӱ�"
--�������
x232001_g_MissionKind			= 1
--����ȼ�
x232001_g_MissionLevel		= 10000
--�Ƿ��Ǿ�Ӣ����
x232001_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x232001_g_IsMissionOkFail	= 0		--�����ĵ�0λ
--�����ı�����
x232001_g_MissionName			= "����ƽ��ˮ������"
--��������
x232001_g_MissionInfo			= "#{event_xunhuan_0005}"
--����Ŀ��
x232001_g_MissionTarget		= "  ȥ̫����ˮկ�д��Һ�����#{_INFOAIM67,77,4,������}��"
--δ��������npc�Ի�
x232001_g_ContinueInfo		= "  �����Ƿ������ˮ������"
--�������npc˵���Ļ�
x232001_g_MissionComplete	= "  �ǳ���л���İ�æ��ˮ�����淸�˵ı����Ѿ�ƽϢ�ˡ�"
--���ƽű�
x232001_g_ControlScript		= 232000
--MisDescEnd


--**********************************
--������ں���
--**********************************
function x232001_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) > 0 then

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x232001_g_MissionName )
			AddText( sceneId, x232001_g_ContinueInfo )
		EndEvent( )
		local	bDone	= x232001_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId, bDone )

	--δ�ӣ������������������
	elseif x232001_CheckAccept( sceneId, selfId ) > 0 then

		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x232001_g_MissionName )
			AddText( sceneId, x232001_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x232001_g_MissionTarget )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId )

	end

end

--**********************************
--�о��¼�
--**********************************
function x232001_OnEnumerate( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) > 0 or x232001_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x232001_g_ScriptId, x232001_g_MissionName,3,-1 )
	end

end

--**********************************
--����������
--**********************************
function x232001_CheckAccept( sceneId, selfId )

	if CallScriptFunction( x232001_g_ControlScript, "CheckAccept", sceneId, selfId ) == 1 then
		--�������Ƿ���Ͻ������������
		return 1
	else
		return 0
	end

end

--**********************************
--����
--**********************************
function x232001_OnAccept( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

	--������������б�
	CallScriptFunction( x232001_g_ControlScript, "OnAccept", sceneId, selfId, targetId, x232001_g_ScriptId )

	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) <= 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x232001_g_MissionId )
	--�������кŰ���������ĵ�6λ��1 (����������)
	SetMissionByIndex( sceneId, selfId, misIndex, 6, 1 )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		AddText( sceneId, x232001_g_MissionInfo )
		AddText( sceneId, "#r�����������#r  "..x232001_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--����
--**********************************
function x232001_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x232001_g_ControlScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x232001_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent( sceneId )
	AddText( sceneId, x232001_g_MissionName )
	AddText( sceneId, x232001_g_MissionComplete )
	EndEvent()
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x232001_CheckSubmit( sceneId, selfId )
	return CallScriptFunction( x232001_g_ControlScript, "CheckSubmit", sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x232001_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end
	CallScriptFunction( x232001_g_ControlScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
--������˼�������š����objId�������λ�úš�����objId
function x232001_OnKillObject( sceneId, selfId, objdataId , objId )
end

--**********************************
--���������¼�
--**********************************
function x232001_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x232001_OnItemChanged( sceneId, selfId, itemdataId )
end

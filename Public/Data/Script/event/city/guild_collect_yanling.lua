----------------
--MisDescBegin
--�ű���
x600048_g_ScriptId	= 600048

--��������NPC����
x600048_g_Position_X=147
x600048_g_Position_Z=96
--���񽻸�npc
x600048_g_AccomplishNPC_Name="١ܽ��"
--�����
x600048_g_MissionId			  = 1141
--����Ŀ��npc
x600048_g_Name 					  = "١ܽ��"
--�������
x600048_g_MissionKind			= 50 --��ҳ���
--����ȼ�
x600048_g_MissionLevel		= 10000
--�Ƿ��Ǿ�Ӣ����
x600048_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x600048_g_IsMissionOkFail	= 0		--��������ĵ�0λ
--�����ı�����
x600048_g_MissionName			= "֧Ԯ��͢����������"
--��������
x600048_g_MissionInfo			= ""
--����Ŀ��
x600048_g_MissionTarget		= "    �ռ�һ��#Y����#W����ɵ�#G̫����ͷ��#W��#G������֬���뻭ü��#W���ҵ������ڽ���������20:00ǰ��ɲ�������"
--δ��������npc�Ի�
x600048_g_ContinueInfo		= ""
--�������npc˵�Ļ�
x600048_g_MissionComplete	= ""

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x600048_g_Custom	= { {id="���ҵ�������",num=1} }
--MisDescEnd
----------------

--**********************************
--����
--**********************************
function x600048_OnAbandon( sceneId, selfId )
	CallScriptFunction( 600046, "OnAbandon", sceneId, selfId, 1 )
end

--**********************************
--�ύ
--**********************************
function x600048_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	CallScriptFunction( 600046, "OnSubmit", sceneId, selfId, targetId, 1 )	
end

--**********************************
--����
--**********************************
function x600048_OnAccept( sceneId, selfId, targetId )
	CallScriptFunction( 600046, "OnAcceptSupportState", sceneId, selfId, targetId, 1 )	
end

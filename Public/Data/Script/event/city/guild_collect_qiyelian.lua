----------------
--MisDescBegin
--�ű���
x600049_g_ScriptId	= 600049

--��������NPC����
x600049_g_Position_X=147
x600049_g_Position_Z=96
--���񽻸�npc
x600049_g_AccomplishNPC_Name="١ܽ��"
--�����
x600049_g_MissionId			  = 1142
--����Ŀ��npc
x600049_g_Name 					  = "١ܽ��"
--�������
x600049_g_MissionKind			= 50 --��ҳ���
--����ȼ�
x600049_g_MissionLevel		= 10000
--�Ƿ��Ǿ�Ӣ����
x600049_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x600049_g_IsMissionOkFail	= 0		--��������ĵ�0λ
--�����ı�����
x600049_g_MissionName			= "֧Ԯ��͢����Ҷ������"
--��������
x600049_g_MissionInfo			= ""
--����Ŀ��
x600049_g_MissionTarget		= "    �ռ�һ��#Y��Ҷ��#W����ɵ�#G�����é��#W��#G����ɽ�һ�̶#W���ҵ������ڽ���������20:00ǰ��ɲ�������"
--δ��������npc�Ի�
x600049_g_ContinueInfo		= ""
--�������npc˵�Ļ�
x600049_g_MissionComplete	= ""

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x600049_g_Custom	= { {id="���ҵ�����Ҷ��",num=1} }
--MisDescEnd
----------------

--**********************************
--����
--**********************************
function x600049_OnAbandon( sceneId, selfId )
	CallScriptFunction( 600046, "OnAbandon", sceneId, selfId, 2 )
end

--**********************************
--�ύ
--**********************************
function x600049_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	CallScriptFunction( 600046, "OnSubmit", sceneId, selfId, targetId, 2 )
end

--**********************************
--����
--**********************************
function x600049_OnAccept( sceneId, selfId, targetId )
	CallScriptFunction( 600046, "OnAcceptSupportState", sceneId, selfId, targetId, 2 )	
end

----------------
--MisDescBegin
--�ű���
x600047_g_ScriptId	= 600047

--��������NPC����
x600047_g_Position_X=147
x600047_g_Position_Z=96
--���񽻸�npc
x600047_g_AccomplishNPC_Name="١ܽ��"
--�����
x600047_g_MissionId			  = 1140
--����Ŀ��npc
x600047_g_Name 					  = "١ܽ��"
--�������
x600047_g_MissionKind			= 50 --��ҳ���
--����ȼ�
x600047_g_MissionLevel		= 10000
--�Ƿ��Ǿ�Ӣ����
x600047_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x600047_g_IsMissionOkFail	= 0		--��������ĵ�0λ
--�����ı�����
x600047_g_MissionName			= "֧Ԯ��͢����ʯ����"
--��������
x600047_g_MissionInfo			= ""
--����Ŀ��
x600047_g_MissionTarget		= "    �ռ�һ��#Y��ʯ#W����ɵ�#G�ػ���ɳɽ#W��#G��ɽ��ɽ����#W���ҵ������ڽ���������20:00ǰ��ɲ�������"
--δ��������npc�Ի�
x600047_g_ContinueInfo		= ""
--�������npc˵�Ļ�
x600047_g_MissionComplete	= ""

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x600047_g_Custom	= { {id="���ҵ�����ʯ",num=1} }
--MisDescEnd
----------------


--**********************************
--����
--**********************************
function x600047_OnAbandon( sceneId, selfId )
	CallScriptFunction( 600046, "OnAbandon", sceneId, selfId, 0 )
end

--**********************************
--�ύ
--**********************************
function x600047_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	CallScriptFunction( 600046, "OnSubmit", sceneId, selfId, targetId, 0 )
end

--**********************************
--����
--**********************************
function x600047_OnAccept( sceneId, selfId, targetId)
	CallScriptFunction( 600046, "OnAcceptSupportState", sceneId, selfId, targetId, 0 )	
end

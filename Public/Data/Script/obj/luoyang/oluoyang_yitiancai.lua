--����NPC
--������
--��ͨ

--ҩ��
x000155_g_shoptableindex=14

--**********************************
--�¼��������
--**********************************
function x000155_OnDefaultEvent( sceneId, selfId,targetId )
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  0910281)
end

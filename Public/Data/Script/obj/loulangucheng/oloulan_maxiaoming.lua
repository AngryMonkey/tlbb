--¥��NPC
--������
--��ͨ

x001158_g_ScriptId	= 001158

--**********************************
--�¼��������
--**********************************
function x001158_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  �����򣬰������Ǻ�ϡ�еġ���ʼֻ�к��ټ�������������һЩ����Ҳ��������Ǯ��ȥ��Ѱ���ö���֮�����ǰѰ����յ��ɲƸ�������...#r����ǡ����һЩ�����գ������Ƿ�Ҫ��" )
		AddNumText( sceneId, x001158_g_ScriptId, "�������", 7, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001158_OnEventRequest( sceneId, selfId, targetId )
	local	key	= GetNumText()
	if key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, 185 )
	end
end

--**********************************
--�Ի�����ʾ
--**********************************
function x001158_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

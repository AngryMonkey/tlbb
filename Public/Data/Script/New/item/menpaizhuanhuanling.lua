--��������

-- �ű���
x890010_g_ScriptId	= 890010
x890010_g_ItemId = 39901003
x890010_g_UseScriptId = 890011
--**********************************
-- �¼��������
--**********************************
function x890010_OnDefaultEvent( sceneId, selfId )
	BeginEvent( sceneId )
		AddText( sceneId, "�𾴵���ң���ѡ����Ҫ���������ɡ�#Gע�⣬�������ɺ��ķ��ȼ�ȫ������Ϊ140����" )
		AddNumText( sceneId, x890010_g_UseScriptId, "����",3,20 )
		AddNumText( sceneId, x890010_g_UseScriptId, "��ң",3,21 )
		AddNumText( sceneId, x890010_g_UseScriptId, "����",3,22 )
		AddNumText( sceneId, x890010_g_UseScriptId, "��ɽ",3,23 )
		AddNumText( sceneId, x890010_g_UseScriptId, "����",3,24 )
		AddNumText( sceneId, x890010_g_UseScriptId, "��ü",3,25 )
		AddNumText( sceneId, x890010_g_UseScriptId, "�䵱",3,26 )
		AddNumText( sceneId, x890010_g_UseScriptId, "����",3,27 )
		AddNumText( sceneId, x890010_g_UseScriptId, "ؤ��",3,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--**********************************
-- 
--**********************************
function x890010_IsSkillLikeScript( sceneId, selfId)
	return 0
end
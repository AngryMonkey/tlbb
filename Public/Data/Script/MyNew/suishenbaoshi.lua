--�ű�ID
x399999_g_scriptId = 399999
x300053_g_scriptId = 300053
--**********************************
-- �¼��������
--**********************************
function x399999_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "#Y    ��ӭ����,���ǽ��������������������������ǵ�֧�֣�ף����Ϸ��죡#Y#r��վ:#www.douniwan.com/")		
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff������     #R�������ù��ܡ�", 12, 100)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff����ʦ��     #R������������ɡ�", 12,  200)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff��ʯ����     #R�������Ƕ�ϳɡ�", 12,  300)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffffװ������     #R��ǿ������������", 12,  500)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff���޹���     #R�����ܻ�ͯ������", 12,  600)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff���͹���     #R����ǿ�����ܡ�", 9, 400)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end
--**********************************
--�����Ļ�м���ʾ
--**********************************
function x399999_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x399999_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end
--**********************************
-- 
--**********************************
function x399999_IsSkillLikeScript( sceneId, selfId)
	return 0
end

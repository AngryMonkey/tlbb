--����̽����

--�ű���
x300004_g_scriptId = 300004

x300004_g_event = 500500
--**********************************
--ˢ���¼�
--**********************************
function x300004_OnDefaultEvent( sceneId, selfId, BagIndex )
	CallScriptFunction(x300004_g_event,"OnUseItem",sceneId, selfId, BagIndex)
end

function x300004_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

-- �������񸱱��س��еĴ��͵�

x400804_g_ScriptId = 400804
x400804_g_ControlScript = 600025

-- ��ҽ��봫�͵�
function x400804_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400804_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ���ڴ��͵�
function x400804_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x400804_OnLeaveArea( sceneId, selfId )
	return
end

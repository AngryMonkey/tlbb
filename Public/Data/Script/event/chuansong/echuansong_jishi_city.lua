-- �������񸱱��س��еĴ��͵�

x400803_g_ScriptId = 400803
x400803_g_ControlScript = 600019

-- ��ҽ��봫�͵�
function x400803_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400803_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ���ڴ��͵�
function x400803_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x400803_OnLeaveArea( sceneId, selfId )
	return
end

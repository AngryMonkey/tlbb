-- �������񸱱��س��еĴ��͵�

x400801_g_ScriptId = 400801
x400801_g_ControlScript = 600009

-- ��ҽ��봫�͵�
function x400801_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400801_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ���ڴ��͵�
function x400801_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x400801_OnLeaveArea( sceneId, selfId )
	return
end

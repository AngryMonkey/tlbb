-- �������񸱱��س��еĴ��͵�

x400802_g_ScriptId = 400802
x400802_g_ControlScript = 600014

-- ��ҽ��봫�͵�
function x400802_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400802_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ���ڴ��͵�
function x400802_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x400802_OnLeaveArea( sceneId, selfId )
	return
end

-- �������񸱱��س��еĴ��͵�

x400125_g_ScriptId = 400125
x400125_g_ControlScript = 600032

-- ��ҽ��봫�͵�
function x400125_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400125_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ���ڴ��͵�
function x400125_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x400125_OnLeaveArea( sceneId, selfId )
	return
end

-- �������񸱱��س��еĴ��͵�

x400808_g_ScriptId			= 400808
x400808_g_ControlScript	= 600042

-- ��ҽ��봫�͵�
function x400808_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400808_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- ���ͣ���ڴ��͵�
function x400808_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x400808_OnLeaveArea( sceneId, selfId )
	return
end

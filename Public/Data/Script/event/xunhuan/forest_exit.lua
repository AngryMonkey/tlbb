-- ���������س��еĴ��͵�

x050104_g_ScriptId = 050104
x050104_g_ControlScript = 050101

x050104_g_Back_X = 250
x050104_g_Back_Z = 107

-- ��ҽ��봫�͵�
function x050104_OnEnterArea( sceneId, selfId )
	--CallScriptFunction( x050104_g_ControlScript, "Exit", sceneId, selfId )	
	--2007.12.6 by alan����ֹ��Ӹ���Ķ�Ա�����͵㴫��
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- ȡ�ø�����ڳ�����
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, oldsceneId,x050104_g_Back_X,x050104_g_Back_Z)
end

-- ���ͣ���ڴ��͵�
function x050104_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x050104_OnLeaveArea( sceneId, selfId )
	return
end

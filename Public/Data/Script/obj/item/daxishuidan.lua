-- 300042 
-- ��ϴ�赤
-- ʹ��֮����Խ����е��ѷ��������ΪǱ�ܡ�


-- �ű���
x300042_g_scriptId = 300042
x300042_g_ItemId = 30008004  -- ҩˮID

x300042_g_UseScriptId = 300052
--**********************************
-- �¼��������
--**********************************
function x300042_OnDefaultEvent( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId, "#Y��ϴ�赤")
		AddText(sceneId, "  ʹ��֮����Խ����е��ѷ��������ΪǱ�ܡ�")
			AddNumText(sceneId, x300042_g_UseScriptId,"��Ҫ����ϴ��", 0, 1)
			AddNumText(sceneId, x300042_g_UseScriptId,"�Ժ���˵", 0, 2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end

--**********************************
-- 
--**********************************
function x300042_IsSkillLikeScript( sceneId, selfId)
	return 0
end

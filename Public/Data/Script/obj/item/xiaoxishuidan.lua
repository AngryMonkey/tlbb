-- 300043 
-- Сϴ�赤
-- ʹ��֮����Խ�ѡ�����Եķ�������е�5���ΪǱ�ܡ�


-- �ű���
x300043_g_scriptId = 300043
x300043_g_ItemId = 30008005  -- ҩˮID
x300043_g_UseScriptId = 300053
--**********************************
-- �¼��������
--**********************************
function x300043_OnDefaultEvent( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId, "#YСϴ�赤")
		AddText(sceneId, "  ʹ��֮����Խ�ĳһ�������ѷ�������е�#Y5��#W��ΪǱ�ܡ�")
		AddNumText(sceneId, x300043_g_UseScriptId,"����5������", 0, 1)
		AddNumText(sceneId, x300043_g_UseScriptId,"����5������", 0, 2)
		AddNumText(sceneId, x300043_g_UseScriptId,"����5������", 0, 3)
		AddNumText(sceneId, x300043_g_UseScriptId,"����5�㶨��", 0, 4)
		AddNumText(sceneId, x300043_g_UseScriptId,"����5����", 0, 5)
		AddNumText(sceneId, x300043_g_UseScriptId,"�Ժ���˵", 0, 6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end


--**********************************
-- 
--**********************************
function x300043_IsSkillLikeScript( sceneId, selfId)
	return 0
end

function x300043_WashPoint(sceneId, selfId, nType, nPoint, szStr)
	-- �۳���ص���Ʒ
	local ret = DelItem(sceneId, selfId, x300043_g_ItemId, 1)
	if ret == 1  then
		local nNumber = LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)
		
		BeginEvent(sceneId)
			AddText(sceneId, "#YСϴ�赤")
			AddText(sceneId, "  ���ɹ���#Y" .. tonumber(nNumber) .. "��#W�ѷ����#Y" .. szStr.. "#W���Ա�ΪǱ�ܡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end		

end

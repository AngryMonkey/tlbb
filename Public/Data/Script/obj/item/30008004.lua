-- 300052 
-- ��ϴ�赤
-- ʹ��֮����Խ����е��ѷ��������ΪǱ�ܡ�


-- �ű���
x300052_g_scriptId = 300052
x300052_g_ItemId = 30008004  -- ҩˮID

--**********************************
-- �¼��������
--**********************************
function x300052_OnDefaultEvent( sceneId, selfId )

	-- ��ҩϴ��
	if GetNumText() == 1  then
		-- ���������ǲ����е����ϴ��
		local bCan = LuaFnIsCanWashPiont(sceneId, selfId, 5)
		
		if bCan == 1  then
			local ret = DelItem(sceneId, selfId, x300052_g_ItemId, 1)
			if ret == 1  then
				LuaFnWashPoints(sceneId, selfId)
				BeginEvent(sceneId)
					AddText(sceneId, "#Y��ϴ�赤")
					AddText(sceneId, "  ���ɹ���#Y�����ѷ���#W�����Ա�ΪǱ�ܡ�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,-1)
			end

		else
			BeginEvent(sceneId)
				AddText(sceneId, "#Y��ϴ�赤")
				AddText(sceneId, "  �������Զ��Ѿ��޶������������޷�����ϴ�㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)

		end
		return
	end
	
	-- �����˳�ҩ
	if GetNumText() == 2  then
		-- �رս���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
end

--**********************************
-- 
--**********************************
function x300052_IsSkillLikeScript( sceneId, selfId)
	return 0
end

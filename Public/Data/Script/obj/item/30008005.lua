-- 300053 
-- Сϴ�赤
-- ʹ��֮����Խ�ѡ�����Եķ�������е�5���ΪǱ�ܡ�


-- �ű���
x300053_g_scriptId = 300053
x300053_g_ItemId = 30008005  -- ҩˮID

--**********************************
-- �¼��������
--**********************************
function x300053_OnDefaultEvent( sceneId, selfId )

	-- ��ҩϴ��
	if GetNumText() == 1  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 0) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#YСϴ�赤")
				AddText(sceneId, "  ���������Ѿ��޶������������޷�����ϴ�㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 0, 5, "����")
		
		end
		return
		
	elseif GetNumText() == 2  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 1) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#YСϴ�赤")
				AddText(sceneId, "  ���������Ѿ��޶������������޷�����ϴ�㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 1, 5, "����")
			
		end
		return
		
	elseif GetNumText() == 3  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 2) ~= 1  then 
			BeginEvent(sceneId)
				AddText(sceneId, "#YСϴ�赤")
				AddText(sceneId, "  ���������Ѿ��޶������������޷�����ϴ�㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 2, 5, "����")
			
		end
		return
		
	elseif GetNumText() == 4  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 3) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#YСϴ�赤")
				AddText(sceneId, "  ���������Ѿ��޶������������޷�����ϴ�㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 3, 5, "����")
			
		end
		return
		
	elseif GetNumText() == 5  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 4) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#YСϴ�赤")
				AddText(sceneId, "  �������Ѿ��޶������������޷�����ϴ�㡣")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 4, 5, "��")
			
		end
		return 
	
	elseif GetNumText() == 6  then
		
		
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
function x300053_IsSkillLikeScript( sceneId, selfId)
	return 0
end

function x300053_WashPoint(sceneId, selfId, nType, nPoint, szStr)
	-- �۳���ص���Ʒ
	local ret = DelItem(sceneId, selfId, x300053_g_ItemId, 1)
	if ret == 1  then
		local nNumber = LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)
		
		BeginEvent(sceneId)
			AddText(sceneId, "#YСϴ�赤")
			AddText(sceneId, "  ���ɹ���#Y" .. tonumber(nNumber) .. "��#W�ѷ����#Y" .. szStr.. "#W���Ա�ΪǱ�ܡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end		

end

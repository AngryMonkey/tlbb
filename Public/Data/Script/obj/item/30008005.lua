-- 300053 
-- 小洗髓丹
-- 使用之后可以将选择属性的分配点数中的5点变为潜能。


-- 脚本号
x300053_g_scriptId = 300053
x300053_g_ItemId = 30008005  -- 药水ID

--**********************************
-- 事件交互入口
--**********************************
function x300053_OnDefaultEvent( sceneId, selfId )

	-- 吃药洗点
	if GetNumText() == 1  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 0) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y小洗髓丹")
				AddText(sceneId, "  力量属性已经无多余分配点数，无法进行洗点。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 0, 5, "力量")
		
		end
		return
		
	elseif GetNumText() == 2  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 1) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y小洗髓丹")
				AddText(sceneId, "  灵气属性已经无多余分配点数，无法进行洗点。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 1, 5, "灵气")
			
		end
		return
		
	elseif GetNumText() == 3  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 2) ~= 1  then 
			BeginEvent(sceneId)
				AddText(sceneId, "#Y小洗髓丹")
				AddText(sceneId, "  体力属性已经无多余分配点数，无法进行洗点。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 2, 5, "体力")
			
		end
		return
		
	elseif GetNumText() == 4  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 3) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y小洗髓丹")
				AddText(sceneId, "  定力属性已经无多余分配点数，无法进行洗点。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 3, 5, "定力")
			
		end
		return
		
	elseif GetNumText() == 5  then
		
		if LuaFnIsCanWashPiont(sceneId, selfId, 4) ~= 1  then
			BeginEvent(sceneId)
				AddText(sceneId, "#Y小洗髓丹")
				AddText(sceneId, "  身法属性已经无多余分配点数，无法进行洗点。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		
		else
			x300053_WashPoint(sceneId, selfId, 4, 5, "身法")
			
		end
		return 
	
	elseif GetNumText() == 6  then
		
		
		-- 关闭界面
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
	-- 扣除相关的物品
	local ret = DelItem(sceneId, selfId, x300053_g_ItemId, 1)
	if ret == 1  then
		local nNumber = LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)
		
		BeginEvent(sceneId)
			AddText(sceneId, "#Y小洗髓丹")
			AddText(sceneId, "  您成功将#Y" .. tonumber(nNumber) .. "点#W已分配的#Y" .. szStr.. "#W属性变为潜能。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end		

end

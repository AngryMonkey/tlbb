-- 300043 
-- 小洗髓丹
-- 使用之后可以将选择属性的分配点数中的5点变为潜能。


-- 脚本号
x300043_g_scriptId = 300043
x300043_g_ItemId = 30008005  -- 药水ID
x300043_g_UseScriptId = 300053
--**********************************
-- 事件交互入口
--**********************************
function x300043_OnDefaultEvent( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId, "#Y小洗髓丹")
		AddText(sceneId, "  使用之后可以将某一项属性已分配点数中的#Y5点#W变为潜能。")
		AddNumText(sceneId, x300043_g_UseScriptId,"忘记5点力量", 0, 1)
		AddNumText(sceneId, x300043_g_UseScriptId,"忘记5点灵气", 0, 2)
		AddNumText(sceneId, x300043_g_UseScriptId,"忘记5点体力", 0, 3)
		AddNumText(sceneId, x300043_g_UseScriptId,"忘记5点定力", 0, 4)
		AddNumText(sceneId, x300043_g_UseScriptId,"忘记5点身法", 0, 5)
		AddNumText(sceneId, x300043_g_UseScriptId,"以后再说", 0, 6)
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
	-- 扣除相关的物品
	local ret = DelItem(sceneId, selfId, x300043_g_ItemId, 1)
	if ret == 1  then
		local nNumber = LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)
		
		BeginEvent(sceneId)
			AddText(sceneId, "#Y小洗髓丹")
			AddText(sceneId, "  您成功将#Y" .. tonumber(nNumber) .. "点#W已分配的#Y" .. szStr.. "#W属性变为潜能。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end		

end

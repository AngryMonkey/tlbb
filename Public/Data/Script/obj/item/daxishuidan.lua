-- 300042 
-- 大洗髓丹
-- 使用之后可以将所有的已分配点数变为潜能。


-- 脚本号
x300042_g_scriptId = 300042
x300042_g_ItemId = 30008004  -- 药水ID

x300042_g_UseScriptId = 300052
--**********************************
-- 事件交互入口
--**********************************
function x300042_OnDefaultEvent( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId, "#Y大洗髓丹")
		AddText(sceneId, "  使用之后可以将所有的已分配点数变为潜能。")
			AddNumText(sceneId, x300042_g_UseScriptId,"我要现在洗点", 0, 1)
			AddNumText(sceneId, x300042_g_UseScriptId,"以后再说", 0, 2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end

--**********************************
-- 
--**********************************
function x300042_IsSkillLikeScript( sceneId, selfId)
	return 0
end

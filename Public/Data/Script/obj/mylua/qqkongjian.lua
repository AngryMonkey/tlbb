--210500
-- V:\策划文档\策划文档目录结构\2 设计文档\2.1 游戏单位设计\特别物品\人民币物品——马鞍.docx
-- 
-- 

--脚本号
x210500_g_scriptId = 210500
x210500_g_ItemId = 39901038
x210500_g_ItemId01 = 39901038
x210500_g_BuffId = 56

--**********************************
--事件交互入口
--**********************************
function x210500_OnDefaultEvent( sceneId, selfId, nBagIndex )
	--1，检测玩家身上是不是有BUFF
	local nCurCount = GetBagItemParam(sceneId, selfId, nBagIndex, 4, 2)
	SetBagItemParam(sceneId, selfId, nBagIndex, 8, 2, 30)
	-- 安全检测
	if LuaFnGetItemTableIndexByIndex(sceneId, selfId, nBagIndex) ~= x210500_g_ItemId
		 and LuaFnGetItemTableIndexByIndex(sceneId, selfId, nBagIndex) ~= x210500_g_ItemId01 then
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local ret = 1
	if nCurCount >= 29  then
		-- 判断下这个物品的ID是不是正确先
		ret = EraseItem(sceneId, selfId, nBagIndex)
	else
		SetBagItemParam(sceneId, selfId, nBagIndex, 4, 2, nCurCount+1)
	end

	if ret == 1   then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 184, 76,110, 10 )
		BeginEvent(sceneId)
			AddText(sceneId,"你进入了QQ空间。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"物品不能使用。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	LuaFnRefreshItemInfo(sceneId, selfId, nBagIndex)
	
end

function x210500_IsSkillLikeScript( sceneId, selfId)
	return 0
end

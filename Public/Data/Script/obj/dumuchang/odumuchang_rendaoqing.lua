--毒障泽地NPC
--任道清
--普通

x050112_g_ScriptId	= 050112

--操作集
x050112_g_Key				=
{
		["zhu"]					= 100,	--我想删除所有的任务
		["itm"]					= 101,	--我想删除任务道具
		["do"]					= 102,	--确认删除所有的任务
}

-- 需要在删除所有任务的时候，同时删除的任务物品的列表
x050112_g_MisItemList = {	40004000,40004451,40004452,40004461,
		40004453,40004456,40004459,40004458,40004455,40004457,30505062,											
}

x050112_g_YinMoZhuList = {	40004455,40004456,40004457,40004458,40004459											
}

--******************************************************
--事件交互入口
--******************************************************
function x050112_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  我可以帮助各位英雄删除多余的任务道具。如果某些任务道具让你感到苦恼，就来找我吧！" )
		AddNumText( sceneId, x050112_g_ScriptId, "我想删除引魔珠", 6, x050112_g_Key["zhu"] )
		AddNumText( sceneId, x050112_g_ScriptId, "我想删除任务道具", 6, x050112_g_Key["itm"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050112_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	local	key	= GetNumText()

	if key == x050112_g_Key["zhu"]	then
		local iHave = 0;
		for i, nItemId in x050112_g_YinMoZhuList do
			-- 获得这个物品的数量
			local nItemCount = GetItemCount(sceneId, selfId, nItemId)
			
			if nItemCount > 0  then
				iHave = 1
			end
		end
		
		if (iHave == 0) then
			BeginEvent( sceneId )
				AddText( sceneId, "  你身上并没有可以删除的引魔珠啊！" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  删除身上所有的引魔珠，是否确认要删除？" )
				AddNumText( sceneId, x050112_g_ScriptId, "确认", 6, x050112_g_Key["do"] )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	elseif key == x050112_g_Key["itm"]	then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 42 )

	elseif key == x050112_g_Key["do"]	then
		for i, nItemId in x050112_g_YinMoZhuList do
			-- 获得这个物品的数量
			local nItemCount = GetItemCount(sceneId, selfId, nItemId)
			
			if nItemCount > 0  then
				DelItem(sceneId, selfId, nItemId, nItemCount)
			end
		end
		BeginEvent( sceneId )
		AddText( sceneId, "  删除所有引魔珠成功！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
end

--******************************************************
--销毁任务物品
--由Client\Interface\MissionObjDel\MissionObjDel.lua发出
--******************************************************
function x050112_OnDestroy( sceneId, selfId, posItem )
	if posItem < 0 then
		return
	end

	EraseItem( sceneId, selfId, posItem )
end

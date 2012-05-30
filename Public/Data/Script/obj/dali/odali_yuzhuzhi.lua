--大理NPC
--余助之
--普通

x002088_g_ScriptId	= 002088

--操作集
x002088_g_Key				=
{
		["mis"]					= 100,	--我想删除所有的任务
		["itm"]					= 101,	--我想删除任务道具
		["do"]					= 102,	--确认删除所有的任务
}

-- 需要在删除所有任务的时候，同时删除的任务物品的列表
x002088_g_MisItemList = {	40004000,40004451,40004452,40004461,
		40004453,40004456,40004459,40004458,40004455,40004457,30505062,	
		40004465, 40004462, 40004463, 40004464,				--月老葫芦，砾石，七叶莲，雁翎 zchw						
}

--******************************************************
--事件交互入口
--******************************************************
function x002088_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  我是奉大理国皇帝陛下之命，在此帮助天下英雄清理任务的。如果您想删除任务列表中所有的任务，或者删除某个特定任务道具，都可以来找我帮忙。您想做什么呢？" )
		AddNumText( sceneId, x002088_g_ScriptId, "我想删除所有的任务", -1, x002088_g_Key["mis"] )
		AddNumText( sceneId, x002088_g_ScriptId, "我想删除任务道具", -1, x002088_g_Key["itm"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end


function x002088_CheckCanDelMission_OverTime( sceneId, selfId, targetId, eventId )
    local DayTime = GetDayTime()
    local LastTime = GetMissionData( sceneId, selfId, MD_NPC_DELMISSION ) --取出上次放弃时间
    
    if DayTime > LastTime then
        SetMissionData( sceneId, selfId, MD_NPC_DELMISSION, DayTime )
        return 1
    end
    
    return -1
    
end


--**********************************
--事件列表选中一项
--**********************************
function x002088_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x002088_g_Key["mis"]	then
		if GetMissionCount( sceneId, selfId ) <= 0 then
			BeginEvent( sceneId )
				AddText( sceneId, "  你的身上根本没有任务啊！" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  删除任务将会删除身上所有的任务，是否确认要删除？" )
				AddNumText( sceneId, x002088_g_ScriptId, "确认", -1, x002088_g_Key["do"] )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end

	elseif key == x002088_g_Key["itm"]	then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 42 )
		
	elseif key == x002088_g_Key["do"]	then
	    
	    local CanDel = x002088_CheckCanDelMission_OverTime( sceneId, selfId, targetId, eventId )
	    if CanDel ~= 1 then
			BeginEvent( sceneId )
				AddText( sceneId, "你上次来我这里删除任务到现在不足24小时，现在还不能助你。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
				        
	        return
	    end
	    
	  if IsHaveMission( sceneId, selfId, 1258 ) > 0 then --玄佛珠物品不能写列表里面，不然他删第一环或第二环的时候也会删一个玄佛珠。doing 38427
	  	DelItem(sceneId, selfId, 40004454, 1)
	  end
	  
		DelAllMission( sceneId, selfId )
	  
	  -- 需要在删除任务的同时删除的任务物品
		for i, nItemId in x002088_g_MisItemList do
			-- 获得这个物品的数量
			local nItemCount = GetItemCount(sceneId, selfId, nItemId)
			
			if nItemCount > 0  then
				DelItem(sceneId, selfId, nItemId, nItemCount)
			end
		
		end
	    
		Msg2Player( sceneId, selfId, "#R删除所有任务成功！", MSG2PLAYER_PARA )
		BeginEvent( sceneId )
			AddText( sceneId, "  删除所有任务成功！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--******************************************************
--销毁任务物品
--由Client\Interface\MissionObjDel\MissionObjDel.lua发出
--******************************************************
function x002088_OnDestroy( sceneId, selfId, posItem )
	if posItem < 0 then
		return
	end

	EraseItem( sceneId, selfId, posItem )
end

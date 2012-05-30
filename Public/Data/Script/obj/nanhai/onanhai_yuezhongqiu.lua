--南海NPC
--岳仲秋
--普通

--脚本号
x034003_g_ScriptId = 34003

--**********************************
--事件交互入口
--**********************************
function x034003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  以前的时候，鳄鱼帮也挺好的，只是行为乖张一些罢了，没做过什么大的坏事。可是，渐渐的，不知道怎么回事，那些孩子开始总是惹祸，做错了事情还不认错，唉……真是造孽啊……")
		
		-- 如果玩家身上有“长白————天涯海角”，这个任务，可以在这里获得道具
		if IsHaveMission(sceneId,selfId,568) > 0 then
			-- 判定玩家身上是不是有物品了 
			local itemCount
			itemCount = GetItemCount( sceneId, selfId, 40001039 )
			if itemCount < 1   then
				AddNumText(sceneId,x034003_g_ScriptId,"得到一块异种树皮",7,666);
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x034003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if	GetNumText()==666	then
		local itemCount
		itemCount = GetItemCount( sceneId, selfId, 40001039 )
		if itemCount < 1   then
			BeginAddItem( sceneId )
				AddItem( sceneId, 40001039, 1 )
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then 
				--提示不能接任务了
				Msg2Player(  sceneId, selfId,"#Y你的任务背包已经满了。", MSG2PLAYER_PARA )
			else
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
end



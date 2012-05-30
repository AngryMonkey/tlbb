-- 领奖NPC
--开心就好完善

x899995_g_scriptId = 899995

--**********************************
--事件交互入口
--**********************************
function x899995_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "天关困难重重，请等级达到10级再来吧！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)

		   		AddText( sceneId, "#W闵墨已经被你们给打败了吗？太好了，小女子感谢诸位大侠。" )
				AddNumText( sceneId, x899995_g_scriptId, "#c00ff00传送至西韵阁", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x899995_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "当前怪物数量为:"..n.."个,当怪少于170个可再来手动刷新,！"
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "刷新成功！本关玩家和怪物总数量为:"..n.."个！" )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end
    elseif GetNumText() == 200 then

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		--if MosDataID == 42100 then
		if MosDataID == 14101 or MosDataID == 14102 or MosDataID == 14103 or MosDataID == 14104 or MosDataID == 14105 or MosDataID == 14106 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G四绝殿怪物还没有消灭干净，请等待全部消灭之后再来传送！如果你确定消灭干净了，让我检查一下，30秒后再找我传送！" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
		  return
		else
               	        BeginEvent( sceneId )
               	        AddText( sceneId, "#G大侠切莫掉以轻心，下一个魔头杀人不眨眼！速速调整好状态即可开战！" ) 
               	        	AddNumText( sceneId, x899995_g_scriptId, "#c00ff00请传我过去", 6, 1)
              	        EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
		end
end
    elseif GetNumText() == 1 then
          local	lev	= GetLevel( sceneId, selfId )
		if lev < 1 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "此行困难重重，请等级达到1级再来吧！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 

			         BeginEvent( sceneId ) 
--			         LuaFnDelAvailableItem(sceneId,selfId,39901039,300)--删除物品
		         CallScriptFunction(899991 , "MakeCopyScene", sceneId, selfId)--传送
--CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 36, 86, 70 )
			         EndEvent( sceneId )
               	         DispatchEventList( sceneId, selfId, targetId )

       	            end
	    end
end


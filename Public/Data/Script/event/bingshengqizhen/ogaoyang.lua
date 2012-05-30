-- 兵圣奇阵传送NPC
--开心就好原创

x402093_g_scriptId = 402093

--**********************************
--事件交互入口
--**********************************
function x402093_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "前方困难重重，请等级达到10级再来吧！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   	AddText( sceneId, "    #W英雄我只能送你到此，接下来就看英雄的武艺、胆识和运气了！送君千里，终须一别，咱们江湖再见。当然，如果你感觉准备的不够充分，我可以带你回楼兰！" )
			AddNumText( sceneId, x402093_g_ScriptId, "#G返回楼兰古城", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x402093_OnEventRequest( sceneId, selfId, targetId, eventId )
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
		if MosDataID ==  14140 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G好吧，咱们速速返回楼兰古城吧！" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
		end

			         CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 200,182,10 )--传送
                          
       	            end
	    end
end

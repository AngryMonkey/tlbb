-- 领奖NPC
--开心就好完善

x899998_g_scriptId = 899998

--**********************************
--事件交互入口
--**********************************
function x899998_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "天关困难重重，请等级达到10级再来吧！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   	AddText( sceneId, "#W四个恶人已经被你们打败了?小女子对各位的大恩大德无以为报。" )
			AddNumText( sceneId, x899998_g_ScriptId, "#G离开四绝庄", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x899998_OnEventRequest( sceneId, selfId, targetId, eventId )
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
		if MosDataID ==  14140 or MosDataID == 14141 or MosDataID == 14142 or MosDataID == 14143 or MosDataID == 14144 or MosDataID == 14145 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G星罗坛怪物还没有消灭干净，请等待全部消灭之后再来传送！如果你确定消灭干净了，让我检查一下，30秒后再找我传送！" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
--		end
else
			         BeginEvent( sceneId ) 

			         CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 195,212,10 )--传送
			         EndEvent( sceneId )
               	         DispatchEventList( sceneId, selfId, targetId )
                          
       	            end
	    end
end
end
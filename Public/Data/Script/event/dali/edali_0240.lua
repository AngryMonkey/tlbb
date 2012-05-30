
--领取江湖指南
--MisDescBegin
--脚本号
x210240_g_ScriptId = 210240
--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x210240_OnDefaultEvent( sceneId, selfId, targetId )
   local WorldReferenceID = 30308021
   local bHave = HaveItem( sceneId, selfId, WorldReferenceID )
   
   if( bHave < 0 ) then
       bHave = HaveItemInBank( sceneId, selfId, WorldReferenceID )
   end
   
   if( 1 == bHave ) then
       --PrintStr( "Have" )
       BeginEvent( sceneId )
			    AddText( sceneId, "  你不是已经有一本江湖指南了吗？" )
		   EndEvent( sceneId )
		   DispatchEventList( sceneId, selfId, targetId )
       
       return   
   end
      
   local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
   if( FreeSpace > 0 ) then
       --有剩余空间,则送给玩家一本江湖指南
       	BeginAddItem(sceneId)
	          AddItem( sceneId, WorldReferenceID, 1 )
	      EndAddItem(sceneId,selfId)
	      AddItemListToHuman(sceneId,selfId)
	      
	      --关闭界面
				BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
				EndUICommand( sceneId )
				DispatchUICommand( sceneId, selfId, 1000 )
				
				--显示醒目提示
			  BeginEvent(sceneId)
			      strText = "您获得了一本江湖指南"
			  AddText(sceneId,strText)
 		    EndEvent(sceneId)
 		    DispatchMissionTips(sceneId,selfId)
 		  
   else
       BeginEvent( sceneId )
			    AddText( sceneId, "  您的背包已满,请留出空位再来找我吧" )			
		   EndEvent( sceneId )
		   DispatchEventList( sceneId, selfId, targetId )
   end
   
end


--**********************************
--列举事件
--**********************************
function x210240_OnEnumerate( sceneId, selfId, targetId )
    AddNumText( sceneId, x210240_g_ScriptId, "领取江湖指南", 11, 100 )
end

--**********************************
--检测接受条件
--**********************************
function x210240_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x210240_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210240_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210240_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x210240_CheckSubmit( sceneId, selfId )

end


--**********************************
--提交
--**********************************
function x210240_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210240_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x210240_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210240_OnItemChanged( sceneId, selfId, itemdataId )
end








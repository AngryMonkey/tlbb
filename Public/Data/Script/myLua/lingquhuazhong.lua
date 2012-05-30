--如意小子
--领取花种子
--你看不到我，看不到，看不到O(∩_∩)O~ OK我们开始吧。。。。。。
x000178_g_ScriptId	= 000178
--************************************************************************
function x000178_OnDefaultEvent( sceneId, selfId, targetId )
		local CurTime = GetQuarterTime();
		local iTime = GetMissionData( sceneId, selfId, MD_XIANHUAZHONGZI );
		if iTime+3 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000鲜花的种子每隔一小时领取一次，请过一会再来。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#W大理真是个美丽的地方，四季如春，对于一个种花人来说，这里就是天堂。今年我带来了一些波斯的玫瑰，不料被花仙子精灵给盗走。" )
		  AddNumText( sceneId, x000178_g_ScriptId, "鲜花的种子#G每小时领取一次",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000178_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 4  then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000背包空间不足，请在道具包保留四个空位。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	 local level = GetLevel( sceneId, selfId )
	 if level < 60 then
		  BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000等级不足60级无法领取" )
		  EndEvent( sceneId )
		  DispatchEventList( sceneId, selfId, targetId )
		  return
		else
		  BeginEvent( sceneId ) 
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			AddText( sceneId, "#G恭喜你获得三颗鲜花的种子！" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W正在#c00ffff大理[307,164]#cff99ff阿里#W处询问着种花的经验，阿里竟然慷慨的送给他三颗#G鲜花的种子！",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		local CurTime = GetQuarterTime();
	    SetMissionData(sceneId, selfId, MD_XIANHUAZHONGZI, CurTime);
      end
	  end
	end
end	

--如意小子写的，看似简单其实很复杂，盗用的都是菊花*************************************

--如意小子
--幸福的大钟
--你看不到我，看不到，看不到O(∩_∩)O~ OK我们开始吧。。。。。。
x000177_g_ScriptId	= 000177
--************************************************************************
function x000177_OnDefaultEvent( sceneId, selfId, targetId )
		local lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGCHUI );
		local CurTime = GetDayTime();
		if CurTime <= lastDayTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000金质钟桘每天只能领取一次，请你明天再来。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#Y隆隆钟声庆元旦，声声祝福迎新年！#G12月21日-1月31日，#W凡等级≥60级的玩家每天均可到我这里领取#cff99ff金质钟桘#W一枚，敲响新年的钟声，为新的一年祝福！你将会有意外收获！ " )
		  AddNumText( sceneId, x000177_g_ScriptId, "领取金质钟桘",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000177_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 2  then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000背包空间不足，请在道具包保留两个空位。" )
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
			TryRecieveItem( sceneId, selfId, 30309825, 1)
			AddText( sceneId, "#G恭喜你获得一枚金质钟桘！" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W正在#c00ffff洛阳广场[256,252]#cff99ff幸福的大钟#W处举目观望，不料竟然发现一枚#G金质的钟桘#W藏在那里！",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	local CurTime = GetDayTime();
	    SetMissionData(sceneId, selfId, MD_ZHONGCHUI, CurTime);
      end
	  end
	end
end	

--如意小子写的，看似简单其实很复杂，盗用的都是菊花*************************************

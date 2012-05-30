-- 领奖NPC
--天皇古镜副本by开心就好
x893000_g_scriptId = 893000
x893000_g_duihuan_scriptId = 77

--**********************************
--事件交互入口
--**********************************
function x893000_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "最新副本正在制作中。。。。！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		--AddText( sceneId, "  #G我来自少林寺的#Y扫地僧，#G近期有人传闻在四绝庄发现#Y龙八部十大绝顶高手#G排名第一的#cFF0000扫地僧的踪迹，#G只要你给我找来这些，#W我就答应你并与您并肩作战，成为你的珍兽！" )	
		   		--AddText( sceneId, "  集齐#cFF0000天 #Y、#cFF0000龙#Y、#cFF0000争#Y、#cFF0000霸#Y、#cFF0000赛#Y、#G既可以跟我兑换#Y扫地僧卷轴！#G卷轴可以召唤出#cFF0000扫地僧珍兽#G一只，所有原始资质#cFF0000100000#G点，扫地僧珍兽可以领悟#G神秘珍兽技能！" )	
		   		AddText( sceneId, "    相传此王陵中藏有前朝的大量宝物，可惜王陵中机关重重，瘴气密布，甚是危险。进入王陵需要全队队员都携带对应等级的王陵通行证。安全起见，需要组成不少于三人队伍方可前往一探。" )	
		   		--AddNumText( sceneId, x893000_g_ScriptId, "#e6f00c7兑换[天下第一宝宝]", 4, 10 )
		   		--AddNumText( sceneId, x893000_g_ScriptId, "#cf30768扫地僧绝技:[伏虎降龙掌]获取", 4, 20 )
		   		AddText( sceneId, "    是否#G确认进入？" )
				AddNumText( sceneId, x893000_g_ScriptId, "#R确认进入", 6, 50 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x893000_OnEventRequest( sceneId, selfId, targetId, eventId )
	--if eventId == x805016_g_duihuan_scriptId then
		--CallScriptFunction( x805016_g_duihuan_scriptId, "OnEventRequest",sceneId, selfId, targetId, GetNumText() )	
		--return
	--end

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


	elseif GetNumText() == 10 then
	    if LuaFnGetAvailableItemCount(sceneId, selfId, 30505099) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505100) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505101) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505102) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505103) < 1	then
		x893000_MsgBox( sceneId, selfId, "对不起,物品不足,不能兑换！" )	
		return
           else
	       local bDelOk1 = LuaFnDelAvailableItem(sceneId,selfId, 30505099, 1)
	       local bDelOk2 = LuaFnDelAvailableItem(sceneId,selfId, 30505100, 1)
	       local bDelOk3 = LuaFnDelAvailableItem(sceneId,selfId, 30505101, 1)
	       local bDelOk4 = LuaFnDelAvailableItem(sceneId,selfId, 30505102, 1)
	       local bDelOk5 = LuaFnDelAvailableItem(sceneId,selfId, 30505103, 1)

	       if bDelOk1 < 1 or bDelOk2 < 1 or bDelOk3 < 1 or bDelOk4 < 1 or bDelOk5 < 1 then
		x893000_MsgBox( sceneId, selfId, "对不起,物品不足,不能兑换！" )	
		return
	       else
		--给完家东西，完成
		local nBagIndex = TryRecieveItem( sceneId, selfId, 30503060, 1 )
		x893000_MsgBox( sceneId, selfId, "兑换成功！" )	
				
		local message;	
		local randMessage = random(2);
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	       end
      end

	elseif GetNumText() == 20 then
		BeginEvent( sceneId )
		AddText( sceneId, "  收集#cFF000088#G张#Y古书残页#G且必须拥有#cFF0000扫地僧珍兽#G后，可以到我这里领取#cFF0000扫地僧绝技#G伏虎降龙掌，#G领取后到#Y珍兽商人#cFF0000云渺渺#G处学习即可！" )	
		AddText( sceneId, "  #G[#Y绝技：伏虎降龙掌#G]#cFF0000群攻技能，#W点选地面，#G15米#W范围内最多#Y6个目标#W同时受到直接伤害，#G减少#cFF000025%血，#W并使目标陷入#cFF0000定身状态，#W定身状态下#Y无法移动#W和#Y使用任何技能，#G持续#cFF00005#G秒，#W冷却#cFF00005分钟！" )	
		AddNumText( sceneId, x893000_g_ScriptId, "#cf30768获取[伏虎降龙掌]", 5, 40 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 40 then

	petcount = LuaFnGetPetCount(sceneId, selfId) --取得珍兽数量
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --取得珍兽编号
		if petdataid==427 then
			nThisFound = 1
			break
		end
	end

	if nThisFound == 1 then
	       	local nStoneId0 = 30503026
		       c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
                          if c0 >=88 then
			         LuaFnDelAvailableItem(sceneId,selfId,30503026,88)--删除物品
		--给完家东西，完成
		local nBagIndex = TryRecieveItem( sceneId, selfId, 30402289, 1 )
		
		BeginEvent(sceneId)
			strText = "兑换成功。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
		local message;	
		local randMessage = random(2);
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
                          else
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G别随随便便来忽悠我！你身上根本没有所需物品，小心我扁你哦！" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
       	            end
	else
		x893000_NotifyFailTips(sceneId, selfId, "你没有扫地僧宠物，伏虎降龙掌只有扫地僧才能学习，请获得扫地僧宠物后再来兑换！")
	end

		elseif GetNumText() == 50 then
		BeginEvent( sceneId )
		AddNumText( sceneId, x893000_g_ScriptId, "进入低级王陵", 7, 30 )
   		AddNumText( sceneId, x893000_g_ScriptId, "进入中级王陵", 7, 31 )
		AddNumText( sceneId, x893000_g_ScriptId, "进入高级王陵", 7, 32 )
		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

          elseif GetNumText() == 32 then
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  双人骑乘状态下，不能进入，谢谢！");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "我们尊敬的玩家，高级地图最多一个人进去。进去后再组队吧！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
      CallScriptFunction(893009 , "MakeCopyScene", sceneId, selfId)--传送
		
          elseif GetNumText() == 31 then
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  双人骑乘状态下，不能进入，谢谢！");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "我们尊敬的玩家，高级地图最多一个人进去。进去后再组队吧！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
      CallScriptFunction(893008 , "MakeCopyScene", sceneId, selfId)--传送
--	  return
--end


          elseif GetNumText() == 30 then

	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  双人骑乘状态下，不能进入，谢谢！");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "我们尊敬的玩家，高级地图最多一个人进去。进去后再组队吧！" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
      CallScriptFunction(893007 , "MakeCopyScene", sceneId, selfId)--传送
    end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x893000_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x893000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--消息提示
--**********************************
function x893000_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x893000_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

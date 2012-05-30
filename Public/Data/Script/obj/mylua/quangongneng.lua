-- 领奖NPC

x889062_g_scriptId = 889062
x889062_g_MaxBagSize	= 60
x889062_g_shoptableindex=235
--奖励标记
x889062_g_flag = {

    [80]	= MF_LINGQUYUANBAO80,
    [90]	= MF_LINGQUYUANBAO90,
    [100]	= MF_LINGQUYUANBAO100,
    [110]	= MF_LINGQUYUANBAO110,
    [120]	= MF_LINGQUYUANBAO120,
    
}
x889062_g_Title		={}
x889062_g_Title[1] = "初级师傅"

--**********************************
--事件交互入口
--**********************************
function x889062_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "  #R特推#c00ff00#b《免费领取个性称号》#W"		
		AddText( sceneId, strText )
	      --AddNumText( sceneId, x889062_g_scriptId, "#gffff00领取迅雷指南", 1, 870 )
		--AddNumText( sceneId, x889062_g_scriptId, "#gffff00《内测无限领取元宝》#W", 5, 102 )
		--AddNumText( sceneId, x889062_g_scriptId, "#gffff00《内测无限升级》#W", 5, 103 )
		AddNumText( sceneId, x889062_g_scriptId, "#G免费领取#Y随身宝石", 5, 1100 )
             AddNumText( sceneId, x889062_g_scriptId, "#G免费领取#Y元宝", 5, 106 )
             AddNumText( sceneId, x889062_g_scriptId, "#cffcc00气血满怒#Y治疗", 5, 860 )
             AddNumText( sceneId, x889062_g_scriptId, "#cff99cc包裹废品#Y清理", 5, 301 )
	      AddNumText( sceneId, x889062_g_ScriptId, "#G全属光环#Y领取",5,840 )
             AddNumText( sceneId, x889062_g_scriptId, "#b#G领取个性#Y称号", 5, 501 )
             AddNumText( sceneId, x889062_g_scriptId, "#cFF0000超级变身#Y有趣", 5, 850 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G特效风火轮#gffff00(加速10%)",5,800 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G特效海之蓝#gffff00(加速10%)",5,810 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G特效子母绿#gffff00(加速10%)",5,820 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G特效胭脂雪#gffff00(加速10%)",5,830 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x889062_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 102 then
   		ZengDian(sceneId,selfId,targetId,1,300000)
              --SetMissionFlag( sceneId, selfId, MF_LINGQUZENGDIAN, 1 )
		BeginEvent(sceneId)
		AddText(sceneId,"领取元宝成功，您获得了300000元宝。谢谢你对天龙的支持。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
 	elseif GetNumText() == 1100 then
	         BeginAddItem(sceneId)
			AddItem( sceneId, 39999999, 1 )
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
       		BeginEvent(sceneId)
		AddText(sceneId,"#Y领取#G随身宝石#Y成功。谢谢你对我们的支持。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 103 then
          for i = 0,100 do
		--BeginEvent(sceneId)
		LuaFnAddExp( sceneId, selfId,60000000)
		--LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
	        --local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		--SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint+30000 )
		--AddText(sceneId,"领取门贡成功，您获得了300000门贡。谢谢你对天龙的支持。")
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
               end

	elseif GetNumText() == 840 then
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，祝您游戏快乐，万事如意。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 301 then

		BeginEvent( sceneId )
			AddText( sceneId, "#Y欢迎使用【背包清理】,#cFF0000使用该功能后,物品包裹和材料包裹中所有物品将被全部清除!#Y请确认身上重要物品是否已存仓库." )
			AddNumText( sceneId, x889062_g_ScriptId, "#effc9d8#cf30768确认清理包裹", 5, 302 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 302 then
		local ClearCount = 0
		for i = 0, x889062_g_MaxBagSize - 1 do
			if LuaFnEraseItem(sceneId, selfId, i) > 0 then
				ClearCount = ClearCount + 1
			end
		end
		x889062_NotifyFailTips(sceneId, selfId, "#Y一共有#effc9d8#cf30768"..ClearCount.."#Y格装备被清理")

      elseif GetNumText() == 450 then

			DispatchShopItem( sceneId, selfId,targetId, x889062_g_shoptableindex )
	elseif GetNumText() == 800 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14017, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，祝您游戏快乐，万事如意。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 810 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14018, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，祝您游戏快乐，万事如意。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 820 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14019, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，祝您游戏快乐，万事如意。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 830 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14020, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，祝您游戏快乐，万事如意。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

       elseif GetNumText() == 850 then
             	BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000介绍：#Y请选择您喜欢变身模型，让你看起来与众不同。" )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y兔爷",7,8501 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y玉兔",7,8502 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y黑熊",7,8503 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y灯谜",7,8504 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y圣诞树",7,8505 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y大铃铛",7,8506 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y糖果盒",7,8507 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y粉红熊",7,8508 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y小狐仙",7,8509 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y大笨熊",7,8510 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y功夫熊猫",7,8511 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G超级变身#W--#Y超人熊猫",7,8512 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 8501 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4878, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8502 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4867, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8503 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4828, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8504 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5723, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8505 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4863, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8506 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4864, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8507 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4865, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8508 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4866, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8509 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5710, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8510 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5006, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8511 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5708, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8512 then
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5709, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"变身成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

      elseif GetNumText() == 860 then
              x889062_Restore_hpmp( sceneId, selfId, targetId )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"治疗成功，祝您游戏愉快。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

      elseif GetNumText() == 870 then
	       if GetItemCount(sceneId, selfId, 39910008) < 10 then
                 TryRecieveItem( sceneId, selfId, 10305007, 10)

		   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		   BeginEvent(sceneId)
		   AddText(sceneId,"领取成功，祝您游戏愉快。")
		   EndEvent(sceneId)
		   DispatchEventList(sceneId,selfId,targetId)
              else
               	BeginEvent( sceneId ) 
					strText = "你包裹已经有指南了,不要消遣本NPC了!"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
	        end

      elseif GetNumText() == 104 then

             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"领取光环成功，自身属性加强了。谢谢你对天龙的支持。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
       elseif GetNumText() == 501 then
             	BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000介绍：#Y请选择您喜欢的个性称号，让你看起来与众不同。" )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-哥玩的是寂寞#gff00f0(称号)",7,791 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-想泡妞#gff00f0(称号)",7,210 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-我是流氓我怕谁#gff00f0(称号)",7,211 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-我就是牛X#gff00f0(称号)",7,212 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-我型我秀#gff00f0(称号)",7,15 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-狂热分子#gff00f0(称号)",7,17 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-天龙财主#gff00f0(称号)",7,18 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-需要爱情#gff00f0(称号)",7,19 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-不服来PK#gff00f0(称号)",7,201 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-我最嚣张#gff00f0(称号)",7,202 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-我是华侨我怕谁谁#gff00f0(称号)",7,203 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-我是老大#gff00f0(称号)",7,204 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-靓女无敌#gff00f0(称号)",7,205 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-烈女红唇#gff00f0(称号)",7,206 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-天狼战队#gff00f0(称号)",7,207 )
		AddNumText( sceneId, x889062_g_ScriptId, "免费-小猪战队#gff00f0(称号)",7,208 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 15 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#6我型我秀#6" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了超酷玩家称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 16 then
		TryRecieveItem( sceneId, selfId, 30900016, 1 )
		Msg2Player( sceneId, selfId, "你获得了500元宝和一个高级宝石合成符。", MSG2PLAYER_PARA )
	elseif GetNumText() == 17 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#63狂热分子#63" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了狂热分子称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 18 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#56大财主#56" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了大财主称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 19 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "需要#33情" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了需要#33情称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 201 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#70不服来PK#70" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了#70不服来PK#70称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 202 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#3我最嚣张#3" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了#3我最嚣张#3称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 203 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#58我是华侨我怕谁#58" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了#58我是华侨我怕谁#58称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 204 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "我是老大#r#58#58#58#58#58" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了#58别惹我#58称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 205 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#40靓女无敌#40" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了#40靓女无敌#40称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 206 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "烈女红#40" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了烈女红#40称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 206 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "烈女红#40" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了烈女红#40称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 207 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "天#93战队" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了天#93战队称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 208 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "小#94战队" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了小#94战队称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )


	elseif GetNumText()  == 791 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#101#gffff00哥玩的是寂寞#101" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了哥玩的不是天龙/是寂寞称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
  
	elseif GetNumText()  == 210 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#122#gffff00想泡妞#122" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了想泡妞称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText()  == 211 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#118#gffff00我是流氓我怕谁#101" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了我是流氓我怕谁。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText()  == 212 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#129#gffff00我就是牛X#129" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G恭喜，您成功领取了我就是牛X称号。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

      elseif GetNumText() == 106 then
	BeginEvent( sceneId )
			AddText( sceneId, "#b#Y    右键点击#G随身宝石#Y→随身功能，领取无限元宝。" )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
             elseif GetNumText() == 107 then
                
-- 千佛莲灯的ID
	       local nStoneId = 30505022
            if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=5 then
                        BeginEvent( sceneId ) 
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,5)
			TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        AddText( sceneId, "领取成功，请到升级NPC哪儿进行升级！" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "请搜集够5千佛莲灯物品再来兑换,129级之后请用回梦石或者帮贡找NPC进行升级" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 
          elseif GetNumText() == 108 then
                
-- 千佛莲灯的ID
	       local nStoneId = 30505155
            if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=6 then
                        BeginEvent( sceneId ) 
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,6)
			TryRecieveItem( sceneId, selfId, 30505156, 1 )
                       TryRecieveItem( sceneId, selfId, 30505156, 1 )
                       TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        AddText( sceneId, "领取成功，请到升级NPC哪儿进行升级！" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "请搜集够6千天尽沙物品再来兑换5个回梦石,129级之后请用回梦石找NPC进行升级" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 
elseif GetNumText() == 109 then
local cityguildid = GetCityGuildID(sceneId, selfId)
if cityguildid ~=-1 then
AddText( sceneId, "对不起！你还没有加入帮派,而且帮派要有城市,要不哪来的帮贡点啊" )
		return
	end
	      local    bg = CityGetAttr( sceneId, selfId, GUILD_CONTRIB_POINT )

            if bg >= 50  then
                        BeginEvent( sceneId ) 
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, -100 )
			TryRecieveItem( sceneId, selfId, 30008019, 1 )
                   
                        AddText( sceneId, "领取特赦令成功" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "请刷帮贡到100点才能进行兑换,请到100点后再来兑换" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 

elseif GetNumText() == 110 then
    local cityguildid = GetCityGuildID(sceneId, selfId)
if cityguildid ~=-1 then
AddText( sceneId, "对不起！你还没有加入帮派,而且帮派要有城市,要不哪来的帮贡点啊" )
		return
	end            


	      local    bg = CityGetAttr( sceneId, selfId, GUILD_CONTRIB_POINT )

              local nStoneId = 30505156
            if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=10 then
                        BeginEvent( sceneId ) 
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, 10 )
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,10)
                   
                        AddText( sceneId, "成功兑换10点帮贡" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "请确认你包里有10个回梦石,再来兑换"..cityguildid.."" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 


	end	
end
--**********************************
--对话提示
--**********************************
function x889062_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x889062_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--恢复血和气
--**********************************
function x889062_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	RestoreRage( sceneId, selfId )
end
--**********************************
--领取元宝
--**********************************
function x889062_lingquyuanbao( sceneId, selfId, targetId )
  local mylevel = GetLevel( sceneId, selfId )
  if mylevel <  GetNumText() then
  local strText = format("您的等级不够，待等级达到%d级再来找我吧。", GetNumText() )
  x889062_TalkMsg( sceneId, selfId, targetId, strText )
  return
  end
  if GetNumText()==80 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO80 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "您已经领取过该项奖励，不能再领了。" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,50000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO80, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "领取元宝成功，您获得了50000元宝。谢谢你对天龙的支持。" )
  elseif GetNumText()==90 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO90 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "您已经领取过该项奖励，不能再领了。" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,100000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO90, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "领取元宝成功，您获得了100000元宝。谢谢你对天龙的支持。" )
    elseif GetNumText()==100 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO100 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "您已经领取过该项奖励，不能再领了。" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,150000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO100, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "领取元宝成功，您获得了150000元宝。谢谢你对天龙的支持。" )
    elseif GetNumText()==110 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO110 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "您已经领取过该项奖励，不能再领了。" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,200000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO110, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "领取元宝成功，您获得了200000元宝。谢谢你对天龙的支持。" )
    elseif GetNumText()==120 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO120 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "您已经领取过该项奖励，不能再领了。" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,300000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO120, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "领取元宝成功，您获得了300000元宝。谢谢你对天龙的支持。" )
   end
end

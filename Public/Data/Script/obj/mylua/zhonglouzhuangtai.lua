x889068_g_ScriptId = 889068

--**********************************
--列举事件
--**********************************
function x889068_OnEnumerate( sceneId, selfId, targetId )	
		
--	BeginEvent(sceneId)					警告：这个函数中不要出现BeginEvent套件 会清空之前的AddNumText信息 
	
		if GetLevel( sceneId, selfId ) >= 30 then
			AddNumText( sceneId, x889068_g_ScriptId, "领取#c00ffff重楼︱武魂#Y状态", 6, 100 )
			--AddNumText( sceneId, x889068_g_ScriptId, "#{TGKW_20070918_004}", 11, 106 )
		end	
			
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--事件交互入口
--**********************************
function x889068_OnDefaultEvent( sceneId, selfId,targetId )

	local key = GetNumText()
       if key == 100 then
	BeginEvent(sceneId)
		AddText(sceneId,"  #c00ff00请选择你自己佩带的装备的状态！！！")
		AddNumText( sceneId, x889068_g_ScriptId, "领取:#c00ffff重楼戒#Y〖#G麻痹状态#Y〗",6,1 )
		AddNumText( sceneId, x889068_g_ScriptId, "领取:#c00ffff重楼玉#Y〖#G封穴状态#Y〗",6,2 )
		AddNumText( sceneId, x889068_g_ScriptId, "武魂:#c00ffff御窑盘[毒]#Y〖#G技能#Y〗",6,3 )
		AddNumText( sceneId, x889068_g_ScriptId, "武魂:#c00ffff御窑盘[火]#Y〖#G技能#Y〗",6,4 )
		AddNumText( sceneId, x889068_g_ScriptId, "武魂:#c00ffff御窑盘[冰]#Y〖#G技能#Y〗",6,5 )
		AddNumText( sceneId, x889068_g_ScriptId, "武魂:#c00ffff御窑盘[玄]#Y〖#G技能#Y〗",6,6 )
		--AddNumText( sceneId, x889068_g_ScriptId, "领取:#c00ffff天山天隐套装#Y〖#G刺骨状态#Y〗",6,7 )
		--AddNumText( sceneId, x889068_g_ScriptId, "领取:#c00ffff逍遥仙逸套装#Y〖#G碧火状态#Y〗",6,8 )
		--AddNumText( sceneId, x889068_g_ScriptId, "领取:#c00ffff天龙乌日套装#Y〖#G神光状态#Y〗",6,9 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	elseif key == 1 then
		x889068_LingQuZhuangTai1( sceneId, selfId, targetId )
	elseif key == 2 then
		x889068_LingQuZhuangTai2( sceneId, selfId, targetId )
	elseif key == 3 then
		x889068_LingQuZhuangTai3( sceneId, selfId, targetId )
	elseif key == 4 then
		x889068_LingQuZhuangTai4( sceneId, selfId, targetId )
	elseif key == 5 then
		x889068_LingQuZhuangTai5( sceneId, selfId, targetId )
	elseif key == 6 then
		x889068_LingQuZhuangTai6( sceneId, selfId, targetId )
	elseif key == 7 then
		x889068_LingQuZhuangTai7( sceneId, selfId, targetId )
	elseif key == 8 then
		x889068_LingQuZhuangTai8( sceneId, selfId, targetId )
	elseif key == 9 then
		x889068_LingQuZhuangTai9( sceneId, selfId, targetId )
	end	
end


function x889068_LingQuZhuangTai1( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10422016) < 1 	then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需携带重楼戒！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5952, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领取重楼戒状态" )
      end
end


function x889068_LingQuZhuangTai2( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10423024) < 1 then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需携带重楼玉！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5953, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领取重楼戒状态" )
      end
end

function x889068_LingQuZhuangTai3( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433320) < 1 then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需携带#Y#eaf0000御窑盘[毒]！" )	
		return
      else
		AddSkill(  sceneId, selfId, 1614)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领悟技能！" )
end
end

function x889068_LingQuZhuangTai4( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433321) < 1 then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需携带#Y#eaf0000御窑盘[火]！" )	
		return
      else
		AddSkill(  sceneId, selfId, 1601)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领悟技能！" )
end
end

function x889068_LingQuZhuangTai5( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433322) < 1 then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需携带#gFFFFF0御窑盘[冰]！" )	
		return
      else
		AddSkill(  sceneId, selfId, 1600)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领悟技能！" )
end
end

function x889068_LingQuZhuangTai6( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10433323) < 1 then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需携带#gFFFFF0御窑盘[玄]！" )	
		return
      else
		AddSkill(  sceneId, selfId, 1612)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领悟技能！" )
end
end

function x889068_LingQuZhuangTai7( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514096) < 1 or GetItemCount(sceneId, selfId, 10521096) < 1 or GetItemCount(sceneId, selfId, 10515096) < 1 or GetItemCount(sceneId, selfId, 10522096) < 1	or GetItemCount(sceneId, selfId, 10523096) < 1	then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“天山天隐”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2927, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领取天山天隐--刺骨状态" )
end
end

function x889068_LingQuZhuangTai8( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514097) < 1 or GetItemCount(sceneId, selfId, 10521097) < 1 or GetItemCount(sceneId, selfId, 10515097) < 1 or GetItemCount(sceneId, selfId, 10522097) < 1	or GetItemCount(sceneId, selfId, 10523097) < 1	then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“逍遥仙逸”一件不能多，一件不能差！" )	
		return
      else
               LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领取逍遥仙逸--碧火状态" )
end
end

function x889068_LingQuZhuangTai9( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514098) < 1 or GetItemCount(sceneId, selfId, 10521098) < 1 or GetItemCount(sceneId, selfId, 10515098) < 1 or GetItemCount(sceneId, selfId, 10522098) < 1	or GetItemCount(sceneId, selfId, 10523098) < 1	then
		x889068_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“天龙乌日”一件不能多，一件不能差！" )	
		return
      else
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2929, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889068_MsgBox( sceneId, selfId, "恭喜您成功领取天龙乌日--神光状态" )
end
end

--**********************************
--消息提示
--**********************************
function x889068_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x889068_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
x889070_g_ScriptId = 889070

--**********************************
--列举事件
--**********************************
function x889070_OnEnumerate( sceneId, selfId, targetId )	
		
--	BeginEvent(sceneId)					警告：这个函数中不要出现BeginEvent套件 会清空之前的AddNumText信息 
	
		if GetLevel( sceneId, selfId ) >= 30 then
			AddNumText( sceneId, x889070_g_ScriptId, "领取#c00ffff战神#Y状态", 6, 100 )
			--AddNumText( sceneId, x889070_g_ScriptId, "#{TGKW_20070918_004}", 11, 106 )
		end	
			
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)
		
end

--**********************************
--事件交互入口
--**********************************
function x889070_OnDefaultEvent( sceneId, selfId,targetId )

	local key = GetNumText()
       if key == 100 then
	BeginEvent(sceneId)
		AddText(sceneId,"  #c00ff00请选择你自己佩带的装备的状态！必需一套哦！！！")
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff少林寂灭套装#Y〖#G普渡状态#Y〗",6,1 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff明教焚仙套装#Y〖#G焚魂状态#Y〗",6,2 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff丐帮啸天套装#Y〖#G炎毒状态#Y〗",6,3 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff武当诛魔套装#Y〖#G寒雷状态#Y〗",6,4 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff峨嵋碧神套装#Y〖#G骤霜状态#Y〗",6,5 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff星宿骨灵套装#Y〖#G噬心状态#Y〗",6,6 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff天山天隐套装#Y〖#G刺骨状态#Y〗",6,7 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff逍遥仙逸套装#Y〖#G碧火状态#Y〗",6,8 )
		AddNumText( sceneId, x889070_g_ScriptId, "领取:#c00ffff天龙乌日套装#Y〖#G神光状态#Y〗",6,9 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	elseif key == 1 then
		x889070_LingQuZhuangTai1( sceneId, selfId, targetId )
	elseif key == 2 then
		x889070_LingQuZhuangTai2( sceneId, selfId, targetId )
	elseif key == 3 then
		x889070_LingQuZhuangTai3( sceneId, selfId, targetId )
	elseif key == 4 then
		x889070_LingQuZhuangTai4( sceneId, selfId, targetId )
	elseif key == 5 then
		x889070_LingQuZhuangTai5( sceneId, selfId, targetId )
	elseif key == 6 then
		x889070_LingQuZhuangTai6( sceneId, selfId, targetId )
	elseif key == 7 then
		x889070_LingQuZhuangTai7( sceneId, selfId, targetId )
	elseif key == 8 then
		x889070_LingQuZhuangTai8( sceneId, selfId, targetId )
	elseif key == 9 then
		x889070_LingQuZhuangTai9( sceneId, selfId, targetId )
	end	
end


function x889070_LingQuZhuangTai1( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10514090) < 1 or GetItemCount(sceneId, selfId, 10521090) < 1 or GetItemCount(sceneId, selfId, 10515090) < 1 or GetItemCount(sceneId, selfId, 10522090) < 1	or GetItemCount(sceneId, selfId, 10523090) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“少林寂灭”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2921, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取少林寂灭--普渡状态" )
      end
end


function x889070_LingQuZhuangTai2( sceneId, selfId, targetId )
	if GetItemCount(sceneId, selfId, 10514091) < 1 or GetItemCount(sceneId, selfId, 10521091) < 1 or GetItemCount(sceneId, selfId, 10515091) < 1 or GetItemCount(sceneId, selfId, 10522091) < 1	or GetItemCount(sceneId, selfId, 10523091) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“明教焚仙”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2922, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取明教焚仙--焚魂状态" )
      end
end

function x889070_LingQuZhuangTai3( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514092) < 1 or GetItemCount(sceneId, selfId, 10521092) < 1 or GetItemCount(sceneId, selfId, 10515092) < 1 or GetItemCount(sceneId, selfId, 10522092) < 1	or GetItemCount(sceneId, selfId, 10523092) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“丐帮啸天”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2923, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取丐帮啸天--炎毒状态" )
end
end

function x889070_LingQuZhuangTai4( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514093) < 1 or GetItemCount(sceneId, selfId, 10521093) < 1 or GetItemCount(sceneId, selfId, 10515093) < 1 or GetItemCount(sceneId, selfId, 10522093) < 1	or GetItemCount(sceneId, selfId, 10523093) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“武当诛魔”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2924, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取武当诛魔--寒雷状态" )
end
end

function x889070_LingQuZhuangTai5( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514094) < 1 or GetItemCount(sceneId, selfId, 10521094) < 1 or GetItemCount(sceneId, selfId, 10515094) < 1 or GetItemCount(sceneId, selfId, 10522094) < 1	or GetItemCount(sceneId, selfId, 10523094) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“峨嵋碧神”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2925, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取峨嵋碧神--骤霜状态" )
end
end

function x889070_LingQuZhuangTai6( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514095) < 1 or GetItemCount(sceneId, selfId, 10521095) < 1 or GetItemCount(sceneId, selfId, 10515095) < 1 or GetItemCount(sceneId, selfId, 10522095) < 1	or GetItemCount(sceneId, selfId, 10523095) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“星宿骨灵”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2926, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取星宿骨灵--噬心状态" )
end
end

function x889070_LingQuZhuangTai7( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514096) < 1 or GetItemCount(sceneId, selfId, 10521096) < 1 or GetItemCount(sceneId, selfId, 10515096) < 1 or GetItemCount(sceneId, selfId, 10522096) < 1	or GetItemCount(sceneId, selfId, 10523096) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“天山天隐”一件不能多，一件不能差！" )	
		return
      else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2927, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取天山天隐--刺骨状态" )
end
end

function x889070_LingQuZhuangTai8( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514097) < 1 or GetItemCount(sceneId, selfId, 10521097) < 1 or GetItemCount(sceneId, selfId, 10515097) < 1 or GetItemCount(sceneId, selfId, 10522097) < 1	or GetItemCount(sceneId, selfId, 10523097) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“逍遥仙逸”一件不能多，一件不能差！" )	
		return
      else
               LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取逍遥仙逸--碧火状态" )
end
end

function x889070_LingQuZhuangTai9( sceneId, selfId, targetId )

	if GetItemCount(sceneId, selfId, 10514098) < 1 or GetItemCount(sceneId, selfId, 10521098) < 1 or GetItemCount(sceneId, selfId, 10515098) < 1 or GetItemCount(sceneId, selfId, 10522098) < 1	or GetItemCount(sceneId, selfId, 10523098) < 1	then
		x889070_MsgBox( sceneId, selfId, "对不起，你必需穿上一套“天龙乌日”一件不能多，一件不能差！" )	
		return
      else
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2929, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x889070_MsgBox( sceneId, selfId, "恭喜您成功领取天龙乌日--神光状态" )
end
end

--**********************************
--消息提示
--**********************************
function x889070_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x889070_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
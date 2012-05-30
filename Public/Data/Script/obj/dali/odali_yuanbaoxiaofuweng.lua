--心法升级
--************************************************************************
--MisDescBegin
--脚本号
x890212_g_ScriptId	= 890212

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x890212_OnDefaultEvent( sceneId, selfId, targetId )
	if GetLevel(sceneId,selfId) >= 10  then
		BeginEvent( sceneId )
		AddText( sceneId, "#Y欢迎使用门派更换功能，更换门派需要购买转职凭证才可以更换！" )
		--	AddNumText( sceneId, x890012_g_ScriptId, "我想升级心法",5,14 )
			AddNumText( sceneId, x002095_g_ScriptId, "#G☆我要更换门派☆",6,120 )
    		EndEvent( sceneId )
	else
		BeginEvent( sceneId )
			AddText(sceneId,"100级别以后我可以帮你更换门派，还是先升级到100级在来找我吧...")
		EndEvent( sceneId )
	end
end
--**********************************
--事件列表选中一项
--**********************************
function x890212_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
       x890212_g_MenPai = GetMenPai(sceneId, selfId)	
	if key == 14 then
	BeginEvent( sceneId )
		AddText( sceneId, "要想升级心法，请点击你所属的门派。" )
		AddNumText( sceneId, x890212_g_ScriptId, "星宿",3,20 )
		AddNumText( sceneId, x890212_g_ScriptId, "逍遥",3,21 )
		AddNumText( sceneId, x890212_g_ScriptId, "少林",3,22 )
		AddNumText( sceneId, x890212_g_ScriptId, "天山",3,23 )
		AddNumText( sceneId, x890212_g_ScriptId, "天龙",3,24 )
		AddNumText( sceneId, x890212_g_ScriptId, "峨眉",3,25 )
		AddNumText( sceneId, x890212_g_ScriptId, "武当",3,26 )
		AddNumText( sceneId, x890212_g_ScriptId, "明教",3,27 )
		AddNumText( sceneId, x890212_g_ScriptId, "丐帮",3,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 20 then
		if x890212_g_MenPai == 5   then
			local	Xingxiulevel = LuaFnGetXinFaLevel(sceneId,selfId,60 )
			if Xingxiulevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,31,150)
				LuaFnSetXinFaLevel(sceneId,selfId,32,150)
				LuaFnSetXinFaLevel(sceneId,selfId,33,150)
				LuaFnSetXinFaLevel(sceneId,selfId,34,150)
				LuaFnSetXinFaLevel(sceneId,selfId,35,150)
				LuaFnSetXinFaLevel(sceneId,selfId,36,150)
				LuaFnSetXinFaLevel(sceneId,selfId,60,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 21 then
		if x890212_g_MenPai == 8   then
			local	Xiaoyaolevel = LuaFnGetXinFaLevel(sceneId,selfId,63 )
			if Xiaoyaolevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,49,150)
				LuaFnSetXinFaLevel(sceneId,selfId,50,150)
				LuaFnSetXinFaLevel(sceneId,selfId,51,150)
				LuaFnSetXinFaLevel(sceneId,selfId,52,150)
				LuaFnSetXinFaLevel(sceneId,selfId,53,150)
				LuaFnSetXinFaLevel(sceneId,selfId,54,150)
				LuaFnSetXinFaLevel(sceneId,selfId,63,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 22 then
		if x890212_g_MenPai == 0   then
			local	Shaolinlevel = LuaFnGetXinFaLevel(sceneId,selfId,55 )
			if Shaolinlevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,1,150)
				LuaFnSetXinFaLevel(sceneId,selfId,2,150)
				LuaFnSetXinFaLevel(sceneId,selfId,3,150)
				LuaFnSetXinFaLevel(sceneId,selfId,4,150)
				LuaFnSetXinFaLevel(sceneId,selfId,5,150)
				LuaFnSetXinFaLevel(sceneId,selfId,6,150)
				LuaFnSetXinFaLevel(sceneId,selfId,55,150)
				LuaFnSetXinFaLevel(sceneId,selfId,72,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 23 then
		if x890212_g_MenPai == 7   then
			local	Tianshanlevel = LuaFnGetXinFaLevel(sceneId,selfId,62 )
			if Tianshanlevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,43,150)
				LuaFnSetXinFaLevel(sceneId,selfId,44,150)
				LuaFnSetXinFaLevel(sceneId,selfId,45,150)
				LuaFnSetXinFaLevel(sceneId,selfId,46,150)
				LuaFnSetXinFaLevel(sceneId,selfId,47,150)
				LuaFnSetXinFaLevel(sceneId,selfId,48,150)
				LuaFnSetXinFaLevel(sceneId,selfId,62,150)
				LuaFnSetXinFaLevel(sceneId,selfId,79,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 24 then
		if x890212_g_MenPai == 6   then
			local	Tianlonglevel = LuaFnGetXinFaLevel(sceneId,selfId,61 )
			if Tianlonglevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,37,150)
				LuaFnSetXinFaLevel(sceneId,selfId,38,150)
				LuaFnSetXinFaLevel(sceneId,selfId,39,150)
				LuaFnSetXinFaLevel(sceneId,selfId,40,150)
				LuaFnSetXinFaLevel(sceneId,selfId,41,150)
				LuaFnSetXinFaLevel(sceneId,selfId,42,150)
				LuaFnSetXinFaLevel(sceneId,selfId,61,150)
				LuaFnSetXinFaLevel(sceneId,selfId,78,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 25 then
		if x890212_g_MenPai == 4   then
			local	Ermeilevel = LuaFnGetXinFaLevel(sceneId,selfId,59 )
			if Ermeilevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,25,150)
				LuaFnSetXinFaLevel(sceneId,selfId,26,150)
				LuaFnSetXinFaLevel(sceneId,selfId,27,150)
				LuaFnSetXinFaLevel(sceneId,selfId,28,150)
				LuaFnSetXinFaLevel(sceneId,selfId,29,150)
				LuaFnSetXinFaLevel(sceneId,selfId,30,150)
				LuaFnSetXinFaLevel(sceneId,selfId,59,150)
				LuaFnSetXinFaLevel(sceneId,selfId,76,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 26 then
		if x890212_g_MenPai == 3   then
			local	Wudanglevel = LuaFnGetXinFaLevel(sceneId,selfId,58 )
			if Wudanglevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,19,150)
				LuaFnSetXinFaLevel(sceneId,selfId,20,150)
				LuaFnSetXinFaLevel(sceneId,selfId,21,150)
				LuaFnSetXinFaLevel(sceneId,selfId,22,150)
				LuaFnSetXinFaLevel(sceneId,selfId,23,150)
				LuaFnSetXinFaLevel(sceneId,selfId,24,150)
				LuaFnSetXinFaLevel(sceneId,selfId,58,150)
				LuaFnSetXinFaLevel(sceneId,selfId,75,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 27 then
		if x890212_g_MenPai == 1   then
			local	Mingjiaolevel = LuaFnGetXinFaLevel(sceneId,selfId,56 )
			if Mingjiaolevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,7,150)
				LuaFnSetXinFaLevel(sceneId,selfId,8,150)
				LuaFnSetXinFaLevel(sceneId,selfId,9,150)
				LuaFnSetXinFaLevel(sceneId,selfId,10,150)
				LuaFnSetXinFaLevel(sceneId,selfId,11,150)
				LuaFnSetXinFaLevel(sceneId,selfId,12,150)
				LuaFnSetXinFaLevel(sceneId,selfId,56,150)
				LuaFnSetXinFaLevel(sceneId,selfId,73,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 28 then
		if x890212_g_MenPai == 2   then
			local	Xingxiulevel = LuaFnGetXinFaLevel(sceneId,selfId,57 )
			if Xingxiulevel >= 119 then
				LuaFnSetXinFaLevel(sceneId,selfId,13,150)
				LuaFnSetXinFaLevel(sceneId,selfId,14,150)
				LuaFnSetXinFaLevel(sceneId,selfId,15,150)
				LuaFnSetXinFaLevel(sceneId,selfId,16,150)
				LuaFnSetXinFaLevel(sceneId,selfId,17,150)
				LuaFnSetXinFaLevel(sceneId,selfId,18,150)
				LuaFnSetXinFaLevel(sceneId,selfId,57,150)
				BeginEvent( sceneId )
					AddText( sceneId, "#G您的心法已经升级好了，祝您游戏愉快。" )
				EndEvent( sceneId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, "#G请把你所有的心法等级都升到119级以上再来找我吧(包括第七本心法)。" )
				EndEvent( sceneId )
			end
		else
			BeginEvent( sceneId )
				AddText( sceneId, "#G请选择你所在的门派进行心法升级。" )
			EndEvent( sceneId )
		end
	DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 120 then
		local	nam	= LuaFnGetName( sceneId, selfId )
		if LuaFnGetAvailableItemCount(sceneId, selfId, 40004475) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "应广大玩家的需求，特开设此功能，希望您游戏愉快！" )	
			AddNumText( sceneId, x002095_g_ScriptId, "星宿",3,121 )
			AddNumText( sceneId, x002095_g_ScriptId, "逍遥",3,122 )
			AddNumText( sceneId, x002095_g_ScriptId, "少林",3,123 )
			AddNumText( sceneId, x002095_g_ScriptId, "天山",3,124 )
			AddNumText( sceneId, x002095_g_ScriptId, "天龙",3,125 )
			AddNumText( sceneId, x002095_g_ScriptId, "峨眉",3,126 )
			AddNumText( sceneId, x002095_g_ScriptId, "武当",3,127 )
			AddNumText( sceneId, x002095_g_ScriptId, "明教",3,128 )
			AddNumText( sceneId, x002095_g_ScriptId, "丐帮",3,129 )
    		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		else
		BeginEvent(sceneId)
			AddText(sceneId, "#G对不起，你没有转职凭证，请到元宝店购买后再来找我吧！")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId) 
		end
	end
	if key == 121 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,150)
		LuaFnSetXinFaLevel(sceneId,selfId,32,150)
		LuaFnSetXinFaLevel(sceneId,selfId,33,150)
		LuaFnSetXinFaLevel(sceneId,selfId,34,150)
		LuaFnSetXinFaLevel(sceneId,selfId,35,150)
		LuaFnSetXinFaLevel(sceneId,selfId,36,150)
		LuaFnSetXinFaLevel(sceneId,selfId,60,150)
		LuaFnSetXinFaLevel(sceneId,selfId,77,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了星宿派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 122 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,150)
		LuaFnSetXinFaLevel(sceneId,selfId,50,150)
		LuaFnSetXinFaLevel(sceneId,selfId,51,150)
		LuaFnSetXinFaLevel(sceneId,selfId,52,150)
		LuaFnSetXinFaLevel(sceneId,selfId,53,150)
		LuaFnSetXinFaLevel(sceneId,selfId,54,150)
		LuaFnSetXinFaLevel(sceneId,selfId,63,150)
		LuaFnSetXinFaLevel(sceneId,selfId,80,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了逍遥派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 123 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,150)
		LuaFnSetXinFaLevel(sceneId,selfId,2,150)
		LuaFnSetXinFaLevel(sceneId,selfId,3,150)
		LuaFnSetXinFaLevel(sceneId,selfId,4,150)
		LuaFnSetXinFaLevel(sceneId,selfId,5,150)
		LuaFnSetXinFaLevel(sceneId,selfId,6,150)
		LuaFnSetXinFaLevel(sceneId,selfId,55,150)
		LuaFnSetXinFaLevel(sceneId,selfId,72,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了少林派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 124 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,150)
		LuaFnSetXinFaLevel(sceneId,selfId,44,150)
		LuaFnSetXinFaLevel(sceneId,selfId,45,150)
		LuaFnSetXinFaLevel(sceneId,selfId,46,150)
		LuaFnSetXinFaLevel(sceneId,selfId,47,150)
		LuaFnSetXinFaLevel(sceneId,selfId,48,150)
		LuaFnSetXinFaLevel(sceneId,selfId,62,150)
		LuaFnSetXinFaLevel(sceneId,selfId,79,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了天山派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 125 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,150)
		LuaFnSetXinFaLevel(sceneId,selfId,38,150)
		LuaFnSetXinFaLevel(sceneId,selfId,39,150)
		LuaFnSetXinFaLevel(sceneId,selfId,40,150)
		LuaFnSetXinFaLevel(sceneId,selfId,41,150)
		LuaFnSetXinFaLevel(sceneId,selfId,42,150)
		LuaFnSetXinFaLevel(sceneId,selfId,61,150)
		LuaFnSetXinFaLevel(sceneId,selfId,78,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了天龙寺，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 126 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,150)
		LuaFnSetXinFaLevel(sceneId,selfId,26,150)
		LuaFnSetXinFaLevel(sceneId,selfId,27,150)
		LuaFnSetXinFaLevel(sceneId,selfId,28,150)
		LuaFnSetXinFaLevel(sceneId,selfId,29,150)
		LuaFnSetXinFaLevel(sceneId,selfId,30,150)
		LuaFnSetXinFaLevel(sceneId,selfId,59,150)
		LuaFnSetXinFaLevel(sceneId,selfId,76,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了峨眉派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 127 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,150)
		LuaFnSetXinFaLevel(sceneId,selfId,20,150)
		LuaFnSetXinFaLevel(sceneId,selfId,21,150)
		LuaFnSetXinFaLevel(sceneId,selfId,22,150)
		LuaFnSetXinFaLevel(sceneId,selfId,23,150)
		LuaFnSetXinFaLevel(sceneId,selfId,24,150)
		LuaFnSetXinFaLevel(sceneId,selfId,58,150)
		LuaFnSetXinFaLevel(sceneId,selfId,75,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了武当派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 128 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,150)
		LuaFnSetXinFaLevel(sceneId,selfId,8,150)
		LuaFnSetXinFaLevel(sceneId,selfId,9,150)
		LuaFnSetXinFaLevel(sceneId,selfId,10,150)
		LuaFnSetXinFaLevel(sceneId,selfId,11,150)
		LuaFnSetXinFaLevel(sceneId,selfId,12,150)
		LuaFnSetXinFaLevel(sceneId,selfId,56,150)
		LuaFnSetXinFaLevel(sceneId,selfId,73,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了明教，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 129 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,150)
		LuaFnSetXinFaLevel(sceneId,selfId,14,150)
		LuaFnSetXinFaLevel(sceneId,selfId,15,150)
		LuaFnSetXinFaLevel(sceneId,selfId,16,150)
		LuaFnSetXinFaLevel(sceneId,selfId,17,150)
		LuaFnSetXinFaLevel(sceneId,selfId,18,150)
		LuaFnSetXinFaLevel(sceneId,selfId,57,150)
		LuaFnSetXinFaLevel(sceneId,selfId,74,150)
		LuaFnDelAvailableItem(sceneId,selfId,40004475,1)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家["..nam.."]成功更换了门派→并领取了150级心法。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您成功领取了心法并且加入了丐帮，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end
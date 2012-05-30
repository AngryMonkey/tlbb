

-- 脚本号
x890011_g_ScriptId	= 890011
x890011_g_ItemId = 39901003

--**********************************
-- 事件交互入口
--**********************************
function x890011_OnDefaultEvent( sceneId, selfId )
	if GetNumText() == 20 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,149)
		LuaFnSetXinFaLevel(sceneId,selfId,32,149)
		LuaFnSetXinFaLevel(sceneId,selfId,33,149)
		LuaFnSetXinFaLevel(sceneId,selfId,34,149)
		LuaFnSetXinFaLevel(sceneId,selfId,35,149)
		LuaFnSetXinFaLevel(sceneId,selfId,36,149)
		LuaFnSetXinFaLevel(sceneId,selfId,60,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→星宿。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了星宿派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 21 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,149)
		LuaFnSetXinFaLevel(sceneId,selfId,50,149)
		LuaFnSetXinFaLevel(sceneId,selfId,51,149)
		LuaFnSetXinFaLevel(sceneId,selfId,52,149)
		LuaFnSetXinFaLevel(sceneId,selfId,53,149)
		LuaFnSetXinFaLevel(sceneId,selfId,54,149)
		LuaFnSetXinFaLevel(sceneId,selfId,63,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→逍遥。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了逍遥派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 22 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,149)
		LuaFnSetXinFaLevel(sceneId,selfId,2,149)
		LuaFnSetXinFaLevel(sceneId,selfId,3,149)
		LuaFnSetXinFaLevel(sceneId,selfId,4,149)
		LuaFnSetXinFaLevel(sceneId,selfId,5,149)
		LuaFnSetXinFaLevel(sceneId,selfId,6,149)
		LuaFnSetXinFaLevel(sceneId,selfId,55,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→少林。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了少林派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 23 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,149)
		LuaFnSetXinFaLevel(sceneId,selfId,44,149)
		LuaFnSetXinFaLevel(sceneId,selfId,45,149)
		LuaFnSetXinFaLevel(sceneId,selfId,46,149)
		LuaFnSetXinFaLevel(sceneId,selfId,47,149)
		LuaFnSetXinFaLevel(sceneId,selfId,48,149)
		LuaFnSetXinFaLevel(sceneId,selfId,62,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→天山。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了天山派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 24 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,149)
		LuaFnSetXinFaLevel(sceneId,selfId,38,149)
		LuaFnSetXinFaLevel(sceneId,selfId,39,149)
		LuaFnSetXinFaLevel(sceneId,selfId,40,149)
		LuaFnSetXinFaLevel(sceneId,selfId,41,149)
		LuaFnSetXinFaLevel(sceneId,selfId,42,149)
		LuaFnSetXinFaLevel(sceneId,selfId,61,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→天龙。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了天龙派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 25 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,149)
		LuaFnSetXinFaLevel(sceneId,selfId,26,149)
		LuaFnSetXinFaLevel(sceneId,selfId,27,149)
		LuaFnSetXinFaLevel(sceneId,selfId,28,149)
		LuaFnSetXinFaLevel(sceneId,selfId,29,149)
		LuaFnSetXinFaLevel(sceneId,selfId,30,149)
		LuaFnSetXinFaLevel(sceneId,selfId,59,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→峨眉。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了峨眉派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 26 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,149)
		LuaFnSetXinFaLevel(sceneId,selfId,20,149)
		LuaFnSetXinFaLevel(sceneId,selfId,21,149)
		LuaFnSetXinFaLevel(sceneId,selfId,22,149)
		LuaFnSetXinFaLevel(sceneId,selfId,23,149)
		LuaFnSetXinFaLevel(sceneId,selfId,24,149)
		LuaFnSetXinFaLevel(sceneId,selfId,58,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→武当。", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了武当派，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 27 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,149)
		LuaFnSetXinFaLevel(sceneId,selfId,8,149)
		LuaFnSetXinFaLevel(sceneId,selfId,9,149)
		LuaFnSetXinFaLevel(sceneId,selfId,10,149)
		LuaFnSetXinFaLevel(sceneId,selfId,11,149)
		LuaFnSetXinFaLevel(sceneId,selfId,12,149)
		LuaFnSetXinFaLevel(sceneId,selfId,56,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→明教。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了明教，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 28 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,149)
		LuaFnSetXinFaLevel(sceneId,selfId,14,149)
		LuaFnSetXinFaLevel(sceneId,selfId,15,149)
		LuaFnSetXinFaLevel(sceneId,selfId,16,149)
		LuaFnSetXinFaLevel(sceneId,selfId,17,149)
		LuaFnSetXinFaLevel(sceneId,selfId,18,149)
		LuaFnSetXinFaLevel(sceneId,selfId,57,149)
		LuaFnDelAvailableItem(sceneId,selfId,x890011_g_ItemId,1)	--删除物品
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功更换门派→丐帮。", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G您加入了丐帮，祝您游戏愉快。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end


end

--**********************************
-- 
--**********************************
function x890011_IsSkillLikeScript( sceneId, selfId)
	return 0
end
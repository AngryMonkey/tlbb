--珍兽繁殖(取珍兽)
--脚本号 （改成正确脚本号）

x800102_g_scriptId = 800102

function x800102_OnDefaultEvent( sceneId, selfId, targetId )

	--获取玩家当前的珍兽繁殖信息
	local checkRet	= LuaFnCheckPetProcreateTakeOut( sceneId, selfId )
	if checkRet == 1 then
		LuaFnPetProcreateTakeOut( sceneId, selfId )
	end

end

function x800102_OnEnumerate( sceneId, selfId, targetId )

	--（1）繁殖进程中，显示繁殖进度
	--		你的珍兽AAA与BBB的珍兽CCC正在快乐的嬉戏，再过D分钟，就能带着二代珍兽回到你身边。
	--（2）繁殖成功后，领取子珍兽
	AddNumText( sceneId, x800102_g_scriptId, "取出完成繁殖的珍兽", 6, x800102_g_scriptId )

end

--取出繁殖珍兽〖Lybin Oct.24 2006〗
--此函数会在Server接收到WGPetProcreateQuestTakeOutResult消息包后，被动执行
--请勿擅自修改
--function x800102_OnTakeOut( sceneId, selfId )
--
--	local	checkRet	= LuaFnCheckPetProcreateTakeOut( sceneId, selfId )
--	if checkRet == 1 then
--		LuaFnPetProcreateTakeOut( sceneId, selfId )
--	end
--end

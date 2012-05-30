--藏经阁NPC
--无名老僧
--普通

x122001_g_ScriptId	= 122001



--**********************************
--事件交互入口
--**********************************
function x122001_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "  阿弥陀佛，善哉善哉。#r  一切有为法，为梦幻泡影。#r  如露亦如电，当作如是观。#r  $N曾去之处，本是虚幻，不若老僧指点与你。" )
		AddNumText( sceneId, x122001_g_ScriptId, "城市 - 苏州", 9, 1001 )
		AddNumText( sceneId, x122001_g_ScriptId, "城市 - 大理", 9, 1002 )
		AddNumText( sceneId, x122001_g_ScriptId, "城市 - 洛阳", 9, 1003 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x122001_OnEventRequest( sceneId, selfId, targetId, eventId )
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x122001_MsgBox( sceneId, selfId, targetId, "  你队伍成员中有人有漕运货舱在身，我们驿站不能为你提供传送服务。" )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x122001_MsgBox( sceneId, selfId, targetId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。" )
		return
	end

	--顺利传送
	local	arg	= GetNumText()

	if arg == 1001 then		--苏州
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162 )
		return
	end
	if arg == 1002 then		--大理
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 141 )
		return
	end
	if arg == 1003 then		--洛阳
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183 )
		return
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x122001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

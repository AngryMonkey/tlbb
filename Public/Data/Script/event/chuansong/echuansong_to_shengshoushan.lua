--created by WTT 2009.3.2

--事件：传送到圣兽山

--脚本号
x400963_g_ScriptId = 400963

--任务文本描述
x400963_g_MissionName="#{QSSS_090302_1}"		-- 去圣兽山
x400963_g_MissionInfo="传送到圣兽山。"  		-- 任务描述
x400963_g_MissionTarget="传送到圣兽山。"		-- 任务目标
x400963_g_ContinueInfo="传送到圣兽山。"			-- 未完成任务的npc对话
x400963_g_MissionComplete="传送到圣兽山。"	-- 完成任务npc说话的话

--**********************************
--入口函数
--**********************************
function x400963_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, 40002000) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
  
	--漕运相关
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
				BeginEvent( sceneId )
					AddText( sceneId, "  你队伍成员中有人有漕运货舱在身，我们驿站不能为你提供传送服务。" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end
  
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  你有漕运货舱在身，我们驿站不能为你提供传送服务。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	-- 以上检测均通过	
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x400963_g_ScriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShengShouShan");
			UICommand_AddString(sceneId, "#{QSSS_090302_2}");		-- “圣兽山为不加杀气场景，请注意安全。你确认要进入吗？”
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
end

--**********************************
--列举事件
--**********************************
function x400963_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText(sceneId,x400963_g_ScriptId,x400963_g_MissionName, 9, 1)	
	
end

--**********************************
--传送至圣兽山
--**********************************
function x400963_GotoShengShouShan( sceneId, selfId, targetId )

	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 158, 233, 225, 21 );
	return
	
end

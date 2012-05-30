--洛阳NPC
--关汉寿
--普通

x000125_g_ScriptId	= 125

--操作集
x000125_g_Key				=
{
		["do"]					= 100,	--确定
		["undo"]				= 101,	--取消
		["del"]					= 103,	--我决定退出江湖
		["hlp"]					= 104,	--帮助
}

--**********************************
--事件交互入口
--**********************************
function x000125_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  我专门为江湖英雄主持金盆洗手的仪式。如果你想要删除角色，退出江湖，就可以来找我。" )
		AddNumText( sceneId, x000125_g_ScriptId, "我想删除角色", -1, x000125_g_Key["do"] )
		AddNumText( sceneId, x000125_g_ScriptId, "关于删除角色", 11, x000125_g_Key["hlp"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x000125_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x000125_g_Key["do"] then
		--1,		//请求成功，可以删除
		--2,		//在帮派中不可以自杀
		--3,		//结婚状态
		--4,		//物品上锁不能删除
		--5,		//拥有玩家商店
		--6,		//拥有结拜兄弟
		--7,		//拥有师徒关系
		BeginEvent(sceneId)
			local result = QueryDeleteCharState(sceneId,selfId)
			if result == 1 then
				AddText(sceneId,"  金盆洗手，退出江湖。")
				AddNumText(sceneId,x000125_g_ScriptId,"我决定退出江湖",6,x000125_g_Key["del"])
			end
			if result == 2 then
				AddText(sceneId,"  你还在帮派中，不可以退隐江湖。")
			end
			if result == 3 then
				AddText(sceneId,"  你还在结婚状态，不可以退隐江湖。")
			end
			if result == 4 then
				AddText(sceneId,"  你有物品已经上锁，不可以退隐江湖。")
			end
			if result == 5 then
				AddText(sceneId,"  你拥有玩家商店，不可以退隐江湖。")
			end
			if result == 6 then
				AddText(sceneId,"  你拥有结拜兄弟，不可以退隐江湖。")
			end
			if result == 7 then
				AddText(sceneId,"  你拥有师徒关系，不可以退隐江湖。")
			end
			if result == 8 then
					local lefttime = GetLeftDeleteTime(sceneId,selfId)-11
					if lefttime > 0 then
						AddText(sceneId,"  你退隐江湖的时间未到，还差" ..lefttime.."天。")
					else
						AddText(sceneId,"  你还没有申请退隐江湖！");
					end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif key == x000125_g_Key["del"] then
		--ExecuteDeleteChar(sceneId, selfId)
		x000125_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )
		
	elseif key == x000125_g_Key["hlp"] then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_089}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return

	end
end

function x000125_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )    
  BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x000125_g_ScriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,eventId)
		UICommand_AddString(sceneId,"OnMsgAccept");
		local str = format("你确定要删除角色吗？")
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	
	DispatchUICommand(sceneId,selfId, 24)
end

function x000125_OnMsgAccept( sceneId, selfId, targetId, eventId )
    local result = QueryDeleteCharState(sceneId,selfId)
    
    if( 1 == result ) then        
        ExecuteDeleteChar(sceneId, selfId)
    end
    
end

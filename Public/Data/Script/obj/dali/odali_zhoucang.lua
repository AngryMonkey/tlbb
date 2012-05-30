--大理NPC
--周仓
--普通

x002091_g_ScriptId	= 2091

--操作集
x002091_g_Key				=
{
		["do"]					= 100,	--确定
		["undo"]				= 101,	--取消
		["del"]					= 103,	--我决定退出江湖
}

--**********************************
--事件交互入口
--**********************************
function x002091_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "我专门为江湖英雄主持金盆洗手的仪式。如果你想要删除角色，退出江湖就可以来找我。" )
		AddNumText( sceneId, x002091_g_ScriptId, "确定", -1, x002091_g_Key["do"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x002091_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()

	if key == x002091_g_Key["do"] then
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
				AddText(sceneId,"请求成功，可以删除")
				AddNumText(sceneId,x002091_g_ScriptId,"确认删除角色",6,x002091_g_Key["del"])
			end
			if result == 2 then
				AddText(sceneId,"您得退出帮派后才能进行此操作。")
			end
			if result == 3 then
				AddText(sceneId,"您处于结婚状态不可以进行此操作。")
			end
			if result == 4 then
				AddText(sceneId,"您身上有物品处于上锁状态无法进行此操作。")
			end
			if result == 5 then
				AddText(sceneId,"您还拥有商店，请去除商店后进行此操作。")
			end
			if result == 6 then
				AddText(sceneId,"您有和朋友处于结拜状态不可以进行此操作。")
			end
			if result == 7 then
				AddText(sceneId,"您还有师徒关系存在不可以进行此操作。")
			end
			if result == 8 then
					local lefttime = GetLeftDeleteTime(sceneId,selfId)-7
					if lefttime > 0 then
						AddText(sceneId,"您的角色可以在满足以上情况可以进行此删除角色操作。")
					else
						AddText(sceneId,"删除角色!");
					end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif key == x002091_g_Key["del"] then
		--ExecuteDeleteChar(sceneId, selfId)
		x002091_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )
	end
end

function x002091_OpenClientAcceptUI( sceneId, selfId, targetId, eventId )    
    BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x002091_g_ScriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,eventId)
		UICommand_AddString(sceneId,"OnMsgAccept");
		local str = format("真的要删除吗？")
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	
	DispatchUICommand(sceneId,selfId, 24)
end

function x002091_OnMsgAccept( sceneId, selfId, targetId, eventId )
    local result = QueryDeleteCharState(sceneId,selfId)
    
    if( 1 == result ) then        
        ExecuteDeleteChar(sceneId, selfId)
    end
    
end

--汪延
--敦煌传送火焰山

--脚本号
x008112_g_ScriptId	= 008112

--所拥有的事件ID列表
x008112_g_Transport = 400900

x008112_g_Impact_Transport_Mission = 113 -- 运输状态特效--[tx45130]
--目标场景
--**********************************
--事件交互入口
--**********************************
function x008112_OnDefaultEvent( sceneId, selfId, targetId )
	local	nam	= GetName( sceneId, selfId )

	BeginEvent( sceneId )
	AddText( sceneId, nam.."，一入阳关大漠飞沙，再往西去，就是火焰山了!途经火焰山能够到达高昌古国等地方。这一路凶险异常，只有#G90级以上#W的英雄才有资格前去冒险。" )
	AddNumText( sceneId, x008112_g_ScriptId, "传送去火焰山", 9, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x008112_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetLevel( sceneId, selfId ) < 90 then 
		BeginEvent( sceneId )
			AddText( sceneId, "  此去一路凶险异常，而你的等级尚不足90级，为了你的安全着想，锻炼时日再来找我吧。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else 
		--[tx45130]	
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x008112_g_Impact_Transport_Mission)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,"#{Transfer_090304_1}");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		--[/tx45130]
		CallScriptFunction((x008112_g_Transport), "TransferFunc",sceneId, selfId, 423, 223, 29, 90, 1000)
	end
end

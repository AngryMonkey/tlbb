-- created by zchw 
-- 007113
-- 龙贾 地宫传送使

-- 脚本号
x007113_g_scriptId = 007113

--**********************************
--事件交互入口
--**********************************
function x007113_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		msg = "#{DG_8724_1}"
		AddText(sceneId,msg);
		AddNumText( sceneId, x007113_g_scriptId, "传送到秦皇地宫", 9, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x007113_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 400, 227, 224)
	end
end


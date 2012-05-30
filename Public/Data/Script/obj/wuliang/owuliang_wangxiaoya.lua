--王小丫

--脚本号
x006011_g_scriptId = 006011
x006011_g_NianShouJieShao = "  #{NSBS_20071228_13}"

--**********************************
--事件交互入口
--**********************************
function x006011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  爹，我不要新衣服，我要娘，娘去哪里了，怎么还不回来啊？")
		--CallScriptFunction( 050054, "OnEnumerate",sceneId, selfId, targetId )
		--AddNumText( sceneId, x006011_g_scriptId, "年兽活动帮助", 11, 102 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x006011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 101 then
		CallScriptFunction( 050054, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 102 then
		BeginEvent(sceneId)
			AddText( sceneId, x006011_g_NianShouJieShao )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end





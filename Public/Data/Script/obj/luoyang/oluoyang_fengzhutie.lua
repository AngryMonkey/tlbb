--洛阳NPC 材料加工技能NPC   包含功能：1材料加工技能的学习 2讲解材料加工技能
--冯铸铁
--普通

--脚本号
x000141_g_ScriptId = 000141

--商店编号
x000141_g_shoptableindex = 167

--所拥有的事件Id列表
--estudy_cailiaojiagong = 713538


--所拥有的事件ID列表
x000141_g_eventList={713538}
--**********************************
--事件列表
--**********************************
function x000141_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  想学习材料加工技能吗？点击下面的“学习材料加工”按钮，就可以学习材料加工技能了。")
	AddText(sceneId,"  材料加工需要的是耐心和恒心，才能制作处大量的合成成品，而这些成品是修习工艺、铸造和缝纫三种生活技能必需的，如果你想提升你的工艺、铸造和缝纫三种生活技能，那么就一定要学习材料加工！")
	AddText(sceneId,"  注意：学习‘材料加工’需要花费#{_EXCHG10000}，别忘记带了！")
	for i, eventId in x000141_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x000141_g_ScriptId,"购买材料加工配方",7, 99 )
	AddNumText( sceneId, x000141_g_ScriptId, "材料加工介绍", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000141_OnDefaultEvent( sceneId, selfId,targetId )
	x000141_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000141_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{HELP_CLJG}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == 99	then
		DispatchShopItem( sceneId, selfId,targetId, x000141_g_shoptableindex )
	end
	for i, findId in x000141_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000141_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000141_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000141_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000141_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--提交已做完的任务
--**********************************
function x000141_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--死亡事件
--**********************************
function x000141_OnDie( sceneId, selfId, killerId )
end

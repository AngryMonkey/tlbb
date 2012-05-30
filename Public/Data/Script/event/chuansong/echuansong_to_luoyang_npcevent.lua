--事件
--传送到洛阳

--脚本号
x400919_g_ScriptId = 400919

--任务文本描述
x400919_g_MissionName="送我回洛阳吧"
x400919_g_MissionInfo="俺们兰陵郡是辽国运送粮草的必经之地，现在路上多出好多草原狼来，得有人杀点狼俺们才敢出去运草料。"  --任务描述
x400919_g_MissionTarget="杀死5只草原狼"		--任务目标
x400919_g_ContinueInfo="你已经杀了5只草原狼吗？它们就在村子南边，走走就看见了。小心点啊，被一群狼围攻了那你就白瞎了。"		--未完成任务的npc对话
x400919_g_MissionComplete="谢谢啊，俺们终于敢出门了"					--完成任务npc说话的话

--**********************************
--入口函数
--**********************************
function x400919_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 159, 240)
end

--**********************************
--列举事件
--**********************************
function x400919_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x400919_g_ScriptId,x400919_g_MissionName)
end

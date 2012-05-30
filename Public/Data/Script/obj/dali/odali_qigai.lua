--大理乞丐

--任务号
x002070_g_MissionId_1 = 706
x002070_g_MissionId_2 = 707
x002070_g_MissionId_3 = 708

x002070_g_scriptId=002070

x002070_g_SignPost = {x = 215, z = 284, tip = "段延庆"}

function x002070_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	misIndex_1 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_1)
	misIndex_2 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_2)
	misIndex_3 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_3)
	BeginEvent(sceneId)
		AddText(sceneId,"  呜呜呜……我好想爹娘啊，当年无量山的一场闹水灾，害得我流离失所，家破人亡！只好在大理城讨饭度日。")
		if	IsHaveMission(sceneId,selfId,x002070_g_MissionId_1) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex_1,0) < 1  then
				AddNumText(sceneId,x002070_g_scriptId,"给他一个馒头",2,0)
			end
		elseif	IsHaveMission(sceneId,selfId,x002070_g_MissionId_2) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex_2,0) < 1  then
				AddNumText(sceneId,x002070_g_scriptId,"给他一件布衣",2,1)
			end
		elseif	IsHaveMission(sceneId,selfId,x002070_g_MissionId_3) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex_3,0) < 1  then
				AddNumText(sceneId,x002070_g_scriptId,"给他一把矿锄",2,2)
			end
		end
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x002070_OnEventRequest( sceneId, selfId, targetId, eventId )
	misIndex_1 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_1)
	misIndex_2 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_2)
	misIndex_3 = GetMissionIndexByID(sceneId,selfId,x002070_g_MissionId_3)
	if	GetNumText()==0	then
		if	HaveItemInBag (  sceneId, selfId, 30101001)	 > 0  then
			DelItem (  sceneId, selfId, 30101001, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex_1, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex_1, 1, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"  太谢谢你了！#r<小乞丐三口两口吃掉了这个馒头>")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"任务完成！")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x002070_g_SignPost.x, x002070_g_SignPost.z, x002070_g_SignPost.tip )
		else
			BeginEvent(sceneId)
				AddText(sceneId,"馒头？馒头在哪里？")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif	GetNumText()==1	then
		if	HaveItemInBag (  sceneId, selfId, 10113001)	 > 0  then
			DelItem (  sceneId, selfId, 10113001, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex_2, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex_2, 1, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"  太谢谢你了！#r<小乞丐把布衣裹在身上>")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"任务完成！")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x002070_g_SignPost.x, x002070_g_SignPost.z, x002070_g_SignPost.tip )
		else
			BeginEvent(sceneId)
				AddText(sceneId,"布衣？布衣在哪里？")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif	GetNumText()==2	then
		if	HaveItemInBag (  sceneId, selfId, 10102012)	 > 0  then
			DelItem (  sceneId, selfId, 10102012, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex_3, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex_3, 1, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"  厄……你为什么要给我矿锄呢？#r  好吧，我收下了，可是我还是不想去干活，天天这样要饭也挺好啊。")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"任务完成！")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x002070_g_SignPost.x, x002070_g_SignPost.z, x002070_g_SignPost.tip )
		else
			BeginEvent(sceneId)
				AddText(sceneId,"矿锄？没有就算了，本来我也不想要的。")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end

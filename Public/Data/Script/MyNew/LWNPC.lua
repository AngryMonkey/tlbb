--脚本号
x892005_g_scriptId = 892005

--**********************************
--事件交互入口
--**********************************
function x892005_OnDefaultEvent( sceneId, selfId, targetId)
	BeginEvent(sceneId)     
		AddText(sceneId, "    #cfff263龙纹可以拥有三种扩展属性，属性必须先学习，才可提升与更换。#r    #G注意：进行龙纹操作时，请按照正确的步骤操作。#r    #cfff263如对现有龙纹的扩展属性不满意，可使用更换扩展属性更能来更换。")
		AddText(sceneId, "    #G龙纹学习扩展属性之后，更换龙纹不会改变扩展属性。")
		AddNumText(sceneId, x892005_g_scriptId,"我要学习扩展属性", 6, 1)
		AddNumText(sceneId, x892005_g_scriptId,"我要提升扩展属性", 6, 2)
		AddNumText(sceneId, x892005_g_scriptId,"我要更换扩展属性", 6, 3)
		AddNumText(sceneId, x892005_g_scriptId,"我要合成更高级的龙纹", 6, 4)							
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x892005_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110728)
	elseif GetNumText()==2 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110730)
	elseif GetNumText()==3 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110727)
	elseif GetNumText()==4 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, selfId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId,  20110725)
	end
end

--**********************************
--醒目提示
--**********************************
function x892005_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

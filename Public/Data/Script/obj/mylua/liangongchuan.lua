--传送NPC
--驿站老板--单简修正完善QQ：274392181
--普通

x210505_g_ScriptId	= 210505

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x210505_g_mpInfo		= {}
x210505_g_mpInfo[0]	= { "星宿", 16,  96, 152, MP_XINGSU }
x210505_g_mpInfo[1]	= { "逍遥", 14,  67, 145, MP_XIAOYAO }
x210505_g_mpInfo[2]	= { "少林",  9,  96, 127, MP_SHAOLIN }
x210505_g_mpInfo[3]	= { "天山", 17,  95, 120, MP_TIANSHAN }
x210505_g_mpInfo[4]	= { "天龙", 13,  96, 120, MP_DALI }
x210505_g_mpInfo[5]	= { "峨嵋", 15,  89, 139, MP_EMEI }
x210505_g_mpInfo[6]	= { "武当", 12, 103, 140, MP_WUDANG }
x210505_g_mpInfo[7]	= { "明教", 11,  98, 167, MP_MINGJIAO }
x210505_g_mpInfo[8]	= { "丐帮", 10,  91, 116, MP_GAIBANG }

x210505_g_Yinpiao = 40002000
--**********************************
--事件交互入口
--**********************************
function x210505_OnDefaultEvent( sceneId, selfId, targetId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, 400, 1 )
end

--**********************************
--事件列表选中一项
--**********************************
function x210505_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( (300053), "ChuanSong", sceneId, selfId, GetNumText(),1)
end

--**********************************
--根据门派ID获取门派信息
--**********************************
function x210505_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x210505_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x210505_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x210505_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--对话窗口信息提示
--**********************************
function x210505_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

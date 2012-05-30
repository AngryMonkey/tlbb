--门派令牌

-- 脚本号
x890061_g_ScriptId	= 890061
x890061_g_ItemId = 39901006
x890061_g_UseScriptId = 890062
--**********************************
-- 事件交互入口
--**********************************
function x890061_OnDefaultEvent( sceneId, selfId )
	BeginEvent( sceneId )
		AddText( sceneId, "尊敬的玩家，请选择您要更换的门派。#G注意，更换门派后，心法等级全部调整为150级！" )
		AddNumText( sceneId, x890061_g_UseScriptId, "慕容",3,29 )
		AddNumText( sceneId, x890061_g_UseScriptId, "星宿",3,20 )
		AddNumText( sceneId, x890061_g_UseScriptId, "逍遥",3,21 )
		AddNumText( sceneId, x890061_g_UseScriptId, "少林",3,22 )
		AddNumText( sceneId, x890061_g_UseScriptId, "天山",3,23 )
		AddNumText( sceneId, x890061_g_UseScriptId, "天龙",3,24 )
		AddNumText( sceneId, x890061_g_UseScriptId, "峨眉",3,25 )
		AddNumText( sceneId, x890061_g_UseScriptId, "武当",3,26 )
		AddNumText( sceneId, x890061_g_UseScriptId, "明教",3,27 )
		AddNumText( sceneId, x890061_g_UseScriptId, "丐帮",3,28 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

--**********************************
-- 
--**********************************
function x890061_IsSkillLikeScript( sceneId, selfId)
	return 0
end
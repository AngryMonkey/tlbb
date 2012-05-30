--脚本ID
x399999_g_scriptId = 399999
x300053_g_scriptId = 300053
--**********************************
-- 事件交互入口
--**********************************
function x399999_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "#Y    欢迎来到,我们将会以最大的热情来回馈您对我们的支持，祝您游戏愉快！#Y#r网站:#www.douniwan.com/")		
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff随身功能     #R【随身常用功能】", 12, 100)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff拜入师门     #R【加入更换门派】", 12,  200)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff宝石功能     #R【打孔镶嵌合成】", 12,  300)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff装备功能     #R【强化鉴定升级】", 12,  500)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff珍兽功能     #R【技能还童其他】", 12,  600)
		AddNumText(sceneId, x300053_g_scriptId,"#e6f00c7#c00ffff传送功能     #R【超强随身功能】", 9, 400)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end
--**********************************
--玩家屏幕中间提示
--**********************************
function x399999_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x399999_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end
--**********************************
-- 
--**********************************
function x399999_IsSkillLikeScript( sceneId, selfId)
	return 0
end

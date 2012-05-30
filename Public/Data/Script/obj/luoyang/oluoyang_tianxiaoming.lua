--洛阳NPC
--田骁鸣
--普通

x000104_g_ScriptId	= 000104

--操作集
x000104_g_Key				=
{
		["stu"]					= 100,	--学习骑乘技能
		["buy"]					= 101,	--购买骑乘
}

--技能列表
x000104_g_Skill			=
{
	{ id=446, name="骑术：陆行雕"},
}

--**********************************
--事件交互入口
--**********************************
function x000104_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  如果你是九大门派的弟子，就可以找门派里的骑乘技能传授人学习骑术。" )
	---	AddNumText( sceneId, x000104_g_ScriptId, "学习骑乘技能", -1, x000104_g_Key["stu"] )
		AddNumText( sceneId, x000104_g_ScriptId, "购买骑乘", 7, x000104_g_Key["buy"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000104_OnEventRequest( sceneId, selfId, targetId )
	local	key	= GetNumText()

	if key == 0	then
		AddSkill( sceneId, selfId, 21 )
		x000104_MsgBox( sceneId, selfId, targetId, "  你现在已经学会骑乘技能了。" )
--	elseif key == x000104_g_Key["stu"] then
--		if GetLevel( sceneId, selfId ) < 20 then
--			x000104_MsgBox( sceneId, selfId, targetId, "  请20级后再来找我！" )
--		end
--		if LuaFnHaveSpecificEquitation( sceneId, selfId, x000104_g_Skill[1].id ) == 0 then
--			if LuaFnLearnSpecificEquitation( sceneId, selfId, x000104_g_Skill[1].id, 1 ) == 1 then
--				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
--				x000104_MsgBox( sceneId, selfId, targetId, "  你学会了“"..x000104_g_Skill[1].name.."”。" )
--			end
--		else
--			x000104_MsgBox( sceneId, selfId, targetId, "  你已经学会“"..x000104_g_Skill[1].name.."”了啊！" )
--		end
	elseif key == x000104_g_Key["buy"] then
		DispatchShopItem( sceneId, selfId, targetId, 138 )
	end
end

--**********************************
--对话框提示
--**********************************
function x000104_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

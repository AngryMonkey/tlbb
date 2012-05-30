--苏州NPC
--朱锋
--普通

x001069_g_ScriptId	= 001069

--操作集
x001069_g_Key				=
{
	["inf"]	= 1000,	--制造介绍
	["ln"]	= 1,		--我要学习精炼配方 - 精炼 - 铸造
	["zh"]	= 2,		--我要学习精制配方 - 精制 - 缝纫
	["gn"]	= 3,		--我要学习精工配方 - 精工 - 工艺
	["sh"]	= 4,		--精工配方商店
}

--商店编号
x001069_g_shoptableindex=196

--**********************************
--事件交互入口
--**********************************
function x001069_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "    十年磨一剑，我朱锋做出来的东西是天下最好的！" )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddNumText( sceneId, x001069_g_ScriptId, "我要学习精炼（锻造）配方", 2, x001069_g_Key["ln"] )
			AddNumText( sceneId, x001069_g_ScriptId, "我要学习精制（缝纫）配方", 2, x001069_g_Key["zh"] )
			AddNumText( sceneId, x001069_g_ScriptId, "我要学习精工（工艺）配方", 2, x001069_g_Key["gn"] )
			AddNumText( sceneId, x001069_g_ScriptId, "购买精工配方", 7, x001069_g_Key["sh"])
		end
		AddNumText( sceneId, x001069_g_ScriptId, "制造介绍", 11, x001069_g_Key["inf"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件列表选中一项
--**********************************
function x001069_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()

	if key == x001069_g_Key["inf"] then
		x001069_MsgBox( sceneId, selfId, targetId, "#{INTRO_ZHIZAO}" )
	
	elseif key == x001069_g_Key["ln"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 46 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 46, 1 )
		end
		for i = 644, 703 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "    恭喜你已经学会了所有的精炼配方。" )

	elseif key == x001069_g_Key["zh"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 47 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 47, 1 )
		end
		for i = 704, 773 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		for i = 804, 883 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "    恭喜你已经学会了所有的精制配方。" )
	
	elseif key == x001069_g_Key["gn"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 48 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 48, 1 )
		end
		for i = 774, 803 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		
		for i = 1064, 1075 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
 		
		x001069_MsgBox( sceneId, selfId, targetId, "    恭喜你已经学会了所有的精工配方。" )
	elseif key == x001069_g_Key["sh"] then
		DispatchShopItem( sceneId, selfId, targetId, x001069_g_shoptableindex )
	end

end

--**********************************
--Message Box
--**********************************
function x001069_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

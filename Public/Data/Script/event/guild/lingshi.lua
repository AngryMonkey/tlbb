-- 灵石的收集和查询数量

--************************************************************************
--MisDescBegin

-- 脚本号
x600050_g_ScriptId = 600050

-- 任务目标 NPC
x600050_g_Name = "上官冰"
x600050_g_Name2 = "上官雪"

--帮战数据索引，对应程序中的 enum GUILDWAR_INT_ARRAY
x600050_g_A_LingShiIndex = 2
x600050_g_B_LingShiIndex = 7

--个人积分数据索引，对应程序enum GUILDWAR_INT_INDEX
x600050_g_Human_ResourceNumIndex = 4					--个人交纳资源个数索引


x600050_g_LingShi = {"青龙石","白虎石","朱雀石","玄武石","盘古石"}		--灵石名字
x600050_g_LingShiID = {30900051,30900052,30900053,30900054,30900055}	--灵石ID

--帮战副本脚本
x600050_g_BangzhanScriptId	= 402047

x600050_g_GuildPoint_LingShi = 1						--积分规则索引，表GuildWarPoint.txt的ID

--MisDescEnd
--************************************************************************

--**********************************
-- 任务入口函数
--**********************************
function x600050_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
--	if GetName( sceneId, targetId ) ~= x600050_g_Name then		-- 判断该npc是否是对应任务的npc
--		return
--	end

	local numText = GetNumText()
	
	if numText == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_39}")
			AddNumText(sceneId, x600050_g_ScriptId, "确定", 8, 3 )
			AddNumText(sceneId, x600050_g_ScriptId, "取消", 8, 4 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_63}")
			AddNumText(sceneId, x600050_g_ScriptId, "确定", 8, 5 )
			AddNumText(sceneId, x600050_g_ScriptId, "取消", 8, 6 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == 3 then
		x600050_AcceptLingshi( sceneId, selfId, targetId )
	elseif numText == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif numText == 5 then
		x600050_QueryLingshi( sceneId, selfId, targetId )
	elseif numText == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
-- 列举事件
--**********************************
function x600050_OnEnumerate( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x600050_g_Name then		--判断该npc是否是对应任务的npc
--		return
--	end
	
	AddNumText( sceneId, x600050_g_ScriptId, "#{BHXZ_081103_38}", 4, 1 ) --交纳灵石
	AddNumText( sceneId, x600050_g_ScriptId, "#{BHXZ_081103_62}", 4, 2 )	--查看灵石个数
end

--**********************************
-- 查询灵石数量
--**********************************
function x600050_QueryLingshi( sceneId, selfId, targetId )

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end
	
	--是否开始帮战积分
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_157}" )
		return
	end
	
	local name = GetName( sceneId, targetId )
	local humanguildid = GetHumanGuildID(sceneId, selfId)
	
	if name == x600050_g_Name then
		local msg = "#{BHXZ_081103_140}"
		
		for i = 1, getn( x600050_g_LingShi ) do
			local num = GetGuildIntNum( sceneId, humanguildid, x600050_g_A_LingShiIndex+i-1 )
			msg = msg.."#r"..x600050_g_LingShi[i].."："..num
		end
		
		x600050_NotifyFailBox( sceneId, selfId, targetId, msg )
	elseif name == x600050_g_Name2 then
		local msg = "#{BHXZ_081103_140}"
		
		for i = 1, getn( x600050_g_LingShi ) do
			local num = GetGuildIntNum( sceneId, humanguildid, x600050_g_B_LingShiIndex+i-1 )
			msg = msg.."#r"..x600050_g_LingShi[i].."："..num
		end
		
		x600050_NotifyFailBox( sceneId, selfId, targetId, msg )
	end
	
end

--**********************************
-- 接收灵石数量
--**********************************
function x600050_AcceptLingshi( sceneId, selfId, targetId )

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_78}" )
		return
	end
	
	--是否开始帮战积分
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_37}" )
		return
	end
	
	local name = GetName( sceneId, targetId )
	local humanguildid = GetHumanGuildID(sceneId, selfId)
	local LingShiPerPoint = GetGuildWarPoint(sceneId, x600050_g_GuildPoint_LingShi)
	
	if name == x600050_g_Name then --A帮
		local msg = ""
		local point = 0
		local totalnum = 0
		local NumPerType = {0,0,0,0,0}
		
		for i = 1, getn( x600050_g_LingShiID ) do
			local num = LuaFnGetAvailableItemCount( sceneId, selfId, x600050_g_LingShiID[i] )
			local alreadynum = GetGuildIntNum( sceneId, humanguildid, x600050_g_A_LingShiIndex+i-1 ) --已有数量
			if num > 0 and alreadynum ~= -1 then --不等于-1的判断可以判断出玩家在正确的帮派中
				if LuaFnDelAvailableItem( sceneId, selfId, x600050_g_LingShiID[i], num ) > 0 then
					point = point + num*LingShiPerPoint
					totalnum = totalnum + num
					NumPerType[i] = num
					SetGuildIntNum( sceneId, humanguildid, x600050_g_A_LingShiIndex+i-1, num+alreadynum )
					msg = msg.."#r"..x600050_g_LingShi[i].."："..num
				end
			end
		end
		
		if point > 0 then
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_141}"..msg )
			
			--增加积分
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddAGuildPoint", sceneId, selfId, humanguildid, point )
--			--增加帮贡，每5个灵石增加一点帮贡
--			local alreadyResource = GetHumanGuildInt( sceneId, selfId, x600050_g_Human_ResourceNumIndex )
--			local alreadymod = mod(alreadyResource, 5)
--			local addbanggong = floor((alreadymod+totalnum) / 5)
--			if addbanggong > 0 then
--				CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, addbanggong )
--			end
			Msg2Player(sceneId, selfId, "#{BHXZ_081103_142}"..totalnum.."#{BHXZ_081103_143}" , MSG2PLAYER_PARA)
			--增加个人积分
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, selfId, x600050_g_Human_ResourceNumIndex, totalnum )
			--统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("qinglong=%d,baihu=%d,zhuque=%d,xuanwu=%d,pangu=%d,total=%d", NumPerType[1], NumPerType[2], NumPerType[3], NumPerType[4], NumPerType[5], totalnum)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_RESOURCE, guid, log)
		else
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_144}" )
		end
	elseif name == x600050_g_Name2 then --B帮
		local msg = ""
		local point = 0
		local totalnum = 0
		local NumPerType = {0,0,0,0,0}
		
		for i = 1, getn( x600050_g_LingShiID ) do
			local num = LuaFnGetAvailableItemCount( sceneId, selfId, x600050_g_LingShiID[i] )
			local alreadynum = GetGuildIntNum( sceneId, humanguildid, x600050_g_B_LingShiIndex+i-1 ) --已有数量
			if num > 0 and alreadynum ~= -1 then --不等于-1的判断可以判断出玩家在正确的帮派中
				if LuaFnDelAvailableItem( sceneId, selfId, x600050_g_LingShiID[i], num ) > 0 then
					point = point + num*LingShiPerPoint
					totalnum = totalnum + num
					NumPerType[i] = num
					SetGuildIntNum( sceneId, humanguildid, x600050_g_B_LingShiIndex+i-1, num+alreadynum )
					msg = msg.."#r"..x600050_g_LingShi[i].."："..num
				end
			end
		end
		
		if point > 0 then
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_141}"..msg )
			
			--增加积分
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddBGuildPoint", sceneId, selfId, humanguildid, point )
--			--增加帮贡，每5个灵石增加一点帮贡
--			local alreadyResource = GetHumanGuildInt( sceneId, selfId, x600050_g_Human_ResourceNumIndex )
--			local alreadymod = mod(alreadyResource, 5)
--			local addbanggong = floor((alreadymod+totalnum) / 5)
--			if addbanggong > 0 then
--				CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, addbanggong )
--			end
			Msg2Player(sceneId, selfId, "#{BHXZ_081103_142}"..totalnum.."#{BHXZ_081103_143}" , MSG2PLAYER_PARA)
			--增加个人积分
			CallScriptFunction( x600050_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, selfId, x600050_g_Human_ResourceNumIndex, totalnum )
			--统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("qinglong=%d,baihu=%d,zhuque=%d,xuanwu=%d,pangu=%d,total=%d", NumPerType[1], NumPerType[2], NumPerType[3], NumPerType[4], NumPerType[5], totalnum)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_RESOURCE, guid, log)
		else
			x600050_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_144}" )
		end
	end
	
end

--**********************************
-- 检测接受条件
--**********************************
function x600050_CheckAccept( sceneId, selfId, targetId )
	return 1
end

--**********************************
--接受
--**********************************
function x600050_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--继续
--**********************************
function x600050_OnContinue( sceneId, selfId, targetId )
--	BeginEvent( sceneId )
--		AddText( sceneId, x600050_g_MissionName )
--		AddText( sceneId, "good 继续" )
--	EndEvent( )
--	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600050_g_ScriptId, x600050_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x600050_OnAbandon( sceneId, selfId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600050_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--提交
--**********************************
function x600050_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x600050_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x600050_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

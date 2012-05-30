--苏州NPC
--艾虎
--一般

--脚本号
x001031_g_ScriptId	= 001031

--**********************************
--事件交互入口
--**********************************
function x001031_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "#{ZSCH_20071018_004}" )
		AddNumText( sceneId, x001031_g_ScriptId, "领取宠物战斗称号", 6, 10 )
		AddNumText( sceneId, x001031_g_ScriptId, "宠物称号介绍", 11, 11 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x001031_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
		--打开珍兽选择界面
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 7 )				--珍兽称号领取分支
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 3 )	--调用珍兽界面
	elseif GetNumText() == 11 then
		x001031_MsgBox( sceneId, selfId, targetId, "#{ZSCH_20071018_006}" )
	end

end

--**********************************
--领取珍兽战斗称号
--**********************************
function x001031_OnAcceptPetTitle( sceneId, selfId, targetId, petHid, petLid )

	if petHid == nil or petLid == nil then
		x001031_MsgBox( sceneId, selfId, targetId, "请选择需要领取称号的宠物。" )
		return
	end
	if LuaFnIsPetGrowRateByGUID( sceneId, selfId, petHid, petLid ) == 0 then
		x001031_MsgBox( sceneId, selfId, targetId, "#{ZSCH_20071018_008}" )
		return
	end

	--悟性
	local	nSavvy	= GetPetSavvy( sceneId, selfId, petHid, petLid )
	local	nLevS		= 0
	--成长率
	local	nGrow		= LuaFnGetPetGrowRateByGUID( sceneId, selfId, petHid, petLid )
	local	nLevG		= 0
	--资质
	local	nPer		= GetPetPerceptionLevel( sceneId, selfId, petHid, petLid )
	local	nLevP		= 0
	--确定三围档次
  if nSavvy ==10  then
		nLevS				= 3
	elseif nSavvy >= 8 then
		nLevS				= 2
	elseif nSavvy >= 5 then
		nLevS				= 1
	elseif nSavvy	>= 0 then
		nLevS				= 0
	end
	if nGrow >= 4 then
		nLevG				= 2
	elseif nGrow >= 3 then
		nLevG				= 1
	elseif nGrow >= 1 then
		nLevG				= 0
	end
	if nPer >= 9 then
		nLevP				= 2
	elseif nPer >= 6 then
		nLevP				= 1
	elseif nPer >= 1 then
		nLevP				= 0
	end
	--确定珍兽称号ID
	local	nTitle	= 100000 + 100 * nLevS + 10 * nLevG + nLevP
	local	nRet		= LuaFnSetPetTitle( sceneId, selfId, petHid, petLid, nTitle )
	if nRet == 1 then
		x001031_MsgBox( sceneId, selfId, targetId, "#{ZSCH_20071018_010}" )
		--相关公告
		local	_, nTLevel, nTName, nTDes	= LuaFnGetPetTitleAttr( sceneId, selfId, petHid, petLid, nTitle )
		local	szMsg
		if nTLevel ~= nil and nTLevel > 550 then
			szMsg			= format( "#{ZSCH_NEW1}#{_INFOUSR%s}#{ZSCH_NEW2}#{_INFOMSG%s}#{ZSCH_NEW3}%s！",
				GetName( sceneId, selfId ),
				LuaFnGetPetTransferByGUID( sceneId, selfId, petHid, petLid ),
				nTName )
			AddGlobalCountNews( sceneId, szMsg )
		end
	else
		x001031_MsgBox( sceneId, selfId, targetId, "#{ZSCH_20071018_009}" )
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x001031_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

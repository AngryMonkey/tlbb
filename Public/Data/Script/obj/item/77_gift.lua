--===============================================
--	七夕礼包 zhangqiang
--===============================================

x300103_g_scriptId = 300103

x300103_g_GiftInfo = {
			[30504119] = {	GiftList = {						--彩凤双飞盒
							{ItemId = 10141132, Count = 1},		--花车
							{ItemId = 10124127, Count = 2},		--时装
							{ItemId = 30309189, Count = 2}		--高级还童丹
							},
					NeedLevel	=	10,
					OKStr		=	"#{QXLH_090806_2}",
					FailStr		=	"#{QXLH_090806_1}"
					},
			
			[30504120] = {	GiftList = {						--灵犀一点盒
							{ItemId = 10141115, Count = 1},		--碧水金睛兽
							{ItemId = 10124127, Count = 1},		--时装
							{ItemId = 30309189, Count = 1}		--高级还童丹
							},
					NeedLevel	=	10,
					OKStr		=	"#{QXLH_090806_4}",
					FailStr		=	"#{QXLH_090806_3}"
					}
			}
			
x300103_g_ImpactId = 49

--==================================
--事件交互入口
--==================================
function x300103_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end



function x300103_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--==================================
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--==================================
function x300103_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--==================================
--引导心跳处理入口：
--返回：1继续下次心跳；0：中断引导。
--==================================
function x300103_OnActivateEachTick( sceneId, selfId)
	return 1; 
end

--==================================
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--==================================
function x300103_OnActivateOnce( sceneId, selfId )
	
	local ItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local GiftTable = x300103_g_GiftInfo[ItemIndex]
	if GiftTable == nil then
		return 0
	end

	BeginAddItem( sceneId )
	for i = 1, getn( GiftTable.GiftList ) do
		AddItem( sceneId, GiftTable.GiftList[i].ItemId, GiftTable.GiftList[i].Count )
	end
	local ret = EndAddItem( sceneId, selfId )
	
	if ret > 0 then
		AddItemListToHuman( sceneId, selfId )
	else
		return 0
	end
	x300103_NotifyTips( sceneId, selfId, GiftTable.OKStr )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x300103_g_ImpactId, 0 )

	local guid = LuaFnObjId2Guid( sceneId, selfId )
	if guid ~= nil then
		local szLog = format( "%d,%d", sceneId, ItemIndex )
		ScriptGlobal_AuditGeneralLog( LUAAUDIT_77_GIFTBAG, guid, szLog )
	end

	return 1
end

--==================================
--条件检测入口
--==================================
function x300103_OnConditionCheck( sceneId, selfId )
	
	--校验Item是否有效
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end

	--查找列表
	local ItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local GiftTable = x300103_g_GiftInfo[ItemIndex]
	if GiftTable == nil then
		return 0
	end
	
	--等级检查
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	if CurLevel < GiftTable.NeedLevel then
		x300103_NotifyTips( sceneId, selfId, "#{GMTripperObj_Resource_Info_Level_Not_Enough}" )
		return 0
	end

	--检查背包空间
	local nFreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	local nNeedSpace = 0
	for i = 1, getn( GiftTable.GiftList ) do
		nNeedSpace = nNeedSpace + GiftTable.GiftList[i].Count
	end
	nNeedSpace = nNeedSpace - 1		--礼包删去后会空出一格，所以这里减1
	if nFreeSpace < nNeedSpace then
		x300103_NotifyTips( sceneId, selfId, GiftTable.FailStr )
		return 0
	end

	return 1
end

--==================================
--消耗检测及处理入口：
--==================================
function x300103_OnDeplete( sceneId, selfId )
	
	if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
		
		local ItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
		local GiftTable = x300103_g_GiftInfo[ItemIndex]
		if GiftTable == nil then
			return 0
		end
	
		return 1
	end
	return 0;
end

--**********************************
--醒目信息提示
--**********************************
function x300103_NotifyTips( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

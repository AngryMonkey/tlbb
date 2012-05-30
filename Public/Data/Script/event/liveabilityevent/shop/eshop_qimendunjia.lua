--商店
--门派商店
--逍遥 奇门遁甲

--脚本号
x701611_g_ScriptId = 701611

--商店号
x701611_g_shoptableindex=57

--商店名称
x701611_g_ShopName = "购买奇门遁甲配方"

--**********************************
--任务入口函数
--**********************************
function x701611_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	DispatchShopItem( sceneId, selfId,targetId, x701611_g_shoptableindex )
end

--**********************************
--列举事件
--**********************************
function x701611_OnEnumerate( sceneId, selfId, targetId )
	--判断是否是本派弟子
	if GetMenPai(sceneId,selfId) == MP_XIAOYAO then
		AddNumText(sceneId,x701611_g_ScriptId,x701611_g_ShopName,7,-1)
    end
	return
end

--**********************************
--检测接受条件
--**********************************
function x701611_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x701611_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x701611_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x701611_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x701611_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x701611_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x701611_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--进入区域事件
--**********************************
function x701611_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x701611_OnItemChanged( sceneId, selfId, itemdataId )
end

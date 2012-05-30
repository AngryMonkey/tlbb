--商店
--门派商店
--丐帮 酿酒

--脚本号
x701606_g_ScriptId = 701606

--商店号
x701606_g_shoptableindex=59

--商店名称
x701606_g_ShopName = "购买酿酒配方"

--**********************************
--任务入口函数
--**********************************
function x701606_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	DispatchShopItem( sceneId, selfId,targetId, x701606_g_shoptableindex )
end

--**********************************
--列举事件
--**********************************
function x701606_OnEnumerate( sceneId, selfId, targetId )
	--判断是否是本派弟子
	if GetMenPai(sceneId,selfId) == MP_GAIBANG then
		AddNumText(sceneId,x701606_g_ScriptId,x701606_g_ShopName,7,-1)
    end
	return
end

--**********************************
--检测接受条件
--**********************************
function x701606_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x701606_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x701606_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x701606_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x701606_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x701606_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x701606_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--进入区域事件
--**********************************
function x701606_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x701606_OnItemChanged( sceneId, selfId, itemdataId )
end

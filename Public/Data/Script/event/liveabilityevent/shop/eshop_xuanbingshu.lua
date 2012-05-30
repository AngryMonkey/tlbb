--商店
--门派商店
--天山 玄冰术

--脚本号
x701612_g_ScriptId = 701612

--商店号
x701612_g_shoptableindex=58

--商店名称
x701612_g_ShopName = "购买玄冰术配方"

--**********************************
--任务入口函数
--**********************************
function x701612_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	DispatchShopItem( sceneId, selfId,targetId, x701612_g_shoptableindex )
end

--**********************************
--列举事件
--**********************************
function x701612_OnEnumerate( sceneId, selfId, targetId )
	--判断是否是本派弟子
	if GetMenPai(sceneId,selfId) == MP_TIANSHAN then
		AddNumText(sceneId,x701612_g_ScriptId,x701612_g_ShopName,7,-1)
    end
	return
end

--**********************************
--检测接受条件
--**********************************
function x701612_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x701612_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x701612_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x701612_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x701612_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x701612_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x701612_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--进入区域事件
--**********************************
function x701612_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x701612_OnItemChanged( sceneId, selfId, itemdataId )
end

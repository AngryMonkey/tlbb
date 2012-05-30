--情缘天龙

--脚本号
x889071_g_scriptId = 889071

--所拥有的事件ID列表

--**********************************
--事件列表#G打孔前，必须保证身上有一个8级精铁或8级棉布或8级秘银。
--**********************************
function x889071_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText( sceneId, "  #e0e8de5#Y一键#W打孔#G(#cFF0000强化#G)#G说明：" )	

	AddText( sceneId, "  #Y将#G打孔#G(#cFF0000强化#G)的装备#G全部放在#cFF0000包裹内" )
	AddText( sceneId, "  #G然后#W您只需要#G点击#Y打孔#G(#cFF0000强化#G)#cFF0000即可" )
	AddText( sceneId, "  #Y装备#W打孔#G(#cFF0000强化#G)数，一键即可实现背包全部装备3孔。" )
	AddText(sceneId,"   #G本服务器已开通#cFF0000坐骑打孔#W和#cFF0000镶嵌 ")	
	AddText(sceneId,"   #Y暗器#G.#Y武魂#G.#Y时装#G.#Y龙纹#G请在#cFF0000网站打孔#Y后到游戏中#G镶嵌！")	
	AddText( sceneId, "  本NPC只支持#cFF0000100级#G以下#W装备强化,#cFF0000100级#G以上#W装备请到#Y武器商#W进行强化" )	
	--AddText( sceneId, "  #W游戏内可以#G强化到#cFF00009#G,强化#cFF000010-15#G请到网站#Y后台！" )
	AddNumText( sceneId, x889071_g_scriptId, "#gffff00#Y一键#W打孔", 2, 300)
	AddNumText( sceneId, x889071_g_scriptId, "#gffff00#Y一键#W强化", 2, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x889071_OnDefaultEvent( sceneId, selfId,targetId )
	x889071_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x889071_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then
		local bagbegin = GetBasicBagStartPos(sceneId, selfId)
		local bagend   = GetBasicBagEndPos(sceneId, selfId)
		for i=bagbegin, bagend do
	       nLevel = GetBagItemLevel( sceneId, selfId, i )
	              if nLevel <= 100 then
                           if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
                               LuaFnEquipEnhance( sceneId, selfId, i, 0 )
		             end
	              end
	       end
	       x889071_NotifyTip( sceneId, selfId, "包裹100级以下所有装备已成功强化 1 次。" )
	       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	elseif GetNumText() == 300 then
		x889071_NotifyFailBox( sceneId, selfId, targetId, "#Y#G一键打孔#Y请使用#r#G随身宝石#Y→#G宝石功能#Y→#G我要打孔#Y。#r点击一次即可实现一键背包全部3孔#r#G注意:不用反复点击。" )
	elseif GetNumText() == 100 then
		local	tEquipGemTable	= { 0, 1, 2, 3, 4, 5, 6, 7, 8, 12, 14, 15, 16, 17, 18 }

		local	Bore_Count			= GetBagGemCount( sceneId, selfId, 0 )
		local nLevel					= GetBagItemLevel( sceneId, selfId, 0 )
		local EquipType				= LuaFnGetBagEquipType( sceneId, selfId, 0 )
		local find						= 0
			for i, gem in tEquipGemTable do
				if gem == EquipType then
					find = 1
				end
			end
		--if find == 0 then
			--x889071_NotifyTip( sceneId, selfId, "该装备不能打孔。" )
			--return
		--end
		--if nLevel < 1 then
			--x889071_NotifyTip( sceneId, selfId, "只提供1以上的装备打孔。" )
			--return
		--end
		--if  GetItemCount( sceneId, selfId, 20500008 ) < 1 or GetItemCount( sceneId, selfId, 20501008 ) < 1 or GetItemCount( sceneId, selfId, 20502008 ) < 1 then
			--x889071_NotifyTip( sceneId, selfId, "请确保身上有足够的材料。" )
			--return
		--end
		--if  GetItemCount( sceneId, selfId, 20500008 ) > 0 then
			--DelItem( sceneId, selfId, 20500008, 1 )
		--else if  GetItemCount( sceneId, selfId, 20501008 ) > 0 then
			--DelItem( sceneId, selfId, 20501008, 1 )
		--else if  GetItemCount( sceneId, selfId, 20502008 ) > 0 then
			--DelItem( sceneId, selfId, 20502008, 1 )
		--end
              AddBagItemSlot( sceneId, selfId, 0 )
              AddBagItemSlot( sceneId, selfId, 1 )
              AddBagItemSlot( sceneId, selfId, 2 )
              AddBagItemSlot( sceneId, selfId, 3 )
              AddBagItemSlot( sceneId, selfId, 4 )
              AddBagItemSlot( sceneId, selfId, 5 )
              AddBagItemSlot( sceneId, selfId, 6 )
              AddBagItemSlot( sceneId, selfId, 7 )
              AddBagItemSlot( sceneId, selfId, 8 )
              AddBagItemSlot( sceneId, selfId, 9 )
              AddBagItemSlot( sceneId, selfId, 10 )
              AddBagItemSlot( sceneId, selfId, 11 )
              AddBagItemSlot( sceneId, selfId, 12 )
              AddBagItemSlot( sceneId, selfId, 13 )
              AddBagItemSlot( sceneId, selfId, 14 )
              AddBagItemSlot( sceneId, selfId, 15 )
              AddBagItemSlot( sceneId, selfId, 16 )
              AddBagItemSlot( sceneId, selfId, 17 )
              AddBagItemSlot( sceneId, selfId, 18 )
              AddBagItemSlot( sceneId, selfId, 19 )
              AddBagItemSlot( sceneId, selfId, 20 )
              AddBagItemSlot( sceneId, selfId, 21 )
              AddBagItemSlot( sceneId, selfId, 22 )
              AddBagItemSlot( sceneId, selfId, 23 )
              AddBagItemSlot( sceneId, selfId, 24 )
              AddBagItemSlot( sceneId, selfId, 25 )
              AddBagItemSlot( sceneId, selfId, 26 )
              AddBagItemSlot( sceneId, selfId, 27 )
              AddBagItemSlot( sceneId, selfId, 28 )
              AddBagItemSlot( sceneId, selfId, 29 )
		x889071_NotifyTip( sceneId, selfId, "包裹所有装备已成功打孔 1 次。" )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x889071_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x889071_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
end

--**********************************
--继续（已经接了任务）
--**********************************
function x889071_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--提交已做完的任务
--**********************************
function x889071_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

--**********************************
--死亡事件
--**********************************
function x889071_OnDie( sceneId, selfId, killerId )
end

--**********************************
--醒目提示
--**********************************
function x889071_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--醒目提示
--**********************************
function x889071_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x889071_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

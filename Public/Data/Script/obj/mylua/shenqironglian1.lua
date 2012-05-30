--大理NPC
--抽奖
--普通
x889063_g_strGongGaoInfo = {
  "#e6f00c7#b#{_INFOUSR%s}#H经过一番努力，终于收集全了合成神器熔炼需要的物品。洛阳的#Y神器熔炼使者#W特赠送给其一个#{_INFOMSG%s}！", 
  "#e0ba4b6#u#{_INFOUSR%s} #cff99cc为#G洛阳#Y神器熔炼使者#cff99cc找齐了#Y神器熔炼精华#cff99cc，神器熔炼使者献上#{_INFOMSG%s}作为感谢！", 
  "#effc9d8#cf30768#b#{_INFOUSR%s}#H在神器熔炼使者处进行#R神器熔炼#I的升级中，一路过关斩将，不愧是功夫不负有心人,特赠与#{_INFOMSG%s}！",
  "#e0e8de5#Y#u#{_INFOUSR%s}#H经过不懈努力收集齐了#R神器熔炼升级#I的所有物品，获得#W#{_INFOMSG%s}#H，真是令人羡慕啊！", 
}
--**********************************
--事件交互入口
--**********************************
function x889063_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#c0066ff神器熔炼升级平台" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV1-LV2#G）#cFF0000一段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV2-LV3#G）#cFF0000二段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV3-LV4#G）#cFF0000二段熔炼精华#Y100个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV4-LV5#G）#cFF0000三段熔炼精华#Y100个#W和#cFF0000天玑珠#Y100个！" )
		AddText( sceneId, "#cff99ff提示（#G请拆下已镶嵌的宝石#cff99ff）" )
		AddNumText( sceneId, x889063_g_ScriptId, "神器熔炼#G（#cFF0000LV1-LV5#G）#cFF000020%↑", 5, 100 )
		AddNumText( sceneId, x889063_g_ScriptId, "神器状态#G（#cFF0000攻击提升#G）#cFF0000领取↑", 5, 200 )
		AddNumText( sceneId, x889063_g_ScriptId, "门派神器#G（#cFF0000详细攻略#G）#cFF0000↑", 5, 400 )
		AddNumText( sceneId, x889063_g_ScriptId, "下次再来", 5, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x889063_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent( sceneId )
		      AddText( sceneId, "升级神器需要消耗：" )
		      AddText( sceneId, "#G相对应的神器#W1#G把" )
		      AddText( sceneId, "#cff99ff熔炼精华#W若干#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
		      AddText( sceneId, "#c0066ff熔炼精华#W可以在#Y各大BOSS处#W获得!" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV1-LV2#G）#cFF0000一段熔炼精华#Y50个" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV2-LV3#G）#cFF0000二段熔炼精华#Y50个" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV3-LV4#G）#cFF0000二段熔炼精华#Y100个" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV4-LV5#G）#cFF0000三段熔炼精华#Y100个#W和#cFF0000天玑珠#Y50个！" )
			AddNumText( sceneId, x889063_g_scriptId, "神器熔炼#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 101)
			AddNumText( sceneId, x889063_g_scriptId, "神器熔炼#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 102)
			AddNumText( sceneId, x889063_g_scriptId, "神器熔炼#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 103)
			AddNumText( sceneId, x889063_g_scriptId, "神器熔炼#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 104)

			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
		      AddText( sceneId, "升级神器需要消耗：" )
		      AddText( sceneId, "#G相对应的神器#W1#G把" )
		      AddText( sceneId, "#cff99ff熔炼精华#W若干#cff99ff个" )
		      AddText( sceneId, "#c0066ff熔炼精华#W可以在#Y各大BOSS处#W获得!" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV1-LV2#G）#cFF0000一段熔炼精华#Y50个" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV2-LV3#G）#cFF0000二段熔炼精华#Y50个" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV3-LV4#G）#cFF0000二段熔炼精华#Y100个" )
		      AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV4-LV5#G）#cFF0000三段熔炼精华#Y100个#W和#cFF0000天玑珠#Y50个！" )
			AddNumText( sceneId, x889063_g_scriptId, "赤焰九纹刀#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 1011)
			AddNumText( sceneId, x889063_g_scriptId, "斩忧断愁枪#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 1012)
			AddNumText( sceneId, x889063_g_scriptId, "万仞龙渊剑#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 1013)
			AddNumText( sceneId, x889063_g_scriptId, "转魂灭魄钩#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 1014)
			AddNumText( sceneId, x889063_g_scriptId, "雷鸣离火扇#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 1015)
			AddNumText( sceneId, x889063_g_scriptId, "碎情雾影环#G（#cFF0000LV1-LV2#G）#cFF000020%↑", 5, 1016)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1011 then
	       	local nStoneId0 = 10300008
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1012 then
	       	local nStoneId0 = 10301002
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301002,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301003, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1013 then
	       	local nStoneId0 = 10302010
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1014 then
	       	local nStoneId0 = 10303002
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303002,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303003, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1015 then
	       	local nStoneId0 = 10304010
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1016 then
	       	local nStoneId0 = 10305010
	       	local nStoneId1 = 30503089
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503089,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 102 then
		BeginEvent( sceneId )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV1-LV2#G）#cFF0000一段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV2-LV3#G）#cFF0000二段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV3-LV4#G）#cFF0000二段熔炼精华#Y100个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV4-LV5#G）#cFF0000三段熔炼精华#Y100个#W和#cFF0000天玑珠#Y50个！" )
			AddNumText( sceneId, x889063_g_scriptId, "赤焰九纹刀#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 1021)
			AddNumText( sceneId, x889063_g_scriptId, "斩忧断愁枪#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 1022)
			AddNumText( sceneId, x889063_g_scriptId, "万仞龙渊剑#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 1023)
			AddNumText( sceneId, x889063_g_scriptId, "转魂灭魄钩#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 1024)
			AddNumText( sceneId, x889063_g_scriptId, "雷鸣离火扇#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 1025)
			AddNumText( sceneId, x889063_g_scriptId, "碎情雾影环#G（#cFF0000LV2-LV3#G）#cFF000020%↑", 5, 1026)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1021 then
	       	local nStoneId0 = 10300009
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300010, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1022 then
	       	local nStoneId0 = 10301003
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301003,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301004, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1023 then
	       	local nStoneId0 = 10302011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1024 then
	       	local nStoneId0 = 10303003
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303003,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303004, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1025 then
	       	local nStoneId0 = 10304011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1026 then
	       	local nStoneId0 = 10305011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=50 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,50)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 103 then
		BeginEvent( sceneId )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV1-LV2#G）#cFF0000一段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV2-LV3#G）#cFF0000二段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV3-LV4#G）#cFF0000二段熔炼精华#Y100个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV4-LV5#G）#cFF0000三段熔炼精华#Y100个#W和#cFF0000天玑珠#Y50个！" )
			AddNumText( sceneId, x889063_g_scriptId, "赤焰九纹刀#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 1031)
			AddNumText( sceneId, x889063_g_scriptId, "斩忧断愁枪#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 1032)
			AddNumText( sceneId, x889063_g_scriptId, "万仞龙渊剑#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 1033)
			AddNumText( sceneId, x889063_g_scriptId, "转魂灭魄钩#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 1034)
			AddNumText( sceneId, x889063_g_scriptId, "雷鸣离火扇#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 1035)
			AddNumText( sceneId, x889063_g_scriptId, "碎情雾影环#G（#cFF0000LV3-LV4#G）#cFF000020%↑", 5, 1036)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1031 then
	       	local nStoneId0 = 10300010
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1032 then
	       	local nStoneId0 = 10301004
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
	                           local bagpos01 = TryRecieveItem( sceneId, selfId, 10301005, 1 )	-- 放不下就没有了
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1033 then
	       	local nStoneId0 = 10302012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1034 then
	       	local nStoneId0 = 10303004
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303005, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1035 then
	       	local nStoneId0 = 10304012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1036 then
	       	local nStoneId0 = 10305012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 104 then
		BeginEvent( sceneId )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV1-LV2#G）#cFF0000一段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV2-LV3#G）#cFF0000二段熔炼精华#Y50个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV3-LV4#G）#cFF0000二段熔炼精华#Y100个" )
		AddText( sceneId, "#c0066ff消耗#W：#G（#cFF0000LV4-LV5#G）#cFF0000三段熔炼精华#Y100个#W和#cFF0000天玑珠#Y50个！" )
			AddNumText( sceneId, x889063_g_scriptId, "赤焰九纹刀#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 1041)
			AddNumText( sceneId, x889063_g_scriptId, "斩忧断愁枪#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 1042)
			AddNumText( sceneId, x889063_g_scriptId, "万仞龙渊剑#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 1043)
			AddNumText( sceneId, x889063_g_scriptId, "转魂灭魄钩#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 1044)
			AddNumText( sceneId, x889063_g_scriptId, "雷鸣离火扇#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 1045)
			AddNumText( sceneId, x889063_g_scriptId, "碎情雾影环#G（#cFF0000LV4-LV5#G）#cFF000020%↑", 5, 1046)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1041 then
	       	local nStoneId0 = 10300011
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10300011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳神器熔炼升级中,取得终极物品#{_INFOMSG%s}!升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1042 then
	       	local nStoneId0 = 10301005
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10301005,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳神器熔炼升级中,取得终极物品#{_INFOMSG%s}!升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end
	elseif GetNumText() == 1043 then
	       	local nStoneId0 = 10302013
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10302013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳神器熔炼升级中,取得终极物品#{_INFOMSG%s}!升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1044 then
	       	local nStoneId0 = 10303005
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId ) 
		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10303005,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳神器熔炼升级中,取得终极物品#{_INFOMSG%s}!升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1045 then
	       	local nStoneId0 = 10304013
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId )
		                    local playername = GetName(sceneId, selfId) 
					LuaFnDelAvailableItem(sceneId,selfId,10304013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳神器熔炼升级中,取得终极物品#{_INFOMSG%s}!升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1046 then
	       	local nStoneId0 = 10305013
	       	local nStoneId1 = 30503091
	       	local nStoneId2 = 30501173
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId2)
            if c0 >=1 and c1 >=100 and c2 >=100 then
				BeginEvent( sceneId )
		                    local playername = GetName(sceneId, selfId) 
					LuaFnDelAvailableItem(sceneId,selfId,10305013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,100)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30501173,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳神器熔炼升级中,取得终极物品#{_INFOMSG%s}!升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 200 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "领取#cFF0000赤焰九纹刀#Y状态", 5, 201)
			AddNumText( sceneId, x889063_g_scriptId, "领取#cFF0000斩忧断愁枪#Y状态", 5, 202)
			AddNumText( sceneId, x889063_g_scriptId, "领取#cFF0000万仞龙渊剑#Y状态", 5, 203)
			AddNumText( sceneId, x889063_g_scriptId, "领取#cFF0000转魂灭魄钩#Y状态", 5, 204)
			AddNumText( sceneId, x889063_g_scriptId, "领取#cFF0000雷鸣离火扇#Y状态", 5, 205)
			AddNumText( sceneId, x889063_g_scriptId, "领取#cFF0000碎情雾影环#Y状态", 5, 206)

			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "#W赤焰九纹刀Ⅰ#cFF00002%↑", 5, 2011)
			AddNumText( sceneId, x889063_g_scriptId, "#Y赤焰九纹刀Ⅱ#cFF00005%↑", 5, 2012)
			AddNumText( sceneId, x889063_g_scriptId, "#G赤焰九纹刀Ⅲ#cFF00008%↑", 5, 2013)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933赤焰九纹刀Ⅳ#cFF000011%↑", 5, 2014)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000赤焰九纹刀Ⅴ#gf00ff015%↑", 5, 2015)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2011 then
	   if GetItemCount(sceneId, selfId, 10300008) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9575, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end
	elseif GetNumText() == 2012 then
	   if GetItemCount(sceneId, selfId, 10300009) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9576, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end
	elseif GetNumText() == 2013 then
	   if GetItemCount(sceneId, selfId, 10300010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9577, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2014 then
	   if GetItemCount(sceneId, selfId, 10300011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9578, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2015 then
	   if GetItemCount(sceneId, selfId, 10300012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9579, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2016 then
	       	local nStoneId0 = 10451232
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451232,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451233, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 202 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "#W斩忧断愁枪Ⅰ#cFF00002%↑", 5, 2021)
			AddNumText( sceneId, x889063_g_scriptId, "#Y斩忧断愁枪Ⅱ#cFF00005%↑", 5, 2022)
			AddNumText( sceneId, x889063_g_scriptId, "#G斩忧断愁枪Ⅲ#cFF00008%↑", 5, 2023)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933斩忧断愁枪Ⅳ#cFF000011%↑", 5, 2024)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000斩忧断愁枪Ⅴ#cFF000015%↑", 5, 2025)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 2021 then
	   if GetItemCount(sceneId, selfId, 10301002) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9590, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2022 then
	   if GetItemCount(sceneId, selfId, 10301003) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9591, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2023 then
	   if GetItemCount(sceneId, selfId, 10301004) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9592, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2024 then
	   if GetItemCount(sceneId, selfId, 10301005) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9596, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2025 then
	   if GetItemCount(sceneId, selfId, 10301006) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9594, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2026 then
	       	local nStoneId0 = 10451233
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451233,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451234, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 203 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "#W万仞龙渊剑Ⅰ#cFF00002%↑", 5, 2031)
			AddNumText( sceneId, x889063_g_scriptId, "#Y万仞龙渊剑Ⅱ#cFF00005%↑", 5, 2032)
			AddNumText( sceneId, x889063_g_scriptId, "#G万仞龙渊剑Ⅲ#cFF00008%↑", 5, 2033)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933万仞龙渊剑Ⅳ#cFF000011%↑", 5, 2034)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000万仞龙渊剑Ⅴ#cFF000015%↑", 5, 2035)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2031 then
	   if GetItemCount(sceneId, selfId, 10302010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9570, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2032 then
	   if GetItemCount(sceneId, selfId, 10302011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9571, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2033 then
	   if GetItemCount(sceneId, selfId, 10302012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9572, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2034 then
	   if GetItemCount(sceneId, selfId, 10302013) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9573, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2035 then
	   if GetItemCount(sceneId, selfId, 10302014) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9574, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2036 then
	       	local nStoneId0 = 10451234
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451234,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451235, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 204 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "#W转魂灭魄钩Ⅰ#cFF00002%↑", 5, 2041)
			AddNumText( sceneId, x889063_g_scriptId, "#Y转魂灭魄钩Ⅱ#cFF00005%↑", 5, 2042)
			AddNumText( sceneId, x889063_g_scriptId, "#G转魂灭魄钩Ⅲ#cFF00008%↑", 5, 2043)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933转魂灭魄钩Ⅳ#cFF000011%↑", 5, 2044)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000转魂灭魄钩Ⅴ#cFF000015%↑", 5, 2045)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2041 then
	   if GetItemCount(sceneId, selfId, 10303002) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9595, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2042 then
	   if GetItemCount(sceneId, selfId, 10303003) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9596, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2043 then
	   if GetItemCount(sceneId, selfId, 10303004) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9597, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2044 then
	   if GetItemCount(sceneId, selfId, 10303005) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9598, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2045 then
	   if GetItemCount(sceneId, selfId, 10303006) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9599, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2046 then
	       	local nStoneId0 = 10451235
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451235,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451236, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 205 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "#W雷鸣离火扇Ⅰ#cFF00002%↑", 5, 2051)
			AddNumText( sceneId, x889063_g_scriptId, "#Y雷鸣离火扇Ⅱ#cFF00005%↑", 5, 2052)
			AddNumText( sceneId, x889063_g_scriptId, "#G雷鸣离火扇Ⅲ#cFF00008%↑", 5, 2053)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933雷鸣离火扇Ⅳ#cFF000011%↑", 5, 2054)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000雷鸣离火扇Ⅴ#cFF000015%↑", 5, 2055)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2051 then
	   if GetItemCount(sceneId, selfId, 10304010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9580, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2052 then
	   if GetItemCount(sceneId, selfId, 10304011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9581, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2053 then
	   if GetItemCount(sceneId, selfId, 10304012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9582, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2054 then
	   if GetItemCount(sceneId, selfId, 10304013) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9583, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2055 then
	   if GetItemCount(sceneId, selfId, 10304014) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9584, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2056 then
	       	local nStoneId0 = 10451236
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451236,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451237, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 206 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff神器状态#W拥有#Y增加所有技能#W攻击效果!" )
		      AddText( sceneId, "领取技能必须有相对应的神器：" )
		      AddText( sceneId, "#G你确定要领取吗？" )
			AddNumText( sceneId, x889063_g_scriptId, "#W碎情雾影环Ⅰ#cFF00002%↑", 5, 2061)
			AddNumText( sceneId, x889063_g_scriptId, "#Y碎情雾影环Ⅱ#cFF00005%↑", 5, 2062)
			AddNumText( sceneId, x889063_g_scriptId, "#G碎情雾影环Ⅲ#cFF00008%↑", 5, 2063)
			AddNumText( sceneId, x889063_g_scriptId, "#c009933碎情雾影环Ⅳ#cFF000011%↑", 5, 2064)
			AddNumText( sceneId, x889063_g_scriptId, "#cFF0000碎情雾影环Ⅴ#cFF000015%↑", 5, 2065)
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2061 then
	   if GetItemCount(sceneId, selfId, 10305010) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9585, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2062 then
	   if GetItemCount(sceneId, selfId, 10305011) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9586, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2063 then
	   if GetItemCount(sceneId, selfId, 10305012) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9587, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2064 then
	   if GetItemCount(sceneId, selfId, 10305013) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9588, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2065 then
	   if GetItemCount(sceneId, selfId, 10305014) ~= 1  then
		x889063_MsgBox( sceneId, selfId, "对不起，您不具备有领状态的资格。" )	
		return
	   else
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 9589, 0)
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
		x889063_MsgBox( sceneId, selfId, "恭喜您成功领取状态" )
          end

	elseif GetNumText() == 2066 then
	       	local nStoneId0 = 10451237
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10451237,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10451238, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x889063_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，装备升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本使者了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end


	elseif GetNumText() == 400 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#cFF0000神器熔炼#W为本服特别为您准备的#G高级装备#W。#Y高级神器#W一共分为#cFF00005个等级#W，每升级#G一个等级#W提升装备#cFF0000所有属性20%#W。高级神器#Y拥有其他神器所没有的状态和触发!" )
		      AddText( sceneId, "#cFF0000高级神器来源#W：" )
		      AddText( sceneId, "#G1.#cFF0000残缺的连戎神节7级。#Y残缺的连戎神节7级#W获取方式和官方相同，在#G飘渺副本#cFF0000最后一环#Y李秋水#W处可以有几率获得！" )
		      AddText( sceneId, "#G2.#cFF0000新莽神符7级。#Y新莽神符7级#W获取方式和官方相同，在#G苏州三环#W和#G楼兰三环#W最后一关中有几率获得。获得#Y新莽神符7级后#W可以修复#Y残缺的连戎神节7级#W，当完成度#cFF0000100%#W时就可以冶炼神器了。" )
		      AddText( sceneId, "#G3.#cFF0000神器配方图样。#Y神器配方图样#W可以在#cFF0000竞技场争霸#W、#G血战四绝庄#W、#Y挑战少室山#W等副本中获得。获得神器配方后，学习即可携带#Y完整的#cFF0000连戎神节7级#W在#Y苏州#W平台打造终极神器！" )
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )


	elseif GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x889063_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x889063_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--消息提示
--**********************************
function x889063_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x889063_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x889063_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x889063_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x889063_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x889063_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

--洛阳NPC
--抽奖
--普通
x001154_g_strGongGaoInfo = {
  "#e6f00c7#b#{_INFOUSR%s}#H经过一番努力，终于收集了材料，大家一起恭喜吧！#{_INFOMSG%s}升级成功！", 
  "#e6f00c7#b#{_INFOUSR%s}#H经过一番努力，终于收集了材料，大家一起恭喜吧！#{_INFOMSG%s}升级成功！", 
  "#e6f00c7#b#{_INFOUSR%s}#H经过一番努力，终于收集了材料，大家一起恭喜吧！#{_INFOMSG%s}升级成功！", 
  "#e6f00c7#b#{_INFOUSR%s}#H经过一番努力，终于收集了材料，大家一起恭喜吧！#{_INFOMSG%s}升级成功！", 
}
--**********************************
--事件交互入口
--**********************************
function x001154_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#c0066ff暗器升级平台" )
		AddText( sceneId, "#G（#cFF0000冰魄银针#G）" )
		--AddText( sceneId, "#G（#cFF0000神器重炼#G）" )
		--AddText( sceneId, "三段#G（#cFF0000LV5-LV6#G）#cFF0000100%↑" )
		AddText( sceneId, "#cff99ff提示（#G请拆下已镶嵌的宝石#cff99ff）" )
		AddNumText( sceneId, x001154_g_ScriptId, "#G（#cFF0000暗器升级#G）", 10, 100 )
		--AddNumText( sceneId, x001154_g_ScriptId, "#G（#cFF0000神器重炼#G）", 5, 200 )
		--AddNumText( sceneId, x001154_g_ScriptId, "三段#G（#cFF0000LV5-LV6#G）#cFF0000100%↑", 5, 300 )
		--AddNumText( sceneId, x001154_g_ScriptId, "#cff99cc『魔魂』#W之刃#Y合成#G（#cFF0000仙器#G）#cFF0000↑", 5, 400 )
		AddNumText( sceneId, x001154_g_ScriptId, "下次再来", 9, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x001154_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff寒冰星屑#W可以在#Y燕子缥缈副本#W获得!" )
		      --AddText( sceneId, "#G（#cFF0000LV1-LV3#G）#cFF000050%↑" )
		      AddText( sceneId, "暗器升级需要消耗：" )
		      AddText( sceneId, "#G梅花镖#W1#G把" )
		      AddText( sceneId, "#cff99ff寒冰星屑#W10#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G（#cFF0000开始升级#G）", 10, 101)
			--AddNumText( sceneId, x001154_g_scriptId, "#G（#cFF0000开始重炼#G）", 10, 102)
			--AddNumText( sceneId, x001154_g_scriptId, "一段#G（#cFF0000LV3-LV4#G）#cFF000010%↑", 5, 103)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff寒冰星屑#W可以在#Y燕子缥缈副本#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV3#G）#cFF000050%↑" )
		      AddText( sceneId, "暗器升级需要消耗：" )
		      AddText( sceneId, "#G梅花镖#W1#G个" )
		      AddText( sceneId, "#cff99ff寒冰星屑#W10#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G冰魄银针#G", 10, 1011)
			--AddNumText( sceneId, x001154_g_scriptId, "#G斩忧断愁枪#G", 10, 1012)
			--AddNumText( sceneId, x001154_g_scriptId, "#G弈天破邪杖#G", 10, 1013)
			--AddNumText( sceneId, x001154_g_scriptId, "#G含光弄影剑#G", 10, 1014)
			--AddNumText( sceneId, x001154_g_scriptId, "#G万仞龙渊剑#G", 10, 1015)
			--AddNumText( sceneId, x001154_g_scriptId, "#G转魂灭魄钩#G", 10, 1016)
			--AddNumText( sceneId, x001154_g_scriptId, "#G雷鸣离火扇#G", 10, 1017)
			--AddNumText( sceneId, x001154_g_scriptId, "#G碎情雾影环#G", 10, 1018)
			--AddNumText( sceneId, x001154_g_scriptId, "#G天星耀阳环#G", 10, 1019)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1011 then
	       	local nStoneId0 = 10155003
	       	local nStoneId1 = 20310113
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10155003,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310113,10)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10155002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，升级成功！"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
                    else
               	BeginEvent( sceneId ) 
					strText = "#G你的材料不够，就不要来打扰本我了，小心我扁你哦！！"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
			end

	elseif GetNumText() == 1012 then
	       	local nStoneId0 = 10301100
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
	       	local nStoneId0 = 10301200
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301200,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301199, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
	       	local nStoneId0 = 10302100
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
	       	local nStoneId0 = 10303100
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
	       	local nStoneId0 = 10303200
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303200,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303001, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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

	elseif GetNumText() == 1017 then
	       	local nStoneId0 = 10304100
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
			
	elseif GetNumText() == 1018 then
	       	local nStoneId0 = 10305100
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
			
				elseif GetNumText() == 1019 then
	       	local nStoneId0 = 10305200
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305200,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器炼化成功！"
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
		      AddText( sceneId, "#c0066ff神兵符#W可以在#Y燕子飘渺副本#W获得!" )
		      --AddText( sceneId, "#c0066ff一段#G（#cFF0000LV1-LV9#G）#cFF000070%↑" )
		      AddText( sceneId, "重炼神器需要消耗：" )
		      AddText( sceneId, "#G相对应的神器#W1#G把" )
		      AddText( sceneId, "#cff99ff神兵符#W5#cff99ff个" )
		      AddText( sceneId, "#G你确定要重炼吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G赤焰九纹刀#G", 10, 1021)
			AddNumText( sceneId, x001154_g_scriptId, "#G斩忧断愁枪#G", 10, 1022)
			AddNumText( sceneId, x001154_g_scriptId, "#G弈天破邪杖#G", 10, 1023)
			AddNumText( sceneId, x001154_g_scriptId, "#G含光弄影剑#G", 10, 1024)
			AddNumText( sceneId, x001154_g_scriptId, "#G万仞龙渊剑#G", 10, 1025)
			AddNumText( sceneId, x001154_g_scriptId, "#G转魂灭魄钩#G", 10, 1026)
			AddNumText( sceneId, x001154_g_scriptId, "#G雷鸣离火扇#G", 10, 1027)
			AddNumText( sceneId, x001154_g_scriptId, "#G碎情雾影环#G", 10, 1028)
			AddNumText( sceneId, x001154_g_scriptId, "#G天星耀阳环#G", 10, 1029)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 9, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 1021 then
	       	local nStoneId0 = 10300007
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
	       	local nStoneId0 = 10302008
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
	       	local nStoneId0 = 10301199
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301199,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301199, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
	       	local nStoneId0 = 10302007
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
	       	local nStoneId0 = 10302009
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
	       	local nStoneId0 = 10303001
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10303001,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303001, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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

	elseif GetNumText() == 1027 then
	       	local nStoneId0 = 10304007
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
			
	elseif GetNumText() == 1028 then
	       	local nStoneId0 = 10305007
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
			
				elseif GetNumText() == 1029 then
	       	local nStoneId0 = 10305009
	       	local nStoneId1 = 30505817
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30505817,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，神器重炼成功！"
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
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y各大Boss跟副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV3-LV5#G）#cFF000070%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W100#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "二段#G（#cFF0000LV3-LV5#G）#cFF000070%↑", 5, 201)
			--AddNumText( sceneId, x001154_g_scriptId, "二段#G（#cFF0000LV5-LV6#G）#cFF000015%↑", 5, 202)
			--AddNumText( sceneId, x001154_g_scriptId, "二段#G（#cFF0000LV6-LV7#G）#cFF000015%↑", 5, 203)
			--AddNumText( sceneId, x001154_g_scriptId, "二段#G（#cFF0000LV7-LV8#G）#cFF000015%↑", 5, 204)
			--AddNumText( sceneId, x001154_g_scriptId, "二段#G（#cFF0000LV8-LV9#G）#cFF000015%↑", 5, 205)
			--AddNumText( sceneId, x001154_g_scriptId, "二段#G（#cFF0000LV9-LV10#G）#cFF000015%↑", 5, 206)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y各大Boss跟副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV3-LV5#G）#cFF000070%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W100#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G阴·#Y元神禁锢#G（#cFF0000LV3-LV5#G）#cFF000070%↑", 5, 2011)
			AddNumText( sceneId, x001154_g_scriptId, "#G古·#Y灵犀神剑#G（#cFF0000LV3-LV5#G）#cFF000070%↑", 5, 2012)
			AddNumText( sceneId, x001154_g_scriptId, "#G混·#Y逍遥江湖#G（#cFF0000LV3-LV5#G）#cFF000070%↑", 5, 2013)
			AddNumText( sceneId, x001154_g_scriptId, "#G恨·#Y别情离恨#G（#cFF0000LV3-LV5#G）#cFF000070%↑", 5, 2014)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2011 then
	       	local nStoneId0 = 10300008
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10300008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301001, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2012 then
	       	local nStoneId0 = 10302008
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302010, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2013 then
	       	local nStoneId0 = 10304008
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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

	elseif GetNumText() == 2014 then
	       	local nStoneId0 = 10305326
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=100 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10304008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,100)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305328, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y各大Boss跟副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV9-LV19#G）#cFF000015%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W1#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff6633斩忧枪#G（#cFF0000LV5-LV6#G）#cFF000015%↑", 5, 2021)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff6633弄影刀#G（#cFF0000LV5-LV6#G）#cFF000015%↑", 5, 2022)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff6633离火环#G（#cFF0000LV5-LV6#G）#cFF000015%↑", 5, 2023)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 2021 then
	       	local nStoneId0 = 10301001
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301001,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2022 then
	       	local nStoneId0 = 10302010
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2023 then
	       	local nStoneId0 = 10305007
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y飘渺副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV9-LV19#G）#cFF000015%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W1#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff6633斩忧枪#G（#cFF0000LV6-LV7#G）#cFF000015%↑", 5, 2031)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff6633弄影刀#G（#cFF0000LV6-LV7#G）#cFF000015%↑", 5, 2032)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff6633离火环#G（#cFF0000LV6-LV7#G）#cFF000015%↑", 5, 2033)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2031 then
	       	local nStoneId0 = 10301002
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301002,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301003, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2032 then
	       	local nStoneId0 = 10302011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2033 then
	       	local nStoneId0 = 10305008
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y飘渺副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV9-LV19#G）#cFF000015%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W1#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff断愁枪#G（#cFF0000LV7-LV8#G）#cFF000015%↑", 5, 2041)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff龙渊刀#G（#cFF0000LV7-LV8#G）#cFF000015%↑", 5, 2042)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff碎情环#G（#cFF0000LV7-LV8#G）#cFF000015%↑", 5, 2043)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2041 then
	       	local nStoneId0 = 10301003
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301003,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301004, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2042 then
	       	local nStoneId0 = 10302012
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2043 then
	       	local nStoneId0 = 10305009
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305010, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y飘渺副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV9-LV19#G）#cFF000015%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W1#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff断愁枪#G（#cFF0000LV8-LV9#G）#cFF000015%↑", 5, 2051)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff龙渊刀#G（#cFF0000LV8-LV9#G）#cFF000015%↑", 5, 2052)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff碎情环#G（#cFF0000LV8-LV9#G）#cFF000015%↑", 5, 2053)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2051 then
	       	local nStoneId0 = 10301004
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301005, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2052 then
	       	local nStoneId0 = 10302013
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2053 then
	       	local nStoneId0 = 10305010
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
		      AddText( sceneId, "#c0066ff二段灵魂精华#W可以在#Y飘渺副本#W获得!" )
		      AddText( sceneId, "#c0066ff二段#G（#cFF0000LV9-LV19#G）#cFF000015%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂二段精华#W1#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff断愁枪#G（#cFF0000LV9-LV10#G）#cFF000015%↑", 5, 2061)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff龙渊刀#G（#cFF0000LV9-LV10#G）#cFF000015%↑", 5, 2062)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#cff99ff碎情环#G（#cFF0000LV9-LV10#G）#cFF000015%↑", 5, 2063)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2061 then
	       	local nStoneId0 = 10301005
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301005,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301197, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2062 then
	       	local nStoneId0 = 10302014
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302014,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303000, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 2063 then
	       	local nStoneId0 = 10305011
	       	local nStoneId1 = 30503090
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503090,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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

	elseif GetNumText() == 300 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff三段灵魂精华#W可以在#Y各大Boss跟副本#W获得!" )
		      AddText( sceneId, "#c0066ff三段#G（#cFF0000LV5-LV6#G）#cFF0000100%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂三段精华#W200#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "三段#G（#cFF0000LV5-LV6#G）#cFF0000100%↑", 5, 301)
			--AddNumText( sceneId, x001154_g_scriptId, "三段#G（#cFF0000LV11-LV#WMAX#G）#cFF000020%↑", 5, 302)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 301 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff三段灵魂精华#W可以在#Y各大Boss跟副本#W获得!" )
		      AddText( sceneId, "#c0066ff三段#G（#cFF0000LV5-LV6#G）#cFF0000100%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂三段精华#W200#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G王·#cff6633五虎断魂#G（#cFF0000LV5-LV6#G）#cFF0000100%↑", 5, 3011)
			AddNumText( sceneId, x001154_g_scriptId, "#G龙·#cff99ff金龙双剪#G（#cFF0000LV5-LV6#G）#cFF0000100%↑", 5, 3012)
			AddNumText( sceneId, x001154_g_scriptId, "#G世·#cff6633浩气长舒#G（#cFF0000LV5-LV6#G）#cFF0000100%↑", 5, 3013)
			AddNumText( sceneId, x001154_g_scriptId, "#G天·#cff6633九天金线#G（#cFF0000LV5-LV6#G）#cFF0000100%↑", 5, 3014)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 3011 then
	       	local nStoneId0 = 10301001
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10301001,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 3012 then
	       	local nStoneId0 = 10302010
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10302010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 3013 then
	       	local nStoneId0 = 10305007
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 3014 then
	       	local nStoneId0 = 10305328
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=200 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10305328,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,200)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305329, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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


	elseif GetNumText() == 302 then
		BeginEvent( sceneId )
		      AddText( sceneId, "#c0066ff三段灵魂精华#W可以在#Y飘渺副本#W获得!" )
		      AddText( sceneId, "#c0066ff三段#G（#cFF0000LV19-LV#WMAX#G）#cFF000020%↑" )
		      AddText( sceneId, "升级灵魂装备需要消耗：" )
		      AddText( sceneId, "#G相对应的灵魂装备#W1#G个" )
		      AddText( sceneId, "#cff99ff灵魂三段精华#W1#cff99ff个" )
		      AddText( sceneId, "#G你确定要升级吗？" )
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#ccc33cc弈天杖#G（#cFF0000LV11-LV#WMAX#G）#cFF000020%↑", 5, 3021)
			AddNumText( sceneId, x001154_g_scriptId, "#G灭世#ccc33cc转魂钩#G（#cFF0000LV11-LV#WMAX#G）#cFF000020%↑", 5, 3022)
			AddNumText( sceneId, x001154_g_scriptId, "#G绝情#ccc33cc魔煞环#G（#cFF0000LV11-LV#WMAX#G）#cFF000020%↑", 5, 3023)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 3021 then
	       	local nStoneId0 = 10301198
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId )
 		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10301198,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10301199, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳灵魂装备升级中,取得终极物品#{_INFOMSG%s}!灵魂升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 3022 then
	       	local nStoneId0 = 10303001
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
 		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10303001,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10303002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳灵魂装备升级中,取得终极物品#{_INFOMSG%s}!灵魂升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
	elseif GetNumText() == 3023 then
	       	local nStoneId0 = 10305013
	       	local nStoneId1 = 30503091
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
 		                    local playername = GetName(sceneId, selfId)
					LuaFnDelAvailableItem(sceneId,selfId,10305013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503091,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10305014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     local strText = format("@*;SrvMsg;SCA:#G[系统]:#G号外号外,恭喜#{_INFOUSR%s}洛阳灵魂装备升级中,取得终极物品#{_INFOMSG%s}!灵魂升级后属性大大加强,乃是居家旅行,PK杀人的必备哦~ ", playername, szItemTransfer)									
		                     BroadMsgByChatPipe(sceneId, selfId, strText, 4)
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
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
		      AddText( sceneId, "#cff99cc『魔魂』#W之刃#W可以在#G梁胖子#W获得!" )
		      AddText( sceneId, "合成仙器需要消耗：" )
		      AddText( sceneId, "#cff99ff涅槃之石" )
		      AddText( sceneId, "#G涅槃之石#W获取：#Y竞技场#G大宝箱#W开取" )
		      AddText( sceneId, "#cff99cc『魔魂』#W之刃#G+#cFF0000涅槃之石#G=#cFF0000仙器" )
			AddNumText( sceneId, x001154_g_scriptId, "合成#G灭世#Y赤焰刀#G·[LV1]#cFF0000↑刀棒类", 5, 401)
			AddNumText( sceneId, x001154_g_scriptId, "合成#G灭世#Y含光剑#G·[LV1]#cFF0000↑单双短", 5, 402)
			AddNumText( sceneId, x001154_g_scriptId, "合成#G灭世#Y雷鸣忍#G·[LV1]#cFF0000↑扇环类", 5, 403)
			AddNumText( sceneId, x001154_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 401 then
	       	local nStoneId0 = 10470012
	       	local nStoneId1 = 30503093
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10470012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503093,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10300006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，兑换成功！"
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

	elseif GetNumText() == 402 then
	       	local nStoneId0 = 10470012
	       	local nStoneId1 = 30503093
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10470012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503093,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10302006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，兑换成功！"
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

	elseif GetNumText() == 403 then
	       	local nStoneId0 = 10470012
	       	local nStoneId1 = 30503093
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId1)
            if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10470012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503093,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10304006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x001154_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					strText = "#G恭喜你，兑换成功！"
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
function x001154_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x001154_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x001154_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x001154_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x001154_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x001154_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x001154_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end


-- 修改[褚少微 2008.5.29 添加,魔兵天将,极品装备放出。]

-- 210518 套装兑换NPC

-- 梁师成

--脚本号
x210518_g_ScriptId = 210518

--所拥有的事件ID列表
x210518_g_eventList={}

--解决流失率兑换门派套装事件脚本
x210518_g_MenPaiTaoScriptId = 500617

x210518_g_EquipList={	
--       衣服－－－－－－－－腰带－－－－－－－－铠甲－－－－－
{n=1100,id=30302527},{n=1200,id=30302528},{n=1300,id=30302529},{n=1400,id=30302530},{n=1500,id=30302531},{n=1600,id=30302532},

-- 30级别的
{n=2100,id=30504094},{n=2200,id=30504125},{n=2300,id=30504126},{n=2400,id=30504127},{n=2500,id=30504128},{n=2600,id=30309881},{n=2700,id=30309888},

-- 40级别的
{n=3100,id=50921001},{n=3200,id=50921002},{n=3300,id=50921003},{n=3400,id=50921004},{n=3500,id=10414024},

-- 50级别的
{n=4100,id=10124183},{n=4200,id=10124184},{n=4300,id=10124185},{n=4400,id=10124186},{n=4500,id=10124187},{n=4600,id=10124188},{n=4700,id=10124189},{n=4800,id=10124190},{n=4900,id=10124191},

-- 60级别的
{n=5100,id=10433320},{n=5200,id=10433321},{n=5300,id=10433322},{n=5400,id=10433323},{n=5500,id=10414026},{n=5600,id=10415018},

-- 70级别的
{n=6100,id=30505706},{n=6200,id=10421012},{n=6300,id=10412012},{n=6400,id=10411012},{n=6500,id=10414027},{n=6600,id=10415019},

-- 80级别的
{n=7100,id=10141155},{n=7200,id=10141160},{n=7300,id=10412017},{n=7400,id=10411014},{n=7500,id=10414028},{n=7600,id=10415020},
{n=7100,id=10141156},{n=7200,id=10141161},{n=7300,id=10412018},{n=7400,id=10411015},{n=7500,id=10414029},{n=7600,id=10415021},
{n=7100,id=10141157},{n=7200,id=10141162},
{n=7100,id=10141158},{n=7200,id=10141163},
{n=7100,id=10141159},
-- 90级别的
{n=8100,id=10413019},{n=8200,id=10421016},{n=8300,id=10412019},{n=8400,id=10411016},{n=8500,id=10414030},{n=8600,id=10415022},
{n=8100,id=10413020},{n=8200,id=10421017},{n=8300,id=10412020},{n=8400,id=10411017},{n=8500,id=10414031},{n=8600,id=10415023},

-- 褚少微，2008.5.29。极品装备放出。两个装备：10422016--重楼戒	10423024--重楼玉
{n=9100,id=10422016},
{n=9100,id=10423024},
}

x210518_g_StoneList={
-- 1级石头
{n=1,id=39910009,num=50,str="#G永久玉玺#W"},
-- 2级石头
{n=2,id=39910009,num=80,str="#G永久玉玺#W"},
-- 3级石头
{n=3,id=39910009,num=150,str="#G永久玉玺#W"},
-- 4级石头
{n=4,id=39910009,num=200,str="#G永久玉玺#W"},
-- 5级石头
{n=5,id=39910009,num=300,str="#G永久玉玺#W"},
-- 6级石头
{n=6,id=39910009,num=500,str="#G永久玉玺#W"},
--80,90级 装备 需要的石头
{n=7,id=39910009,num=200,str="#G永久玉玺#W"},

{n=8,id=30008081,num=120,str="#G七夕的花瓣#W"},

-- 褚少微，2008.5.29。极品装备放出。两个兑换需要的物品：20310101--重楼之泪	20310102--重楼之芒
{n=9,id=30503026,num=20,str="#G古书残页#W"},
{n=10,id=20310102,num=20,str="重楼之芒"},

}

--**********************************
--事件列表
--**********************************
function x210518_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #{JPZB_0610_01}")
		for i, eventId in x210518_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		AddText( sceneId, "#e0e8de5#Y永久玉玺#W兑换" )
		AddText( sceneId, "#G永久玉玺可以在#Y草原#cFF0000四大恶人#W处获得" )
		AddText( sceneId, "#cFF0000四大恶人#Y一个小时#G刷新一次！" )
		AddText( sceneId, "#cFF0000刷新后系统自动提示,#Y每次刷新#W怪物一共#Y20只，#G必爆永久玉玺！" )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000顶级神器打造图", 0, 1000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000最新宠物宝宝蛋", 0, 2000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000高级减抗冥宝石", 0, 3000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000带属性最新时装", 0, 4000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000顶级攻击性武魂", 0, 5000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000顶级神器残神节", 0, 6000 )
		AddNumText( sceneId, x210518_g_ScriptId, "#G玉玺#W兑换#cFF0000门派80最新坐骑", 0, 7000 )
		--AddNumText( sceneId, x210518_g_ScriptId, "兑换90级套装", 0, 8000 )
		--AddNumText( sceneId, x210518_g_MenPaiTaoScriptId, "兑换师门套装", 0, 846 )
		
		-- 褚少微，2008.5.29。极品装备放出。
		--AddNumText( sceneId, x210518_g_ScriptId, "魔兵天降", 0, 9000 )
		--AddNumText( sceneId, x210518_g_ScriptId, "魔兵天降介绍", 11, 10000 )
		
		AddNumText( sceneId, x210518_g_ScriptId, "离开……", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x210518_OnDefaultEvent( sceneId, selfId,targetId )
	x210518_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x210518_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	if eventId == x210518_g_MenPaiTaoScriptId then
		if nNumText == 846 then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
			CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
			return
		end
	end
	
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #G请选择您兑换的物品：")
				if nNumText < 2000  then
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933赤焰九纹刀图样", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933斩忧断愁枪图样", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933万仞龙渊剑图样", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933转魂灭魄钩图样", 0, nNumText+400)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933雷鸣离火扇图样", 0, nNumText+500)
					AddNumText(sceneId, x210518_g_ScriptId, "#c009933碎情雾影环图样", 0, nNumText+600)

				end
			if nNumText >= 2000 and nNumText < 3000 then
			AddNumText(sceneId, x210518_g_ScriptId, "#cFF0000宠物蛋:go仔", 0, nNumText+100)
			AddNumText(sceneId, x210518_g_ScriptId, "#cFF0000宠物蛋:花仙子", 0, nNumText+200)
			AddNumText(sceneId, x210518_g_ScriptId, "#cFF0000宠物蛋:章魚", 0, nNumText+300)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933宠物蛋:熊貓双侠", 0, nNumText+400)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933宠物蛋:奶油火鸡", 0, nNumText+500)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933宠物蛋:灵兔双杰", 0, nNumText+600)
			AddNumText(sceneId, x210518_g_ScriptId, "#c009933宠物蛋:蛮石怪", 0, nNumText+700)

			end
			if nNumText >= 3000 and nNumText < 4000  then
					AddNumText(sceneId, x210518_g_ScriptId, "兑换#cFF0000黄冥石(9级)", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "兑换#cFF0000蓝冥石(9级)", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "兑换#cFF0000红冥石(9级)", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "兑换#cFF0000绿冥石(9级)", 0, nNumText+400)

				end
			if nNumText >= 4000 and nNumText < 5000  then
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000紫魅幻影", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000山盟海誓", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000疏狂暗香", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000段誉语嫣", 0, nNumText+400)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000萧峰阿朱", 0, nNumText+500)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000天天向上", 0, nNumText+600)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000春风余雪", 0, nNumText+700)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000激情圣诞", 0, nNumText+800)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000才子佳人", 0, nNumText+900)

				end
			if nNumText >= 5000 and nNumText < 6000 then
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000御窑盘[毒]", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000御窑盘[火]", 0, nNumText+200)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000御窑盘[冰]", 0, nNumText+300)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#cFF0000御窑盘[玄]", 0, nNumText+400)

				end
			if nNumText >= 6000 and nNumText < 7000 then
					AddNumText(sceneId, x210518_g_ScriptId, "#G换#cFF0000残缺的神节7级", 0, nNumText+100)
				end
			if nNumText >= 7000 then
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#Y80坐骑#cFF0000①", 0, nNumText+100)
					AddNumText(sceneId, x210518_g_ScriptId, "#G兑换#Y80坐骑#cFF0000②", 0, nNumText+200)
				end
			AddNumText( sceneId, x210518_g_ScriptId, "离开……", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 9000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #{JPZB_0610_03}")
			
			local nLevel = 0
			if nNumText > 1000 then
				nLevel = 1
			end
			if nNumText > 2000 then
				nLevel = 2
			end
			if nNumText > 3000 then
				nLevel = 3
			end
			if nNumText > 4000 then
				nLevel = 4
			end
			if nNumText > 5000 then
				nLevel = 5
			end
			if nNumText > 6000 then
				nLevel = 6
			end
			if nNumText > 7000 then
				nLevel = 7
			end
			if nNumText > 8000 then
				nLevel = 8
			end
			
			local szStr = "  #{JPZB_0610_04}" .. x210518_g_StoneList[nLevel].str 
										.. "”“".. tostring(x210518_g_StoneList[nLevel].num) .. "#{JPZB_0610_05}"
			AddText(sceneId, szStr)
			
			for i, item in x210518_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x210518_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x210518_g_ScriptId, 0)
		
	end
	
	for i, findId in x210518_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	-- 褚少微，2008.5.29。极品装备放出。添加两个按钮的处理事件
	if nNumText == 9000 then
		BeginEvent(sceneId)	
				local szStr = "  #{JPZB_0610_06}"
				AddText(sceneId, szStr)
				for i, item in x210518_g_EquipList do
					if item.n == 9100  then
						AddRadioItemBonus( sceneId, item.id, 4 )
					end
				end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x210518_g_ScriptId, 0)
	end
	-- 魔兵天降介绍
	if nNumText == 10000 then
		BeginEvent(sceneId)	
				AddText( sceneId, "#{JPZB_20080523_01}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x210518_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x210518_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			x210518_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x210518_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x210518_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x210518_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	if missionScriptId == x210518_g_MenPaiTaoScriptId then
		CallScriptFunction( missionScriptId, "OnMissionSubmit", sceneId, selfId, targetId, missionScriptId, selectRadioId )
		return 0
	end
	
	for i, item in x210518_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nLevel = 0
	if x210518_g_EquipList[nItemIndex].n > 1000 then
		nLevel = 1
	end
	if x210518_g_EquipList[nItemIndex].n > 2000 then
		nLevel = 2
	end
	if x210518_g_EquipList[nItemIndex].n > 3000 then
		nLevel = 3
	end
	if x210518_g_EquipList[nItemIndex].n > 4000 then
		nLevel = 4
	end
	if x210518_g_EquipList[nItemIndex].n > 5000 then
		nLevel = 5
	end
	if x210518_g_EquipList[nItemIndex].n > 6000 then
		nLevel = 6
	end
	if x210518_g_EquipList[nItemIndex].n > 7000 then
		nLevel = 7
	end
	if x210518_g_EquipList[nItemIndex].n > 8000 then
		nLevel = 8
	end
	
	-- 褚少微，2008.5.29。极品装备放出。
	if x210518_g_EquipList[nItemIndex].n == 9100 then
		if selectRadioId == 10422016 then
			nLevel = 9
		else 
			if selectRadioId == 10423024 then
				nLevel = 10
			end
		end
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x210518_g_StoneList[nLevel].id) >= x210518_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_09}"
			end
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查是不是有足够的石头可以扣除
	if LuaFnGetAvailableItemCount(sceneId, selfId, x210518_g_StoneList[nLevel].id) < x210518_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			-- 褚少微，2008.5.29。极品装备放出。
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_10}"
			end
			
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 检查背包空间
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_11}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x210518_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- 删除相关的石头
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x210518_g_StoneList[nLevel].id, x210518_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_12}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--给完家东西，完成
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x210518_g_EquipList[nItemIndex].id, 1 );
		
		-- 褚少微，2008.5.29。极品装备放出。这两个极品装备无法打孔，强制刻铭
		-- LuaFnEquipLock( sceneId, selfId, nBagIndex )
		
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_13}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x210518_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x210518_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x210518_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#{WLS_00}#Y%d#I颗#W#{_INFOMSG%s}#I由衷的赞道：“#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x210518_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		-- 褚少微，2008.5.29。极品装备放出。
		if nLevel == 9 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		if nLevel == 10 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x210518_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x210518_OnDie( sceneId, selfId, killerId )
end

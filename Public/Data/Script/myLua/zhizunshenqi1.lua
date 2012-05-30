-- 002957 至尊神器激活专用脚本 
-- 如意小子写
-- 脚本号
x002957_g_ScriptId = 002957
--**********************************
--参入激活的装备
--**********************************
x002957_g_eventList={}
x002957_g_EquipList={	
-- 凤歌鸾舞一级
{n=110,id=10305203},
-- 凤歌鸾舞二级
{n=120,id=10305204},
-- 凤歌鸾舞三级
{n=130,id=10305205},
-- 凤歌鸾舞四级
{n=140,id=10305206},
-- 【毒】凤歌鸾舞
{n=150,id=10305207},
-- 【冰】凤歌鸾舞
{n=160,id=10305208},
-- 【火】凤歌鸾舞
{n=170,id=10305209},
-- 【玄】凤歌鸾舞
{n=180,id=10305210},
-- 游云惊龙一级
{n=190,id=10305211},
-- 游云惊龙二级
{n=200,id=10305212},
-- 游云惊龙三级
{n=210,id=10305213},
-- 游云惊龙四级
{n=220,id=10305214},
-- 【毒】游云惊龙
{n=230,id=10305215},
-- 【冰】游云惊龙
{n=240,id=10305216},
-- 【火】游云惊龙
{n=250,id=10305217},
-- 【玄】游云惊龙
{n=260,id=10305218},
-- 激活道具
{n=270,id=20310116},
}
--**********************************
--道具需要数量
--**********************************
x002957_g_StoneList={
-- 凤歌鸾舞一级 
-- 游云惊龙一级
{n=1,id=20310116,num=20,str="灵兽精魄"},
-- 凤歌鸾舞二级
{n=2,id=10305203,num=3,str="凤歌鸾舞一级"},
-- 凤歌鸾舞三级
{n=3,id=10305204,num=3,str="凤歌鸾舞二级"},
-- 凤歌鸾舞四级
{n=4,id=10305205,num=3,str="凤歌鸾舞三级"},
-- 凤歌鸾舞【毒】【冰】【火】【玄】
{n=5,id=10305206,num=3,str="凤歌鸾舞四级"},
-- 游云惊龙二级
{n=6,id=10305211,num=3,str="游云惊龙一级"},
-- 游云惊龙三级
{n=7,id=10305212,num=3,str="游云惊龙二级"},
-- 游云惊龙四级
{n=8,id=10305213,num=3,str="游云惊龙三级"},
-- 游云惊龙【毒】【冰】【火】【玄】
{n=9,id=10305214,num=3,str="游云惊龙四级"},
}
--**********************************
--NPC对话
--**********************************
function x002957_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #gFF3E96至尊神器需要稀有的灵兽精魄来唤醒，只要你收集到了足够的材料便可来找我。")
		for i, eventId in x002957_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活至尊神器游云惊龙", 1, 100 )
		AddNumText( sceneId, x002957_g_ScriptId, "离开……", 13, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002957_OnDefaultEvent( sceneId, selfId,targetId )
	x002957_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002957_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	if nNumText == 100 then
		BeginEvent(sceneId)
			AddText(sceneId, "  请选择一下你要唤醒的至尊神器")
			if nNumText == 100 then
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y凤歌鸾舞一级", 1, nNumText+10)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y凤歌鸾舞二级", 1, nNumText+20)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y凤歌鸾舞三级", 1, nNumText+30)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y凤歌鸾舞四级", 1, nNumText+40)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【毒】凤歌鸾舞", 1, nNumText+50)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【冰】凤歌鸾舞", 1, nNumText+60)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【火】凤歌鸾舞", 1, nNumText+70)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【玄】凤歌鸾舞", 1, nNumText+80)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y游云惊龙一级", 1, nNumText+90)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y游云惊龙二级", 1, nNumText+100)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y游云惊龙三级", 1, nNumText+110)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#Y游云惊龙四级", 1, nNumText+120)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【毒】游云惊龙", 1, nNumText+130)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【冰】游云惊龙", 1, nNumText+140)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【火】游云惊龙", 1, nNumText+150)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G激活#I【玄】游云惊龙", 1, nNumText+160)
			end																	
			AddNumText( sceneId, x002957_g_ScriptId, "离开……", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
			
	if nNumText > 100 and nNumText < 800  then
		BeginEvent(sceneId)
			AddText(sceneId, "  至尊神器已经沉睡千年，用这个材料来唤醒！")
			
			local nLevel = 0
			if nNumText > 100 then    -- 激活凤歌鸾舞一级
				nLevel = 1
			end
			if nNumText > 110 then    -- 激活凤歌鸾舞二级
				nLevel = 2
			end
			if nNumText > 120 then    -- 激活凤歌鸾舞三级
				nLevel = 3
			end			
			if nNumText > 130 then    -- 激活凤歌鸾舞四级
				nLevel = 4
			end			
			if nNumText > 140 then    -- 【毒】凤歌鸾舞
				nLevel = 5
			end			
			if nNumText > 150 then    -- 【冰】凤歌鸾舞
				nLevel = 5
			end			
			if nNumText > 160 then    -- 【火】凤歌鸾舞
				nLevel = 5
			end			
			if nNumText > 170 then    -- 【玄】凤歌鸾舞
				nLevel = 5
			end			
			if nNumText > 180 then    -- 游云惊龙一级
				nLevel = 1
			end			
			if nNumText > 190 then    -- 游云惊龙二级
				nLevel = 6
			end			
			if nNumText > 200 then    -- 游云惊龙三级
				nLevel = 7
			end					
			if nNumText > 210 then    -- 游云惊龙四级
				nLevel = 8
			end					
			if nNumText > 220 then    -- 【毒】游云惊龙
				nLevel = 9
			end					
			if nNumText > 230 then    -- 【冰】游云惊龙
				nLevel = 9
			end					
			if nNumText > 240 then    -- 【火】游云惊龙
				nLevel = 9
			end				
			if nNumText > 250 then    -- 【玄】游云惊龙
				nLevel = 9
			end				

			local szStr = "  要获得这些装备，你需要给我#gfff0f0“" .. x002957_g_StoneList[nLevel].str
										.. "”#cFFCC00“".. tostring(x002957_g_StoneList[nLevel].num) .. "”#W个  #r#cFFCC00得其者得天下，武林中人梦寐以求的神器！#W"
			AddText(sceneId, szStr)
			
			for i, item in x002957_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    		EndEvent(sceneId)
   		DispatchMissionContinueInfo(sceneId,selfId,targetId, x002957_g_ScriptId, 0)		
	end
			
	for i, findId in x002957_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002957_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002957_g_eventList do
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
function x002957_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002957_g_eventList do
		if missionScriptId == findId then
			x002957_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x002957_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002957_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002957_g_eventList do
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
function x002957_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	for i, item in x002957_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nLevel = 0
	if x002957_g_EquipList[nItemIndex].n > 100 then
		nLevel = 1
	end
	if x002957_g_EquipList[nItemIndex].n > 110 then
		nLevel = 2
	end
	if x002957_g_EquipList[nItemIndex].n > 120 then
		nLevel = 3
	end	
	if x002957_g_EquipList[nItemIndex].n > 130 then
		nLevel = 4
	end	
	if x002957_g_EquipList[nItemIndex].n > 140 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 150 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 160 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 170 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 180 then
		nLevel = 1
	end	
	if x002957_g_EquipList[nItemIndex].n > 190 then
		nLevel = 6
	end	
	if x002957_g_EquipList[nItemIndex].n > 200 then
		nLevel = 7
	end	
	if x002957_g_EquipList[nItemIndex].n > 210 then
		nLevel = 8
	end	
	if x002957_g_EquipList[nItemIndex].n > 220 then
		nLevel = 9
	end	
	if x002957_g_EquipList[nItemIndex].n > 230 then
		nLevel = 9
	end	
	if x002957_g_EquipList[nItemIndex].n > 240 then
		nLevel = 9
	end	
	if x002957_g_EquipList[nItemIndex].n > 250 then
		nLevel = 9
	end	
		
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x002957_g_StoneList[nLevel].id) >= x002957_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "你没有足够的材料，不能激活至尊神器。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查是不是有足够的石头可以扣除
	if LuaFnGetAvailableItemCount(sceneId, selfId, x002957_g_StoneList[nLevel].id) < x002957_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "你没有足够的材料可以被扣除，请检查物品是否上锁。"
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
			strText = "你的背包没有空间了。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x002957_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- 删除相关的石头
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x002957_g_StoneList[nLevel].id, x002957_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "扣出材料失败。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--给完家东西，完成
		local nBagIndex = TryRecieveItem( sceneId, selfId, x002957_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "激活成功。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	for i, findId in x002957_g_eventList do
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
function x002957_OnDie( sceneId, selfId, killerId )
end

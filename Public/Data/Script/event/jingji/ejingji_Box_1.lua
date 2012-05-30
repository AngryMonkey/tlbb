-- 125022 宝箱
-- 获取buff的宝箱

x125022_g_scriptId = 125022


--所拥有的事件ID列表用ID集合实现
x125022_g_LimitiBuffCollectionID = 75;

--高级时装，50%掉落随机 1 件
x125022_g_LootItem_1 = {
10124009,10124010,10124011,10124012,
10124013,10124014,10124015,10124016,
10124017,                           
}

--4星套装，100%掉落随机 1 件
x125022_g_LootItem_2 = {
10510005,10510006,10510008,10510012,10510013,10510017,10510023,10510026,
10510035,10510036,10510038,10510042,10510043,10510047,10510053,10510056,
10510065,10510066,10510068,10510072,10510073,10510077,10510083,10510086,
10511004,10511007,10511012,10511014,10511016,10511018,10511025,10511028,
10511034,10511037,10511042,10511044,10511046,10511048,10511055,10511058,
10511064,10511067,10511072,10511074,10511076,10511078,10511085,10511088,
10512003,10512008,10512012,10512015,10512017,10512023,10512026,10512033,
10512038,10512042,10512045,10512047,10512053,10512056,10512063,10512068,
10512072,10512075,10512077,10512083,10512086,10513004,10513008,10513014,
10513018,10513022,10513024,10513028,10513034,10513038,10513044,10513048,
10513052,10513054,10513058,10513064,10513068,10513074,10513078,10513082,
10513084,10513088,10514003,10514007,10514015,10514017,10514022,10514025,
10514028,10514033,10514037,10514045,10514047,10514052,10514055,10514058,
10514063,10514067,10514075,10514077,10514082,10514085,10514088,10515004,
10515006,10515014,10515016,10515022,10515025,10515027,10515034,10515036,
10515044,10515046,10515052,10515055,10515057,10515064,10515066,10515074,
10515076,10515082,10515085,10515087,10520002,10520005,10520006,10520013,
10520018,10520024,10520027,10520028,10520032,10520035,10520036,10520043,
10520048,10520054,10520057,10520058,10520062,10520065,10520066,10520073,
10520078,10520084,10520087,10520088,10521002,10521004,10521007,10521014,
10521017,10521025,10521027,10521028,10521032,10521034,10521037,10521044,
10521047,10521055,10521057,10521058,10521062,10521064,10521067,10521074,
10521077,10521085,10521087,10521088,10522002,10522003,10522007,10522015,
10522018,10522023,10522026,10522032,10522033,10522037,10522045,10522048,
10522053,10522056,10522062,10522063,10522067,10522075,10522078,10522083,
10522086,10523005,10523006,10523013,10523017,10523024,10523026,10523035,
10523036,10523043,10523047,10523054,10523056,10523065,10523066,10523073,
10523077,10523084,10523086,10552005,10552008,10552015,10552016,10552024,
10552027,10552035,10552038,10552045,10552046,10552054,10552057,10552065,
10552068,10552075,10552076,10552084,10552087,10553007,10553008,10553016,
10553018,10553027,10553037,10553038,10553046,10553048,10553057,10553067,
10553068,10553076,10553078,10553087,10500009,10500019,10501009,10502009,
10503009,10503019,10504009,10504019,10505009,10510009,10510019,10510029,
10510039,10510049,10510059,10510069,10510079,10510089,10511009,10511019,
10511029,10511039,10511049,10511059,10511069,10511079,10511089,10512009,
10512019,10512029,10512039,10512049,10512059,10512069,10512079,10512089,
10513009,10513019,10513029,10513039,10513049,10513059,10513069,10513079,
10513089,10514009,10514019,10514029,10514039,10514049,10514059,10514069,
10514079,10514089,10515009,10515019,10515029,10515039,10515049,10515059,
10515069,10515079,10515089,10520009,10520019,10520029,10520039,10520049,
10520059,10520069,10520079,10520089,10521009,10521019,10521029,10521039,
10521049,10521059,10521069,10521079,10521089,10522009,10522019,10522029,
10522039,10522049,10522059,10522069,10522079,10522089,10523009,10523019,
10523029,10523039,10523049,10523059,10523069,10523079,10523089,10552009,
10552019,10552029,10552039,10552049,10552059,10552069,10552079,10552089,
10553009,10553019,10553029,10553039,10553049,10553059,10553069,10553079,
10553089,}-- 10500019~10553089由zz添加



x125022_g_LootItem_3 = {10421018}

--无敌buff
x125022_g_BuffId_1 = 54

--武林盟主buff
x125022_g_BuffId_2 = 8046

--驱散不该有的BUFF的效果
x125022_g_BuffId_3 = 8055	--心无旁骛（开箱驱散）


--心无旁骛BuffID
x125022_g_BuffId_4 = 8056	--心无旁骛（开箱免疫）

--Code Check Only
--QUALITY_CREATE_BY_BOSS =nil

--**********************************
--事件列表
--**********************************
function x125022_OnDefaultEvent( sceneId, selfId, targetId )
	
end

--**********************************
--特殊交互:条件判断
--**********************************
function x125022_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- 限制身上的buff
	local bOk = x125022_IsCanOpenBox( sceneId,activatorId )
	
	if bOk == 0  then
    BeginEvent(sceneId)
      AddText(sceneId,"你现在不能开启这个宝箱。");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
	end
	-- 驱散不该有的BUFF并添加心无旁骛Buff
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x125022_g_BuffId_3, 0);
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, activatorId, x125022_g_BuffId_4, 0);

	if GetUnitCampID(sceneId, activatorId, activatorId) < 500   then
    BeginEvent(sceneId)
      AddText(sceneId,"你现在的战斗阵营不正确，不能开启宝箱。");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
		bOk = 0
	end
	
	if bOk == 1  then
		local str = "#G[封禅台]#W" .. GetName(sceneId, activatorId) .."#P正在试图打开宝箱呢！"
		CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	end
	
	return bOk
end

--**********************************
-- 检测当前玩家身上的buff，能不能开启宝箱
--**********************************
function x125022_IsCanOpenBox( sceneId,activatorId )
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId,activatorId, x125022_g_BuffId_2)==1  then
		return 0
	end

	return 0==LuaFnHaveImpactInSpecificCollection(sceneId, activatorId, x125022_g_LimitiBuffCollectionID)
end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x125022_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x125022_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- selfId == 宝箱Id
	-- activatorId == 开启人Id
	
	local x
	local z
	
	x,z = GetWorldPos(sceneId, selfId)
	
	local nCount = GetMonsterCount(sceneId)
	local bDelOk = 0
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, nObjId) == "黄色宝箱"  then
			bDelOk = 1
			LuaFnDeleteMonster(sceneId, nObjId)
		end
	end
	
	-- 给开启成功的玩家一个掉落包
	local nItemCount = 2
	local nItemId_1
	local nItemId_2
	local nItemId_3

	if random(1000) <= 125  then
		nItemCount = 3
		nItemId_1 = x125022_g_LootItem_1[random( getn(x125022_g_LootItem_1))]
	end
	
	nItemId_2 = x125022_g_LootItem_2[random( getn(x125022_g_LootItem_2) )]
	
	nItemId_3 = x125022_g_LootItem_3[1]
	
	if bDelOk == 1  then
		local nBoxId = DropBoxEnterScene(	x,z,sceneId )
		if nBoxId > -1  then
			if nItemCount == 3  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,3,
								nItemId_1,nItemId_2,nItemId_3)
			elseif nItemCount == 2  then
				AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,2,
								nItemId_2,nItemId_3)
			end
			
			-- 把这个掉落绑定给制定玩家
			SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,activatorId))
			
			-- 发送系统公告
			local nCurHour = GetHour()
			if nCurHour==0 or nCurHour==2 or nCurHour==4 or
				 nCurHour==6 or nCurHour==8 or nCurHour==10 or
				 nCurHour==12 or nCurHour==14 or nCurHour==16 or
				 nCurHour==18 or nCurHour==20 or nCurHour==22  then
				
					nCurHour = nCurHour + 2
			else
					nCurHour = nCurHour + 1
			
			end
			
			if nCurHour >= 2 and nCurHour < 10  then
				nCurHour = 10
			end
			
			if nCurHour == 24  then
				nCurHour = 0
			end
			
			--#P [世界]于九莲大喊：天下英雄们！强大的AAA已经打开了武林盟主的宝箱！请大家XXX点再来封禅台争夺武林盟主之位吧！
			local str = format("#Y于九莲#P大喊：天下英雄们！强大的#{_INFOUSR%s}#P已经打开了武林盟主的宝箱！请大家#Y%s点45分#P再来#G封禅台#P争夺武林盟主之位吧！",GetName(sceneId,activatorId),nCurHour)
			BroadMsgByChatPipe(sceneId, 0, str, 4)
			
		end
	end
	
	-- 在这里记录开启宝箱的日志
	LuaFnAuditPlayerBehavior(sceneId, activatorId, "开启盟主宝箱");
	
	-- 给这个玩家一个buff
	LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x125022_g_BuffId_1, 100 )
	
	LuaFnSendSpecificImpactToUnit(sceneId, activatorId, activatorId, 
										activatorId, x125022_g_BuffId_2, 100 )
										
	x125022_DealExp(sceneId, activatorId)
	
	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x125022_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时的特殊处理
--**********************************
function x125022_OnActivateActionStart( sceneId, selfId, activatorId )
	--PrintNum(777)
	return 1
end

--**********************************
--特殊交互:交互撤消时的特殊处理
--**********************************
function x125022_OnActivateCancel( sceneId, selfId, activatorId )
	local str = "#G[封禅台]#W" .. GetName(sceneId,activatorId) .. "#P打开宝箱的努力功败垂成！"
	CallScriptFunction((200060), "Duibai",sceneId, "", "", str)
	return 0
end

--**********************************
--特殊交互:交互中断时的特殊处理
--**********************************
function x125022_OnActivateInterrupt( sceneId, selfId, activatorId )
	
	return 0
end

function x125022_OnActivateInterrupt( sceneId, selfId, activatorId )

end

function x125022_DealExp(sceneId, activatorId)

	local nPlayerCamp = GetUnitCampID(sceneId, activatorId, activatorId)

	-- 开启宝箱的同时，分配Exp
	local nHumanIdList = {}
	
	for i=1, 10  do
		nHumanIdList[i] = -1
	end
	
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local j=1
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) == nPlayerCamp   then
			nHumanIdList[j] = nHumanId
			j = j+1
		end
	end
	
	j = j-1
	
	for i=1, j  do
		if nHumanIdList[i] ~= -1  then
			AddExp(sceneId, nHumanIdList[i], floor(100000/j))
		end
	end
	
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId) ~= nPlayerCamp   then
			AddExp(sceneId, nHumanId, floor(100000/(nHumanCount-j)))
		end
	end
	
end

--经验，
--和开宝箱的人相同阵营的人平分 10 万
--在场的除这些人以外的人平分 10 万




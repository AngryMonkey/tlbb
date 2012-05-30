--杀怪，在接任务的同时，创建要杀的怪
--最后一击

--MisDescBegin
--脚本号
x212109_g_ScriptId = 212109

--任务号
x212109_g_MissionId = 658

--目标NPC
x212109_g_Name	="阿青"

--任务归类
x212109_g_MissionKind = 42

--任务等级
x212109_g_MissionLevel = 38

--是否是精英任务
x212109_g_IfMissionElite = 0

--任务名
x212109_g_MissionName="最后一击"
--任务描述
x212109_g_MissionInfo="#{Lua_Longquan_0001}"
--任务目标
x212109_g_MissionTarget="#G龙泉断桥#W的#R阿青#W#{_INFOAIM51,115,31,阿青}要求你杀死#R通天#W。#R通天#W#{_INFOAIM48,51,31,-1}经常在#G归云亭#W附近出现。"		
--未完成任务的npc对话
x212109_g_ContinueInfo="  你已经杀死通天了吗？"
--提交时npc的话
x212109_g_MissionComplete="  一切都结束了吗？是否，我和仲之之间也该有个了断了……"		

x212109_g_MoneyBonus=4000
x212109_g_exp=20000

--x212109_g_ItemBonus={{id=10111011, num=1}}

x212109_g_RadioItemBonus={{id=10421066 ,num=1},{id=10411073,num=1},{id=10410067,num=1}}

x212109_g_Custom	= { {id="已杀死通天",num=1} }

x212109_g_IsMissionOkFail = 0		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212109_OnDefaultEvent( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if (IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212109_g_MissionId) > 0)  then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, x212109_g_MissionName)
			AddText(sceneId, x212109_g_ContinueInfo)
		EndEvent( )
		local bDone = x212109_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId,bDone)
				
	--满足任务接收条件
  elseif x212109_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212109_g_MissionName)
			AddText(sceneId,x212109_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212109_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212109_g_MoneyBonus )
			for i, item in x212109_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212109_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212109_g_MissionId) > 0 then
		AddNumText(sceneId, x212109_g_ScriptId, x212109_g_MissionName, 2, -1)
	--满足任务接收条件
	elseif x212109_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212109_g_ScriptId, x212109_g_MissionName, 1, -1)
	end
end

--**********************************
--检测接受条件
--**********************************
function x212109_CheckAccept( sceneId, selfId )

	--要求完成的前续任务
	if IsMissionHaveDone(sceneId,selfId,656) <= 0 then		--断桥花妖
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,657) <= 0 then		--断桥花妖
		return 0
	end
	
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= x212109_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212109_OnAccept( sceneId, selfId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212109_g_MissionId) > 0 then
		return 
	end

	-- 给玩家身上加一个东西
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002152, 1)
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		-- 加入任务到玩家列表
		local ret = AddMission( sceneId,selfId, x212109_g_MissionId, x212109_g_ScriptId, 1, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)

		--设置任务变量宝物的场景编号和坐标位置
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212109_g_MissionId)--得到任务在20个任务中的序列号
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
	
		Msg2Player(  sceneId, selfId,"#Y接受任务" .. x212109_g_MissionName, MSG2PLAYER_PARA )

		BeginEvent(sceneId)
			strText = "#Y接受任务 ".. x212109_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
	
		Msg2Player(  sceneId, selfId,"#Y你的背包满了", MSG2PLAYER_PARA )
	end	

end	

--**********************************
--放弃
--**********************************
function x212109_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212109_g_MissionId )
	
	--删除任务物品
	DelItem( sceneId, selfId, 40002152, 1 )
end

--**********************************
--继续
--**********************************
function x212109_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212109_g_MissionName)
		AddText(sceneId,x212109_g_MissionComplete)
		AddMoneyBonus( sceneId, x212109_g_MoneyBonus )
		for i, item in x212109_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212109_g_ScriptId,x212109_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212109_CheckSubmit( sceneId, selfId )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212109_g_MissionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x212109_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212109_g_MissionId) <= 0 then
		return
	end
	
	-- 2、完成任务的情况检测
	if x212109_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212109_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	
	if ret > 0 then
		--删除任务物品
		DelItem( sceneId, selfId, 40002152, 1 )
		AddItemListToHuman(sceneId,selfId)
		-- 金钱和经验
		AddMoney(sceneId,selfId,x212109_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212109_g_exp)
		
		DelMission( sceneId,selfId, x212109_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId, x212109_g_MissionId )
	else
		--任务奖励没有加成功
		BeginEvent(sceneId)
			AddText(sceneId, "背包已满,无法完成任务");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
		
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212109_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	-- 检测任务是不是已经完成
	if x212109_CheckSubmit(sceneId, selfId) > 0    then
		return
	end
	
	if monsterName == "通天"   then
		--取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x212109_g_MissionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212109_g_MissionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("已杀死通天：1/1" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					-- 设置任务完成
					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
					SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x212109_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212109_OnItemChanged( sceneId, selfId, itemdataId )
end


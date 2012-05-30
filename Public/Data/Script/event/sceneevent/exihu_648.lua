--杀怪，在接任务的同时，创建要杀的怪
--苏飞的世界

--MisDescBegin
--脚本号
x212100_g_ScriptId = 212100

--任务号
x212100_g_MissionId = 648

--目标NPC
x212100_g_Name	="苏飞"

--任务归类
x212100_g_MissionKind = 41

--任务等级
x212100_g_MissionLevel = 25

--是否是精英任务
x212100_g_IfMissionElite = 0

--任务名
x212100_g_MissionName="苏飞的世界"
--任务描述
x212100_g_MissionInfo="#{Mis_K_Xihu_1000042}"
--任务目标
x212100_g_MissionTarget="#{MIS_TAR_ADD_010}"		
--未完成任务的npc对话
x212100_g_ContinueInfo="  你已经杀死#W麦友仁#W了？"
--提交时npc的话
x212100_g_MissionComplete="  太谢谢你了，新的世界，仿佛就在我的面前。"		

x212100_g_MoneyBonus=1800
x212100_g_exp=18000
--x212100_g_ItemBonus={{id=10111008,num=1}}


x212100_g_Custom	= { {id="已杀死麦友仁",num=1} }
x212100_g_IsMissionOkFail = 0

x212100_g_RadioItemBonus={{id=10412063 ,num=1},{id=10413065,num=1},{id=10402065,num=1}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212100_OnDefaultEvent( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if (IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0)  then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, x212100_g_MissionName)
			AddText(sceneId, x212100_g_ContinueInfo)
		EndEvent( )
		local bDone = x212100_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId,bDone)
				
	--满足任务接收条件
  elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212100_g_MissionName)
			AddText(sceneId,x212100_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212100_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
			for i, item in x212100_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212100_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212100_g_MissionId) > 0 then
		AddNumText(sceneId, x212100_g_ScriptId, x212100_g_MissionName, 2, -1);
	--满足任务接收条件
	elseif x212100_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212100_g_ScriptId, x212100_g_MissionName, 1, -1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x212100_CheckAccept( sceneId, selfId )

	--要求完成的前续任务
	if IsMissionHaveDone(sceneId,selfId,645) <= 0 then		--断桥花妖
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,646) <= 0 then	--白堤柳鬼
		return 0
	elseif IsMissionHaveDone(sceneId,selfId,647) <= 0 then--归风庄
		return 0
	end
	
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= x212100_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212100_OnAccept( sceneId, selfId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212100_g_MissionId) > 0 then
		return 
	end
	
	-- 1，检测当前是不是已经在场景中有 麦友人 了，如果有，提示玩家现在不能接这个任务
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "麦友仁"  then
			BeginEvent(sceneId)
				AddText(sceneId,"你现在不能接这个任务。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			return
		end
	end
		
	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212100_g_MissionId, x212100_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	--设置任务变量宝物的场景编号和坐标位置
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212100_g_MissionId)--得到任务在20个任务中的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况

	Msg2Player(  sceneId, selfId,"#Y接受任务" .. x212100_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y接受任务 " .. x212100_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- 创建这个怪出来，同时喊话
	local nMonsterId = LuaFnCreateMonster(sceneId, 509, 161, 262, 5, 0, -1)
	LuaFnSendSpecificImpactToUnit(sceneId,nMonsterId,nMonsterId,nMonsterId,44,3)
	CallScriptFunction((200060), "Duibai",sceneId, "麦友仁", "西湖", "苏飞！你这蝼蚁一样的人，也妄想动摇偃师的统治吗？苏飞！明年的今天就是你的忌日！" )
	
	SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
	SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)

	--设置这个怪的消失时间
	SetCharacterDieTime(sceneId, nMonsterId, 600000)

end

--**********************************
--场景计时器
--**********************************
function x212100_OnSceneTimer( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x212100_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212100_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212100_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212100_g_MissionName)
		AddText(sceneId,x212100_g_MissionComplete)
		AddMoneyBonus( sceneId, x212100_g_MoneyBonus )
		for i, item in x212100_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212100_g_ScriptId,x212100_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212100_CheckSubmit( sceneId, selfId )

	--local missionId = GetMissionIdByIndex(x212100_g_ScriptId)
	local missionId = x212100_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)

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
function x212100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- 安全性检测
		-- 1、检测玩家是不是有这个任务
		if IsHaveMission(sceneId,selfId,x212100_g_MissionId) <= 0 then
			return
		end
		
		-- 2、完成任务的情况检测
		if x212100_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		BeginAddItem(sceneId)
		for i, item in x212100_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			-- 金钱和经验
			AddMoney(sceneId,selfId,x212100_g_MoneyBonus )
			LuaFnAddExp( sceneId, selfId, x212100_g_exp)
			
			DelMission( sceneId,selfId, x212100_g_MissionId )
			--设置任务已经被完成过
			MissionCom( sceneId,selfId, x212100_g_MissionId )
			
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
function x212100_OnKillObject( sceneId, selfId, objdataId ,objId )

	--local missionId = TGetMissionIdByIndex(x212100_g_ScriptId)
	local missionId = x212100_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == "麦友仁"   then
		
		CallScriptFunction((200060), "Duibai",sceneId, "苏飞", "西湖", "水鬼弟兄们！今天，就在今天！我们自由了！我们不再是奴隶了！" )

		--取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
		     	BeginEvent(sceneId)
						local strText = format("已杀死麦友仁：1/1" )
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
function x212100_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212100_OnItemChanged( sceneId, selfId, itemdataId )
end








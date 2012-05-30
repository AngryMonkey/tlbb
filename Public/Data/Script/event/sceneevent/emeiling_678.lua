--杀怪，在接任务的同时，创建要杀的怪
--梅岭 罪魁祸首

--MisDescBegin
--脚本号
x212113_g_ScriptId = 212113

--任务号
x212113_g_MissionId = 678

--前续任务号
x212113_g_PreMissionId1 = 673
x212113_g_PreMissionId2 = 674
x212113_g_PreMissionId3 = 675

--目标NPC
x212113_g_Name	="月季"

--任务归类
x212113_g_MissionKind = 44

--任务等级
x212113_g_MissionLevel = 70

--是否是精英任务
x212113_g_IfMissionElite = 0

--任务名
x212113_g_MissionName="罪魁祸首"
--任务描述
x212113_g_MissionInfo="#{Mis_K_Meiling_1000183}"
--任务目标
x212113_g_MissionTarget="    梅岭的月季#{_INFOAIM192,70,33,月季}要求你杀死严白虎。小心，只要月季开始祭祀，#R严白虎#W就会出现。"		
--未完成任务的npc对话
x212113_g_ContinueInfo="  你已经杀死严白虎了吗？"
--提交时npc的话
x212113_g_MissionComplete="  谢谢你，谢谢你。咳咳……我没事，每次祭祀总会消耗一些真气的……"		

x212113_g_MoneyBonus=51700
x212113_g_exp=37000

x212113_g_szMonsterName = "严白虎"
x212113_g_MonsterID = 525

x212113_g_Custom	= { {id="已杀死严白虎",num=1} }
x212113_g_IsMissionOkFail = 0

x212113_g_RadioItemBonus={{id=10412072 ,num=1},{id=10403056,num=1}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212113_OnDefaultEvent( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if (IsMissionHaveDone(sceneId,selfId,x212113_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x212113_g_MissionId) > 0)  then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, x212113_g_MissionName)
			AddText(sceneId, x212113_g_ContinueInfo)
		EndEvent( )
		local bDone = x212113_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212113_g_ScriptId,x212113_g_MissionId,bDone)
				
	--满足任务接收条件
  elseif x212113_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212113_g_MissionName)
			AddText(sceneId,x212113_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212113_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}")
			AddMoneyBonus( sceneId, x212113_g_MoneyBonus )
			for i, item in x212113_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212113_g_ScriptId,x212113_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212113_OnEnumerate( sceneId, selfId, targetId )
	
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212113_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212113_g_MissionId) > 0 then
		AddNumText(sceneId, x212113_g_ScriptId, x212113_g_MissionName, 2, -1);
	--满足任务接收条件
	elseif x212113_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212113_g_ScriptId, x212113_g_MissionName, 1, -1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x212113_CheckAccept( sceneId, selfId )

	--要求完成的3个前续任务
	if IsMissionHaveDone(sceneId,selfId,x212113_g_PreMissionId1) <= 0 then
			return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212113_g_PreMissionId2) <= 0 then
			return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212113_g_PreMissionId3) <= 0 then
			return 0
	end
	
	--需要1级才能接
	if GetLevel( sceneId, selfId ) < x212113_g_MissionLevel then
		return 0
	end
	
	return 1
	
end

--**********************************
--接受
--**********************************
function x212113_OnAccept( sceneId, selfId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212113_g_MissionId) > 0 then
		return 
	end
		
	-- 先检测地图上是不是有这个怪，如果有就不再放出来
	local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == "严白虎"  then
			BeginEvent(sceneId)
				strText = "现在还不能接这个任务。"
				AddText(sceneId, strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end

	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212113_g_MissionId, x212113_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	--设置任务变量宝物的场景编号和坐标位置
	local misIndex = GetMissionIndexByID(sceneId, selfId, x212113_g_MissionId)--得到任务在20个任务中的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况

	Msg2Player(  sceneId, selfId,"#Y接受任务" .. x212113_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y接受任务 ".. x212113_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
	-- 创建怪物
	local nMonstrId = LuaFnCreateMonster(sceneId, x212113_g_MonsterID, 189, 71, 1, 0, -1)
	CallScriptFunction((200060), "Paopao",sceneId, "严白虎", "梅岭", "可怜的凡人！你以为凭你们渺小的力量，就能够背叛修罗王的意志吗？为你的年轻付出代价吧！修罗王会等待你的忏悔的！")
	SetCharacterDieTime(sceneId, nMonstrId, 600000)
	
end

--**********************************
--放弃
--**********************************
function x212113_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212113_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212113_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212113_g_MissionName)
		AddText(sceneId,x212113_g_MissionComplete)
		AddMoneyBonus( sceneId, x212113_g_MoneyBonus )
		for i, item in x212113_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212113_g_ScriptId,x212113_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212113_CheckSubmit( sceneId, selfId )

	local missionId = x212113_g_MissionId
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
function x212113_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212113_g_MissionId) <= 0 then
		return
	end
	
	-- 2、完成任务的情况检测
	if x212113_CheckSubmit(sceneId, selfId) <= 0    then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212113_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	if ret > 0  then
		-- 金钱和经验
		AddMoney(sceneId,selfId,x212113_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212113_g_exp)
	
		DelMission( sceneId,selfId, x212113_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId, x212113_g_MissionId )
		AddItemListToHuman(sceneId,selfId)
		
	else
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "背包已满,无法完成任务"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212113_OnKillObject( sceneId, selfId, objdataId ,objId )

	local missionId = x212113_g_MissionId
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == x212113_g_szMonsterName   then

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
						local strText = format("已经战胜严白虎：1/1" )
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
function x212113_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212113_OnItemChanged( sceneId, selfId, itemdataId )
end








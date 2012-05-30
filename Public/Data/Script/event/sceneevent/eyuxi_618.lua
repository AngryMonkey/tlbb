
-- 玉溪，英雄救美

--************************************************************************
--MisDescBegin
--脚本号
x212111_g_ScriptId = 212111

--任务号
x212111_g_MissionId = 618

--前续任务
x212111_g_PreMissionId_1 = 615
x212111_g_PreMissionId_2 = 616
x212111_g_PreMissionId_3 = 617

--目标NPC
x212111_g_Name = "阿诗玛"

--是否是精英任务
x212111_g_IfMissionElite = 0

--任务归类
x212111_g_MissionKind = 38

--任务等级
x212111_g_MissionLevel = 72

--任务文本描述
x212111_g_MissionName="英雄救美"
x212111_g_MissionInfo="#{Mis_K_Yuxi_1000173}"
x212111_g_MissionTarget="  杀死玉溪的热布巴拉#{_INFOAIM254,147,27,-1}，救出阿诗玛。"	--任务目标
x212111_g_MissionComplete="  是你救出了我吗？还是阿黑……阿黑，他已经走了吗？我其实早就知道阿黑是很喜欢阿依娜的……#r  我不想嫁给阿支，也不想看到阿黑难过，我还是……还是做一块石头，永远的做一块石头吧……"	--完成任务npc说话的话
x212111_g_MissionContinue="  我还是……还是做一块石头，永远的做一块石头吧……"

x212111_g_MoneyBonus=4750
x212111_g_exp=19800

x212111_g_Custom	= { {id="已杀热布巴拉",num=1} }
x212111_g_IsMissionOkFail = 0

x212111_g_RadioItemBonus={{id=10400067 ,num=1},{id=10411080,num=1},{id=10412073,num=1},{id=10405066,num=1}}

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x212111_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x212111_g_MissionId) > 0 then
		--发送任务需求的信息

		if GetName(sceneId, targetId) == "阿诗玛"   then
			BeginEvent(sceneId)
				AddText(sceneId,x212111_g_MissionName)
				AddText(sceneId,x212111_g_MissionContinue)
			EndEvent( )
			bDone = x212111_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212111_g_ScriptId,x212111_g_MissionId,bDone)
		end
    --满足任务接收条件
  elseif x212111_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212111_g_MissionName)
			AddText(sceneId,x212111_g_MissionInfo)
			AddText(sceneId,x212111_g_MissionTarget)
			AddMoneyBonus( sceneId, x212111_g_MoneyBonus )
			for i, item in x212111_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212111_g_ScriptId,x212111_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x212111_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x212111_g_MissionId) > 0 then
		return
	end
	
  --如果已接此任务
	if IsHaveMission(sceneId,selfId,x212111_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == "阿诗玛"   then
			AddNumText(sceneId,x212111_g_ScriptId,x212111_g_MissionName,2,-1);
		end

	--满足任务接收条件
	elseif x212111_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId, targetId) == "阿黑"   then
			AddNumText(sceneId,x212111_g_ScriptId,x212111_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212111_CheckAccept( sceneId, selfId )
	
	--需要4级才能接
	if GetLevel( sceneId, selfId ) < 72 then
		return 0
	end

	if IsMissionHaveDone(sceneId,selfId,x212111_g_PreMissionId_1) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212111_g_PreMissionId_2) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x212111_g_PreMissionId_3) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212111_OnAccept( sceneId, selfId )
	
	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212111_g_MissionId, x212111_g_ScriptId, 1, 0, 0 )		--添加任务
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212111_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：英雄救美",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x212111_g_SignPost.x, x212111_g_SignPost.z, x212111_g_SignPost.tip )
	BeginEvent(sceneId)
		strText = "#Y接受任务：英雄救美"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--放弃
--**********************************
function x212111_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212111_g_MissionId )
end


--**********************************
--继续
--**********************************
function x212111_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
		AddText(sceneId,x212111_g_MissionName)
		AddText(sceneId,x212111_g_MissionComplete)
		AddMoneyBonus( sceneId, x212111_g_MoneyBonus )
		for i, item in x212111_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212111_g_ScriptId,x212111_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212111_CheckSubmit( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x212111_g_MissionId)
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)

	if Kill1~=1 			then
		return 0
	end
	return 1
end

--**********************************
--提交
--**********************************
function x212111_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	-- 需要再做一个完成任务的检测
	if x212111_CheckSubmit( sceneId, selfId ) < 1  then
		return
	end
	
	-- 检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212111_g_MissionId) <= 0 then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212111_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	if ret > 0 then
		DelMission( sceneId, selfId, x212111_g_MissionId )
		MissionCom( sceneId, selfId, x212111_g_MissionId )
	
		AddMoney(sceneId,selfId,x212111_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x212111_g_exp)
		AddItemListToHuman(sceneId,selfId)
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
function x212111_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == "热布巴拉"	  then
		misIndex = GetMissionIndexByID(sceneId,selfId,x212111_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		SetMissionByIndex(sceneId,selfId,misIndex,1,1)
		BeginEvent(sceneId)
		AddText(sceneId,"已杀死热布巴拉:1/1");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		--如果玩家杀对了人，就在一个固定点刷出一个NPC，持续一分钟
		local NpcId
		NpcId = LuaFnCreateMonster(sceneId, 210, 252, 142, 3, 0, 027004)
		SetCharacterName(sceneId, NpcId, "阿诗玛")
		SetCharacterDieTime(sceneId, NpcId, 600000)
	end

end

--**********************************
--进入区域事件
--**********************************
function x212111_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212111_OnItemChanged( sceneId, selfId, itemdataId )
end

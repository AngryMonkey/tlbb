--默认建设任务

--给帮会大总管5个金币

--MisDescBegin

--脚本号

x805026_g_ScriptId = 805026



--任务号

x805026_g_MissionId = 443



--上一个任务的ID

x805026_g_MissionIdPre = 441



--目标NPC

x805026_g_Name	="帮会大总管"



--任务道具编号

x805026_g_ItemId = 30101001



--任务道具需求数量

x805026_g_ItemNeedNum = 1



--任务归类

x805026_g_MissionKind = 13



--任务等级

x805026_g_MissionLevel = 1



--是否是精英任务

x805026_g_IfMissionElite = 0



--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--任务是否已经完成

x805026_g_IsMissionOkFail = 0		--变量的第0位



--以上是动态**************************************************************



--任务需要得到的物品

x805026_g_DemandItem={{id=30101001,num=1}}		--变量第1位



--任务名

x805026_g_MissionName="升级研究"

x805026_g_MissionInfo_1="  #R"

x805026_g_MissionInfo_2="#{city0_levelup_0001}"

x805026_g_MissionTarget="给帮会大总管5个金币"

x805026_g_MissionContinue="你有5个金币了吗？"

x805026_g_MissionComplete="  嗯，做得不错。看来你很有钱吗。"

x805026_g_MoneyBonus=0

x805026_g_SignPost = {x = 109, z = 167, tip = "帮会大总管"}

x805026_g_ItemBonus={{id=30304001,num=1}}

--MisDescEnd

--**********************************

--任务入口函数

--**********************************

function x805026_OnDefaultEvent( sceneId, selfId, targetId )

    --如果已接此任务

		if IsHaveMission(sceneId,selfId,x805026_g_MissionId) > 0 then

			--发送任务需求的信息

			BeginEvent(sceneId)

			AddText(sceneId,x805026_g_MissionName)

			AddText(sceneId,x805026_g_MissionContinue)

			EndEvent( )

			bDone = x805026_CheckSubmit( sceneId, selfId )

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x805026_g_ScriptId,x805026_g_MissionId,bDone)

		--满足任务接收条件

		elseif x805026_CheckAccept(sceneId,selfId) > 0 then

			--发送任务接受时显示的信息

				local  PlayerName=GetName(sceneId,selfId)	

	            local  PlayerSex=GetSex(sceneId,selfId)

	            if PlayerSex == 0 then

		            PlayerSex = "姑娘"

	            else

		            PlayerSex = "少侠"

	            end

				BeginEvent(sceneId)

					AddText(sceneId,x805026_g_MissionName)

					AddText(sceneId,x805026_g_MissionInfo_1..PlayerName..PlayerSex..x805026_g_MissionInfo_2)

					AddText(sceneId,"#{M_MUBIAO}")

					AddText(sceneId,x805026_g_MissionTarget)

				EndEvent( )

				DispatchMissionInfo(sceneId,selfId,targetId,x805026_g_ScriptId,x805026_g_MissionId)

		end

end



--**********************************

--列举事件

--**********************************

function x805026_OnEnumerate( sceneId, selfId, targetId )

    --如果已接此任务
		
    if IsHaveMission(sceneId,selfId,x805026_g_MissionId) > 0 then
 			
    	AddNumText(sceneId,x805026_g_ScriptId,x805026_g_MissionName,1,-1);
	
		--满足任务接收条件
 		elseif x805026_CheckAccept(sceneId,selfId) > 0 then
 	
			AddNumText(sceneId,x805026_g_ScriptId,x805026_g_MissionName,2,-1);
		
		end

end



--**********************************

--检测接受条件

--**********************************

function x805026_CheckAccept( sceneId, selfId )

	--需要1级才能接

	if GetLevel( sceneId, selfId ) >= 1 then
	
		return 1

	else
		
		return 0

	end

end



--**********************************

--接受

--**********************************

function x805026_OnAccept( sceneId, selfId )

	--加入任务到玩家列表
	AddMission( sceneId,selfId, x805026_g_MissionId, x805026_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：升级研究",MSG2PLAYER_PARA )

	end

--**********************************
--放弃
--**********************************

function x805026_OnAbandon( sceneId, selfId )

	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x805026_g_MissionId )
end



--**********************************

--继续

--**********************************

function x805026_OnContinue( sceneId, selfId, targetId )

	--提交任务时的说明信息

   BeginEvent(sceneId)

		AddText(sceneId,x805026_g_MissionName)

		AddText(sceneId,x805026_g_MissionComplete)

	 EndEvent( )

   DispatchMissionContinueInfo(sceneId,selfId,targetId,x805026_g_ScriptId,x805026_g_MissionId)

end



--**********************************

--检测是否可以提交

--**********************************

function x805026_CheckSubmit( sceneId, selfId )

	local	SelfMoney = GetMoney(sceneId, selfId)
	
	if(SelfMoney<50000) then
	
		return 0
		
	end

	return 1

end



--**********************************

--提交

--**********************************

function x805026_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x805026_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
			ret = DelMission( sceneId, selfId, x805026_g_MissionId )
			if ret > 0 then
	
				local	SelfMoney = GetMoney(sceneId, selfId)
				CostMoney(sceneId, selfId, 50000)			
				
				--增加研究进度
				
				CityIncProgress(sceneId, selfId, sceneId, 1)
				
				Msg2Player(  sceneId, selfId,"#Y完成任务：升级研究",MSG2PLAYER_PARA )

			end
			
	end
	
end



--**********************************

--杀死怪物或玩家

--**********************************

function x805026_OnKillObject( sceneId, selfId, objdataId )

end



--**********************************

--进入区域事件

--**********************************

function x805026_OnEnterZone( sceneId, selfId, zoneId )

end



--**********************************

--道具改变

--**********************************

function x805026_OnItemChanged( sceneId, selfId, itemdataId )

end


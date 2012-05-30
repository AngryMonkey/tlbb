-- 200038

-- 六军辟易 护送 萧峰 回

--MisDescBegin
--脚本号
x200038_g_ScriptId = 200038

--任务号
x200038_g_MissionId = 32

--前续任务号
x200038_g_PreMissionId = 31

--目标NPC
x200038_g_Name	="萧峰"

--任务归类
x200038_g_MissionKind = 52

--任务等级
x200038_g_MissionLevel = 50

--是否是精英任务
x200038_g_IfMissionElite = 0

--任务名
x200038_g_MissionName="六军辟易"
--任务描述
x200038_g_MissionInfo="#{Mis_juqing_0032}"
--任务目标
x200038_g_MissionTarget="#{Mis_juqing_Tar_0032}"		
--提交时npc的话
x200038_g_MissionComplete="  耶律洪基重见天日，全靠义弟萧峰和$N大侠之力。二位请受耶律洪基一拜！"		

x200038_g_MoneyBonus=54000
x200038_g_exp=62400

x200038_g_RadioItemBonus={{id=10422007 ,num=1},{id=10422008,num=1},{id=10422009,num=1},{id=10422010,num=1}}

x200038_g_Custom	= { {id="已护送萧峰和皇太叔回苍茫山北寨",num=1} }

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x200038_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	if IsHaveMission(sceneId,selfId,x200038_g_MissionId) > 0 then
			--需要任务完成才可以
			local misIndex = GetMissionIndexByID(sceneId, selfId, x200038_g_MissionId)--得到任务在20个任务中的序列号
			if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --如果护送完成
				BeginEvent(sceneId)
					AddText(sceneId,x200038_g_Name)
					AddText(sceneId,x200038_g_MissionComplete)
					AddText(sceneId,"#{M_MUBIAO}#r")
					AddText(sceneId,x200038_g_MissionTarget)
					AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
					for i, item in x200038_g_RadioItemBonus do
						AddRadioItemBonus( sceneId, item.id, item.num )
					end
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x200038_g_ScriptId, x200038_g_MissionId)
		end
		
	elseif x200038_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200038_g_MissionName)
			AddText(sceneId, x200038_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId, x200038_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x200038_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200038_g_ScriptId,x200038_g_MissionId)
	end	
end

--**********************************
--列举事件
--**********************************
function x200038_OnEnumerate( sceneId, selfId, targetId )

	-- 如果前续任务1没有完成，就返回
	if IsMissionHaveDone(sceneId, selfId, x200038_g_PreMissionId) <= 0   then
		return
	end
	-- 如果本任务已经完成，就返回
	if IsMissionHaveDone(sceneId, selfId, x200038_g_MissionId) > 0 then
   	return
	--满足任务接收条件
	elseif IsHaveMission(sceneId, selfId, x200038_g_MissionId) > 0 then

		if GetName(sceneId, targetId) == x200038_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200038_g_ScriptId, x200038_g_MissionName,2,-1);
			--EndEvent()	
			DispatchEventList(sceneId, selfId, targetId)
		end
		
	--满足任务接收条件
  elseif x200038_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200038_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200038_g_ScriptId, x200038_g_MissionName,1,-1);
			--EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
		end
  end
end

--**********************************
-- 
--**********************************
function x200038_OnLockedTarget( sceneId, selfId, targetId )

end

--**********************************
--检测接受条件
--**********************************
function x200038_CheckAccept( sceneId, selfId )
	-- 接任务的条件是，人物达到20级以上，并且完成了前续任务
	
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200038_g_MissionId) > 0 ) then
		return 0
	end

	if GetLevel(sceneId, selfId) < x200038_g_MissionLevel   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200038_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200038_OnAccept( sceneId, selfId, targetId )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x200038_g_MissionId) > 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200038_g_MissionId, x200038_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：六军辟易" , MSG2PLAYER_PARA )
	
	-- 在这里启动一个护送，
	if LuaFnGetCopySceneData_Param(sceneId, 8) < 10  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 10)
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	end

end

--**********************************
--放弃
--**********************************
function x200038_OnAbandon( sceneId, selfId )
  --将护送npc瞬移回原来位置
  DelMission(sceneId, selfId, x200038_g_MissionId)
  
end

--**********************************
--继续
--**********************************
function x200038_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200038_g_Name)
		AddText(sceneId,x200038_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200038_g_MissionTarget)
		AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
		for i, item in x200038_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200038_g_ScriptId, x200038_g_MissionId)

end

--**********************************
--检测是否可以提交
--**********************************
function x200038_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200038_g_MissionId)
	
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
function x200038_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- 检测是不是满足完成任务的条件
	if x200038_CheckSubmit(sceneId, selfId) < 1 then 
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200038_g_RadioItemBonus do
		if item.id == selectRadioId then

			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret < 1 then
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "背包已满,无法完成任务"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)
	
	--添加任务奖励
	AddMoney(sceneId,selfId, x200038_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId, x200038_g_exp)

	DelMission( sceneId,selfId, x200038_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x200038_g_MissionId )
	Msg2Player(  sceneId, selfId,"#Y完成任务：六军辟易",MSG2PLAYER_PARA )

	Msg2Player( sceneId, selfId,"你已经完成了#G苍茫山#W系列任务",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "你已经完成了#G苍茫山#W系列任务。请在达到60级之后，在大理城找到赵天师，开启#G擂鼓山#W系列任务。")

	-- 完成苍茫山剧情，给10点剧情点
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- 通知玩家，可以做剧情循环任务了
	-- 您现在可以去AA城的[bb，cc]找到DD，接受DD循环任务。
	local strText1 = "#{LOOTMISSION_MAIL_09}"
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#{LOOTMISSION_INFO_04}");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

function x200038_OnHumanDie(sceneId, selfId)

end

--**********************************
--定时事件
--**********************************
function x200038_OnTimer(sceneId,selfId)

end

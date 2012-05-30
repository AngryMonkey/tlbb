--草原 草原的劫匪
--212125

--MisDescBegin
--脚本号
x212125_g_ScriptId = 212125

--接受任务NPC属性
x212125_g_Position_X=164
x212125_g_Position_Z=159
x212125_g_SceneID=20
x212125_g_AccomplishNPC_Name="萧蔷"

--任务号
x212125_g_MissionId = 943

--目标NPC
x212125_g_Name	="萧蔷"

--任务归类
x212125_g_MissionKind = 31

--任务等级
x212125_g_MissionLevel = 59

--是否是精英任务
x212125_g_IfMissionElite = 0

--任务名
x212125_g_MissionName="草原的劫匪"
x212125_g_MissionInfo="#{Mis_30_60_desc_018}"
x212125_g_MissionTarget="    草原兰陵郡的萧蔷#{_INFOAIM163,158,20,萧蔷}让你杀死30个弯刀马匪#{_INFOAIM273,156,20,-1}。"
x212125_g_MissionContinue="  你已经杀了30个弯刀马匪了吗？"
x212125_g_MissionComplete="  没看出来你还真有两下子。"

x212125_g_MoneyBonus=10000
x212125_g_exp=15000

x212125_g_Custom	= { {id="已杀死弯刀马匪",num=30} }
x212125_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212125_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212125_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212125_g_MissionId) > 0)  then
		--x212125_OnContinue( sceneId, selfId, targetId )
		local bDone = x212125_CheckSubmit( sceneId, selfId )
		BeginEvent(sceneId)
			AddText(sceneId,x212125_g_MissionName)
			AddText(sceneId,x212125_g_MissionContinue)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212125_g_ScriptId,x212125_g_MissionId,bDone)		
	
	--满足任务接收条件
	elseif x212125_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212125_g_MissionName)
			AddText(sceneId,x212125_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212125_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212125_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212125_g_ScriptId,x212125_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212125_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212125_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212125_g_MissionId) > 0 then
		AddNumText(sceneId, x212125_g_ScriptId,x212125_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x212125_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212125_g_ScriptId,x212125_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x212125_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212125_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212125_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212125_OnAccept( sceneId, selfId, targetId )
	if x212125_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于30级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 30 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到30级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212125_g_MissionId, x212125_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		Msg2Player(sceneId, selfId,"#Y你的任务日志已经满了。" , MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, "#Y你的任务日志已经满了。")
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	Msg2Player(sceneId, selfId,"#Y接受任务：草原的劫匪。",MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, "#Y接受任务：草原的劫匪。")
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212125_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- 玩家关心杀怪
	SetMissionEvent( sceneId,selfId,x212125_g_MissionId, 0 )

end

--**********************************
--放弃
--**********************************
function x212125_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212125_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212125_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212125_g_MissionName)
	AddText(sceneId,x212125_g_MissionComplete)
	AddMoneyBonus( sceneId, x212125_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212125_g_ScriptId,x212125_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212125_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212125_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212125_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212125_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212125_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212125_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212125_g_exp)
		DelMission( sceneId, selfId, x212125_g_MissionId )
		MissionCom( sceneId, selfId, x212125_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：草原的劫匪",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212125_OnKillObject( sceneId, selfId, objdataId, objId )
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == "弯刀马匪"    then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			if IsHaveMission(sceneId, humanObjId, x212125_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212125_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local ct = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					if ct < 30    then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 1, ct+1)
						-- 通知客户端
			     	BeginEvent(sceneId)
							local strText = format("已杀死弯刀马匪:%d/30", ct+1 )
							AddText(sceneId, strText)
					  EndEvent(sceneId)
				  	DispatchMissionTips(sceneId,humanObjId)
						if ct+1 >= 30  then
							SetMissionByIndex( sceneId, humanObjId, misIndex, 0, 1 )
						end
					end
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x212125_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212125_OnItemChanged( sceneId, selfId, itemdataId )
end


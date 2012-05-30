--雁北 清除熊患
--212122

--MisDescBegin
--脚本号
x212122_g_ScriptId = 212122

--接受任务NPC属性
x212122_g_Position_X=234
x212122_g_Position_Z=192
x212122_g_SceneID=19
x212122_g_AccomplishNPC_Name="曲端"

--任务号
x212122_g_MissionId = 935

--目标NPC
x212122_g_Name	="曲端"

--任务归类
x212122_g_MissionKind = 30

--任务等级
x212122_g_MissionLevel = 46

--是否是精英任务
x212122_g_IfMissionElite = 0

--任务名
x212122_g_MissionName="清除熊患"
x212122_g_MissionInfo="#{Mis_30_60_desc_010}"
x212122_g_MissionTarget="    雁北的曲端#{_INFOAIM233,192,19,曲端}要你去杀死20只红枫熊#{_INFOAIM233,93,19,-1}。"
x212122_g_MissionContinue="  你已经杀死20只红枫熊了么？"
x212122_g_MissionComplete="  真是太好了，这样一来，就没有红枫熊再敢来偷吃军粮了。"

x212122_g_MoneyBonus=10000
x212122_g_exp=12000

x212122_g_Custom	= { {id="已杀死红枫熊",num=20} }
x212122_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212122_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212122_g_MissionId) > 0)  then
		--x212122_OnContinue( sceneId, selfId, targetId )
		local bDone = x212122_CheckSubmit( sceneId, selfId )
		BeginEvent(sceneId)
			AddText(sceneId,x212122_g_MissionName)
			AddText(sceneId,x212122_g_MissionContinue)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId,bDone)		
	
	--满足任务接收条件
	elseif x212122_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212122_g_MissionName)
			AddText(sceneId,x212122_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212122_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212122_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212122_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212122_g_MissionId) > 0 then
		AddNumText(sceneId, x212122_g_ScriptId,x212122_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x212122_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212122_g_ScriptId,x212122_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x212122_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212122_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212122_OnAccept( sceneId, selfId, targetId )
	if x212122_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于20级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 20 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到20级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212122_g_MissionId, x212122_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		Msg2Player(sceneId, selfId,"#Y你的任务日志已经满了。" , MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, "#Y你的任务日志已经满了。")
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	Msg2Player(sceneId, selfId,"#Y接受任务：清除熊患。",MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, "#Y接受任务：清除熊患。")
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212122_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- 玩家关心杀怪
	SetMissionEvent( sceneId,selfId,x212122_g_MissionId, 0 )

end

--**********************************
--放弃
--**********************************
function x212122_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212122_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212122_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212122_g_MissionName)
	AddText(sceneId,x212122_g_MissionComplete)
	AddMoneyBonus( sceneId, x212122_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212122_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212122_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212122_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212122_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212122_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212122_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212122_g_exp)
		DelMission( sceneId, selfId, x212122_g_MissionId )
		MissionCom( sceneId, selfId, x212122_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：清除熊患",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212122_OnKillObject( sceneId, selfId, objdataId, objId )
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == "红枫熊"    then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			if IsHaveMission(sceneId, humanObjId, x212122_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212122_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local ct = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					if ct < 20    then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 1, ct+1)
						-- 通知客户端
			     	BeginEvent(sceneId)
							local strText = format("已杀死红枫熊:%d/20", ct+1 )
							AddText(sceneId, strText)
					  EndEvent(sceneId)
				  	DispatchMissionTips(sceneId,humanObjId)
						if ct+1 >= 20  then
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
function x212122_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212122_OnItemChanged( sceneId, selfId, itemdataId )
end


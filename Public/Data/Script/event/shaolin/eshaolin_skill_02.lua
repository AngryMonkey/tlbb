-- 212141 
-- 困兽犹斗


--MisDescBegin
--脚本号
x212141_g_ScriptId = 212141

--接受任务NPC属性
x212141_g_Position_X=262
x212141_g_Position_Z=46
x212141_g_SceneID=18
x212141_g_AccomplishNPC_Name="种世衡"

--任务号
x212141_g_MissionId = 964

--前续任务
x212141_g_PreMissionId = 963

--任务归类
x212141_g_MissionKind = 20

--任务等级
x212141_g_MissionLevel = 30

--是否是精英任务
x212141_g_IfMissionElite = 0

--任务名
x212141_g_MissionName="困兽犹斗"
x212141_g_MissionInfo="#{Mis_shaolin_964}"
x212141_g_MissionTarget="#G雁门关#W的#R种世衡#W#{_INFOAIM263,46,18,种世衡}要你在雁门关包围圈中杀死二十名秦家寨败兵。"
x212141_g_MissionContinue="  你已经干掉所有的秦家寨败兵了吗？"
x212141_g_MissionComplete="  真不愧是老师指点过的人物，$N果然名不虚传！"

x212141_g_MoneyBonus=1000
x212141_g_exp=2000

x212141_g_Custom	= { {id="已杀死秦家寨败兵",num=20} }
x212141_g_IsMissionOkFail = 0

x212141_g_Menpai = 0

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x212141_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212141_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212141_g_MissionId) > 0)  then
		-- 检测任务是不是完成了
		BeginEvent(sceneId)
			AddText(sceneId,x212141_g_MissionName);
			AddText(sceneId,x212141_g_MissionContinue);
		EndEvent(sceneId)
  	local done = x212141_CheckSubmit( sceneId, selfId );
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212141_g_ScriptId,x212141_g_MissionId,done)

	--满足任务接收条件
	elseif x212141_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212141_g_MissionName)
			AddText(sceneId,x212141_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212141_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212141_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212141_g_ScriptId,x212141_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212141_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212141_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212141_g_MissionId) > 0 then
		AddNumText(sceneId, x212141_g_ScriptId,x212141_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x212141_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212141_g_ScriptId,x212141_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x212141_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212141_g_MissionId) > 0 ) then
		return 0
	end
	
	-- 前续任务是不是完成
	if (IsMissionHaveDone(sceneId,selfId,x212141_g_PreMissionId) < 1 ) then
		return 0
	end
	
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212141_g_MissionLevel then
		return 0
	end
	
	-- 门派检测
	if GetMenPai(sceneId, selfId) ~= x212141_g_Menpai  then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212141_OnAccept( sceneId, selfId, targetId )
	
	if x212141_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212141_g_MissionId, x212141_g_ScriptId, 1, 0, 0)
	if ret <= 0 then
		local strText = "#Y你的任务日志已经满了。"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = "#Y接受任务：困兽犹斗。"
	Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212141_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	--任务关心杀人
	
end

--**********************************
--放弃
--**********************************
function x212141_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212141_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212141_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
		AddText(sceneId,x212141_g_MissionName)
		AddText(sceneId,x212141_g_MissionComplete)
		AddMoneyBonus( sceneId, x212141_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212141_g_ScriptId,x212141_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212141_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212141_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212141_g_MissionId)
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) == 0   then
		return 0
	end
	
	return 1
end

--**********************************
--提交
--**********************************
function x212141_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212141_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212141_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212141_g_exp)
		DelMission( sceneId, selfId, x212141_g_MissionId )
		MissionCom( sceneId, selfId, x212141_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：困兽犹斗",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212141_OnKillObject( sceneId, selfId, objdataId, objId )	
	
	local missionId = x212141_g_MissionId
	
	-- 需要考虑所有队友
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == "秦家寨败兵"   then
		
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					
					local killCount = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					killCount = killCount + 1
		     	BeginEvent(sceneId)
						local strText = format("已杀死秦家寨败兵：" .. killCount .. "/20" )
						AddText(sceneId, strText)
				  EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
					
					if killCount >= 20 then
						SetMissionByIndex( sceneId, humanObjId, misIndex, 0, 1)
					end
					SetMissionByIndex( sceneId, humanObjId, misIndex, 1, killCount)
					
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x212141_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212141_OnItemChanged( sceneId, selfId, itemdataId )
end


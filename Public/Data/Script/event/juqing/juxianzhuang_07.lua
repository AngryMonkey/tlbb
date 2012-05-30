-- 副本中的乔峰送信给洛阳刷出来的乔峰

--MisDescBegin
--脚本号
x200026_g_ScriptId = 200026

--任务号
x200026_g_MissionId = 47

--前续任务
x200026_g_PreMissionId = 21

--接受任务NPC属性
x200026_g_Position_X=277
x200026_g_Position_Z=133
x200026_g_SceneID=0
x200026_g_AccomplishNPC_Name="乔峰"

--目标NPC
x200026_g_Name	="乔峰"

--任务归类
x200026_g_MissionKind = 47

--任务等级
x200026_g_MissionLevel = 40

--是否是精英任务
x200026_g_IfMissionElite = 0

--任务名
x200026_g_MissionName="后会有期"
x200026_g_MissionInfo="  $N，你的帮助，乔某不胜感激。#r  乔某明日一早便要带阿朱来聚贤庄，请薛神医给她治伤。聚贤庄里那些无知小人对我乔某造谣诬蔑，倒是不难，要出手伤我，未必有这么容易。#r  $N，明日一早，我们洛阳城东门再见！"
x200026_g_MissionTarget="  在#G洛阳城东门#W附近找到#R乔峰#W#{_INFOAIM275,134,0,乔峰}。"
x200026_g_MissionComplete="  $N，愚兄来迟，劳你在这里等候多时了。我们这就出发去聚贤庄吧。"

x200026_g_MoneyBonus=5400
x200026_g_exp=5400

x200026_g_Custom	= { {id="已找到乔峰",num=1} }
x200026_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200026_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200026_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200026_g_MissionId) > 0)  then
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType ~= 1 then --场景类型是副本
			x200026_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x200026_CheckAccept(sceneId,selfId) > 0 then
		-- 判断是在副本，
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型是副本
		--if GetName(sceneId,targetId) ~= x200026_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x200026_g_MissionName)
				AddText(sceneId,x200026_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200026_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200026_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200026_g_ScriptId,x200026_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200026_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200026_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200026_g_MissionId) > 0 then
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType ~= 1 then --场景类型是副本
			AddNumText(sceneId, x200026_g_ScriptId,x200026_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200026_CheckAccept(sceneId,selfId) > 0 then
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型是副本
			AddNumText(sceneId,x200026_g_ScriptId,x200026_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200026_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200026_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x200026_g_MissionLevel then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x200026_g_PreMissionId) < 1  then
		return 0
	end
	return 1	
end

--**********************************
--接受
--**********************************
function x200026_OnAccept( sceneId, selfId, targetId )
	if x200026_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200026_g_MissionId, x200026_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y接受任务：后会有期",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200026_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x200026_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200026_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200026_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200026_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x200026_g_MissionName)
	AddText(sceneId,x200026_g_MissionComplete)
	AddMoneyBonus( sceneId, x200026_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200026_g_ScriptId,x200026_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200026_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200026_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200026_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200026_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x200026_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200026_g_exp)
		
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x200026_g_MissionId )
		MissionCom( sceneId,selfId,  x200026_g_MissionId )

		Msg2Player(  sceneId, selfId,"#Y完成任务：后会有期",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200022), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200026_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200026_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200026_OnItemChanged( sceneId, selfId, itemdataId )
end

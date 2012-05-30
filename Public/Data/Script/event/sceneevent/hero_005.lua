-- 212132
-- 寂寞高手

-- 直接接任务，完成任务

--MisDescBegin
--脚本号
x212132_g_ScriptId = 212132

--接受任务NPC属性
x212132_g_Position_X=207
x212132_g_Position_Z=212
x212132_g_SceneID=0
x212132_g_AccomplishNPC_Name="司马光"

--任务号
x212132_g_MissionId = 254
--前续任务号
x212132_g_PreMissionId = 349

--目标NPC
x212132_g_Name	="司马光"

--任务归类
x212132_g_MissionKind = 55

--任务等级
x212132_g_MissionLevel = 75

--是否是精英任务
x212132_g_IfMissionElite = 0

--任务名
x212132_g_MissionName="寂寞高手"
x212132_g_MissionInfo="#{Mis_Hero_songxin_02}"
x212132_g_MissionTarget="    在洛阳城找到司马光#{_INFOAIM207,212,0,司马光}。"
x212132_g_MissionComplete="  你的交际和名位都已经独步江湖，距离英雄的称号也越来越近了。"

x212132_g_MoneyBonus=50000
x212132_g_exp=700000

x212132_g_Custom	= { {id="已找到司马光",num=1} }
x212132_g_IsMissionOkFail = 0

x212132_g_RadioItemBonus={{id=10510047 ,num=1},{id=10515027,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212132_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212132_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212132_g_MissionId) > 0)  then
		x212132_OnContinue( sceneId, selfId, targetId )
	
	--满足任务接收条件
	elseif x212132_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212132_g_MissionName)
			AddText(sceneId,x212132_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212132_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212132_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212132_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212132_g_ScriptId,x212132_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212132_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212132_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212132_g_MissionId) > 0 then
		AddNumText(sceneId, x212132_g_ScriptId,x212132_g_MissionName,2,-1);

	--满足任务接收条件
	elseif x212132_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212132_g_ScriptId,x212132_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x212132_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212132_g_MissionId) > 0 ) then
		return 0
	end

	-- 等级检测
	if GetLevel(sceneId, selfId) < x212132_g_MissionLevel then
		return 0
	end	
	
	--检测前续任务
	if IsMissionHaveDone(sceneId, selfId, x212132_g_PreMissionId ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x212132_OnAccept( sceneId, selfId, targetId )
	if x212132_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于30级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 70 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到70级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212132_g_MissionId, x212132_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y你的任务日志已经满了。")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y接受任务：寂寞高手。")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212132_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212132_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212132_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212132_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
		AddText(sceneId,x212132_g_MissionName)
		AddText(sceneId,x212132_g_MissionComplete)
		AddMoneyBonus( sceneId, x212132_g_MoneyBonus )
		for i, item in x212132_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212132_g_ScriptId,x212132_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212132_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212132_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212132_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212132_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--添加任务奖励
		BeginAddItem(sceneId)
		for i, item in x212132_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		
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
		
		AddMoney(sceneId,selfId, x212132_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212132_g_exp)
		DelMission( sceneId, selfId, x212132_g_MissionId )
		MissionCom( sceneId, selfId, x212132_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：寂寞高手",MSG2PLAYER_PARA )

		-- 给玩家添加称号
		LuaFnAwardTitle( sceneId, selfId,  10, 234)
		SetCurTitle(sceneId, selfId,  10, 234)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212132_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212132_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212132_OnItemChanged( sceneId, selfId, itemdataId )
end


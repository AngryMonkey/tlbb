--武夷 受人之托
--212123

--MisDescBegin
--脚本号
x212123_g_ScriptId = 212123

--接受任务NPC属性
x212123_g_Position_X=195
x212123_g_Position_Z=53
x212123_g_SceneID=32
x212123_g_AccomplishNPC_Name="曲阳"

--任务号
x212123_g_MissionId = 938

--目标NPC
x212123_g_Name	="曲阳"

--任务归类
x212123_g_MissionKind = 43

--任务等级
x212123_g_MissionLevel = 52

--是否是精英任务
x212123_g_IfMissionElite = 0

--任务名
x212123_g_MissionName="受人之托"
x212123_g_MissionInfo="#{Mis_30_60_desc_013}"
x212123_g_MissionTarget="    把曲端的信函送给武夷山巡逻者营地的曲阳#{_INFOAIM194,52,32,曲阳}。"
x212123_g_MissionContinue="  我忽然想起了雁北的大哥……"
x212123_g_MissionComplete="  原来是大哥送来的信件，分别这么久，难得大哥还挂念着我！"

x212123_g_MoneyBonus=12000
x212123_g_exp=15000

x212123_g_Custom	= { {id="已得到曲端的信函",num=1} }
x212123_g_IsMissionOkFail = 0

x212123_g_MisItemId = 40004420 --曲端的信函

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212123_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212123_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212123_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212123_g_Name then
			--x212123_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212123_g_MissionName)
				AddText(sceneId,x212123_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212123_g_ScriptId,x212123_g_MissionId,1)		
			
		end
	
	--满足任务接收条件
	elseif x212123_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212123_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212123_g_MissionName)
				AddText(sceneId,x212123_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212123_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212123_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212123_g_ScriptId,x212123_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212123_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212123_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212123_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212123_g_Name then
			AddNumText(sceneId, x212123_g_ScriptId,x212123_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212123_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212123_g_Name then
			AddNumText(sceneId,x212123_g_ScriptId,x212123_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212123_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212123_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212123_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212123_OnAccept( sceneId, selfId, targetId )
	if x212123_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于25级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 25 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到25级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 需要网玩家身上丢一个物品
	BeginAddItem( sceneId )
		AddItem( sceneId, x212123_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )
	
	if ret > 0  then
		--加入任务到玩家列表
		ret = AddMission(sceneId,selfId, x212123_g_MissionId, x212123_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			Msg2Player(sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, "#Y你的任务日志已经满了")
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		Msg2Player(sceneId, selfId,"#Y接受任务：受人之托",MSG2PLAYER_PARA)
	 	BeginEvent(sceneId)
			AddText(sceneId, "#Y接受任务：受人之托")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212123_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	else
		--提示不能接任务了
		local strText = "Y你的任务背包已经满了。。"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
	end
	
end

--**********************************
--放弃
--**********************************
function x212123_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212123_g_MissionId )
	DelItem( sceneId, selfId, x212123_g_MisItemId, 1 )	
end

--**********************************
--继续
--**********************************
function x212123_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212123_g_MissionName)
	AddText(sceneId,x212123_g_MissionComplete)
	AddMoneyBonus( sceneId, x212123_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212123_g_ScriptId,x212123_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212123_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212123_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212123_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212123_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		DelItem( sceneId, selfId, x212123_g_MisItemId, 1 )	
		AddMoney(sceneId,selfId, x212123_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212123_g_exp)
		DelMission( sceneId, selfId, x212123_g_MissionId )
		MissionCom( sceneId, selfId, x212123_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：受人之托",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212123_OnKillObject( sceneId, selfId, objdataId )
	
end

--**********************************
--进入区域事件
--**********************************
function x212123_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x212123_OnItemChanged( sceneId, selfId, itemdataId )
	
end


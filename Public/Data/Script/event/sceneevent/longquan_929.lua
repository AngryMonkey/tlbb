--212119
--龙泉 曾经痴狂少年时

--把翁季之的忏悔信送给金山寺的法念。

--MisDescBegin
--脚本号
x212119_g_ScriptId = 212119

--接受任务NPC属性
x212119_g_Position_X=208
x212119_g_Position_Z=62
x212119_g_SceneID=31
x212119_g_AccomplishNPC_Name="法念"

--任务号
x212119_g_MissionId = 929

--目标NPC
x212119_g_Name	="法念"

--任务归类
x212119_g_MissionKind = 42

--任务等级
x212119_g_MissionLevel = 36

--是否是精英任务
x212119_g_IfMissionElite = 0

--任务名
x212119_g_MissionName="曾经痴狂少年时"
x212119_g_MissionInfo="#{Mis_30_60_desc_004}"
x212119_g_MissionTarget="    把翁季之的忏悔信送给龙泉金山寺的法念#{_INFOAIM207,63,31,法念}。"
x212119_g_MissionContinue="  生命如果能够重来一次，我会怎么选择呢？既然真实和虚幻无从分辨，为何不听从心灵的召唤做出抉择呢。"
x212119_g_MissionComplete="  人生几经沉浮之后，那些尘世间的山盟海誓、功名利禄都不过是过眼烟云，何必再提！就让它们都随风而去吧！"

x212119_g_MoneyBonus=5000
x212119_g_exp=9000

x212119_g_Custom	= { {id="已得到翁季之的忏悔信",num=1} }
x212119_g_IsMissionOkFail = 0

x212119_g_MisItemId = 40004418 --翁季之的忏悔信

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212119_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212119_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212119_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212119_g_Name then
			--x212119_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212119_g_MissionName)
				AddText(sceneId,x212119_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212119_g_ScriptId,x212119_g_MissionId,1)		
			
		end
	
	--满足任务接收条件
	elseif x212119_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212119_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212119_g_MissionName)
				AddText(sceneId,x212119_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212119_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212119_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212119_g_ScriptId,x212119_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212119_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212119_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212119_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212119_g_Name then
			AddNumText(sceneId, x212119_g_ScriptId,x212119_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212119_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212119_g_Name then
			AddNumText(sceneId,x212119_g_ScriptId,x212119_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212119_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212119_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212119_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212119_OnAccept( sceneId, selfId, targetId )
	if x212119_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于15级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 15 ) == 0  then	-- zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到15级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 需要网玩家身上丢一个物品
	BeginAddItem( sceneId )
		AddItem( sceneId, x212119_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )
	
	if ret > 0  then
		--加入任务到玩家列表
		ret = AddMission(sceneId,selfId, x212119_g_MissionId, x212119_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			local strText = format("#Y你的任务日志已经满了。")
			Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		local strText = format("#Y接受任务：曾经痴狂少年时。")
		Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
	 	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212119_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	
	else
		--提示不能接任务了
		local strText = "Y你的任务背包已经满了。"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	
	end
	
end

--**********************************
--放弃
--**********************************
function x212119_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212119_g_MissionId )
	DelItem( sceneId, selfId, x212119_g_MisItemId, 1 )	
end

--**********************************
--继续
--**********************************
function x212119_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212119_g_MissionName)
	AddText(sceneId,x212119_g_MissionComplete)
	AddMoneyBonus( sceneId, x212119_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212119_g_ScriptId,x212119_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212119_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212119_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212119_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212119_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		DelItem( sceneId, selfId, x212119_g_MisItemId, 1 )	
		AddMoney(sceneId,selfId, x212119_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212119_g_exp)
		DelMission( sceneId, selfId, x212119_g_MissionId )
		MissionCom( sceneId, selfId, x212119_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：曾经痴狂少年时",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212119_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212119_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212119_OnItemChanged( sceneId, selfId, itemdataId )
end


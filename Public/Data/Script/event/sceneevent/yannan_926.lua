--雁南 私通辽国
--212120

--MisDescBegin
--脚本号
x212120_g_ScriptId = 212120

--接受任务NPC属性
x212120_g_Position_X=129
x212120_g_Position_Z=50
x212120_g_SceneID=18
x212120_g_AccomplishNPC_Name="耶律莫哥"

--任务号
x212120_g_MissionId = 926

--目标NPC
x212120_g_Name	="耶律莫哥"

--任务归类
x212120_g_MissionKind = 29

--任务等级
x212120_g_MissionLevel = 31

--是否是精英任务
x212120_g_IfMissionElite = 0

--任务名
x212120_g_MissionName="私通辽国"
x212120_g_MissionInfo="#{Mis_30_60_desc_001}"
x212120_g_MissionTarget="    把马承倩密函送给雁南的耶律莫哥#{_INFOAIM128,50,18,耶律莫哥}。"
x212120_g_MissionContinue="  我听说大宋的官员都很贪财，不知道是不是真的。"
x212120_g_MissionComplete="  这是马承倩给我的信？快拿来给我看看。嗯……嗯，原来是这样，太好了，大宋有如此官员，哪怕有再多的宋朝将士在战场上浴血奋战都不可怕了。哈哈，真乃天助我们大辽国！#r  <耶律莫哥脸上露出了得意的笑容。>"

x212120_g_MoneyBonus=6000
x212120_g_exp=7000

x212120_g_Custom	= { {id="已得到马承倩密函",num=1} }
x212120_g_IsMissionOkFail = 0

x212120_g_MisItemId = 40004416 --马承倩密函

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212120_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212120_g_Name then
			--x212120_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId,1)		
		end
	
	--满足任务接收条件
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212120_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212120_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212120_g_Name then
			AddNumText(sceneId, x212120_g_ScriptId,x212120_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			AddNumText(sceneId,x212120_g_ScriptId,x212120_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212120_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212120_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212120_OnAccept( sceneId, selfId, targetId )
	if x212120_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于10级）
	if x212120_CheckAllXinfaLevel(sceneId, selfId, 10) == 0  then --zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到10级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 需要给玩家身上丢一个物品
	BeginAddItem( sceneId )
		AddItem( sceneId, x212120_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0  then
		--提示不能接任务了
		local strText = "Y你的任务背包已经满了。。"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
		
	else
		--加入任务到玩家列表
		ret = AddMission(sceneId,selfId, x212120_g_MissionId, x212120_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			local strText = "#Y你的任务日志已经满了。"
			Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		local strText = "#Y接受任务：私通辽国。"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212120_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	end

end

--**********************************
--放弃
--**********************************
function x212120_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212120_g_MissionId )
	DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
end

--**********************************
--继续
--**********************************
function x212120_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
		AddText(sceneId,x212120_g_MissionName)
		AddText(sceneId,x212120_g_MissionComplete)
		AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212120_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212120_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212120_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212120_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 删除任务道具
		DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
		--添加任务奖励
		AddMoney(sceneId,selfId, x212120_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212120_g_exp)
		DelMission( sceneId, selfId, x212120_g_MissionId )
		MissionCom( sceneId, selfId, x212120_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：私通辽国",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212120_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212120_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212120_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--检测心法是不够接任务
--**********************************
function x212120_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end

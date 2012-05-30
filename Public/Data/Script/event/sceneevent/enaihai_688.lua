-- 送信任务
-- 石敢当 -> 叶流凡

--MisDescBegin
--脚本号
x212114_g_ScriptId = 212114

--任务号
x212114_g_MissionId = 688

--前续任务
x212114_g_PreMissionId = 687

--目标NPC
x212114_g_Name	="叶流凡"

--任务归类
x212114_g_MissionKind = 45

--任务等级
x212114_g_MissionLevel = 82

--是否是精英任务
x212114_g_IfMissionElite = 0

--任务名
x212114_g_MissionName="第二块血迹"
x212114_g_MissionInfo="#{Mis_S_Nanhai_1010193}"
x212114_g_MissionTarget="  把#Y血衣#W送给#G南海剑派#W的#R叶流凡#W#{_INFOAIM115,58,34,叶流凡}。"
x212114_g_MissionContinue="  你找我有什么事情吗？"
x212114_g_MissionComplete="  这……这件血衣……好像是一件南诏白苗人的衣服。"

x212114_g_MoneyBonus=36900
x212114_g_exp=35000

x212114_g_Custom	= { {id="已得到血衣",num=1} }
x212114_g_IsMissionOkFail = 0

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x212114_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212114_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212114_g_Name then
			x212114_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x212114_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212114_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212114_g_MissionName)
				AddText(sceneId,x212114_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212114_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212114_g_MoneyBonus )
				AddRadioItemBonus( sceneId, 10420074, 1 )
				AddRadioItemBonus( sceneId, 10410076, 1 )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212114_g_ScriptId,x212114_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212114_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212114_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212114_g_Name then
			AddNumText(sceneId, x212114_g_ScriptId,x212114_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212114_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212114_g_Name then
			AddNumText(sceneId,x212114_g_ScriptId,x212114_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212114_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x212114_g_MissionLevel then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x212114_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--接受
--**********************************
function x212114_OnAccept( sceneId, selfId, targetId )
	if x212114_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 添加任务物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40002075, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--提示不能接任务了
		Msg2Player(  sceneId, selfId,"#Y你的任务背包已经满了。", MSG2PLAYER_PARA )
	else
		--加入任务到玩家列表
		local ret = AddMission( sceneId,selfId, x212114_g_MissionId, x212114_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end

		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y接受任务：第二块血迹",MSG2PLAYER_PARA )
		BeginEvent(sceneId)
			strText = "#Y接受任务：第二块血迹"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212114_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	end
	
end

--**********************************
--放弃
--**********************************
function x212114_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212114_g_MissionId )
	DelItem( sceneId, selfId, 40002075, 1 )	
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x212114_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x212114_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212114_g_MissionName)
	AddText(sceneId,x212114_g_MissionComplete)
	AddMoneyBonus( sceneId, x212114_g_MoneyBonus )
	AddRadioItemBonus( sceneId, 10420074, 1 )
	AddRadioItemBonus( sceneId, 10410076, 1 )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212114_g_ScriptId,x212114_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212114_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212114_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212114_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x212114_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 添加奖励物品
		BeginAddItem(sceneId)
			AddItem( sceneId, selectRadioId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0  then
			-- 删除任务物品
			DelItem( sceneId, selfId, 40002075, 1 )	

			--添加任务奖励
			AddItemListToHuman(sceneId,selfId)			
			AddMoney(sceneId,selfId, x212114_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, x212114_g_exp)
			
			--设置任务已经被完成过
			DelMission( sceneId,selfId,  x212114_g_MissionId )
			MissionCom( sceneId,selfId,  x212114_g_MissionId )
	
			Msg2Player(  sceneId, selfId,"#Y完成任务：第二块血迹",MSG2PLAYER_PARA )
			
			-- 调用后续任务
			CallScriptFunction((200081), "OnDefaultEvent",sceneId, selfId, targetId )
			
			-- 提交任务后，刷2组，3个怪出来,消失时间30秒
			local nNpcId
			nNpcId = LuaFnCreateMonster(sceneId, 823, 118, 55, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			
			nNpcId = LuaFnCreateMonster(sceneId, 821, 115, 54, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			nNpcId = LuaFnCreateMonster(sceneId, 821, 114, 52, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			
		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				AddText(sceneId, "背包已满,无法完成任务");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		end
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212114_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212114_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212114_OnItemChanged( sceneId, selfId, itemdataId )
end

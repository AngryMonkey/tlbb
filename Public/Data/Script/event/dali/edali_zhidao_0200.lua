--找人任务
--赵天师寻找蒲良
--MisDescBegin
--脚本号
x210200_g_ScriptId = 210200

--接受任务NPC属性
x210200_g_Position_X=216.6208
x210200_g_Position_Z=133.6347
x210200_g_SceneID=2
x210200_g_AccomplishNPC_Name="蒲良"

--任务号
x210200_g_MissionId = 440

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x210200_g_Name	="蒲良"

--任务归类
x210200_g_MissionKind = 13

--任务等级
x210200_g_MissionLevel = 1

--是否是精英任务
x210200_g_IfMissionElite = 0

--任务名
x210200_g_MissionName="第一把武器"
x210200_g_MissionInfo_1="  这不是#R"
x210200_g_MissionInfo_2="#{event_dali_0001}" --应我们镇南王的邀请前来参加武林大会。
x210200_g_MissionTarget="#{xinshou_001}"
x210200_g_MissionComplete="#{event_dali_0002}"
x210200_g_MoneyBonus=1
x210200_g_SignPost = {x = 216, z = 135, tip = "蒲良"}

x210200_g_ItemBonus={id=30101001, num=10}
x210200_g_RadioItemBonus={{id=10101000 ,num=1},{id=10102000,num=1},{id=10104000,num=1},{id=10103000,num=1}}

x210200_g_Custom	= { {id="已找到蒲良",num=1} }
x210200_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210200_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210200_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210200_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210200_g_Name then
			x210200_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210200_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210200_g_Name then
			--发送任务接受时显示的信息
				local  PlayerName=GetName(sceneId,selfId)	
	            local  PlayerSex=GetSex(sceneId,selfId)
	            if PlayerSex == 0 then
		            PlayerSex = "姑娘"
	            else
		            PlayerSex = "少侠"
	            end
			BeginEvent(sceneId)
				AddText(sceneId,x210200_g_MissionName)
				AddText(sceneId,x210200_g_MissionInfo_1..PlayerName..PlayerSex..x210200_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210200_g_MissionTarget)
				AddItemDemand( sceneId, 30101001, 10 )
				
				for i, item in x210200_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				
				AddMoneyBonus( sceneId, x210200_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210200_g_ScriptId,x210200_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210200_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210200_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x210200_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210200_g_Name then
			AddNumText(sceneId, x210200_g_ScriptId,x210200_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x210200_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210200_g_Name then
			AddNumText(sceneId,x210200_g_ScriptId,x210200_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210200_CheckAccept( sceneId, selfId )
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210200_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210200_g_MissionId, x210200_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：第一把武器",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210200_g_SignPost.x, x210200_g_SignPost.z, x210200_g_SignPost.tip )

	-- 设置任务完成标志
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210200_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--放弃
--**********************************
function x210200_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210200_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210200_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210200_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210200_g_MissionName)
		AddText(sceneId,x210200_g_MissionComplete)
		AddMoneyBonus( sceneId, x210200_g_MoneyBonus )
		AddItemDemand( sceneId, 30101001, 10 )
		
		for i, item in x210200_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210200_g_ScriptId,x210200_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210200_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210200_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210200_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210200_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210200_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
			AddItem( sceneId,30101001, 10 )
			
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		if ret > 0 then
			AddMoney(sceneId,selfId,x210200_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 10)
			
			ret = DelMission( sceneId, selfId, x210200_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210200_g_MissionId )
				--扣除任务物品
				--for i, item in g_DemandItem do
				--	DelItem( sceneId, selfId, item.id, item.num )
				--end
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y完成任务：第一把武器",MSG2PLAYER_PARA )
				CallScriptFunction( 210201, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "背包已满,无法完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210200_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210200_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210200_OnItemChanged( sceneId, selfId, itemdataId )
end

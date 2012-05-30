
--门派引导任务

--MisDescBegin
--脚本号
x210238_g_ScriptId = 210238

--接受任务NPC属性
x210238_g_Position_X=160.0895
x210238_g_Position_Z=156.9309
x210238_g_SceneID=2
x210238_g_AccomplishNPC_Name="赵天师"

--任务号
x210238_g_MissionId = 718

--目标NPC
x210238_g_Name	="赵天师"

--任务归类
x210238_g_MissionKind = 13

--任务等级
x210238_g_MissionLevel = 1

--是否是精英任务
x210238_g_IfMissionElite = 0
x210238_g_IsMissionOkFail = 0		--变量的第0位
--任务名
x210238_g_MissionName="十年"
--任务描述
x210238_g_MissionInfo  = "    我们四大善人老哥儿几个一看到你，就觉得你是百年一遇的武学奇才，若得到名师传授，前途不可限量啊。"
x210238_g_MissionInfo1 = "    不过你现在最主要的事情，还是先把武学根基打好。根基扎好了之后，就可以找一位名师，学习高深武功，以后成为一代大英雄，大侠士！"
x210238_g_MissionInfo2 = "    这样吧，等你达到10级，就来找我赵天师，我们几个老家伙会给你准备一份很特殊的礼物。"
--任务目标
x210238_g_MissionTarget="#{MIS_dali_ZTS_002}"		
--未完成任务的npc对话
x210238_g_ContinueInfo="  你已经达到10级吗？"
--提交时npc的话
x210238_g_MissionComplete="  太好了，你可以加入门派了。"		


x210238_g_exp=0
x210238_g_ItemBonus={}

x210238_g_Custom	= { {id="已达等级",num=10} }--变量的第1位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210238_OnDefaultEvent( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if (IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0)  then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, x210238_g_MissionName)
			AddText(sceneId, x210238_g_ContinueInfo)
		EndEvent( )
		local bDone = x210238_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId,bDone)
				
	--满足任务接收条件
  elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210238_g_MissionName)
			AddText(sceneId,x210238_g_MissionInfo)
			AddText(sceneId,x210238_g_MissionInfo1)			
			AddText(sceneId,x210238_g_MissionInfo2)
			
			--AddText(sceneId,"#{M_MUBIAO}")
			--AddText(sceneId,x210238_g_MissionTarget)
			--AddText(sceneId,"#{M_SHOUHUO}")
			--AddMoneyBonus( sceneId, x210238_g_MoneyBonus )
			--for i, item in x210238_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210238_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0 then
	    
	    local bDone = x210238_CheckSubmit( sceneId, selfId ) 
	    if( 1 == bDone ) then
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 2, -1);
	    else
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	    end	
	    			
	--满足任务接收条件
	elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210238_CheckAccept( sceneId, selfId )

	--要求完成的前续任务
	--if IsMissionHaveDone(sceneId,selfId,645) <= 0 then
	--	return 0

	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= x210238_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210238_OnAccept( sceneId, selfId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	end
		
	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x210238_g_MissionId, x210238_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	--设置任务变量宝物的场景编号和坐标位置
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)--得到任务在20个任务中的序列号
	--SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况

	--Msg2Player(  sceneId, selfId,"#Y接受任务" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	Msg2Player(  sceneId, selfId,"接受任务:#Y" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)--得到任务在20个任务中的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

--**********************************
--放弃
--**********************************
function x210238_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x210238_g_MissionId )
end

--**********************************
--继续
--**********************************
function x210238_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x210238_g_MissionName)
		AddText(sceneId,x210238_g_MissionComplete)

		for i, item in x210238_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210238_CheckSubmit( sceneId, selfId )

    local Level = GetLevel( sceneId, selfId )
    
    if( Level < 10 ) then
        return 0
    end

	return 1

end

--**********************************
--提交
--**********************************
function x210238_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- 安全性检测
		-- 1、检测玩家是不是有这个任务
		if IsHaveMission(sceneId,selfId,x210238_g_MissionId) <= 0 then
			return
		end
		
		-- 2、完成任务的情况检测
		if x210238_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		-- 金钱和经验
		

		
		if( x210238_g_exp > 0 ) then
		    LuaFnAddExp( sceneId, selfId, x210238_g_exp)
		end
								
		DelMission( sceneId,selfId, x210238_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId, x210238_g_MissionId )
		
		
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210238_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--进入区域事件
--**********************************
function x210238_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210238_OnItemChanged( sceneId, selfId, itemdataId )
end








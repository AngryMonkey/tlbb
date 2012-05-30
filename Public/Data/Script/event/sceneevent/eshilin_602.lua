--石林 
--MisDescBegin
--脚本号
x212103_g_ScriptId = 212103

--任务号
x212103_g_MissionId = 602

--任务目标npc
x212103_g_Name	="圆月村村长郑玄" 

--任务归类
x212103_g_MissionKind = 37

--任务等级
x212103_g_MissionLevel = 55

--是否是精英任务
x212103_g_IfMissionElite = 0

--******下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--任务是否已经完成
x212103_g_IsMissionOkFail = 0		--变量的第0位

--******以上是动态*****

--任务文本描述
x212103_g_MissionName="绝望之地"
x212103_g_MissionInfo="#{Lua_Shilin_001}"
x212103_g_MissionTarget="听郑玄#{_INFOAIM182,163,26,郑玄}讲他的故事。"
x212103_g_ContinueInfo="....."
x212103_g_MissionComplete="我的故事讲完了，你好好考虑一下吧。"

x212103_g_MoneyBonus=21000
x212103_g_Exp = 6000

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212103_OnDefaultEvent( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_ContinueInfo)
		EndEvent()
		bDone = x212103_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId,bDone)
		--满足任务接收条件
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212103_g_MissionTarget)
			AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
		
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212103_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 2, -1);
		--满足任务接收条件
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 1, -1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x212103_CheckAccept( sceneId, selfId )
	-- 如果玩家做过这个任务，不能再做
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 0
	end
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= x212103_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212103_OnAccept( sceneId, selfId )
	-- 如果玩家做过这个任务，不能再做
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212103_g_MissionId, x212103_g_ScriptId, 1, 0, 0 )

	-- 需要考虑玩家是不是能够接受到这个任务
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	-- 玩家已经接到了这个任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)		--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--根据序列号把任务变量的第0位置0 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#Y接受任务 ".. x212103_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y接受任务 " .. x212103_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212103_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212103_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212103_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212103_g_MissionName)
		AddText(sceneId,x212103_g_MissionComplete)
		AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
				
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212103_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x212103_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212103_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	--添加任务奖励
	AddMoney(sceneId, selfId, x212103_g_MoneyBonus )
	AddExp(sceneId, selfId, x212103_g_Exp)
	DelMission( sceneId, selfId, x212103_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x212103_g_MissionId )
	
	-- 消息通知客户端
	
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212103_OnKillObject( sceneId, selfId, objdataId ,objId)

end

--**********************************
--进入区域事件
--**********************************
function x212103_OnEnterArea( sceneId, selfId, zoneId )

end

--**********************************
--道具改变
--**********************************
function x212103_OnItemChanged( sceneId, selfId, itemdataId )

end

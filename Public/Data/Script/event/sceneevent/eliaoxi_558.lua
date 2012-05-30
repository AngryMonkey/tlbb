--辽西 勇士的家书
--MisDescBegin
--脚本号
x212112_g_ScriptId = 212112

--任务号
x212112_g_MissionId = 558

--任务归类
x212112_g_MissionKind = 32

--任务等级
x212112_g_MissionLevel = 80

--是否是精英任务
x212112_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x212112_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务需要得到的物品
x212112_g_DemandItem={{id=40002071,num=1}}		--变量第1位

--任务文本描述
x212112_g_MissionName="勇士的家书"
x212112_g_MissionInfo="#{Mis_S_Liaoxi_1010091}"
x212112_g_MissionTarget="  把#Y勇士的家书#W交给#G南海#W的#R李老太太#W#{_INFOAIM214,243,34,李老太太}。"
x212112_g_ContinueInfo="  你找我有什么事情吗？"
x212112_g_MissionComplete="  我的儿子虽然死了，但他没有给他的父辈丢人！"

--货物ID
x212112_g_ItemID = 40002071

--收货人
x212112_g_Name = "李老太太"

x212112_g_MoneyBonus=54500
x212112_g_Exp = 35000

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212112_OnDefaultEvent( sceneId, selfId, targetId )

	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212112_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212112_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212112_g_Name then
			--发送交任务前的需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212112_g_MissionName);
				AddText(sceneId,x212112_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212112_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId,done)
		end
	--满足任务接收条件
	elseif GetLevel( sceneId, selfId ) >= x212112_g_MissionLevel then
	
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212112_g_MissionName);
			AddText(sceneId,x212112_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212112_g_MissionTarget);
			AddMoneyBonus( sceneId, x212112_g_MoneyBonus )
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212112_OnEnumerate( sceneId, selfId, targetId )
	-- add by zchw
	if IsMissionHaveDone( sceneId, selfId, x212112_g_MissionId ) > 0 and targetId == -1 then
		AddText(sceneId, "  你已经完成了这个任务。");
		return 
	elseif IsHaveMission(sceneId,selfId,x212112_g_MissionId) > 0  then
		if targetId == -1 then
		AddText(sceneId, "  你已经接取了这个任务。");
	  elseif GetName(sceneId,targetId) == x212112_g_Name then
			AddNumText(sceneId, x212112_g_ScriptId,x212112_g_MissionName, 2, -1)
		end
	--满足任务接收条件
	elseif x212112_CheckAccept(sceneId,selfId) > 0 then
	  if targetId == -1 then
			AddNumText(sceneId, x212112_g_ScriptId, x212112_g_MissionName, 1, -1);
		elseif GetName(sceneId,targetId) ~= x212112_g_Name then
			AddNumText(sceneId, x212112_g_ScriptId, x212112_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212112_CheckAccept( sceneId, selfId )
	--需要60级才能接
	if GetLevel( sceneId, selfId ) >= 80 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212112_OnMissionAccept( sceneId, selfId )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x212112_g_MissionId) > 0   then
		return
	end
	
	if x212112_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- 生成一个任务道具
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002071, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#Y任务背包已经满了", MSG2PLAYER_PARA )
		return 
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212112_g_MissionId, x212112_g_ScriptId, 0, 0, 0 )
	-- 需要考虑玩家是不是能够接受到这个任务
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	-- 加任务物品
	AddItemListToHuman(sceneId,selfId)
	-- 删除普通道具
	DelItem( sceneId, selfId, 30505060, 1 )
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212112_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--根据序列号把任务变量的第0位置1 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#Y接受任务 ".. x212112_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#Y接受任务 ".. x212112_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212112_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212112_g_MissionId )
	
	-- 删除任务道具
	DelItem( sceneId, selfId, 40002071, 1 )
	
end

--**********************************
--已经接了任务再给出的提示
--**********************************
function x212112_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212112_g_MissionName)
		AddText(sceneId,x212112_g_MissionComplete)
		AddMoneyBonus( sceneId, x212112_g_MoneyBonus )
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212112_g_ScriptId,x212112_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212112_CheckSubmit( sceneId, selfId )

	itemNum = GetItemCount( sceneId, selfId, x212112_g_ItemID );
	if itemNum > 0 then
		return 1;
	end
	return 0
end

--**********************************
--提交（完成）
--**********************************
function x212112_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212112_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212112_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	for i, item in x212112_g_DemandItem do
		DelItem( sceneId, selfId, item.id, item.num )
	end
	
	AddExp(sceneId,selfId,x212112_g_Exp)
	AddMoney(sceneId,selfId,x212112_g_MoneyBonus );

	ret = DelMission( sceneId, selfId, x212112_g_MissionId )
	if ret > 0 then
		MissionCom( sceneId, selfId, x212112_g_MissionId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212112_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212112_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212112_OnItemChanged( sceneId, selfId, itemdataId )
end


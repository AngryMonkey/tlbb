--辽西 重建牧场
--MisDescBegin
--脚本号
x212108_g_ScriptId = 212108

--任务号
x212108_g_MissionId = 554

--任务归类
x212108_g_MissionKind = 32

--任务等级
x212108_g_MissionLevel = 78

--是否是精英任务
x212108_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x212108_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务需要得到的物品
--x212108_g_DemandItem={{id=40002112,num=1}}		--变量第1位

--任务文本描述
x212108_g_MissionName="重建牧场"
x212108_g_MissionInfo="#{Lua_liaoxi_002}"
x212108_g_MissionTarget="  找到10块寒铁矿石和10块金矿石，以及10个金币，把他们交给#G辽西广宁镇#W的#R耶律金#W#{_INFOAIM170,206,21,耶律金}。"
x212108_g_ContinueInfo="  你找到足够的材料了吗？"
x212108_g_MissionComplete="  谢谢你的帮助，等牧场重建，我一定用最新鲜的羊奶和最可口的烤肉好好的招待你。"

x212108_g_DemandItem={{id=20103004,num=10},{id=20103005,num=10}}		--从背包中计算

--奖励
x212108_g_MoneyBonus=46000
x212108_g_Exp = 65000
--x212108_g_ItemBonus={{id=10401031,num=1}}

x212108_g_RadioItemBonus={{id=10405067 ,num=1},{id=10401067,num=1},{id=10400068,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212108_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212108_g_Name then
			--发送交任务前的需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212108_g_MissionName);
				AddText(sceneId,x212108_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212108_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId,done)
--		end
	--满足任务接收条件
	elseif GetLevel( sceneId, selfId ) >= 78 then
	
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212108_g_MissionName);
			AddText(sceneId,x212108_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212108_g_MissionTarget);
			AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
			for i, item in x212108_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212108_OnEnumerate( sceneId, selfId, targetId )

	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
		AddNumText(sceneId, x212108_g_ScriptId,x212108_g_MissionName, 2, -1)

	--满足任务接收条件
	elseif x212108_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212108_g_MissionName then
			AddNumText(sceneId, x212108_g_ScriptId, x212108_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212108_CheckAccept( sceneId, selfId )
	--需要60级才能接
	if GetLevel( sceneId, selfId ) >= 78 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212108_OnAccept( sceneId, selfId )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x212108_g_MissionId) > 0   then
		return
	end
	
	if x212108_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212108_g_MissionId, x212108_g_ScriptId, 0, 0, 0 )
	-- 需要考虑玩家是不是能够接受到这个任务
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--根据序列号把任务变量的第0位置1 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#Y接受任务 ".. x212108_g_MissionName, MSG2PLAYER_PARA )
	
	SetMissionEvent(sceneId, selfId, x212108_g_MissionId, 2)
	
	BeginEvent(sceneId)
		strText = "#Y接受任务 ".. x212108_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212108_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212108_g_MissionId )
	
end

--**********************************
--已经接了任务再给出的提示
--**********************************
function x212108_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212108_g_MissionName)
		AddText(sceneId,x212108_g_MissionComplete)
		AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
		for i, item in x212108_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212108_CheckSubmit( sceneId, selfId )
	--检测看玩家身上是不是够了这些物品
	if  GetItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 0
	end
	
	if  GetItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 0
	end
	
	if  GetMoney(sceneId, selfId)  < 100000   then 
		return 0
	end
	
	return 1
end

--**********************************
--提交（完成）
--**********************************
function x212108_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212108_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212108_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	--检测钱是不是还够扣
	if  GetMoney(sceneId, selfId)  < 100000  then
		return
	end
	
	--检查材料是不是还在
	if  LuaFnGetAvailableItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 
	end
	
	if  LuaFnGetAvailableItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 
	end
	
	
	BeginAddItem(sceneId)
		for i, item in x212108_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
		
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret > 0 then		
		--销毁材料
		DelItem( sceneId, selfId, 20103005, 10 )
		DelItem( sceneId, selfId, 20103004, 10 )
		
		AddExp(sceneId,selfId,x212108_g_Exp)
		
		--扣钱咯
		CostMoney(sceneId,selfId, 100000)

		--给钱
		AddMoney(sceneId,selfId,x212108_g_MoneyBonus );
				
		ret = DelMission( sceneId, selfId, x212108_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x212108_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
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

--**********************************
--杀死怪物或玩家
--**********************************
function x212108_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212108_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212108_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 20103005  then		-- 金矿石
		-- 获得玩家身上有的 金矿石 的数量，如果小鱼＝10 ，就提示
		if  GetItemCount( sceneId, selfId, 20103005 ) <= 10   then
			BeginEvent(sceneId)
				strText = "得到金矿石：" .. tostring(GetItemCount( sceneId, selfId, 20103005 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	
	if itemdataId == 20103004  then		-- 寒铁矿石
		-- 获得玩家身上有的 寒铁矿石 的数量，如果小鱼＝10 ，就提示
		if  GetItemCount( sceneId, selfId, 20103004 ) <= 10   then
			BeginEvent(sceneId)
				strText = "得到寒铁矿石：" .. tostring(GetItemCount( sceneId, selfId, 20103004 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

end


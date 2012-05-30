--长白 捉迷藏
--MisDescBegin
--脚本号
x212110_g_ScriptId = 212110

--任务号
x212110_g_MissionId = 561

--任务归类
x212110_g_MissionKind = 33

--任务等级
x212110_g_MissionLevel = 88

--是否是精英任务
x212110_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x212110_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务需要得到的物品
--x212110_g_DemandItem={{id=40002112,num=1}}		--变量第1位

--任务文本描述
x212110_g_MissionName="捉迷藏"
x212110_g_MissionInfo="#{Lua_changbai_001}"
x212110_g_MissionTarget="  #G长白山完颜部#W的完颜兀术#{_INFOAIM118,107,22,完颜兀术}让你找到#R完颜粘没喝#W#{_INFOAIM147,120,22,完颜粘没喝}、#R完颜斡离不#W#{_INFOAIM166,94,22,完颜斡离不}、#R完颜讹里朵#W#{_INFOAIM178,113,22,完颜讹里朵}。"
x212110_g_ContinueInfo="  你找到我的哥哥们了吗？"
x212110_g_MissionComplete="  你好厉害啊，这么快就找到他们了！为什么我总是找不到呢？难道我是笨小孩吗？"

--奖励
x212110_g_MoneyBonus=54500
x212110_g_Exp = 36000
--x212110_g_ItemBonus={{id=30004020,num=1}}

x212110_g_Custom	= { {id="已找到完颜粘没喝",num=1},{id="已找到完颜斡离不",num=1},{id="已找到完颜讹里朵",num=1} }
x212110_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212110_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212110_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212110_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212110_g_Name then
			--发送交任务前的需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212110_g_MissionName);
				AddText(sceneId,x212110_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212110_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212110_g_ScriptId,x212110_g_MissionId,done)
--		end
	--满足任务接收条件
	elseif GetLevel( sceneId, selfId ) >= 88 then
	
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212110_g_MissionName);
			AddText(sceneId,x212110_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212110_g_MissionTarget);
			AddMoneyBonus( sceneId, x212110_g_MoneyBonus )
			--for i, item in x212110_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212110_g_ScriptId,x212110_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212110_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission(sceneId,selfId,x212110_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212110_g_MissionId)			--得到任务的序列号
	
		--先看是不是找对人了，如果找对，就给个提示，如果是第二次，就给不同的提示
		if  GetName(sceneId, targetId) == "完颜粘没喝"   then
			if GetMissionParam(sceneId, selfId, misIndex, 1) == 0  then
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--根据序列号把任务变量的第0位置1 (任务完成情况)
				BeginEvent(sceneId)
					strText = "找到完颜粘没喝"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				local n1 = GetMissionParam(sceneId, selfId, misIndex, 1)
				local n2 = GetMissionParam(sceneId, selfId, misIndex, 2)
				local n3 = GetMissionParam(sceneId, selfId, misIndex, 3)
				
				if n1==1 and n2==1 and n3==1   then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
				return
			end
		end
		
		if  GetName(sceneId, targetId) == "完颜斡离不"   then
			if GetMissionParam(sceneId, selfId, misIndex, 2) == 0  then
				SetMissionByIndex(sceneId,selfId,misIndex,2,1)		--根据序列号把任务变量的第0位置1 (任务完成情况)
				BeginEvent(sceneId)
					strText = "找到完颜斡离不"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		
				local n1 = GetMissionParam(sceneId, selfId, misIndex, 1)
				local n2 = GetMissionParam(sceneId, selfId, misIndex, 2)
				local n3 = GetMissionParam(sceneId, selfId, misIndex, 3)
				
				if n1==1 and n2==1 and n3==1   then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
				return
			end
		end
		
		if  GetName(sceneId, targetId) == "完颜讹里朵"   then
			if GetMissionParam(sceneId, selfId, misIndex, 3) == 0  then
				SetMissionByIndex(sceneId,selfId,misIndex,3,1)		--根据序列号把任务变量的第0位置1 (任务完成情况)
				BeginEvent(sceneId)
					strText = "找到完颜讹里朵"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
		
				local n1 = GetMissionParam(sceneId, selfId, misIndex, 1)
				local n2 = GetMissionParam(sceneId, selfId, misIndex, 2)
				local n3 = GetMissionParam(sceneId, selfId, misIndex, 3)
				
				if n1==1 and n2==1 and n3==1   then
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				end
				return
			end
		end
	end

	if IsMissionHaveDone( sceneId, selfId, x212110_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212110_g_MissionId) > 0 then
		if  GetName(sceneId, targetId) == "完颜兀术"   then
			AddNumText(sceneId, x212110_g_ScriptId,x212110_g_MissionName, 2, -1)
		end	

	--满足任务接收条件
	elseif x212110_CheckAccept(sceneId,selfId) > 0 then
		if  GetName(sceneId, targetId) == "完颜兀术"   then
			AddNumText(sceneId, x212110_g_ScriptId, x212110_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212110_CheckAccept( sceneId, selfId )
	--需要60级才能接
	if GetLevel( sceneId, selfId ) >= 88 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212110_OnAccept( sceneId, selfId )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x212110_g_MissionId) > 0   then
		return
	end
	
	if x212110_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212110_g_MissionId, x212110_g_ScriptId, 0, 0, 0 )
	-- 需要考虑玩家是不是能够接受到这个任务
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212110_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)		--根据序列号把任务变量的第0位置1 (任务完成情况)
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)		--根据序列号把任务变量的第0位置1 (任务完成情况)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)		--根据序列号把任务变量的第0位置1 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#Y接受任务 ".. x212110_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y接受任务 ".. x212110_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)


end

--**********************************
--放弃
--**********************************
function x212110_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212110_g_MissionId )
end

--**********************************
--已经接了任务再给出的提示
--**********************************
function x212110_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212110_g_MissionName)
		AddText(sceneId,x212110_g_MissionComplete)
		AddMoneyBonus( sceneId, x212110_g_MoneyBonus )
		--for i, item in x212110_g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212110_g_ScriptId,x212110_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212110_CheckSubmit( sceneId, selfId )
	--检测条件是看任务中的标记是不是被改为1了
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212110_g_MissionId)			--得到任务的序列号
	
	if GetMissionParam(sceneId, selfId, misIndex, 1) <= 0  then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 2) <= 0  then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 3) <= 0  then
		return 0
	end
	
	return 1
end

--**********************************
--提交（完成）
--**********************************
function x212110_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212110_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212110_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
--	BeginAddItem(sceneId)
--		for i, item in x212110_g_ItemBonus do
--			AddItem( sceneId,item.id, item.num )
--		end
		
--	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
--	if ret > 0 then		
		AddExp(sceneId,selfId,x212110_g_Exp)
		AddMoney(sceneId,selfId,x212110_g_MoneyBonus );

		DelMission( sceneId, selfId, x212110_g_MissionId )
		MissionCom( sceneId, selfId, x212110_g_MissionId )
--		AddItemListToHuman(sceneId,selfId)
--	else
--	--任务奖励没有加成功
--		BeginEvent(sceneId)
--			strText = "背包已满,无法完成任务"
--			AddText(sceneId,strText);
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212110_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212110_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212110_OnItemChanged( sceneId, selfId, itemdataId )
end


--辽西 驱赶黑蜂
--MisDescBegin
--脚本号
x212107_g_ScriptId = 212107

--任务号
x212107_g_MissionId = 552

--任务归类
x212107_g_MissionKind = 32

--任务等级
x212107_g_MissionLevel = 75

--是否是精英任务
x212107_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x212107_g_IsMissionOkFail = 0		--变量的第0位
x212107_g_Custom	= { {id="已经点燃干狼粪",num=1} }

--以上是动态**************************************************************

--任务需要得到的物品
--x212107_g_DemandItem={{id=40002112,num=1}}		--变量第1位

--任务文本描述
x212107_g_MissionName="驱赶黑蜂"
x212107_g_MissionInfo="#{Lua_liaoxi_001}"
x212107_g_MissionTarget="  杀死#R白狼王#W#{_INFOAIM161,268,21,-1}，得到干狼粪。用火折子点燃干狼粪，驱赶黑蜂，然后回到#G广宁镇#W，向#R伯颜#W#{_INFOAIM164,199,21,伯颜}报告你的发现。"
x212107_g_ContinueInfo="  你已经驱赶完黑蜂了吗？"
x212107_g_MissionComplete="  年轻人，你真是我们的救星啊！我代表所有的族人感谢你的帮助！我们永远都不会忘记你的。"

--奖励
x212107_g_MoneyBonus=49800
x212107_g_Exp = 45000
--x212107_g_ItemBonus={{id=30003007,num=5}}
x212107_g_RadioItemBonus={{id=10411081 ,num=1},{id=10412074,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212107_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212107_g_Name then
			--发送交任务前的需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212107_g_MissionName);
				AddText(sceneId,x212107_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212107_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId,done)
--		end
	--满足任务接收条件
	elseif GetLevel( sceneId, selfId ) >= 75 then
	
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212107_g_MissionName);
			AddText(sceneId,x212107_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212107_g_MissionTarget);
			AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
			for i, item in x212107_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212107_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x212107_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212107_g_MissionId) > 0 then
		AddNumText(sceneId, x212107_g_ScriptId,x212107_g_MissionName, 2, -1)

	--满足任务接收条件
	elseif x212107_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212107_g_MissionName then
			AddNumText(sceneId, x212107_g_ScriptId, x212107_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212107_CheckAccept( sceneId, selfId )
	--需要60级才能接
	if GetLevel( sceneId, selfId ) >= 75 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x212107_OnAccept( sceneId, selfId )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x212107_g_MissionId) > 0   then
		return
	end
	
	if x212107_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	-- 生成一个任务道具
	BeginAddItem(sceneId)
		AddItem( sceneId, 40002070, 1)
		--AddItem( sceneId, 40002069, 1)
	local retItem = EndAddItem(sceneId,selfId)

	if retItem < 0   then
		Msg2Player(  sceneId, selfId,"#Y任务背包已经满了", MSG2PLAYER_PARA )
		return 
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212107_g_MissionId, x212107_g_ScriptId, 0, 0, 0 )
	-- 需要考虑玩家是不是能够接受到这个任务
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	-- 加任务物品
	AddItemListToHuman(sceneId,selfId)
	
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x212107_g_MissionId, 2)
	
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--根据序列号把任务变量的第0位置1 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#Y接受任务 ".. x212107_g_MissionName, MSG2PLAYER_PARA )

	BeginEvent(sceneId)
		strText = "#Y接受任务 ".. x212107_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212107_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x212107_g_MissionId )
	
	-- 删除任务道具
	DelItem( sceneId, selfId, 40002070, 1 )
	DelItem( sceneId, selfId, 40002069, 1 )

end

--**********************************
--已经接了任务再给出的提示
--**********************************
function x212107_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x212107_g_MissionName)
		AddText(sceneId,x212107_g_MissionComplete)
		AddMoneyBonus( sceneId, x212107_g_MoneyBonus )
		for i, item in x212107_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212107_g_ScriptId,x212107_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212107_CheckSubmit( sceneId, selfId )
	--检测条件是看任务中的标记是不是被改为1了
	misIndex = GetMissionIndexByID(sceneId,selfId,x212107_g_MissionId)			--得到任务的序列号
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0  then
		return 1
	end
	return 0
end

--**********************************
--提交（完成）
--**********************************
function x212107_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家是不是有这个任务
	if IsHaveMission(sceneId,selfId,x212107_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212107_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212107_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)

	--添加任务奖励
	if ret > 0 then		
		-- 删除任务道具
		DelItem( sceneId, selfId, 40002070, 1 )
		DelItem( sceneId, selfId, 40002069, 1 )

		AddExp(sceneId,selfId,x212107_g_Exp)
		AddMoney(sceneId,selfId,x212107_g_MoneyBonus );
		DelMission( sceneId, selfId, x212107_g_MissionId )
		MissionCom( sceneId, selfId, x212107_g_MissionId )
		AddItemListToHuman(sceneId,selfId)

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
function x212107_OnKillObject( sceneId, selfId, objdataId ,objId )
	-- 如果完家杀了白狼大王，可以获得另一个道具“干狼粪”
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if monsterName == "白狼王"   then
		--取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			--取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x212107_g_MissionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local nMisIndex = GetMissionIndexByID(sceneId,humanObjId,x212107_g_MissionId)
				
				-- 检测玩家身上是不是有这个物品了，有了就不再掉了
				if GetMissionParam(sceneId, humanObjId, nMisIndex, 0) == 0  and
						GetItemCount(sceneId, humanObjId, 40002069) == 0 then
					AddMonsterDropItem(sceneId,objId,humanObjId, 40002069)
				end
			end
		end
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x212107_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212107_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40002069  then
	 	BeginEvent(sceneId)
			AddText(sceneId, "已得到干狼粪：1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end


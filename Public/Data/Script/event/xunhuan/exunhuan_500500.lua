--循环任务
--寻找宝藏
--待增强的部分:	寻宝方式的增强,1现有的直接告诉玩家距离2限制探测器使用
--				次数3使用探测器后用声音来提示距离4使用探测器后用方向来
--				提示5使用探测器后用玩家的前后左右来提示6找到第一个位置
--				是指示宝藏位置的纸条7找到第一个位置还要有迷题才能知道
--				具体位置

--************************************************************************
--MisDescBegin
--脚本号
x500500_g_ScriptId = 500500

--上一个任务的ID
--g_MissionIdPre =

--任务号
x500500_g_MissionId = 700

--任务目标npc
x500500_g_Name	="何执中" 

--任务道具编号
x500500_g_ItemId = 40002106

--任务道具需求数量
x500500_g_ItemNeedNum = 1

--任务归类
x500500_g_MissionKind = 1

--任务等级
x500500_g_MissionLevel = 20

--是否是精英任务
x500500_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
x500500_g_IsMissionOkFail = 0					--变量的第0位
x500500_g_DemandItem={{id=40002106,num=1}}		--变量第1位,任务需要得到的物品
x500500_g_MissionRound = 3						--循环任务的数据索引，里面存着已做的环数 MD_WABAO_HUAN
--**********************************以上是动态****************************


--任务文本描述
x500500_g_MissionName="寻宝"
x500500_g_MissionInfo="#{M_700_TEXT1}"  --任务描述
x500500_g_MissionTarget="找到宝藏交给何执中"		--任务目标
x500500_g_ContinueInfo="你找到宝藏了么？点击任务道具中的探测器就可以找到宝藏的位置了"		--未完成任务的npc对话
x500500_g_MissionComplete="干的不错"					--完成任务npc说话的话

x500500_g_MoneyBonus=100
x500500_g_ItemBonus={{id=30002001,num=1}}

--MisDescEnd
--************************************************************************

--角色Mission变量说明
--0号：任务状态
--1号：任务需要的物品(这个任务只有一个)
--2号：宝物所在场景编号
--3号：宝物x坐标
--4号：宝物z坐标
--5号：未用
--6号：未用
--7号：未用

--宝藏位置
x500500_g_TreasureAddress = {	{scene=0,x=105,z=88},
						{scene=0,x=146,z=60},
						{scene=0,x=99,z=114},
						{scene=0,x=80,z=85},
						{scene=0,x=55,z=134},
						{scene=0,x=203,z=45},
						{scene=0,x=24,z=67},
						{scene=0,x=219,z=109},
						{scene=0,x=222,z=62},
						{scene=0,x=227,z=196},
						{scene=0,x=168,z=224},
						{scene=0,x=88,z=226},
						{scene=0,x=34,z=111}}


--**********************************
--任务入口函数
--**********************************
function x500500_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x500500_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x500500_g_MissionName)
			AddText(sceneId,x500500_g_ContinueInfo)
			AddText(sceneId," ")
			AddText(sceneId,"需要物品：")
			for i, item in x500500_g_DemandItem do
				AddItemDemand( sceneId, item.id, item.num )
			end
		EndEvent( )
		bDone = x500500_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x500500_g_ScriptId,x500500_g_MissionId,bDone)
	--满足任务接收条件
	elseif x500500_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x500500_g_MissionName)
			AddText(sceneId,x500500_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x500500_g_MissionTarget)
			AddMoneyBonus( sceneId, x500500_g_MoneyBonus )
			AddText(sceneId,"#{M700_6}")
			for i, item in x500500_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x500500_g_ScriptId,x500500_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x500500_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
    --else

    if IsHaveMission(sceneId,selfId,x500500_g_MissionId) > 0 then
		AddNumText(sceneId,x500500_g_ScriptId,x500500_g_MissionName,3,-1);
    --满足任务接收条件
    elseif x500500_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x500500_g_ScriptId,x500500_g_MissionName,4,-1);
    end
end

--**********************************
--检测接受条件
--**********************************
function x500500_CheckAccept( sceneId, selfId )
	--需要10级才能接
	if GetLevel( sceneId, selfId ) >= 10 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x500500_OnAccept( sceneId, selfId )

	if x500500_CheckAccept(sceneId, selfId )<=0 then
		return
	end
	
	x500500_g_sequence = random(13)					--根据宝物地点总数获得一个随机数
	SceneNum = x500500_g_TreasureAddress[x500500_g_sequence].scene
	X		 = x500500_g_TreasureAddress[x500500_g_sequence].x
	Z		 = x500500_g_TreasureAddress[x500500_g_sequence].z
	--添加宝藏探测器
	BeginAddItem(sceneId)
		ret = AddItem( sceneId,40002104, 1 )
	EndAddItem(sceneId,selfId)
	--加入任务到玩家列表
	ret = AddMission( sceneId,selfId, x500500_g_MissionId, x500500_g_ScriptId, 0, 0, 1 )

	--设置任务变量宝物的场景编号和坐标位置
	misIndex = GetMissionIndexByID(sceneId,selfId,x500500_g_MissionId)		--得到任务在20个任务中的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
	SetMissionByIndex(sceneId,selfId,misIndex,1,x500500_g_DemandItem[1].id)						--根据序列号把任务变量的第2位置为需求物品的编号
	SetMissionByIndex(sceneId,selfId,misIndex,2,SceneNum)			--把第三位置为宝物的场景编号
	SetMissionByIndex(sceneId,selfId,misIndex,3,X)					--把第四位置为宝物的X坐标
	SetMissionByIndex(sceneId,selfId,misIndex,4,Z)					--把第五位置为宝物的Z坐标
	
	AddItemListToHuman(sceneId,selfId)

	--得到环数
	local huan = GetMissionData(sceneId,selfId,x500500_g_MissionRound)
	--环数增加1
	huan = huan + 1
	SetMissionData(sceneId,selfId,x500500_g_MissionRound,huan)
	Msg2Player( sceneId,selfId,"接受任务：寻宝",MSG2PLAYER_PARA)
	Msg2Player( sceneId,selfId,"当前第"..huan.."次",MSG2PLAYER_PARA)	

end

--**********************************
--放弃
--**********************************
function x500500_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x500500_g_MissionId )
	DelItem (sceneId,selfId,40002104,1)
	SetMissionData(sceneId,selfId,12,0)	--环数清0
end

--**********************************
--继续
--**********************************
function x500500_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x500500_g_MissionName)
		AddText(sceneId,x500500_g_MissionComplete)
		AddMoneyBonus( sceneId, x500500_g_MoneyBonus )
		for i, item in x500500_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x500500_g_ScriptId,x500500_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x500500_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x500500_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	for i, item in x500500_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--提交
--**********************************
function x500500_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	local huan = GetMissionData(sceneId,selfId,x500500_g_MissionRound)

	--计算奖励金钱的数量
	if mod(huan,10) == 0 then
		x500500_g_Money = 1000 * 15
	else
		x500500_g_Money = 1000 * mod(huan,10)
	end
	
	if x500500_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x500500_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
			--for i, item in g_RadioItemBonus do
			--	if item.id == selectRadioId then
			--		AddItem( sceneId,item.id, item.num )
			--	end
			--end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		if ret > 0 then
			
			ret = DelMission( sceneId, selfId, x500500_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId,selfId, x500500_g_MissionId )
				local bDelItem = true
				--扣除任务物品
				for i, item in x500500_g_DemandItem do
					if 0== DelItem( sceneId, selfId, item.id, item.num ) then
						bDelItem = bDelItem and false
					end
				end
				--删除探测器
				if 0==DelItem( sceneId, selfId, 40002104, 1 ) then
					bDelItem = bDelItem and false
				end
				if(true==bDelItem) then
					AddItemListToHuman(sceneId,selfId)
					--给钱奖励
					AddMoney(sceneId,selfId,x500500_g_Money )
					--给经验值奖励
					AddExp( sceneId,selfId,x500500_g_Money)	
	
					Msg2Player( sceneId,selfId,"你得到"..x500500_g_Money.."金币",MSG2PLAYER_PARA)
				end
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
function x500500_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x500500_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x500500_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == x500500_g_ItemId then
		x500500_g_ItemNum = GetItemCount(sceneId,selfId,x500500_g_ItemId)
		if x500500_g_ItemNum < x500500_g_ItemNeedNum then
			BeginEvent(sceneId)
				strText = format("已得到宝物%d/1", x500500_g_ItemNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = format("已得到宝物%d/1", x500500_g_ItemNeedNum )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--道具使用
--**********************************
function x500500_OnUseItem( sceneId, selfId, BagIndex )
	misIndex = GetMissionIndexByID(sceneId,selfId,x500500_g_MissionId)
	x500500_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--获得任务状态
	scene = GetMissionParam(sceneId,selfId,misIndex,2)					--获得宝物场景号
	treasureX = GetMissionParam(sceneId,selfId,misIndex,3)				--获得宝物X坐标
	treasureZ = GetMissionParam(sceneId,selfId,misIndex,4)				--获得宝物Z坐标	
	--如果任务已经完成
	if x500500_g_MissionCondition == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"已经找到了,回去交任务吧")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--取得玩家当前坐标
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与宝藏的距离
	Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId ~= scene then
		BeginEvent(sceneId)
			AddText(sceneId,"似乎宝藏不在这个场景")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if Distance >1 then
		BeginEvent(sceneId)
			AddText(sceneId,"距离宝藏还有"..Distance.."米")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif Distance <= 1 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x500500_g_DemandItem[1].id, 1 )
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--把任务状态变量设置为1,表示已经完成
		else
			BeginEvent(sceneId)
				AddText(sceneId,"背包任务栏已满")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

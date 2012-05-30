--循环任务
--召集同伴
--************************************************************************
--MisDescBegin
--脚本号
x210211_g_ScriptId = 210211

--接受任务NPC属性
x210211_g_Position_X=172.7304
x210211_g_Position_Z=146.4640
x210211_g_SceneID=2
x210211_g_AccomplishNPC_Name="孙八爷" 

--上一个任务的ID
x210211_g_MissionIdPre =450

--任务号
x210211_g_MissionId = 451

--任务目标npc
x210211_g_Name	="孙八爷" 

x210211_g_ItemId	=30505062

--任务归类
x210211_g_MissionKind = 13

--任务等级
x210211_g_MissionLevel = 3

--是否是精英任务
x210211_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
x210211_g_IsMissionOkFail = 0					--变量的第0位
--**********************************以上是动态****************************


--任务文本描述
x210211_g_MissionName="放焰火啦"
x210211_g_MissionInfo="#{event_dali_0013}"  --任务描述至于什么地方合适，你只要打开#Y背包#W里的任务道具栏，右键点一下这个#Y传讯焰火#W，它就能给你相关的提示。
x210211_g_MissionTarget="#{xinshou_003}"		--任务目标
x210211_g_ContinueInfo="  焰火已经放了吗？"		--未完成任务的npc对话
x210211_g_MissionComplete="#{event_dali_0015}"					--完成任务npc说话的话
x210211_g_ItemBonus={{id=10111000,num=1}}
x210211_g_SignPost = {x = 173, z = 147, tip = "孙八爷"}
x210211_g_MoneyBonus=72
x210211_g_SignPost_1 = {x = 82, z = 220, tip = "焰火燃放点"}

x210211_g_Custom	= { {id="已燃放传讯焰火",num=1} }

--MisDescEnd
--************************************************************************

--角色Mission变量说明
--0号：任务状态
--1号：
--2号：所在场景编号
--3号：指定x坐标
--4号：指定z坐标
--5号：未用
--6号：未用
--7号：未用

--宝藏位置
x210211_g_TreasureAddress = {	{scene=2,x=82,z=220}}
--						{scene=2,x=104,z=201},
--						{scene=2,x=242,z=55},
--						{scene=2,x=202,z=237},
--						{scene=2,x=255,z=232},
--						{scene=2,x=82,z=220},
--						{scene=2,x=46,z=255},
--						{scene=2,x=44,z=151},
--						{scene=2,x=79,z=222}}

--**********************************
--任务入口函数
--**********************************
function x210211_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x210211_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210211_g_MissionName)
			AddText(sceneId,x210211_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		EndEvent( )
		bDone = x210211_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId,bDone)
	--满足任务接收条件
	elseif x210211_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210211_g_MissionName)
			AddText(sceneId,x210211_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x210211_g_MissionTarget)
			for i, item in x210211_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210211_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210211_g_MissionIdPre) <= 0 then
    	return
    end
	if IsMissionHaveDone(sceneId,selfId,x210211_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210211_g_MissionId) > 0 then
		AddNumText(sceneId,x210211_g_ScriptId,x210211_g_MissionName,2,-1);
    --满足任务接收条件
    elseif x210211_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210211_g_ScriptId,x210211_g_MissionName,1,-1);
    end
end

--**********************************
--检测接受条件
--**********************************
function x210211_CheckAccept( sceneId, selfId )
	--需要3级才能接
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210211_OnAccept( sceneId, selfId )

	if x210211_CheckAccept(sceneId, selfId )<=0 then
		return
	end
	
	--x210211_g_sequence = random(3)					--根据宝物地点总数获得一个随机数
	SceneNum = x210211_g_TreasureAddress[1].scene
	X		 = x210211_g_TreasureAddress[1].x
	Z		 = x210211_g_TreasureAddress[1].z
	--添加烟花
	BeginAddItem(sceneId)
		AddItem( sceneId,x210211_g_ItemId, 1 )
	local ret = EndAddItem(sceneId,selfId)
	
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务背包已经满了。", MSG2PLAYER_PARA )
	
	else
		--加入任务到玩家列表
		local ret1 = AddMission( sceneId,selfId, x210211_g_MissionId, x210211_g_ScriptId, 0, 0, 1 )
	
		if ret1 > 0  then
			
			--设置任务变量宝物的场景编号和坐标位置
			misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)		--得到任务在20个任务中的序列号
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况
			SetMissionByIndex(sceneId,selfId,misIndex,2,SceneNum)		--把第三位置为宝物的场景编号
			SetMissionByIndex(sceneId,selfId,misIndex,3,X)					--把第四位置为宝物的X坐标
			SetMissionByIndex(sceneId,selfId,misIndex,4,Z)					--把第五位置为宝物的Z坐标
			
			AddItemListToHuman(sceneId,selfId)
			Msg2Player( sceneId, selfId,"#Y接受任务：放焰火啦",MSG2PLAYER_PARA )
			
		  Msg2Player( sceneId, selfId, "@*;flagPOS;" .. sceneId .. ";" .. X .. ";" .. Z .. ";".."焰火燃放点", MSG2PLAYER_PARA )
			Msg2Player( sceneId, selfId, "@*;flashPOS;" .. sceneId .. ";" .. X .. ";" .. Z .. ";" .. "焰火燃放点", MSG2PLAYER_PARA )
			BeginEvent(sceneId)
				AddText(sceneId, "你得到了传讯焰火。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210211_g_SignPost_1.x, x210211_g_SignPost_1.z, x210211_g_SignPost_1.tip )
		else
			Msg2Player( sceneId, selfId,"#Y你的任务日志已经满了。", MSG2PLAYER_PARA )
		
		end
	end
end

--**********************************
--放弃
--**********************************
function x210211_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    res = DelMission( sceneId, selfId, x210211_g_MissionId )
	if res > 0 then
		--移去任务物品
		DelItem( sceneId, selfId, x210211_g_ItemId, 1 )
		--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210211_g_SignPost.tip )
		
	  Msg2Player( sceneId, selfId, "@*;flagNPCdel;" .. sceneId .. ";" .. "焰火燃放点", MSG2PLAYER_PARA )
	  Msg2Player( sceneId, selfId, "@*;flashNPCdel;" .. sceneId .. ";" .. "焰火燃放点", MSG2PLAYER_PARA )
		
		
	end
end

--**********************************
--继续
--**********************************
function x210211_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210211_g_MissionName)
		AddText(sceneId,x210211_g_MissionComplete)
		AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		for i, item in x210211_g_ItemBonus do
			AddItemBonus( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210211_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210211_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)
	x210211_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--获得任务状态
	if	x210211_g_MissionCondition>=1	then
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x210211_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210211_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210211_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
			if ret > 0 then
					AddMoney(sceneId,selfId,x210211_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,400)
					ret = DelMission( sceneId, selfId, x210211_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210211_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y完成任务：放焰火啦",MSG2PLAYER_PARA )
					CallScriptFunction( 210212, "OnDefaultEvent",sceneId, selfId, targetId)
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
function x210211_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210211_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210211_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--道具使用
--**********************************
function x210211_OnUseItem( sceneId, selfId, BagIndex )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)
	x210211_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--获得任务状态
	scene = GetMissionParam(sceneId,selfId,misIndex,2)					--获得宝物场景号
	treasureX = GetMissionParam(sceneId,selfId,misIndex,3)				--获得宝物X坐标
	treasureZ = GetMissionParam(sceneId,selfId,misIndex,4)				--获得宝物Z坐标	
	--如果任务已经完成
	if x210211_g_MissionCondition == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"施放传讯焰火成功")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--取得玩家当前坐标
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与宝藏的距离
	Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId==scene or sceneId==71 or sceneId==72 then
	else
		BeginEvent(sceneId)
			AddText(sceneId,"似乎在这个场景不能施放传讯焰火")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if Distance > 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"距离施放传讯焰火的地方还有"..Distance.."米")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif Distance <= 5 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--把任务状态变量设置为1,表示已经完成
		SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--把任务状态变量设置为1,表示已经完成
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210211_g_SignPost.x, x210211_g_SignPost.z, x210211_g_SignPost.tip )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4825, 0);
		BeginEvent(sceneId)
			AddText(sceneId,"各大门派弟子们闻讯纷纷赶来，快回去找孙八爷吧。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		DelItem( sceneId, selfId, x210211_g_ItemId, 1 )
	end
end

--捉珍兽任务
--捉珍兽
--MisDescBegin
--脚本号
x250033_g_ScriptId = 250033

--任务号
x250033_g_MissionId = 720

--任务目标npc
x250033_g_Name	="云涵儿"

--任务归类
x250033_g_MissionKind = 11

--任务等级
x250033_g_MissionLevel = 85

--是否是精英任务
x250033_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x250033_g_IsMissionOkFail = 0		--变量的第0位

x250033_g_PetDataID=3320	--任务珍兽的编号
--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x250033_g_MissionName="捕捉珍兽"
x250033_g_MissionInfo="我家小姐想要一只英招。"  --任务描述
x250033_g_MissionTarget="帮云涵儿找到一只英招。"		--任务目标
x250033_g_ContinueInfo="你捉到英招了吗？"		--未完成任务的npc对话
x250033_g_MissionComplete="干的不错。"					--完成任务npc说话的话

--任务奖励
x250033_g_MoneyBonus = 3015

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x250033_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x250033_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x250033_g_MissionName)
			AddText(sceneId,x250033_g_ContinueInfo)
		EndEvent( )
		bDone = x250033_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x250033_g_ScriptId,x250033_g_MissionId,bDone)
	--满足任务接收条件
	elseif x250033_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x250033_g_MissionName)
			AddText(sceneId,x250033_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x250033_g_MissionTarget)
			--AddMoneyBonus( sceneId, x250033_g_MoneyBonus )
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x250033_g_ScriptId,x250033_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x250033_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x250033_g_MissionId) > 0 then
		AddNumText(sceneId,x250033_g_ScriptId,x250033_g_MissionName,3,-1);
    --满足任务接收条件
    elseif x250033_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x250033_g_ScriptId,x250033_g_MissionName,4,-1);
    end
end

--**********************************
--检测接受条件
--**********************************
function x250033_CheckAccept( sceneId, selfId )
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--检测是否离放弃超过15分钟，如果未超过，则不可以接受任务。原因是为了防止玩家来回刷任务，以刷到自己好抓的珍兽。
--**********************************
function x250033_GetTimePass( sceneId, selfId )        --create by Steven.Han
   
  --检测捉珍兽任务放弃时间是否超过15分钟，如果超过，返回1，否则，返回0

  local iDayCount=GetMissionData( sceneId, selfId, MD_CAPTUREPETABANDON_TIME )
  
  if( 0 == iDayCount ) then
      return 1                   --如果是0，表示还未放弃过此任务，是可以接受的。
  end
  
  local CurTime = GetHourTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)

	local OldDaytime = floor(iDayCount/100)	--上次放弃的时间(天)
	local OldQuarterTime = mod(iDayCount,100)	--上次放弃的时间(刻)  	
  
  if( CurDaytime > OldDaytime ) then
      return 1               --如果已经超过一天了，则认为超过了15分钟。
  end
  
  if( OldQuarterTime == CurQuarterTime ) then
      return 0
  end	
	
	return 1

end

--**********************************
--接受
--**********************************
function x250033_OnAccept( sceneId, selfId )

  if( 0 == x250033_GetTimePass( sceneId, selfId ) ) then      
      --Msg2Player(  sceneId, selfId,"#Y距放弃此任务不足15分钟，无法再次接受",MSG2PLAYER_PARA )	--聊天窗口提示
      
		  BeginEvent(sceneId)
			  strText = format("距放弃此任务不足15分钟，无法再次接受")
			  AddText(sceneId,strText)
 		  EndEvent(sceneId)

 		  DispatchMissionTips(sceneId,selfId)
 		      
      return
  end	
  
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x250033_g_MissionId, x250033_g_ScriptId,0,0,0 )
	misIndex = GetMissionIndexByID(sceneId,selfId,x250033_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0 (任务完成情况)
	SetMissionByIndex(sceneId,selfId,misIndex,1,x250033_g_ScriptId)						--根据序列号把任务变量的第1位置为任务脚本号
	--检测玩家身上的道具是否已经满足完成条件，如果已经满足，则把完成任务的变量置为1
	if x250033_CheckSubmit( sceneId, selfId ) then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1
	end
	--显示内容告诉玩家已经接受了任务
--	BeginEvent(sceneId)
--		AddText(sceneId,x250033_g_MissionInfo)
--	EndEvent(sceneId)
--	DispatchEventList(sceneId,selfId,targetId)	--对话框显示MissionInfo
	Msg2Player(  sceneId, selfId,"#Y接受任务：捕捉珍兽",MSG2PLAYER_PARA )	--聊天窗口提示
end

--**********************************
--放弃
--**********************************
function x250033_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x250033_g_MissionId )
    
    local CurTime = GetHourTime()		--当前时间	
	  SetMissionData(sceneId,selfId,MD_CAPTUREPETABANDON_TIME,CurTime )     --把当前时间设置为放弃时间  Steven.Han
    --Msg2Player(  sceneId, selfId,"#Y你放弃了捕捉珍兽任务，15分钟之内你将无法再次接受此任务",MSG2PLAYER_PARA )	--聊天窗口提示
    
end

--**********************************
--继续
--**********************************
function x250033_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
    AddText(sceneId,x250033_g_MissionName)
    AddText(sceneId,x250033_g_MissionComplete)
    --AddMoneyBonus( sceneId, x250033_g_MoneyBonus )
    --for i, item in g_ItemBonus do
	--	AddItemBonus( sceneId, item.id, item.num )
	--end
    --for i, item in g_RadioItemBonus do
	--	AddRadioItemBonus( sceneId, item.id, item.num )
	--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x250033_g_ScriptId,x250033_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x250033_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x250033_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	--得到携带珍兽数量
	PetNum = LuaFnGetPetCount(sceneId,selfId)
	if PetNum ~= 0 then
		for i = 1,PetNum,1 do
			PetIndex = i - 1		--珍兽index从0开始
			if LuaFnGetPet_DataID(sceneId, selfId, PetIndex) == x250033_g_PetDataID then
				return 2
			end
		end
	end
	return 0
end

--**********************************
--提交
--**********************************
function x250033_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x250033_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x250033_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x250033_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--玩家提交的物品及珍兽
--**********************************
function x250033_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if indexpet == 255 then --索引值返回255表示空，没提交珍兽
		BeginEvent(sceneId)
			strText = "请把珍兽拖动到窗口中!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		--得到放入窗口中的珍兽编号
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, indexpet )
		if petdataid == x250033_g_PetDataID then
			--奖励金钱并提示
			
				BeginEvent(sceneId)
					AddText(sceneId,"恭喜你完成了任务，奖励你#{_MONEY"..x250033_g_MoneyBonus.."}")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,npcid)
			ret0 = DelMission( sceneId, selfId, x250033_g_MissionId ) --删除任务
			ret1 = LuaFnDeletePet(sceneId, selfId, indexpet ) --删除珍兽
			if ret0>0 and ret1>0 then
				Msg2Player(  sceneId, selfId,"完成任务：捕捉珍兽",MSG2PLAYER_PARA )
				AddMoney(sceneId, selfId, x250033_g_MoneyBonus )
			end
			
			BeginEvent(sceneId)
				strText = "完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				strText = "珍兽条件不符!"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end


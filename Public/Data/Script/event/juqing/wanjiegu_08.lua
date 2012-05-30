
-- 再在副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200008_g_ScriptId = 200008

--副本名称
x200008_g_CopySceneName="万劫谷"

--任务号
x200008_g_MissionId = 8
--任务号
x200008_g_PreMissionId = 7

--目标NPC
x200008_g_Name = "段正明"

--是否是精英任务
x200008_g_IfMissionElite = 1

--任务归类
x200008_g_MissionKind = 51

--任务等级
x200008_g_MissionLevel = 20

--任务文本描述
x200008_g_MissionName="虎啸龙吟"
x200008_g_MissionInfo="#{Mis_juqing_0008}"
x200008_g_MissionTarget="#{Mis_juqing_Tar_0008}"
x200008_g_MissionComplete="  太好了，多谢你的帮忙，以后大理国都会视你为贵宾，用最高的礼节招待你！"
x200008_g_MissionContinue="  你已经救出誉儿了吗？"

x200008_g_MoneyBonus=3720
x200008_g_exp=24000

x200008_g_RadioItemBonus={{id=10423001 ,num=1},{id=10423002,num=1},{id=10423003,num=1},{id=10423004,num=1}}

x200008_g_Custom	= { {id="已救出段誉",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200008_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 888   then
		-- 检测玩家身上是不是有钥匙
		if  GetItemCount( sceneId, selfId, 40001001 ) > 0   then
			-- 需要创建段誉出来 439
			local nMonsterNum = GetMonsterCount(sceneId)
	
			local ii = 0
			local bHaveMonster = 0
			local bHave=0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
			
				if GetName(sceneId, nMonsterId)  == "段誉"  then
					bHave = 1
				end
			end
			
			if bHave == 0  then
				local nNpcId = LuaFnCreateMonster(sceneId, 439, 51, 90, 3, 0, 118020)
				SetCharacterName(sceneId, nNpcId, "段誉")
			end
			
			-- 设置任务完成标志，删除钥匙，
			local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			DelItem( sceneId, selfId, 40001001, 1 )
			
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)

		end
		return
	end
	
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200008_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200008_g_MissionName)
			AddText(sceneId,x200008_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
		EndEvent( )
		bDone = x200008_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200008_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200008_g_MissionName)
			AddText(sceneId,x200008_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}#r")
			AddText(sceneId,x200008_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
			for i, item in x200008_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200008_OnEnumerate( sceneId, selfId, targetId )
	if GetName(sceneId, targetId) == "万劫谷石敢当"   then
		-- 检测玩家身上是不是有钥匙，
		if  GetItemCount( sceneId, selfId, 40001001 ) > 0   then
			AddNumText(sceneId,x200008_g_ScriptId,"打开石门",6,888);
		end
		return
	end
	
  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200008_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200008_g_MissionId) > 0 then
		AddNumText(sceneId,x200008_g_ScriptId,x200008_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x200008_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200008_g_ScriptId,x200008_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200008_CheckAccept( sceneId, selfId )
	--需要4级才能接
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200008_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200008_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200008_g_MissionId, x200008_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：虎啸龙吟",MSG2PLAYER_PARA )
	
	-- 接任务后，把相关的怪设置为可以战斗
	-- 需要遍历所有的怪，改变他们的阵营
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "段延庆"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
			SetNPCAIType(sceneId, nMonsterId, 1)
		end
	end
	
	-- 设置任务关系的事件
	SetMissionEvent(sceneId, selfId, x200008_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200008_g_MissionId, 2)

end

--**********************************
--放弃
--**********************************
function x200008_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200008_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200008_g_SignPost.tip )
	DelItem( sceneId, selfId, 40001001, 1 )
end

--**********************************
--继续
--**********************************
function x200008_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200008_g_MissionName)
		AddText(sceneId,x200008_g_MissionComplete)
		AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
		for i, item in x200008_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200008_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200008_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)

	if Kill1~=1 			then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200008_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200008_CheckSubmit(sceneId, selfId) ~= 1   then
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200008_g_RadioItemBonus do
		if item.id == selectRadioId then
			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret < 1 then
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "背包已满,无法完成任务"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)

	AddMoney(sceneId,selfId,x200008_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200008_g_exp)

	DelMission( sceneId, selfId, x200008_g_MissionId )
	MissionCom( sceneId, selfId, x200008_g_MissionId )
	Msg2Player( sceneId, selfId,"#Y完成任务：虎啸龙吟",MSG2PLAYER_PARA )
	
	Msg2Player( sceneId, selfId,"你已经完成了#G万劫谷#W系列任务",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "你已经完成了#G万劫谷#W系列任务。请在达到30级之后，在大理城找到赵天师，开启#G燕子坞#W系列任务。")
	
	-- 完成万劫谷剧情，给10点剧情点
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- 通知玩家，可以做剧情循环任务了
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)

	-- 通知玩家，可以做剧情循环任务了
	-- 您现在可以去AA城的[bb，cc]找到DD，接受DD循环任务。
	local strText1 = "#{LOOTMISSION_MAIL_01}#r#{LOOTMISSION_MAIL_02}#r#{LOOTMISSION_MAIL_03}#r#{LOOTMISSION_MAIL_04}"
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#{LOOTMISSION_INFO_01}");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200008_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == "段延庆"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200008_g_MissionId) > 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死段延庆：1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
				AddMonsterDropItem(sceneId,objId,humanObjId,40001001)    --给这个人任务道具(道具会出现在尸体包里)
			end
		end
	end	
end

--**********************************
--进入区域事件
--**********************************
function x200008_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200008_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == 40001001    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "已得到石屋钥匙:1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

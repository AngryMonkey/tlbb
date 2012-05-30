					
--找人任务
--发送通知
--MisDescBegin
--脚本号
x250551_g_ScriptId = 250551

--任务号
x250551_g_MissionId = 721

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x250551_g_Name	="邱行洛"

--任务归类 
x250551_g_MissionKind = 11

--任务等级
x250551_g_MissionLevel = 10000

--是否是精英任务
x250551_g_IfMissionElite = 0

--任务需要得到的物品
--g_DemandItem={{id=30701021,num=1}}


--任务名
x250551_g_MissionName="捎口信"
x250551_g_MissionInfo="帮我告诉%s%s[%d,%d]，蹴鞠大会就要开始了。"
x250551_g_MissionTarget="%f"
x250551_g_ContinueInfo="干得不错"		--未完成任务的npc对话
x250551_g_MissionComplete="我知道了，这是给你的奖励"

--用来保存字符串格式化的数据
x250551_g_FormatList = {
								"找到%n",
								}
								
--格式字符串中对应于g_StringList中字符串的索引, 表示从4开始,后多少位视SetMissionByIndexEx(...)的多少而定
x250551_g_StrForePart=4

--MisDescEnd

x250551_g_fasongtongzhiNpcIndex = 5

--**********************************
--任务入口函数
--**********************************
function x250551_OnDefaultEvent( sceneId, selfId, targetId )
  --如果玩家完成过这个任务
  if( IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0)  then
  	if GetName(sceneId, targetId) == x250551_g_Name then
  		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
  		local npcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
  		local _, npcName, npcScene, x, z = GetNpcInfoByNpcId(sceneId,npcId)
  		local strText = format("我的口信捎到了么？%s%s就在(%d，%d)。你可以点击Alt+Q查看任务目标。", npcScene, npcName, x, z)
			BeginEvent(sceneId)
				AddText(sceneId, strText)
			EndEvent()
			DispatchEventList(sceneId, selfId, -1)
  	else
	  	if x250551_CheckSubmit( sceneId, selfId ) > 0 then
		 		BeginEvent(sceneId)
					AddText(sceneId,x250551_g_MissionName)
					local BonusMoney = 500	--90 + (GetLevel(sceneId, selfId) - 10) * 5
					local BonusExp = 200
					AddText(sceneId, "奖励你" .. tostring(BonusExp) .. "点经验和" .. "#{_MONEY" .. tostring(BonusMoney) .. "}，快回去告诉邱行洛，口信收到啦，谢谢你。")
					SetMissionCacheData(sceneId, selfId, 0, BonusMoney)
					SetMissionCacheData(sceneId, selfId, 1, BonusExp)
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x250551_g_ScriptId, x250551_g_MissionId,x250551_g_ScriptId)
			end	
		end
		--DispatchMissionDemandInfo(sceneId,selfId,targetId,x250551_g_ScriptId,x250551_g_MissionId,bDone,x250551_g_ScriptId)
    --满足任务接收条件
  elseif x250551_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x250551_g_Name then
			--///////////////////////////////////////////////////
			--local playerLevel = GetLevel(sceneId, selfId)
			--if playerLevel >= 21 then
			--	BeginEvent(sceneId)
			--		AddText(sceneId, "你的等级已经超过20级了，去做一些更有前途的任务吧。")
			--	EndEvent( )
			--	DispatchEventList(sceneId, selfId, -1)
			--	return 
			--end
			--///////////////////////////////////////////////////
			--begin modified by zhangguoxin 090207
			local iDayCount = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
			--local iTime = mod(iDayCount,100000)
			local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
			local iDayTime = floor(iTime/100)					--上一次放弃任务的时间(天数)
			local iQuarterTime = mod(iTime,100)				--上一次放弃任务的时间(一刻种)
			--local iDayHuan = floor(iDayCount/100000) 	--当天内完成的任务次数
			local iDayHuan = iDayCount 	--当天内完成的任务次数
			--print("iDayHuan ... is ... " .. iDayHuan)
			
			--local CurTime = GetHourTime()							--当前时间
			local CurTime = GetQuarterTime()							--当前时间
			local CurDaytime = floor(CurTime/100)			--当前时间(天)
			local CurQuarterTime = mod(CurTime,100) 	--当前时间(一刻钟)
			--end modified by zhangguoxin 090207
			
			if iDayTime ~= CurDaytime  then
				iDayHuan = 0
				CurQuarterTime = 99
			end

			if iDayHuan >= 10 then
				BeginEvent(sceneId)
					AddText(sceneId, "今天你已经帮我送了10次口信啦，明天再来吧，别累坏了。")
				EndEvent( )
				DispatchEventList(sceneId, selfId, -1)
				return
				
			end

			if iDayTime == CurDaytime then
				if CurQuarterTime == iQuarterTime then
					BeginEvent(sceneId)
						AddText(sceneId, x250551_g_MissionName)
						AddText(sceneId, "  由于你放弃过任务，在15分钟内你不能接收新的任务!")
					EndEvent( )
					DispatchEventList(sceneId, selfId, -1)
					return
				end
			end
			--/////////////////////////////////////////////////// end
			
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				--加入任务到玩家列表
				local bAdd = AddMission( sceneId,selfId, x250551_g_MissionId, x250551_g_ScriptId, 0, 0, 0 )
				if bAdd < 1 then
					return
				end	
				--寻物, 送信则设置锁定目标NPC的事件Flag
				SetMissionEvent(sceneId, selfId, x250551_g_MissionId, 4)
				
				local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(x250551_g_fasongtongzhiNpcIndex)
				print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ)
				--print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc)
				Msg2Player(  sceneId, selfId,"#Y接受任务：捎口信", MSG2PLAYER_PARA )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

				--得到任务在20个任务中的序列号
				local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
				
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
				
				SetMissionByIndex(sceneId, selfId, misIndex, x250551_g_StrForePart, 0)
				SetMissionByIndex(sceneId, selfId, misIndex, x250551_g_StrForePart+1, nNpcId)
				--////////////////////////////////////////////////////////////
				AddText(sceneId,x250551_g_MissionName)
				local str = format("帮我告诉%s%s[%d,%d]，蹴鞠大会就要开始了。", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, str)
				AddText(sceneId,"#{M_MUBIAO}")
				local strMissionTarget = format("找到%s%s[%d,%d]", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, strMissionTarget)
				
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
  end
  
end

--**********************************
--列举事件
--**********************************
function x250551_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0 then
    	AddNumText(sceneId,x250551_g_ScriptId,x250551_g_MissionName,3,-1);
	  --满足任务接收条件
    elseif x250551_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) == x250551_g_Name then
				AddNumText(sceneId,x250551_g_ScriptId,x250551_g_MissionName,4,-1);
			end
    end
end

--**********************************
--检测接受条件
--**********************************
function x250551_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--接受
--**********************************
function x250551_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x250551_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
	local npcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
	local  _, strNpcName, strNpcScene, x, z, desc, scene = GetNpcInfoByNpcId(sceneId,npcId)
	
  DelMission( sceneId, selfId, x250551_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, scene, strNpcName, x250551_g_MissionId)
	
	-- 在这里还是要检测这个任务里头存的时间是不是过去一天了，如果过去了，就先更新
	--begin modified by zhangguoxin 090207
	local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
	local iDayTime = floor(iTime/100)		--上一次放弃任务的时间(天数)
	local iQuarterTime = mod(iTime,100)	--上一次放弃任务的时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成的任务次数
	local iDayHuan = iDayCount --当天内完成的任务次数

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	
	if CurDaytime~=iDayTime then 	--上次完成任务是同一天内
		iDayHuan = 0
	end
	
	--iDayCount = iDayHuan*100000 + CurTime 

	--设置循环任务的时间
	--SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayCount)
	SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayHuan)
	SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME,CurTime)
	--end modified by zhangguoxin 090207
end

--**********************************
--检测是否可以提交
--**********************************
function x250551_CheckSubmit( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then
			return 1
		end
	else
		return 0	
	end
end

--**********************************
--提交
--**********************************
function x250551_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	if x250551_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--begin modified by zhangguoxin 090207
		local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
		--local iTime = mod(iDayCount,100000)
		local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
		local iDayTime = floor(iTime/100)		--上一次放弃任务的时间(天数)
		local iQuarterTime = mod(iTime,100)	--上一次放弃任务的时间(刻)
		--local iDayHuan = floor(iDayCount/100000)	--当天内完成的任务次数
		local iDayHuan = iDayCount 									--当天内完成的任务次数
	
		--local CurTime = GetHourTime()		--当前时间
		local CurTime = GetQuarterTime()		--当前时间
		local CurDaytime = floor(CurTime/100)	--当前时间(天)
		local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)
		
		if CurDaytime==iDayTime then 	--上次完成任务是同一天内
			iDayHuan = iDayHuan+1
		else							--上次完成任务不在同一天，重置
			iDayTime = CurDaytime
			iDayHuan = 1
		end
		
		-- 只要玩家交了任务，就让放弃任务的数据无效
		iQuarterTime = 99
		
		--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime 
		iDayCount = iDayHuan;
		local newTime = CurDaytime * 100 + iQuarterTime;
		--设置循环任务的DAYCOUNT
		SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayCount)
		SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME,newTime)
		--end modified by zhangguoxin 090207
		
		local BonusMoney = GetMissionCacheData(sceneId, selfId, 0)
		local BonusExp = GetMissionCacheData(sceneId, selfId, 1)
		AddMoney(sceneId,selfId,BonusMoney )
		AddExp(sceneId,selfId,BonusExp )
		
		----------------------------------------changed by xindefeng-------------------------------------------------
		--AddMoney()&AddExp()本身会在系统频道提示,所以将以下两句提示注释掉
		----Msg2Player(  sceneId, selfId, "你获得了" .. tostring(BonusExp) .. "点经验", MSG2PLAYER_PARA )
		----Msg2Player(  sceneId, selfId, "你获得了#{_MONEY" .. tostring(BonusMoney) .. "}", MSG2PLAYER_PARA )
		----------------------------------------changed by xindefeng-------------------------------------------------
		
		DelMission( sceneId,selfId, x250551_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：捎口信",MSG2PLAYER_PARA )
		-- 当每天完成第10次和第20次的时候，启动防外挂提问
		if iDayHuan == 5 or iDayHuan == 10   then
			LuaFnSendGuajiQuestion(sceneId,selfId)
		end
	end
end

function x250551_OnLockedTarget(sceneId, selfId, objId )
	-- 判断是不是锁定的Npc
	if IsHaveMission(sceneId, selfId, x250551_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)		--得到任务在20个任务中的序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
		local _, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
			 
		if GetName(sceneId, objId) == strNpcName then
			TAddNumText(sceneId, x250551_g_ScriptId,x250551_g_MissionName,4,-1,x250551_g_ScriptId);
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
		end	
	end 
	
	return 0;

end
	
											

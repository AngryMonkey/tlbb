
--门派引导任务

--MisDescBegin
--脚本号
x210239_g_ScriptId = 210239

--接受任务NPC属性
x210239_g_Position_X=160.0895
x210239_g_Position_Z=156.9309
x210239_g_SceneID=2
x210239_g_AccomplishNPC_Name="赵天师"

--任务号
x210239_g_MissionId = 719
--前置任务ID
x210239_g_MissionIdPer = 718

--目标NPC
x210239_g_Name	="赵天师"

--任务归类
x210239_g_MissionKind = 13

--任务等级
x210239_g_MissionLevel = 10

--是否是精英任务
x210239_g_IfMissionElite = 0

--任务名
x210239_g_MissionName="名门正派"
--任务描述
x210239_g_MissionInfo  = ""
x210239_g_MissionInfo1 = "    $N，你终于来了。#r    不错不错，你现在的根基已经打得相当扎实，去九大门派学习高深武功已经是顺理成章之事了。"
x210239_g_MissionInfo2 = "    对，你没有听错，就是传说中的九大门派。星宿派是西域大宗，天山派是西北奇葩，天龙派是天南支柱，逍遥派神出鬼没，峨嵋派万佛朝宗，武当派道骨仙风，明教是天下第一大教，丐帮是天下第一大帮，少林派更是天下武林的泰山北斗。"
x210239_g_MissionInfo3 = "    无论你拜入了哪一个门派，都是踏上了一条金光大道啊，我们老哥儿几个脸上都有光啊。"
x210239_g_MissionInfo4 = "    这样吧，你去找九大门派的收录人聊聊，听他们讲讲各大门派的特色，然后选择一个门派加入。等你成为了九大门派的弟子，你再来找我，我们会给你开一个庆功宴的。"

--任务目标
x210239_g_MissionTarget="#{MIS_dali_ZTS_001}"
--未完成任务的npc对话
x210239_g_ContinueInfo="    已经成为九大门派的弟子了吗？"
--提交时npc的话
x210239_g_MissionComplete="    看来你已经选好了正确的人生道路，向着未来奔跑吧！"


x210239_g_ItemBonus={}


x210239_g_IsMissionOkFail = 0		--变量的第0位
x210239_g_Custom	= { {id="已加入门派",num=1} }--变量的第1位

--x210239_g_MenpaiArray = {}


--MisDescEnd


--取得此门派排序应得的经验值。
function x210239_GetExpByMenpaiIndex( MenPaiIndex )
    --根据门派的排名，获得应得的经验值。

    local ReturnVal = 0

    if( 0 == MenPaiIndex ) then
        ReturnVal = 3000
    end
    if( 1 == MenPaiIndex ) then
        ReturnVal = 2900
    end
    if( 2 == MenPaiIndex ) then
        ReturnVal = 2600
    end
    if( 3 == MenPaiIndex ) then
        ReturnVal = 2500
    end
    if( 4 == MenPaiIndex ) then
        ReturnVal = 2200
    end
    if( 5 == MenPaiIndex ) then
        ReturnVal = 2000
    end
    if( 6 == MenPaiIndex ) then
        ReturnVal = 1200
    end
    if( 7 == MenPaiIndex ) then
        ReturnVal = 1000
    end
    if( 8 == MenPaiIndex ) then
        ReturnVal = 900
    end

    return ReturnVal

end


--0少林 1明教 2丐帮 3武当 4峨嵋 5星宿 6天龙 7天山 8消遥
--根据门派ID取得门派名称（汉字）
function x210239_GetMenpaiName( Menpai)
    local Name = "无门派"

    if( 0 == Menpai ) then
         Name = "少林派"
    elseif( 1 == Menpai ) then
         Name = "明教"
    elseif( 2 == Menpai ) then
         Name = "丐帮"
    elseif( 3 == Menpai ) then
         Name = "武当派"
    elseif( 4 == Menpai ) then
         Name = "峨嵋派"
    elseif( 5 == Menpai ) then
         Name = "星宿派"
    elseif( 6 == Menpai ) then
         Name = "天龙派"
    elseif( 7 == Menpai ) then
         Name = "天山派"
    elseif( 8 == Menpai ) then
         Name = "逍遥派"
    end

    return Name

end

function x210239_MenpaiSort()
    local MenpaiArray = {}
    local Max0 = 3
    local ZeroCount =0

    for i=1, 9 do
        MenpaiArray[ i ] = LuaFnGetWorldGlobalData( Max0 - 1 + i )
        if( 0 == MenpaiArray[ i ] ) then
            ZeroCount = ZeroCount + 1
        end
    end

    if( 9 == ZeroCount ) then
        MenpaiArray[ 1 ] = 6
        MenpaiArray[ 2 ] = 2
        MenpaiArray[ 3 ] = 7
        MenpaiArray[ 4 ] = 5
        MenpaiArray[ 5 ] = 8
        MenpaiArray[ 6 ] = 0
        MenpaiArray[ 7 ] = 3
        MenpaiArray[ 8 ] = 4
        MenpaiArray[ 9 ] = 1
    end

    return MenpaiArray

end

--保存门派排列，使用任务数据第3,4,5,6,7
function x210239_SaveMenpaiArray( sceneId, selfId, MenpaiArray )
    --0少林 1明教 2丐帮 3武当 4峨嵋 5星宿 6天龙 7天山 8逍遥
		--使用任务数据3,4,5,6,7用来存放门派排名。

    local MixDWORD = 0
    local CurMenpai
    local misIndex = GetMissionIndexByID(sceneId,selfId,x210239_g_MissionId)

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 1 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 2 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 3, MixDWORD)   --人数最多门派，放在任务数据第3个数据的高16位，第二放在第3个数据的低16位

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 3 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 4 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 4, MixDWORD)   --人数第三门派，放在任务数据第4个数据的高16位，第四放在第4个数据的低16位

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 5 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 6 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 5, MixDWORD)   --人数第五门派，放在任务数据第5个数据的高16位，第六放在第5个数据的低16位

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 7 ] )
    MixDWORD = SetLowWord ( MixDWORD, MenpaiArray[ 8 ] )
    SetMissionByIndex( sceneId, selfId, misIndex, 6, MixDWORD)   --人数第七门派，放在任务数据第6个数据的高16位，第八放在第6个数据的低16位

    MixDWORD = SetHighWord( MixDWORD, MenpaiArray[ 9 ] )
    MixDWORD = SetLowWord ( MixDWORD, 0 )
    SetMissionByIndex( sceneId, selfId, misIndex, 7, MixDWORD)   --人数第九门派，放在任务数据第7个数据的高16位，低16位置0

end


--**********************************
--任务入口函数
--**********************************
function x210239_OnDefaultEvent( sceneId, selfId, targetId )

   --x210239_GetMenpaiIndex( 9 )
  --如果玩家完成过这个任务
  if (IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x210239_g_MissionId) > 0)  then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, x210239_g_MissionName)
			AddText(sceneId, x210239_g_ContinueInfo)
		EndEvent( )
		local bDone = x210239_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId,bDone)

	--满足任务接收条件
  elseif x210239_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		local MenpaiArray = x210239_MenpaiSort()

		BeginEvent(sceneId)
			AddText(sceneId,x210239_g_MissionName)
			AddText(sceneId,x210239_g_MissionInfo1)
			AddText(sceneId,x210239_g_MissionInfo2)
			AddText(sceneId,x210239_g_MissionInfo3)
			AddText(sceneId,x210239_g_MissionInfo4)


			local MixStr1 = ""
			local MixStr2 = ""
			for i=1, 9 do
			    if( i <= 5 ) then
			        local MenpaiName = x210239_GetMenpaiName( MenpaiArray[ i ] )
			        local MenpaiExp  = x210239_GetExpByMenpaiIndex( i - 1 )
			        local Str = "    如果你加入" ..MenpaiName.. "，你将得到"..MenpaiExp.."点经验奖励"
			        MixStr1 = MixStr1..Str.."#r"
			    end

			    if( i>5 and i<=9 ) then
			        local MenpaiName = x210239_GetMenpaiName( MenpaiArray[ i ] )
			        local MenpaiExp  = x210239_GetExpByMenpaiIndex( i - 1 )
			        local Str = "    如果你加入" ..MenpaiName.. "，你将得到"..MenpaiExp.."点经验奖励"
			        MixStr2 = MixStr2..Str.."#r"
			    end

			end
			AddText( sceneId, MixStr1 )
      AddText( sceneId, MixStr2 )

			--AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,"#{M_MUBIAO}#r"..x210239_g_MissionTarget)

			--AddText(sceneId,"#{M_SHOUHUO}")
			--AddMoneyBonus( sceneId, x210239_g_MoneyBonus )
			--for i, item in x210239_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		--    DispatchMissionInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId)
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId, 0 )

		--x210239_OnAccept( sceneId, selfId )
		x210239_DirectAccept( sceneId, selfId, MenpaiArray )

	end
end


--直接接受任务，没有经过界面点击
function x210239_DirectAccept( sceneId, selfId, MenpaiArray )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 then
		return
	end

	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x210239_g_MissionId, x210239_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"接受任务:#Y" .. x210239_g_MissionName, MSG2PLAYER_PARA )


	local misIndex = GetMissionIndexByID(sceneId,selfId,719)
	local Menpai = LuaFnGetMenPai( sceneId, selfId )

  if( Menpai >= 0 and Menpai < 9 ) then
		  SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)    --任务追踪情况标志 1/1
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)    --任务完成情况
  end

  x210239_SaveMenpaiArray( sceneId, selfId, MenpaiArray )

end



--**********************************
--列举事件
--**********************************
function x210239_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 then
		return
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x210239_g_MissionId) > 0 then

	    local bDone = x210239_CheckSubmit( sceneId, selfId )
	    if( 1 == bDone ) then
	        AddNumText(sceneId, x210239_g_ScriptId, x210239_g_MissionName, 2, -1);
	    else
	        AddNumText(sceneId, x210239_g_ScriptId, x210239_g_MissionName, 1, -1);
	    end

	--满足任务接收条件
	elseif x210239_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x210239_g_ScriptId, x210239_g_MissionName, 1, -1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210239_CheckAccept( sceneId, selfId )

	--要求完成的前续任务
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionIdPer) <= 0 then
		return 0
	end

    return 1
end

--**********************************
--接受
--**********************************
function x210239_OnAccept( sceneId, selfId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210239_g_MissionId) > 0 then
		return
	end

	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x210239_g_MissionId, x210239_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	--设置任务变量宝物的场景编号和坐标位置
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210239_g_MissionId)--得到任务在20个任务中的序列号
	--SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量的第一位置0	第一位是完成/失败情况

	Msg2Player(  sceneId, selfId,"接受任务:#Y" .. x210239_g_MissionName, MSG2PLAYER_PARA )


	misIndex = GetMissionIndexByID(sceneId,selfId,719)
	local Menpai = LuaFnGetMenPai( sceneId, selfId )
  if( Menpai >= 0 and Menpai < 9 ) then
		  SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)    --任务追踪情况标志 1/1
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)    --任务完成情况
  end

end

--**********************************
--放弃
--**********************************
function x210239_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x210239_g_MissionId )
end

--**********************************
--继续
--**********************************
function x210239_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x210239_g_MissionName)
		AddText(sceneId,x210239_g_MissionComplete)

		for i, item in x210239_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210239_g_ScriptId,x210239_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210239_CheckSubmit( sceneId, selfId )

    local MenPai = GetMenPai( sceneId, selfId )

    if( MenPai > 8 ) then
        return 0
    end

    if( MenPai < 0 ) then
        return 0
    end

	return 1

end


--***********************************************
--按照玩家门派和存在任务数据中的门派排序计算经验
--***********************************************
function x210239_CalculatePlayerExp( sceneId, selfId )
    local Exp = 0
    local MenpaiArray ={}
    for i=1, 9 do
        MenpaiArray[ i ] = 0
    end

    if IsHaveMission(sceneId,selfId,x210239_g_MissionId) > 0 then
        local misIndex = GetMissionIndexByID(sceneId, selfId, x210239_g_MissionId)

        local MixDWORD
        local High
        local Low
        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 3)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 1 ] = High
        MenpaiArray[ 2 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 4)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 3 ] = High
        MenpaiArray[ 4 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 5)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 5 ] = High
        MenpaiArray[ 6 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 6)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 7 ] = High
        MenpaiArray[ 8 ] = Low

        MixDWORD = GetMissionParam(sceneId, selfId, misIndex, 7)
        High = GetHighWord( MixDWORD )
        Low = GetLowWord( MixDWORD )
        MenpaiArray[ 9 ] = High

    end

    local MenpaiID = LuaFnGetMenPai( sceneId, selfId )

    for i=1, 9 do
        if( MenpaiArray[ i ] == MenpaiID ) then
            Exp = x210239_GetExpByMenpaiIndex( i - 1 )
        end
    end

    return Exp
end
--**********************************
--提交
--**********************************
function x210239_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- 安全性检测
		-- 1、检测玩家是不是有这个任务
		if IsHaveMission(sceneId,selfId,x210239_g_MissionId) <= 0 then
			return
		end

		-- 2、完成任务的情况检测
		if x210239_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end

		local nPlayerExp = x210239_CalculatePlayerExp( sceneId, selfId )


		-- 金钱和经验
		LuaFnAddExp( sceneId, selfId, nPlayerExp)

		DelMission( sceneId,selfId, x210239_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId, x210239_g_MissionId )

		local MenpaiID = LuaFnGetMenPai( sceneId, selfId )
    local MenpaiName = x210239_GetMenpaiName( MenpaiID )

    local PlayerName = GetName( sceneId, selfId )
    local PlayerSex=GetSex(sceneId,selfId)

    local strSex = ""
    if PlayerSex == 0 then
        strSex = "她"
    else
        strSex = "他"
    end

    local SysStr = "#Y赵天师大喊：四大善人的朋友#{_INFOUSR"..PlayerName .."}已经成为了"..MenpaiName.."的弟子，老哥儿几个，一起来祝贺"..strSex.."吧！#W"

    --local SysStr = "#Y赵天师大喊：四大善人的朋友$N已经成为了"..MenpaiName.."的弟子，老哥儿几个，一起来祝贺他吧！#W"
    
    if IsPermitAreetAddMenpai()==1 then --modi:lby20071107新手加入门派是否通知玩家
    	BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
		end


end

--**********************************
--杀死怪物或玩家
--**********************************
function x210239_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--进入区域事件
--**********************************
function x210239_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210239_OnItemChanged( sceneId, selfId, itemdataId )
end








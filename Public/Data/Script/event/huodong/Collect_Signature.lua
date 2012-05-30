--Creator 左春伟
--收集签名
----------------
--MisDescBegin
--脚本号
x808038_g_ScriptId = 808038;
--接受任务NPC属性
x808038_g_Position_X=170.5004
x808038_g_Position_Z=122.5593

x808038_g_AccomplishNPC_Name="龚彩云"

--任务号
x808038_g_MissionId = 1130;

--任务目标npc
x808038_g_Name 					= "龚彩云"
--任务归类
x808038_g_MissionKind			= 13 --大理
--任务等级
x808038_g_MissionLevel		= 10000
--是否是精英任务
x808038_g_IfMissionElite	= 0
--任务是否已经完成
x808038_g_IsMissionOkFail	= 0		--任务参数的第0位

--任务文本描述
x808038_g_MissionName			= "收集签名"
--任务描述
x808038_g_MissionInfo			= "收集15个好友签名，到龚彩云处领取奖励！"
--任务目标
x808038_g_MissionTarget		= "#{SJQM_8825_20}"
--未完成任务的npc对话
x808038_g_ContinueInfo		= "看来你还没有完成啊！"
--完成任务npc说的话
x808038_g_MissionComplete	= "做的很好！"

x808038_g_city 				 	= 1		 --任务参数的第1位

-- 任务完成情况,内容动态刷新,占用任务参数的第1位

x808038_g_Custom	= { {id="已经收集好友签名",num=15} }
--MisDescEnd
----------------

--签名录道具ID
x808038_g_SignatureList_id = 40004451; 
--签名道具ID
x808038_g_Signature_id = 40004452; 
--奖励大礼包ID
x808038_g_Gift_id = 30008052; 
--兑换奖励特效ID
x808038_g_Impact_id = 47;
--经验奖励值
x808038_g_Exp_Prize = 
{
18308,19336,20337,21344,22392,23412,24437,25505,26543,27624,  										-- 10->19
56219,58703,61269,63851,66448,68992,71619,74262,76921,79526,											-- 20->29
132458,136815,141197,145491,149923,154380,158861,163253,167784,172339,						-- 30->39
258033,264744,271376,278159,284979,291718,298610,305538,312384,319384,						-- 40->49
326421,333374,340483,347628,354809,361905,369159,376448,383652,391013,						-- 50->59
398411,405722,413192,420699,428117,435695,443310,450835,458522,466245,						-- 60->69
474004,481673,489504,497371,505147,513087,521063,528946,536994,545078,						-- 70->79
553069,561225,569418,577647,585780,594081,602418,610659,619069,627514,						-- 80->89
635862,644380,652934,661390,670016,678678,687241,695975,704745,713552,						-- 90->99
722258,731000,739915,748866,757714,766738,775797,784753,793885,803052,						-- 100->109
812116,821356,830632,839802,849151,858535,867813,877269,886762,896148,						-- 110->119
905712,915314,924806,934479,944189,953789,963570,973388,983242,992985,						-- 120->129
1002911,1012874,1022724,1032759,1042829,1052787,1062930,1073109,1083174,1093425,	-- 130->139
1103713,1113885,1124244,1134640,1144920,1155387,1165892,1176278,1186855,1197467,	-- 140->149
1207961,
}
 
--**********************************
--任务入口函数
--**********************************
function x808038_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	if id == 1 then 
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_02}");	
			AddNumText(sceneId, x808038_g_ScriptId, "参加收集签名活动", 6, 3);
			AddNumText(sceneId, x808038_g_ScriptId, "兑换奖励", 6, 4);
			EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 2 then --帮助
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_08}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 3 then --参加活动
		-- 等级>10?
		local lvl = GetLevel(sceneId, selfId);
		if lvl < 10 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_03}");
			return
		end
		-- 已接签名任务？
		if IsHaveMission(sceneId, selfId, x808038_g_MissionId) > 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_04}");
			return		
		end
		-- 任务已满？
		if IsMissionFull(sceneId, selfId) == 1 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_05}");
			return			
		end
		-- 背包任务栏有空间？
		if LuaFnGetTaskItemBagSpace(sceneId, selfId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_06}");
			return		
		end
		-- 收到任务
		local ret = AddMission( sceneId,selfId, x808038_g_MissionId, x808038_g_ScriptId, 0, 0, 0 );
		if ret < 1 then
			return
		end	
		-- 条件满足，给签名录道具
		ret = TryRecieveItem( sceneId, selfId, x808038_g_SignatureList_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			return  -- 给道具失败	
		end	
		--日志
		AuditJoinCollectSignature(sceneId, selfId);
		-- 返回信息
		BeginEvent(sceneId, selfId)
			AddText(sceneId, "#{SJQM_8815_07}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);	
	elseif id == 4 then
		-- 本周兑奖过？
		local weekTime = GetWeekTime();
		local diJiTian = GetTodayWeek();
		if diJiTian == 0 then  -- 星期一作为一周开始
			weekTime = weekTime - 1;
		end
		if GetMissionData(sceneId, selfId, MD_SIGNATURE_GETPRIZE_TIME) == weekTime then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_16}");
			return					
		end
		-- 参加活动了吗？
		if IsHaveMission(sceneId, selfId, x808038_g_MissionId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_17}");
			return		
		end
		-- 够15个签名？、
		if GetItemCount(sceneId, selfId, x808038_g_Signature_id) < 15 then
		  x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_18}");
		  return
		end
		-- 上锁？
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_Signature_id) < 15 then
		  x808038_ReturnMsg(sceneId, selfId, targetId, "#{ResultText_158}");
		  return			
		end
		-- 背包道具栏有空间？
		if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8819_20}");
			return		
		end
		--扣除签名
		if LuaFnDelAvailableItem(sceneId, selfId, x808038_g_Signature_id, 15) == 0 then
			x808038_ShowMsg(sceneId, selfId, "扣除签名失败！");
		  return
		end
		--扣除签名簿
		if LuaFnDelAvailableItem(sceneId, selfId, x808038_g_SignatureList_id, 1) == 0 then
			x808038_ShowMsg(sceneId, selfId, "扣除签名录失败！");
		  return
		end		
		-- 奖励经验
		local lvl = GetLevel(sceneId, selfId);
		if lvl > 9 and lvl < 119 then
			LuaFnAddExp(sceneId, selfId, x808038_g_Exp_Prize[lvl-9]);
		end
		-- 给大礼包
		ret = TryRecieveItem( sceneId, selfId, x808038_g_Gift_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			x808038_ShowMsg(sceneId, selfId, "奖励失败！");		
			return  -- 道具失败	
		end
		-- 播放特效
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808038_g_Impact_id, 0);
		-- 设置兑奖时间
		SetMissionData(sceneId, selfId, MD_SIGNATURE_GETPRIZE_TIME, weekTime);
		-- 删除任务
		DelMission(sceneId, selfId, x808038_g_MissionId);

		-- 返回消息
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_19}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
		-- 广播
		local playerName = GetName(sceneId, selfId);
		if playerName ~= nil then
			str = format("#{_INFOUSR%s}#{SJQM_8815_01}", playerName); 
			AddGlobalCountNews( sceneId, str )
		end		
	end
end

--**********************************
--列举事件
--**********************************
function x808038_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText(sceneId, x808038_g_ScriptId, "收集签名活动", 6, 1);
	AddNumText(sceneId, x808038_g_ScriptId, "收集签名活动帮助", 0, 2);
end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x808038_OnAbandon( sceneId, selfId )
	local itemNum = LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_SignatureList_id);
	local itemNum2 = LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_Signature_id);
	if itemNum >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x808038_g_SignatureList_id, itemNum );
	end
	if itemNum2 >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x808038_g_Signature_id, itemNum2 );
	end
  if IsHaveMission(sceneId, selfId, x808038_g_MissionId) > 0 then
  	DelMission( sceneId, selfId, x808038_g_MissionId )
  end
  return 0;
end

--**********************************
--信息提示
--**********************************
function x808038_ShowMsg( sceneId, selfId, msg )
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--NPC返回消息
--**********************************

function x808038_ReturnMsg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

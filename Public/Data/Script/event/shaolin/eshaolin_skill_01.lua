-- 212140
-- 少林任务 少林旧事

-- 玩家等级大于等于30级。
-- 金刚经、法华经，达摩心经，龙树心经，释迦经心法等级至少25级，大光明经心法等级至少30级。这个条件在点“接受任务”的时候再进行提示。

--MisDescBegin
--脚本号
x212140_g_ScriptId = 212140

--接受任务NPC属性
x212140_g_Position_X=217
x212140_g_Position_Z=255
x212140_g_SceneID=2
x212140_g_AccomplishNPC_Name="王韶"

--任务号
x212140_g_MissionId = 961

--目标NPC
x212140_g_Name	="王韶"

--任务归类
x212140_g_MissionKind = 20

--任务等级
x212140_g_MissionLevel = 30

--是否是精英任务
x212140_g_IfMissionElite = 0

--任务名
x212140_g_MissionName="少林旧事"
x212140_g_MissionInfo="#{Mis_shaolin_961}"
x212140_g_MissionTarget="在#G大理城修文台#W找到#R王韶#W#{_INFOAIM217,255,2,王韶}。"
x212140_g_MissionComplete="  你是少林派的弟子啊，你们方丈玄慈大师还好吗？"

x212140_g_MoneyBonus=1000
x212140_g_exp=2000

x212140_g_Custom	= { {id="已找到王韶",num=1} }
x212140_g_IsMissionOkFail = 0

--MisDescEnd

x212140_g_Xinfa = {{id=1,limit=10,name="金刚经"},  -- zchw
									 {id=2,limit=10,name="法华经"},
									 {id=3,limit=10,name="大光明经"},
									 {id=4,limit=10,name="达摩心经"},
									 {id=5,limit=10,name="龙树心经"},
									 {id=6,limit=10,name="释迦经"},
									 }
x212140_g_Menpai = 0

--**********************************
--任务入口函数
--**********************************
function x212140_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212140_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212140_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212140_g_Name then
			x212140_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x212140_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212140_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x212140_g_MissionName)
				AddText(sceneId,x212140_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212140_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212140_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212140_g_ScriptId,x212140_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212140_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212140_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212140_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212140_g_Name then
			AddNumText(sceneId, x212140_g_ScriptId,x212140_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212140_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212140_g_Name then
			AddNumText(sceneId,x212140_g_ScriptId,x212140_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212140_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212140_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212140_g_MissionLevel then
		return 0
	end
	
	-- 门派检测
	if GetMenPai(sceneId, selfId) ~= x212140_g_Menpai  then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212140_OnAccept( sceneId, selfId, targetId )
	if x212140_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于10级）
	if x212140_CheckAllXinfaLevel(sceneId, selfId) == 0  then
		x212140_DispatchXinfaLimit(sceneId, selfId, targetId)
		return
	end

	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212140_g_MissionId, x212140_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = "#Y你的任务日志已经满了。"
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = "#Y接受任务：少林旧事。"
	Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212140_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--放弃
--**********************************
function x212140_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212140_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212140_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
		AddText(sceneId,x212140_g_MissionName)
		AddText(sceneId,x212140_g_MissionComplete)
		AddMoneyBonus( sceneId, x212140_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212140_g_ScriptId,x212140_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212140_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212140_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212140_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212140_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212140_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212140_g_exp)
		DelMission( sceneId, selfId, x212140_g_MissionId )
		MissionCom( sceneId, selfId, x212140_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：少林旧事",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212140_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212140_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212140_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--检测心法是不够接任务
--**********************************
function x212140_CheckAllXinfaLevel(sceneId, selfId)
	for i, xinfa in x212140_g_Xinfa do
		if LuaFnGetXinFaLevel(sceneId, selfId, xinfa.id) < xinfa.limit  then
			return 0
		end
	end
	return 1
end

--**********************************
--向玩家显示心法差距
--**********************************
function x212140_DispatchXinfaLimit(sceneId, selfId, targetId)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#Y" .. x212140_g_MissionName)
		AddText(sceneId,"  你的心法等级不足啊，没有足够等级的心法，为师怎敢让你去找王韶兄冒此大险呢？")
		AddText(sceneId,"你的心法等级：")
		local str
		local bOk = 0
		for i, xinfa in x212140_g_Xinfa do
			if LuaFnGetXinFaLevel(sceneId, selfId, xinfa.id) < xinfa.limit  then
				str = "[等级不足]"
				bOk = 0
			else
				str = "[完成]"
				bOk = 1
			end
			local str1 = "    " .. xinfa.name .. ":" .. tostring(LuaFnGetXinFaLevel(sceneId, selfId, xinfa.id)) .. "/" .. xinfa.limit .. str
			if bOk == 1  then
				str1 = "#Y" .. str1
			else
				str1 = "#R" .. str1
			end
			AddText(sceneId,str1)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

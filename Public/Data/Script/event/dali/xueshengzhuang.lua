--找人任务
--赵天师寻找孙八爷
--MisDescBegin
--脚本号
x210246_g_ScriptId = 210246

--接受任务NPC属性
x210246_g_Position_X=172.7304
x210246_g_Position_Z=146.4640
x210246_g_SceneID=2
x210246_g_Name	="孙八爷"

--任务等级
x210246_g_LevelLimit = 10

--任务名
x210246_g_MissionName="天天向上"
x210246_g_MissionNameTip="关于天天向上"
x210246_g_starttime = 20080917
x210246_g_endtime = 20080928

--给予才子佳人id和数量
x210246_g_ItemData = {nItemId = 10124122, nItemNum = 1}
x210246_g_SpecificId = 49

--**********************************
--任务入口函数
--**********************************
function x210246_OnDefaultEvent( sceneId, selfId, targetId )

	if GetNumText() == 1 then
		local strOutMsg = ""
		local CurLevel = LuaFnGetLevel( sceneId, selfId )
		local nBagNum = LuaFnGetPropertyBagSpace(sceneId, selfId)
		local bHave = 0
		if CurLevel < 10 then       --等级不够10级
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_01}")
			return
		end
		
		local bHave = GetMissionFlag(sceneId, selfId, MF_Xueshengzhuang_flag)
		if bHave == 1 then      --已经参加过了
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_02}")
			return
		end
		
		if nBagNum < 1 then         --道具栏不足一个
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_03}")
			x210246_Tip(sceneId, selfId, "#{TTXS_80821_04}")
			return
		end
		

		--给物品
		BeginAddItem(sceneId)                --给物品
			AddItem(sceneId, x210246_g_ItemData.nItemId, x210246_g_ItemData.nItemNum)
		local canAdd = EndAddItem(sceneId,selfId)						
		if canAdd > 0 then
			AddItemListToHuman(sceneId, selfId)	
			SetMissionFlag(sceneId, selfId, MF_Xueshengzhuang_flag, 1)
			x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_05}")
			x210246_Tip(sceneId, selfId, "#{TTXS_80821_06}")
			--增加特效
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x210246_g_SpecificId, 0);
			CreateXSzhuangAudit(sceneId, selfId, x210246_g_ItemData.nItemNum)
		end
	
	elseif GetNumText() == 2 then
		x210246_Msg(sceneId, selfId, targetId, "#{TTXS_80821_07}")
	end
end

--**********************************
--列举事件
--**********************************
function x210246_OnEnumerate( sceneId, selfId, targetId )

	local nDay = GetTime2Day(sceneId)
	if (nDay >= x210246_g_starttime and nDay <= x210246_g_endtime) then
		AddNumText(sceneId, x210246_g_ScriptId, x210246_g_MissionName, 6, 1);
		AddNumText(sceneId, x210246_g_ScriptId, x210246_g_MissionNameTip, 11, 2);
	end

end

--**********************************
--检测接受条件
--**********************************
function x210246_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x210246_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210246_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210246_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x210246_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x210246_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

function x210246_Msg( sceneId, selfId, targetId, strOutMsg)
	BeginEvent( sceneId )
		AddText(sceneId, strOutMsg)
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end

function x210246_Tip( sceneId, selfId, strOutMsg)
	BeginEvent( sceneId )
		AddText(sceneId, strOutMsg)
	EndEvent( sceneId )
	DispatchMissionTips(sceneId, selfId);
end

-- 宠物悟性提升

-- 脚本号
x800106_g_ScriptId = 800106

-- NPC 名字
x800106_g_Name = "云霏霏"

	
--**********************************
-- 任务入口函数
--**********************************
function x800106_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x800106_g_Name then		--判断该 npc 是否是指定的npc
		return
	end

	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19820425 )
end

--**********************************
-- 列举事件
--**********************************
function x800106_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x800106_g_Name then		--判断该 npc 是否是指定的npc
		return
	end

	AddNumText( sceneId, x800106_g_ScriptId, "使用根骨丹提升悟性" ,6,-1)
end


--**********************************
-- 宠物悟性提升
--**********************************
function x800106_PetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	
	local	SelfMoney = GetMoney(sceneId, selfId)
	
	local gengu = LuaFnGetPetGenGuByGUID(sceneId, selfId, mainPetGuidH, mainPetGuidL)
	local savvy = GetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	if savvy == 10 then
		x800106_NotifyTip(sceneId, selfId, "悟性已经打到最高，不能再提升！" );
		return 0;
	end
	local cost = GetCostOfGenGuBySavvy(sceneId, selfId, savvy);
	local succRate = GetSuccrateOfGenGuBySavvy(sceneId, selfId, savvy);
	local rand = random(1000)
	
	--检查 跟骨 丹
	local nSavvyNeed = savvy+1;	
	local nItemIdGenGuDan = 0;
	local msgTemp;
	if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
		msgTemp = "低";
		nItemIdGenGuDan = 30504038;
	elseif nSavvyNeed >= 4 and nSavvyNeed <= 6 then
		msgTemp = "中"
		nItemIdGenGuDan = 30502001;
	elseif nSavvyNeed >= 7 and nSavvyNeed <= 10 then
		msgTemp = "高"
		nItemIdGenGuDan = 30502002;
	end
	
	local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
	if nYaoDingCount <= 0 then
		if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
			--没有绑定的低级根骨丹
			nItemIdGenGuDan = 30502000
			local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
			if nYaoDingCount<= 0 then
				local msg = format("提升该珍兽悟性到%d需要%s级根骨丹。", savvy+1, msgTemp )
				x800106_NotifyTip(sceneId, selfId, msg );
				return 0;
			end
		else
			local msg = format("提升该珍兽悟性到%d需要%s级根骨丹。", savvy+1, msgTemp )
			x800106_NotifyTip(sceneId, selfId, msg );
			return 0;
		end
	end
	local	SelfMoney = GetMoney(sceneId, selfId)  +  GetMoneyJZ(sceneId, selfId);   --交子普及 Vega
	if SelfMoney < cost then 
		return 0;
	end
	
	--删除跟骨 丹
	local bRet = DelItem(sceneId, selfId, nItemIdGenGuDan, 1)
	
	if bRet<=0 then
		local msg = format("删除道具失败！");
		x800106_NotifyTip(sceneId, selfId, msg );		
		return 0;
	end
	
	local costRet = LuaFnCostMoneyWithPriority(sceneId,selfId,cost)
	if costRet < 0 then
		return 0;
	end
		
	if rand > succRate then
		
		local nSavvyDown = GetLeveldownOfCompoundBySavvy( sceneId,selfId, savvy );
		if nSavvyDown > savvy then
			nSavvyDown = savvy;	
		end
		
		SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, savvy - nSavvyDown );
		
		Audit_PetImproveWuxing( sceneId, selfId, mainPetGuidH, mainPetGuidL, 0, savvy - nSavvyDown );
		
		local msg = format("合成失败，目前珍兽的悟性为%d", savvy - nSavvyDown );
		x800106_NotifyTip(sceneId, selfId, msg );
		return 0;
	end
	
	SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, nSavvyNeed )
	
	Audit_PetImproveWuxing( sceneId, selfId, mainPetGuidH, mainPetGuidL, 1, nSavvyNeed );
	
	local szPlayerName, szPetTransString;
	
	szPetTransString = GetPetTransString(  sceneId, selfId, mainPetGuidH, mainPetGuidL );
	szPlayerName = GetName( sceneId, selfId );
	
	local msg = format("恭喜您，合成成功，您的珍兽悟性＋1。");
	x800106_NotifyTip(sceneId, selfId, msg );

	--公告精简，悟性提升到7和以上才公告
	if nSavvyNeed >= 7 then
		
		local szMsg;
		szMsg = format("#{_INFOUSR%s}#{ZW_1}#{_INFOMSG%s}#{ZW_2}%d#{ZW_3}",szPlayerName, szPetTransString, nSavvyNeed );
		
		AddGlobalCountNews( sceneId, szMsg );
	
	end
	
	--成功的光效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
		
end


--**********************************
--醒目提示
--**********************************
function x800106_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

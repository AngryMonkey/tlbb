--夫妻技能学习

--脚本号
x806016_g_ScriptId		= 806016


--心心相印技能表....
x806016_g_skillList_XXXY = {

	{id=260, name="心心相印(1级)", firendPt=1000, lvM=0, lvF=0, exp=0, money=0},
	{id=261, name="心心相印(2级)", firendPt=2000, lvM=0, lvF=0, exp=0, money=442},
	{id=262, name="心心相印(3级)", firendPt=3000, lvM=0, lvF=0, exp=0, money=967},
	{id=263, name="心心相印(4级)", firendPt=4000, lvM=0, lvF=0, exp=0, money=1800},
	{id=264, name="心心相印(5级)", firendPt=5000, lvM=0, lvF=0, exp=0, money=3009},
	{id=265, name="心心相印(6级)", firendPt=6000, lvM=0, lvF=0, exp=0, money=4660},
	{id=266, name="心心相印(7级)", firendPt=7000, lvM=0, lvF=0, exp=0, money=6825},
	{id=267, name="心心相印(8级)", firendPt=8000, lvM=0, lvF=0, exp=0, money=13322},
	{id=268, name="心心相印(9级)", firendPt=9000, lvM=0, lvF=0, exp=0, money=23449}

};

--同气连枝技能表....
x806016_g_skillList_TQLZ = {

	{id=250, name="同气连枝(1级)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=251, name="同气连枝(2级)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=252, name="同气连枝(3级)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=253, name="同气连枝(4级)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=254, name="同气连枝(5级)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--天长地久技能表....
x806016_g_skillList_TCDJ = {

	{id=255, name="天长地久(1级)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=256, name="天长地久(2级)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=257, name="天长地久(3级)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=258, name="天长地久(4级)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=259, name="天长地久(5级)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--形影不离技能表....
x806016_g_skillList_XYBL = {

	{id=269, name="形影不离(1级)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=270, name="形影不离(2级)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=271, name="形影不离(3级)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=272, name="形影不离(4级)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=273, name="形影不离(5级)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--形影不离1级对应的技能ID
x806016_g_xybl_SkillID = 269
--学习形影不离1级需要的物品ID
x806016_g_xybl_ItemID = 30308059

--需要世界公告的技能编号表
x806016_g_MaxMarrySkill_T = {268,253,254,258,259,272,273};

--**********************************
--任务入口函数
--**********************************
function x806016_OnDefaultEvent(sceneId, selfId, targetId)

	local selectEventId	= GetNumText();

	if selectEventId == 0 then
		BeginEvent(sceneId);
			AddNumText(sceneId, x806016_g_ScriptId, "学习心心相印", 12, 11);
			AddNumText(sceneId, x806016_g_ScriptId, "学习同气连枝", 12, 12);
			AddNumText(sceneId, x806016_g_ScriptId, "学习天长地久", 12, 13);
			AddNumText(sceneId, x806016_g_ScriptId, "学习形影不离", 12, 14);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);

	elseif selectEventId == 11 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_XXXY );
		if ret > 0 then
			local skill = x806016_g_skillList_XXXY[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  心心相印可以增加配偶的体力，技能等级越高增加的体力越多。");
				if skill.money > 0 then
					AddText(sceneId, "  男方需要花费#{_EXCHG"..skill.money.."}学习"..skill.name.."。");
				end
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "升级技能", 12, 21);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "学习技能", 12, 21);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 12 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_TQLZ );
		if ret > 0 then
			local skill = x806016_g_skillList_TQLZ[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  同气连枝能够恢复配偶的血，技能等级越高，恢复的血越多。");
				AddText(sceneId, "  学习"..skill.name.."需要男方花费"..skill.exp.."经验和#{_EXCHG"..skill.money.."}。");
				AddText(sceneId, "  同时需要夫妻的好感度达到#G"..skill.firendPt.."#W，男方等级达到"..skill.lvM.."级，女方等级达到"..skill.lvF.."级。");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "升级技能", 12, 22);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "学习技能", 12, 22);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 13 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_TCDJ );
		if ret > 0 then
			local skill = x806016_g_skillList_TCDJ[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  天长地久可以复活配偶并回复一定比例的血气，技能等级越高，技能冷却时间越少。");
				AddText(sceneId, "  学习"..skill.name.."需要男方花费"..skill.exp.."经验和#{_EXCHG"..skill.money.."}。");
				AddText(sceneId, "  同时需要夫妻的好感度达到#G"..skill.firendPt.."#W，男方等级达到"..skill.lvM.."级，女方等级达到"..skill.lvF.."级。");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "升级技能", 12, 23);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "学习技能", 12, 23);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 14 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_XYBL );
		if ret > 0 then
			local skill = x806016_g_skillList_XYBL[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  形影不离可以同场景瞬间移动到配偶所在点，技能等级越高，技能冷却时间越少。");
				if skill.id == x806016_g_xybl_SkillID then
					AddText(sceneId, "  学习"..skill.name.."需要男方持有#G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W。");
				else
					AddText(sceneId, "  学习"..skill.name.."需要男方花费"..skill.exp.."经验和#{_EXCHG"..skill.money.."}。");
				end
				AddText(sceneId, "  同时需要夫妻的好感度达到#G"..skill.firendPt.."#W，男方等级达到"..skill.lvM.."级，女方等级达到"..skill.lvF.."级。");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "升级技能", 12, 24);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "学习技能", 12, 24);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 21 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_XXXY)

	elseif selectEventId == 22 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_TQLZ)

	elseif selectEventId == 23 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_TCDJ)

	elseif selectEventId == 24 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_XYBL)

	end

end

--**********************************
--列举事件
--**********************************
function x806016_OnEnumerate(sceneId, selfId, targetId)
	local isMarried = LuaFnIsMarried(sceneId, selfId);
	if isMarried and isMarried > 0 then
		AddNumText(sceneId, x806016_g_ScriptId, "学习夫妻技能", 12, 0);
	end
end

--**********************************
--检测是否可以学习某项夫妻技能....
--**********************************
function x806016_CheckStudySkill( sceneId, selfId, targetId, SkillList )

	--前提条件
	local szMsg = "如果想学习夫妻技能，请男女双方2人组成一队再来找我。"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "队伍必须只能由夫妻双方组成，队伍中不能有其他人员。"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "只有2人都走到我身边才可以学习技能。"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "不是夫妻不能学习夫妻技能。"
	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "内部错误，脚本不可以正常执行。"
	if LuaFnIsCanDoScriptLogic(sceneId, maleId) ~= 1 then
		return 0;
	end
	if LuaFnIsCanDoScriptLogic(sceneId, femaleId) ~= 1 then
		return 0;
	end
	
	szMsg = "双方必须互为好友才能学习夫妻技能。"
	local maleIsFirend, femaleIsFirend;
	maleIsFirend = LuaFnIsFriend(sceneId, maleId, femaleId);
	femaleIsFirend = LuaFnIsFriend(sceneId, femaleId, maleId);
	if maleIsFirend and maleIsFirend == 1 and femaleIsFirend and femaleIsFirend == 1 then
	else
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	local maleSkillLevel, femaleSkillLevel;
	maleSkillLevel = -1;
	femaleSkillLevel = -1;

	local skill, skillLevel;
	skillLevel = 0;
	--检查玩家的夫妻技能已经学到几级
	for _, skill in SkillList do
		local maleHaveSkill = HaveSkill(sceneId, maleId, skill.id);
		if maleHaveSkill and maleHaveSkill > 0 then
			maleSkillLevel = skillLevel;
		end
		
		local femaleHaveSkill = HaveSkill(sceneId, femaleId, skill.id);
		if femaleHaveSkill and femaleHaveSkill > 0 then
			femaleSkillLevel = skillLevel;
		end
		skillLevel  =skillLevel + 1;
	end
	
	local maxSkillLevel = skillLevel - 1;
	
	szMsg = "您此技能已经升级到最高，无法继续升级。"
	if maleSkillLevel >= maxSkillLevel then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	nextLevel = femaleSkillLevel+1;

	return 1, nextLevel, maleId, femaleId;

end

--**********************************
--学习技能
--**********************************
function x806016_StudySkill(sceneId, selfId, targetId, SkillList)

	--检测基本条件....
	local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, SkillList );
	if ret == 0 then
		return
	end

	local skill = SkillList[nextLevel+1];

	szMsg = "双方的友好度必须达到%d才可以学会下一项夫妻技能。"
	local maleFirendPt, femaleFirendPt, needFirendPt;
	maleFirendPt =  LuaFnGetFriendPoint(sceneId, maleId, femaleId);
	femaleFirendPt =  LuaFnGetFriendPoint(sceneId, femaleId, maleId);
	needFirendPt = skill.firendPt;
	if maleFirendPt >= needFirendPt and femaleFirendPt >= needFirendPt then
	else
		szMsg = format(szMsg, needFirendPt);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end

	szMsg = "男方等级必须达到%d才可以学会下一项夫妻技能。"
	if GetLevel( sceneId, maleId ) < skill.lvM then
		szMsg = format(szMsg, skill.lvM);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end

	szMsg = "女方等级必须达到%d才可以学会下一项夫妻技能。"
	if GetLevel( sceneId, femaleId ) < skill.lvF then
		szMsg = format(szMsg, skill.lvF);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end
	
	if skill.id == x806016_g_xybl_SkillID then
		if HaveItemInBag(sceneId,maleId,x806016_g_xybl_ItemID)<0 then
			x806016_MessageBox(sceneId, selfId, targetId, "男方需要持有#G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W才能学习该技能！");
			return
		end
		if LuaFnGetAvailableItemCount(sceneId,maleId,x806016_g_xybl_ItemID)<=0 then
			x806016_MessageBox(sceneId, selfId, targetId, "需求物品#G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W已加锁，请解锁后再学习！");
			return
		end
		--扣除物品
		LuaFnDelAvailableItem(sceneId,maleId,x806016_g_xybl_ItemID,1)
	else
		szMsg = "男方经验必须达到%d才可以学会下一项夫妻技能。"
		if GetExp(sceneId, maleId) < skill.exp then
			szMsg = format(szMsg, skill.exp);
			x806016_MessageBox(sceneId, selfId, targetId, szMsg);
			return
		end
	
		szMsg = "男方需要携带#{_EXCHG%d}才能学习技能。"
		local maleMoney, needMoney;
		maleMoney = LuaFnGetMoney(sceneId, maleId);
		needMoney = skill.money;
		
		if maleMoney and maleMoney+GetMoneyJZ(sceneId, maleId) >= needMoney then
		else
			szMsg = format(szMsg, needMoney);
			x806016_MessageBox(sceneId, selfId, targetId, szMsg);
			return
		end
	
		--扣除男方身上金钱....
		LuaFnCostMoneyWithPriority(sceneId, maleId, needMoney);
		
		--扣除男方身经验....
		if skill.exp > 0 then
			LuaFnAddExp( sceneId, maleId, -skill.exp );
		end
	end

	--增加一个夫妻技能给双方
	x806016_MyAddSkill(sceneId, maleId, SkillList, nextLevel);
	x806016_MyAddSkill( sceneId, femaleId, SkillList, nextLevel);
	x806016_SendWorldMsg(sceneId,maleId,femaleId,SkillList, nextLevel)
	--添加统计信息
	x806016_LogCoupleAction(sceneId,maleId,femaleId,SkillList, nextLevel)
	
	--成功学习后关闭对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	
	return

end

--**********************************
--添加一项夫妻技能
--**********************************
function x806016_MyAddSkill(sceneId, selfId, SkillList, nextLevel)

	--删除夫妻技能
	local tempSkill;
	for _, tempSkill in SkillList do
		local haveSkill = HaveSkill(sceneId, selfId, tempSkill.id);
		if haveSkill and haveSkill > 0 then
			DelSkill(sceneId, selfId, tempSkill.id);
		end
	end

	local skill = SkillList[nextLevel+1];

	AddSkill(sceneId, selfId, skill.id);
	--Msg2Player( sceneId, selfId, "你学会了"..skill.name.."。", MSG2PLAYER_PARA )
	
	--BeginEvent(sceneId)
		--AddText(sceneId, "你学会了"..skill.name.."。");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)
	
	if skill.id == x806016_g_xybl_SkillID then
		x806016_SendSkillMsg_XYBL(sceneId,selfId,skill.name)
	else
		x806016_SendSkillMsg(sceneId,selfId,skill.exp,skill.money,skill.name)
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x806016_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--学习形影不离1级时的提示信息
function x806016_SendSkillMsg_XYBL(sceneId,selfId,skname)
	if skname then
		local str = format("#I贵夫妇同心协力，排除万难，在男方耗费了#Y#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#I之后，终于学会了夫妻技能#Y%s。",skname)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--系统提示信息
function x806016_SendSkillMsg(sceneId,selfId,exp,money,skname)
	if exp and money and skname then
		local moneyt = format("#{_EXCHG%d}",money)
		local str = format("#I贵夫妇同心协力，排除万难，在男方耗费了#Y%d经验和%s金钱#I之后，终于学会了夫妻技能#Y%s。",exp,moneyt,skname)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--世界提示信息
function x806016_SendWorldMsg(sceneId,maleId,femaleId,SkillList, nextLevel)
	local skill = SkillList[nextLevel+1]
	
	if maleId and femaleId and skill then
		for _, tempId in x806016_g_MaxMarrySkill_T do
			if tempId == skill.id then
					local uname = format("#{_INFOUSR%s}",GetName(sceneId,maleId))
					local oname = format("#{_INFOUSR%s}",GetName(sceneId,femaleId))
					local str = format("#W%s#I与#W%s#I夫妻同心，终于苦尽甘来，学会了#cff66cc%s#I，不愧是所有夫妻的楷模。",uname,oname,skill.name)
					BroadMsgByChatPipe(sceneId, maleId, str, 4)
				return
			end -- end if tempId
		end -- end for
	end -- end if maleId
	
end

--统计信息
function x806016_LogCoupleAction(sceneId,tid1,tid2,SkillList,nextLevel)
	local skill = SkillList[nextLevel+1]
	local logid = COUPLE_LOG_LEVELUPSKILL
	if nextLevel == 0 then logid = COUPLE_LOG_LEARNSKILL end
	
	if skill and logid and COUPLE_LOG_DETAIL[logid] then
		--CPL:编号,说明,GUID1,GUID2,技能ID,技能名称,时间
		local logstr = format("CPL:%d,%s,0x%X,0x%X,%d,%s",
									 				logid,
									 				COUPLE_LOG_DETAIL[logid],
									 				LuaFnGetGUID(sceneId,tid1),
									 				LuaFnGetGUID(sceneId,tid2),
									 				skill.id,
									 				skill.name)
		LogCouple(logstr)
	end
end

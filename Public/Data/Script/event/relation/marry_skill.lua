--���޼���ѧϰ

--�ű���
x806016_g_ScriptId		= 806016


--������ӡ���ܱ�....
x806016_g_skillList_XXXY = {

	{id=260, name="������ӡ(1��)", firendPt=1000, lvM=0, lvF=0, exp=0, money=0},
	{id=261, name="������ӡ(2��)", firendPt=2000, lvM=0, lvF=0, exp=0, money=442},
	{id=262, name="������ӡ(3��)", firendPt=3000, lvM=0, lvF=0, exp=0, money=967},
	{id=263, name="������ӡ(4��)", firendPt=4000, lvM=0, lvF=0, exp=0, money=1800},
	{id=264, name="������ӡ(5��)", firendPt=5000, lvM=0, lvF=0, exp=0, money=3009},
	{id=265, name="������ӡ(6��)", firendPt=6000, lvM=0, lvF=0, exp=0, money=4660},
	{id=266, name="������ӡ(7��)", firendPt=7000, lvM=0, lvF=0, exp=0, money=6825},
	{id=267, name="������ӡ(8��)", firendPt=8000, lvM=0, lvF=0, exp=0, money=13322},
	{id=268, name="������ӡ(9��)", firendPt=9000, lvM=0, lvF=0, exp=0, money=23449}

};

--ͬ����֦���ܱ�....
x806016_g_skillList_TQLZ = {

	{id=250, name="ͬ����֦(1��)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=251, name="ͬ����֦(2��)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=252, name="ͬ����֦(3��)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=253, name="ͬ����֦(4��)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=254, name="ͬ����֦(5��)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--�쳤�ؾü��ܱ�....
x806016_g_skillList_TCDJ = {

	{id=255, name="�쳤�ؾ�(1��)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=256, name="�쳤�ؾ�(2��)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=257, name="�쳤�ؾ�(3��)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=258, name="�쳤�ؾ�(4��)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=259, name="�쳤�ؾ�(5��)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--��Ӱ���뼼�ܱ�....
x806016_g_skillList_XYBL = {

	{id=269, name="��Ӱ����(1��)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=270, name="��Ӱ����(2��)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=271, name="��Ӱ����(3��)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=272, name="��Ӱ����(4��)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=273, name="��Ӱ����(5��)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--��Ӱ����1����Ӧ�ļ���ID
x806016_g_xybl_SkillID = 269
--ѧϰ��Ӱ����1����Ҫ����ƷID
x806016_g_xybl_ItemID = 30308059

--��Ҫ���繫��ļ��ܱ�ű�
x806016_g_MaxMarrySkill_T = {268,253,254,258,259,272,273};

--**********************************
--������ں���
--**********************************
function x806016_OnDefaultEvent(sceneId, selfId, targetId)

	local selectEventId	= GetNumText();

	if selectEventId == 0 then
		BeginEvent(sceneId);
			AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ������ӡ", 12, 11);
			AddNumText(sceneId, x806016_g_ScriptId, "ѧϰͬ����֦", 12, 12);
			AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ�쳤�ؾ�", 12, 13);
			AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ��Ӱ����", 12, 14);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);

	elseif selectEventId == 11 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_XXXY );
		if ret > 0 then
			local skill = x806016_g_skillList_XXXY[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  ������ӡ����������ż�����������ܵȼ�Խ�����ӵ�����Խ�ࡣ");
				if skill.money > 0 then
					AddText(sceneId, "  �з���Ҫ����#{_EXCHG"..skill.money.."}ѧϰ"..skill.name.."��");
				end
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "��������", 12, 21);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ����", 12, 21);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 12 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_TQLZ );
		if ret > 0 then
			local skill = x806016_g_skillList_TQLZ[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  ͬ����֦�ܹ��ָ���ż��Ѫ�����ܵȼ�Խ�ߣ��ָ���ѪԽ�ࡣ");
				AddText(sceneId, "  ѧϰ"..skill.name.."��Ҫ�з�����"..skill.exp.."�����#{_EXCHG"..skill.money.."}��");
				AddText(sceneId, "  ͬʱ��Ҫ���޵ĺøжȴﵽ#G"..skill.firendPt.."#W���з��ȼ��ﵽ"..skill.lvM.."����Ů���ȼ��ﵽ"..skill.lvF.."����");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "��������", 12, 22);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ����", 12, 22);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 13 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_TCDJ );
		if ret > 0 then
			local skill = x806016_g_skillList_TCDJ[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  �쳤�ؾÿ��Ը�����ż���ظ�һ��������Ѫ�������ܵȼ�Խ�ߣ�������ȴʱ��Խ�١�");
				AddText(sceneId, "  ѧϰ"..skill.name.."��Ҫ�з�����"..skill.exp.."�����#{_EXCHG"..skill.money.."}��");
				AddText(sceneId, "  ͬʱ��Ҫ���޵ĺøжȴﵽ#G"..skill.firendPt.."#W���з��ȼ��ﵽ"..skill.lvM.."����Ů���ȼ��ﵽ"..skill.lvF.."����");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "��������", 12, 23);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ����", 12, 23);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 14 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_XYBL );
		if ret > 0 then
			local skill = x806016_g_skillList_XYBL[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  ��Ӱ�������ͬ����˲���ƶ�����ż���ڵ㣬���ܵȼ�Խ�ߣ�������ȴʱ��Խ�١�");
				if skill.id == x806016_g_xybl_SkillID then
					AddText(sceneId, "  ѧϰ"..skill.name.."��Ҫ�з�����#G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W��");
				else
					AddText(sceneId, "  ѧϰ"..skill.name.."��Ҫ�з�����"..skill.exp.."�����#{_EXCHG"..skill.money.."}��");
				end
				AddText(sceneId, "  ͬʱ��Ҫ���޵ĺøжȴﵽ#G"..skill.firendPt.."#W���з��ȼ��ﵽ"..skill.lvM.."����Ů���ȼ��ﵽ"..skill.lvF.."����");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "��������", 12, 24);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ����", 12, 24);
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
--�о��¼�
--**********************************
function x806016_OnEnumerate(sceneId, selfId, targetId)
	local isMarried = LuaFnIsMarried(sceneId, selfId);
	if isMarried and isMarried > 0 then
		AddNumText(sceneId, x806016_g_ScriptId, "ѧϰ���޼���", 12, 0);
	end
end

--**********************************
--����Ƿ����ѧϰĳ����޼���....
--**********************************
function x806016_CheckStudySkill( sceneId, selfId, targetId, SkillList )

	--ǰ������
	local szMsg = "�����ѧϰ���޼��ܣ�����Ů˫��2�����һ���������ҡ�"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "�������ֻ���ɷ���˫����ɣ������в�����������Ա��"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "ֻ��2�˶��ߵ�����߲ſ���ѧϰ���ܡ�"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "���Ƿ��޲���ѧϰ���޼��ܡ�"
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

	szMsg = "�ڲ����󣬽ű�����������ִ�С�"
	if LuaFnIsCanDoScriptLogic(sceneId, maleId) ~= 1 then
		return 0;
	end
	if LuaFnIsCanDoScriptLogic(sceneId, femaleId) ~= 1 then
		return 0;
	end
	
	szMsg = "˫�����뻥Ϊ���Ѳ���ѧϰ���޼��ܡ�"
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
	--�����ҵķ��޼����Ѿ�ѧ������
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
	
	szMsg = "���˼����Ѿ���������ߣ��޷�����������"
	if maleSkillLevel >= maxSkillLevel then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	nextLevel = femaleSkillLevel+1;

	return 1, nextLevel, maleId, femaleId;

end

--**********************************
--ѧϰ����
--**********************************
function x806016_StudySkill(sceneId, selfId, targetId, SkillList)

	--����������....
	local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, SkillList );
	if ret == 0 then
		return
	end

	local skill = SkillList[nextLevel+1];

	szMsg = "˫�����Ѻöȱ���ﵽ%d�ſ���ѧ����һ����޼��ܡ�"
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

	szMsg = "�з��ȼ�����ﵽ%d�ſ���ѧ����һ����޼��ܡ�"
	if GetLevel( sceneId, maleId ) < skill.lvM then
		szMsg = format(szMsg, skill.lvM);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end

	szMsg = "Ů���ȼ�����ﵽ%d�ſ���ѧ����һ����޼��ܡ�"
	if GetLevel( sceneId, femaleId ) < skill.lvF then
		szMsg = format(szMsg, skill.lvF);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end
	
	if skill.id == x806016_g_xybl_SkillID then
		if HaveItemInBag(sceneId,maleId,x806016_g_xybl_ItemID)<0 then
			x806016_MessageBox(sceneId, selfId, targetId, "�з���Ҫ����#G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W����ѧϰ�ü��ܣ�");
			return
		end
		if LuaFnGetAvailableItemCount(sceneId,maleId,x806016_g_xybl_ItemID)<=0 then
			x806016_MessageBox(sceneId, selfId, targetId, "������Ʒ#G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W�Ѽ��������������ѧϰ��");
			return
		end
		--�۳���Ʒ
		LuaFnDelAvailableItem(sceneId,maleId,x806016_g_xybl_ItemID,1)
	else
		szMsg = "�з��������ﵽ%d�ſ���ѧ����һ����޼��ܡ�"
		if GetExp(sceneId, maleId) < skill.exp then
			szMsg = format(szMsg, skill.exp);
			x806016_MessageBox(sceneId, selfId, targetId, szMsg);
			return
		end
	
		szMsg = "�з���ҪЯ��#{_EXCHG%d}����ѧϰ���ܡ�"
		local maleMoney, needMoney;
		maleMoney = LuaFnGetMoney(sceneId, maleId);
		needMoney = skill.money;
		
		if maleMoney and maleMoney+GetMoneyJZ(sceneId, maleId) >= needMoney then
		else
			szMsg = format(szMsg, needMoney);
			x806016_MessageBox(sceneId, selfId, targetId, szMsg);
			return
		end
	
		--�۳��з����Ͻ�Ǯ....
		LuaFnCostMoneyWithPriority(sceneId, maleId, needMoney);
		
		--�۳��з�����....
		if skill.exp > 0 then
			LuaFnAddExp( sceneId, maleId, -skill.exp );
		end
	end

	--����һ�����޼��ܸ�˫��
	x806016_MyAddSkill(sceneId, maleId, SkillList, nextLevel);
	x806016_MyAddSkill( sceneId, femaleId, SkillList, nextLevel);
	x806016_SendWorldMsg(sceneId,maleId,femaleId,SkillList, nextLevel)
	--���ͳ����Ϣ
	x806016_LogCoupleAction(sceneId,maleId,femaleId,SkillList, nextLevel)
	
	--�ɹ�ѧϰ��رնԻ�����....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	
	return

end

--**********************************
--���һ����޼���
--**********************************
function x806016_MyAddSkill(sceneId, selfId, SkillList, nextLevel)

	--ɾ�����޼���
	local tempSkill;
	for _, tempSkill in SkillList do
		local haveSkill = HaveSkill(sceneId, selfId, tempSkill.id);
		if haveSkill and haveSkill > 0 then
			DelSkill(sceneId, selfId, tempSkill.id);
		end
	end

	local skill = SkillList[nextLevel+1];

	AddSkill(sceneId, selfId, skill.id);
	--Msg2Player( sceneId, selfId, "��ѧ����"..skill.name.."��", MSG2PLAYER_PARA )
	
	--BeginEvent(sceneId)
		--AddText(sceneId, "��ѧ����"..skill.name.."��");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)
	
	if skill.id == x806016_g_xybl_SkillID then
		x806016_SendSkillMsg_XYBL(sceneId,selfId,skill.name)
	else
		x806016_SendSkillMsg(sceneId,selfId,skill.exp,skill.money,skill.name)
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806016_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--ѧϰ��Ӱ����1��ʱ����ʾ��Ϣ
function x806016_SendSkillMsg_XYBL(sceneId,selfId,skname)
	if skname then
		local str = format("#I���ͬ��Э�����ų����ѣ����з��ķ���#Y#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#I֮������ѧ���˷��޼���#Y%s��",skname)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--ϵͳ��ʾ��Ϣ
function x806016_SendSkillMsg(sceneId,selfId,exp,money,skname)
	if exp and money and skname then
		local moneyt = format("#{_EXCHG%d}",money)
		local str = format("#I���ͬ��Э�����ų����ѣ����з��ķ���#Y%d�����%s��Ǯ#I֮������ѧ���˷��޼���#Y%s��",exp,moneyt,skname)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--������ʾ��Ϣ
function x806016_SendWorldMsg(sceneId,maleId,femaleId,SkillList, nextLevel)
	local skill = SkillList[nextLevel+1]
	
	if maleId and femaleId and skill then
		for _, tempId in x806016_g_MaxMarrySkill_T do
			if tempId == skill.id then
					local uname = format("#{_INFOUSR%s}",GetName(sceneId,maleId))
					local oname = format("#{_INFOUSR%s}",GetName(sceneId,femaleId))
					local str = format("#W%s#I��#W%s#I����ͬ�ģ����ڿྡ������ѧ����#cff66cc%s#I�����������з��޵Ŀ�ģ��",uname,oname,skill.name)
					BroadMsgByChatPipe(sceneId, maleId, str, 4)
				return
			end -- end if tempId
		end -- end for
	end -- end if maleId
	
end

--ͳ����Ϣ
function x806016_LogCoupleAction(sceneId,tid1,tid2,SkillList,nextLevel)
	local skill = SkillList[nextLevel+1]
	local logid = COUPLE_LOG_LEVELUPSKILL
	if nextLevel == 0 then logid = COUPLE_LOG_LEARNSKILL end
	
	if skill and logid and COUPLE_LOG_DETAIL[logid] then
		--CPL:���,˵��,GUID1,GUID2,����ID,��������,ʱ��
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

--��翷帱��....

--�ű���
x899993_g_ScriptId = 899993

x899993_g_CopySceneType = FUBEN_DAZHAN_SJZ	--�������ͣ�������ScriptGlobal.lua����

x899993_g_TickTime		= 1				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x899993_g_NoUserTime	= 300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x899993_g_Fuben_X			= 22			--���븱����λ��X
x899993_g_Fuben_Z			= 16			--���븱����λ��Z
x899993_g_FuBenTime		= 3*60*60	--�����ر�ʱ��....

--BOSS��....
x899993_g_BOSSList =
{
	["HaDaBa_NPC"]				= { DataID=14101, Title="", posX=99, posY=88, Dir=0, BaseAI=3, AIScript=0, ScriptID=910001 },--��ī
	["HaDaBa1_BOSS"]				= { DataID=14101, Title="", posX=99, posY=88, Dir=0, BaseAI=27, AIScript=0, ScriptID=910005 },
	["HaDaBa2_BOSS"]				= { DataID=14102, Title="", posX=99, posY=88, Dir=0, BaseAI=27, AIScript=0, ScriptID=910005 },
	["HaDaBa3_BOSS"]				= { DataID=14103, Title="", posX=99, posY=88, Dir=0, BaseAI=27, AIScript=0, ScriptID=910005 },
	["HaDaBa4_BOSS"]				= { DataID=14104, Title="", posX=99, posY=88, Dir=0, BaseAI=27, AIScript=0, ScriptID=910005 },
	["HaDaBa5_BOSS"]				= { DataID=14105, Title="", posX=99, posY=88, Dir=0, BaseAI=27, AIScript=0, ScriptID=910005 },
	["HaDaBa6_BOSS"]				= { DataID=14106, Title="", posX=99, posY=88, Dir=0, BaseAI=27, AIScript=0, ScriptID=910005 },

	["SangTuGong_NPC"]		= { DataID=14120, Title="", posX=27, posY=100, Dir=0, BaseAI=3, AIScript=0, ScriptID=910002 },--����
	["SangTuGong1_BOSS"]		= { DataID=14120, Title="", posX=27, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=910006 },
	["SangTuGong2_BOSS"]		= { DataID=14121, Title="", posX=27, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=910006 },
	["SangTuGong3_BOSS"]		= { DataID=14122, Title="", posX=27, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=910006 },
	["SangTuGong4_BOSS"]		= { DataID=14123, Title="", posX=27, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=910006 },
	["SangTuGong5_BOSS"]		= { DataID=14124, Title="", posX=27, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=910006 },
	["SangTuGong6_BOSS"]		= { DataID=14125, Title="", posX=27, posY=100, Dir=0, BaseAI=27, AIScript=0, ScriptID=910006 },
	["JiangShi_BOSS"]			= { DataID=14126, Title="", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },

	["WuLaoDa_NPC"]				= { DataID=14127, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=3, AIScript=0, ScriptID=910003 },--����
	["WuLaoDaLoss_NPC"]		= { DataID=14127, Title="����֮��", posX=0, posY=0, Dir=0, BaseAI=3, AIScript=0, ScriptID=402275 },
	["WuLaoDa1_BOSS"]			= { DataID=14127, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=27, AIScript=0, ScriptID=910007 },
	["WuLaoDa2_BOSS"]			= { DataID=14128, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=27, AIScript=0, ScriptID=910007 },
	["WuLaoDa3_BOSS"]			= { DataID=14129, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=27, AIScript=0, ScriptID=910007 },
	["WuLaoDa4_BOSS"]			= { DataID=14130, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=27, AIScript=0, ScriptID=910007 },
	["WuLaoDa5_BOSS"]			= { DataID=14131, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=27, AIScript=0, ScriptID=910007 },
	["WuLaoDa6_BOSS"]			= { DataID=14132, Title="����֮��", posX=100, posY=33, Dir=11, BaseAI=27, AIScript=0, ScriptID=910007 },

	["ZhuoBuFan_NPC"]			= { DataID=14140, Title="����", posX=30, posY=28, Dir=11, BaseAI=3, AIScript=0, ScriptID=910004 },--����
	["ZhuoBuFan1_BOSS"]		= { DataID=14140, Title="����", posX=30, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=910008 },
	["ZhuoBuFan2_BOSS"]		= { DataID=14141, Title="����", posX=30, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=910008 },
	["ZhuoBuFan3_BOSS"]		= { DataID=14142, Title="����", posX=30, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=910008 },
	["ZhuoBuFan4_BOSS"]		= { DataID=14143, Title="����", posX=30, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=910008 },
	["ZhuoBuFan5_BOSS"]		= { DataID=14144, Title="����", posX=30, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=910008 },
	["ZhuoBuFan6_BOSS"]		= { DataID=14145, Title="����", posX=30, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=910008 },
	["xingluo1_BOSS"]			= { DataID=14167, Title="", posX=23, posY=23, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo2_BOSS"]			= { DataID=14167, Title="", posX=30, posY=23, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo3_BOSS"]			= { DataID=14167, Title="", posX=37, posY=23, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo4_BOSS"]			= { DataID=14167, Title="", posX=37, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo5_BOSS"]			= { DataID=14167, Title="", posX=37, posY=33, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo6_BOSS"]			= { DataID=14167, Title="", posX=30, posY=33, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo7_BOSS"]			= { DataID=14167, Title="", posX=23, posY=33, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo8_BOSS"]			= { DataID=14167, Title="", posX=23, posY=28, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo9_BOSS"]			= { DataID=14167, Title="", posX=30, posY=32, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["xingluo10_BOSS"]			= { DataID=14167, Title="", posX=30, posY=24, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["BuPingDaoRen_BOSS"]	= { DataID=9545, Title="����", posX=129, posY=31, Dir=0, BaseAI=27, AIScript=261, ScriptID=402268 },

	["DuanMuYuan_BOSS"]		= { DataID=9547, Title="", posX=125, posY=36, Dir=0, BaseAI=0, AIScript=0, ScriptID=402274 },

	["FuMinYi_NPC"]				= { DataID=9552, Title="", posX=159, posY=54, Dir=11, BaseAI=3, AIScript=0, ScriptID=402273 },

	["LiQiuShui_BOSS"]		= { DataID=9546, Title="����Ů��", posX=125, posY=36, Dir=11, BaseAI=27, AIScript=0, ScriptID=402269 },
}

x899993_g_FightBOSSList =
{
	[1] = x899993_g_BOSSList["HaDaBa1_BOSS"].DataID,
	[2] = x899993_g_BOSSList["HaDaBa2_BOSS"].DataID,
	[3] = x899993_g_BOSSList["HaDaBa3_BOSS"].DataID,
	[4] = x899993_g_BOSSList["HaDaBa4_BOSS"].DataID,
	[5] = x899993_g_BOSSList["HaDaBa5_BOSS"].DataID,
	[6] = x899993_g_BOSSList["HaDaBa6_BOSS"].DataID,

	[7] = x899993_g_BOSSList["SangTuGong1_BOSS"].DataID,
	[8] = x899993_g_BOSSList["SangTuGong2_BOSS"].DataID,
	[9] = x899993_g_BOSSList["SangTuGong3_BOSS"].DataID,
	[10] = x899993_g_BOSSList["SangTuGong4_BOSS"].DataID,
	[11] = x899993_g_BOSSList["SangTuGong5_BOSS"].DataID,
	[12] = x899993_g_BOSSList["SangTuGong6_BOSS"].DataID,

	[13] = x899993_g_BOSSList["WuLaoDa1_BOSS"].DataID,
	[14] = x899993_g_BOSSList["WuLaoDa2_BOSS"].DataID,
	[15] = x899993_g_BOSSList["WuLaoDa3_BOSS"].DataID,
	[16] = x899993_g_BOSSList["WuLaoDa4_BOSS"].DataID,
	[17] = x899993_g_BOSSList["WuLaoDa5_BOSS"].DataID,
	[18] = x899993_g_BOSSList["WuLaoDa6_BOSS"].DataID,

	[19] = x899993_g_BOSSList["ZhuoBuFan1_BOSS"].DataID,
	[20] = x899993_g_BOSSList["ZhuoBuFan2_BOSS"].DataID,
	[21] = x899993_g_BOSSList["ZhuoBuFan3_BOSS"].DataID,
	[22] = x899993_g_BOSSList["ZhuoBuFan4_BOSS"].DataID,
	[23] = x899993_g_BOSSList["ZhuoBuFan5_BOSS"].DataID,
	[24] = x899993_g_BOSSList["ZhuoBuFan6_BOSS"].DataID,
--	[5] = x899993_g_BOSSList["BuPingDaoRen_BOSS"].DataID,
--	[6] = x899993_g_BOSSList["LiQiuShui_BOSS"].DataID
}

--�Ƿ������սĳ��BOSS�ı���б�....
x899993_g_BattleFlagTbl = 
{
	["HaDaBa"]			= 8,	--�Ƿ������ս�����...
	["SangTuGong"]	= 9,	--�Ƿ������սɣ����....
	["WuLaoDa"]			= 10,	--�Ƿ������ս���ϴ�....
	["ShuangZi"]		= 11,	--�Ƿ������ս˫��....
	["LiQiuShui"]		= 12,	--�Ƿ������ս����ˮ....
}

--������������....�Ƿ������սĳ��BOSS�ı��....
-- 0=������ս 1=������ս 2=�Ѿ���ս����
x899993_g_IDX_BattleFlag_Hadaba			= 8
x899993_g_IDX_BattleFlag_Sangtugong	= 9
x899993_g_IDX_BattleFlag_Wulaoda		= 10
x899993_g_IDX_BattleFlag_Shuangzi		= 11
x899993_g_IDX_BattleFlag_Liqiushui	= 12

x899993_g_IDX_FuBenOpenTime		= 13	--����������ʱ��....
x899993_g_IDX_FuBenLifeStep		= 14	--���������ڵ�step....(��������NPC....�رյ���ʱ��ʾ....)

--������������....ͨ�õ���翷��ʱ��....��Ҫ���ڼ���BOSSս��....
x899993_g_IDX_PMFTimerStep			= 15
x899993_g_IDX_PMFTimerScriptID	= 16

--������������....���ϴ������ļ�ʱ��....���ڴ��������߼�....
x899993_g_IDX_WuLaoDaDieStep				= 17
x899993_g_IDX_WuLaoDaDieScriptID		= 18
x899993_g_IDX_WuLaoDaDiePosX				=	19
x899993_g_IDX_WuLaoDaDiePosY				=	20


--**********************************
--������ں���....
--**********************************
function x899993_OnDefaultEvent( sceneId, selfId, targetId )

	--����Ƿ���Խ��븱��....
	local ret, msg = x899993_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�ر�NPC�Ի�����....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x899993_MakeCopyScene( sceneId, selfId )

end

--**********************************
--�о��¼�
--**********************************
function x899993_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x899993_g_ScriptId, "��ս��翷�", 10, 1 )

end

--**********************************
--����Ƿ���Խ���˸���....
--**********************************
function x899993_CheckCanEnter( sceneId, selfId, targetId )

	--�Ƿ��ж���....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--�ǲ��Ƕӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--�����Ƿ�....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "#{PMF_20080521_04}"
	end

	--�Ƿ��ڸ���....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--�Ƿ����˲���90��....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 90 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "    ���鵱�е�"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "��"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "����Ϊ��ǳ�����ǲ�ҪȥΪ�"
		return 0, msg

	end


	--�Ƿ����˽�������3����....
--	nHumanNum = 0
--	local CurDayTime = GetDayTime()
--	for i=0, NearTeamSize-1 do

--		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
--		local lastTime = GetMissionData( sceneId, PlayerId, MD_PIAOMIAOFENG_LASTTIME )
--		local lastDayTime = floor( lastTime / 100 )
--		local lastDayCount = mod( lastTime, 100 )
	
--		if CurDayTime > lastDayTime then
--			lastDayTime = CurDayTime
--			lastDayCount = 0
--		end

--		if lastDayCount >= 5 then
--			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
--			nHumanNum = nHumanNum + 1
--		end

	end

--	if nHumanNum > 0 then

--		local msg = "    "
--		for i=0, nHumanNum-2 do
--			msg = msg .. Humanlist[i] .. "��"
--		end
--		msg = msg .. Humanlist[nHumanNum-1] .. "�����Ѿ���ս��5����翷��ˡ�"
--		return 0, msg

--	end

--	return 1

--end

--**********************************
--��������....
--**********************************
function x899993_MakeCopyScene( sceneId, selfId )
	-- ʹ�ö�Ա�ĵȼ����������ĵȼ�
	local param0 = 4;
	local param1 = 3;

	--���ս��
	local mylevel = 0;

	--��ʱ����
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1  then  --û�ж���
		mylevel = GetLevel(sceneId, selfId)
	end
	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "sijuezhuang.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x899993_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x899993_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x899993_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x899993_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = PlayerMaxLevel/10;
	end

	-- ʹ�õ�13λ����¼����ʵ�ʵĵȼ�
	LuaFnSetCopySceneData_Param(sceneId, 11, mylevel)

	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_BattleFlag_Hadaba, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_BattleFlag_Sangtugong, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_BattleFlag_Wulaoda, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_BattleFlag_Shuangzi, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_BattleFlag_Liqiushui, 1 )

	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "sijuezhuang_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "sijuezhuang_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"ǰ������̳");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--�����¼�....
--**********************************
function x899993_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1�����������û����ӣ��ʹ����������Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 13)
	local nMonsterLevel = LuaFnGetCopySceneData_Param(sceneId,11)
	LuaFnSetCopySceneData_Param(sceneId, 13, 1)
	LuaFnSetCopySceneData_Param(sceneId, 13, nStep + 1)
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--ͳ�ƴ�����������....
	AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x899993_g_Fuben_X, x899993_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x899993_g_Fuben_X, x899993_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x899993_g_Fuben_X, x899993_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--����������ʱ���¼�....
--**********************************
function x899993_OnCopySceneTimer( sceneId, nowTime )

	x899993_TickFubenLife( sceneId, nowTime )

	x899993_TickPMFTimer( sceneId, nowTime )

	x899993_TickWuLaoDaDieTimer( sceneId, nowTime )

	x899993_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--����ҽ��븱���¼�....
--**********************************
function x899993_OnPlayerEnter( sceneId, selfId )

	--���������¼�....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x899993_g_Fuben_X, x899993_g_Fuben_Z )

	--������ս��һ����翷�....
--	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_LASTTIME )
--	local lastDayTime = floor( lastTime / 100 )
--	local lastDayCount = mod( lastTime, 100 )
--	local CurDayTime = GetDayTime()

--	if CurDayTime > lastDayTime then
--		lastDayTime = CurDayTime
--		lastDayCount = 0
--	end

--	lastDayCount = lastDayCount + 1
--	lastTime = lastDayTime * 100 + lastDayCount
--	SetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_LASTTIME, lastTime )

end

--**********************************
--������ڸ����������¼�....
--**********************************
function x899993_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--��ʾ���и��������....
--**********************************
function x899993_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick����������....
--**********************************
function x899993_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x899993_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 16 )

		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 15 )
		x899993_TipAllHuman( sceneId, "��������1���رա�" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 14 )
		x899993_TipAllHuman( sceneId, "��������2���رա�" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 13 )
		x899993_TipAllHuman( sceneId, "��������3���رա�" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 12 )
		x899993_TipAllHuman( sceneId, "��������4���رա�" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 11 )
		x899993_TipAllHuman( sceneId, "��������5���رա�" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 10 )
		x899993_TipAllHuman( sceneId, "��������10���رա�" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 9 )
		x899993_TipAllHuman( sceneId, "��������30���رա�" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 8 )
		x899993_TipAllHuman( sceneId, "��������1���Ӻ�رա�" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 7 )
		x899993_TipAllHuman( sceneId, "��������2���Ӻ�رա�" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 6 )
		x899993_TipAllHuman( sceneId, "��������3���Ӻ�رա�" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 5 )
		x899993_TipAllHuman( sceneId, "��������5���Ӻ�رա�" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 4 )
		x899993_TipAllHuman( sceneId, "��������15���Ӻ�رա�" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 3 )
		x899993_TipAllHuman( sceneId, "��������30���Ӻ�رա�" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 2 )
		x899993_TipAllHuman( sceneId, "��������60���Ӻ�رա�" )
		return
	end

	--��ʼ�������ڵ�NPC....
	if lifeStep == 0 then

		local MstId = x899993_CreateBOSS( sceneId, "HaDaBa_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x899993_CreateBOSS( sceneId, "SangTuGong_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x899993_CreateBOSS( sceneId, "WuLaoDa_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x899993_CreateBOSS( sceneId, "ZhuoBuFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick��翷��ʱ��....
--**********************************
function x899993_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerScriptID )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--������翷��ʱ��....
--**********************************
function x899993_OpenPMFTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerScriptID, ScriptID )

end

--**********************************
--��ǰ��翷��ʱ���Ƿ񼤻�....
--**********************************
function x899993_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick���ϴ�������ʱ��....
--**********************************
function x899993_TickWuLaoDaDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosY )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnHaDaBaDieTimer", sceneId, step, posX, posY )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieStep, step )
	end

end

--**********************************
--�������ϴ�������ʱ��....
--**********************************
function x899993_OpenWuLaoDaDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x899993_g_IDX_WuLaoDaDiePosY, posY )

end

--**********************************
--Tick��������....
--ֻҪ���վ�ڳ������6��������....ÿ�붼�ܻ��һ�����߽����buff....
--**********************************
function x899993_TickJianWuArea( sceneId, nowTime )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then

			local x,z = GetWorldPos( sceneId, nHumanId )
			local buff1 = -1
			local buff2 = 10376

			if x>=112 and x<=116 and z>=27 and z<=31 then
				buff1 = 10370
			elseif x>=134 and x<=138 and z>=27 and z<=31 then
				buff1 = 10374
			elseif x>=145 and x<=149 and z>=46 and z<=50 then
				buff1 = 10375
			elseif x>=134 and x<=138 and z>=65 and z<=69 then
				buff1 = 10371
			elseif x>=112 and x<=116 and z>=65 and z<=69 then
				buff1 = 10373
			elseif x>=101 and x<=105 and z>=46 and z<=50 then
				buff1 = 10372
			end

			if buff1 ~= -1 then
				LuaFnSendSpecificImpactToUnit(sceneId, nHumanId, nHumanId, nHumanId, buff1, 0)
				LuaFnSendSpecificImpactToUnit(sceneId, nHumanId, nHumanId, nHumanId, buff2, 0)
			end

		end
	end

end

--**********************************
--����ָ��BOSS....
--**********************************
function x899993_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x899993_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--ͳ�ƴ���BOSS....
	AuditPMFCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--ɾ��ָ��BOSS....
--**********************************
function x899993_DeleteBOSS( sceneId, name )

	local BOSSData = x899993_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--Ѱ��ָ��BOSS....
--**********************************
function x899993_FindBOSS( sceneId, name )

	local BOSSData = x899993_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--��⵱ǰ�Ƿ��Ѿ�����һ��BOSS��....
--**********************************
function x899993_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x899993_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end

	if nBossNum > 0 then
		local msg = "����"
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. "��"
		end
		msg = msg .. BossList[nBossNum-1] .. "ս����"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--��ȡ�Ƿ������սĳ��BOSS�ı��....
--**********************************
function x899993_GetBossBattleFlag( sceneId, bossName )

	local idx = x899993_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--�����Ƿ������սĳ��BOSS�ı��....
--**********************************
function x899993_SetBossBattleFlag( sceneId, bossName, bCan )

--	local idx = x899993_g_BattleFlagTbl[ bossName ]
--	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end

--��翷帱��....

--�ű���
x402082_g_ScriptId = 402082

x402082_g_CopySceneType = FUBEN_BINGSHENGQIZHEN	--�������ͣ�������ScriptGlobal.lua����

x402082_g_TickTime		= 1				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x402082_g_NoUserTime	= 300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x402082_g_Fuben_X			= 128			--���븱����λ��X
x402082_g_Fuben_Z			= 141			--���븱����λ��Z
x402082_g_FuBenTime		= 3*60*60	--�����ر�ʱ��....

--BOSS��....
x402082_g_BOSSList =
{
	["HaDaBa_NPC"]				= { DataID=15106, Title="", posX=50, posY=53, Dir=0, BaseAI=3, AIScript=0, ScriptID=402075 },--���ݷ�
	["HaDaBa1_BOSS"]				= { DataID=15106, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa2_BOSS"]				= { DataID=15107, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa3_BOSS"]				= { DataID=15108, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa4_BOSS"]				= { DataID=15109, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa5_BOSS"]				= { DataID=15110, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["fengzhenshouwei1_BOSS"]				= { DataID=15103, Title="", posX=42, posY=53, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei2_BOSS"]				= { DataID=15103, Title="", posX=51, posY=45, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei3_BOSS"]				= { DataID=15103, Title="", posX=58, posY=50, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei4_BOSS"]				= { DataID=15103, Title="", posX=57, posY=60, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei5_BOSS"]				= { DataID=15103, Title="", posX=49, posY=59, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },

	["SangTuGong_NPC"]		= { DataID=15126, Title="", posX=173, posY=36, Dir=0, BaseAI=3, AIScript=0, ScriptID=402076 },--������
	["SangTuGong1_BOSS"]		= { DataID=15126, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong2_BOSS"]		= { DataID=15127, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong3_BOSS"]		= { DataID=15128, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong4_BOSS"]		= { DataID=15129, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong5_BOSS"]		= { DataID=15130, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["linzhenshouwei1_BOSS"]				= { DataID=15123, Title="", posX=168, posY=34, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei2_BOSS"]				= { DataID=15123, Title="", posX=173, posY=29, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei3_BOSS"]				= { DataID=15123, Title="", posX=178, posY=35, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei4_BOSS"]				= { DataID=15123, Title="", posX=177, posY=41, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei5_BOSS"]				= { DataID=15123, Title="", posX=167, posY=39, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["JiangShi_BOSS"]			= { DataID=15143, Title="", posX=0, posY=0, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },

	["WuLaoDa_NPC"]				= { DataID=15131, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402077 },--����ε
	["WuLaoDa1_BOSS"]		= { DataID=15131, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa2_BOSS"]		= { DataID=15132, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa3_BOSS"]		= { DataID=15133, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa4_BOSS"]		= { DataID=15134, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa5_BOSS"]		= { DataID=15135, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["linzhenshouwei6_BOSS"]				= { DataID=15123, Title="", posX=166, posY=101, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei7_BOSS"]				= { DataID=15123, Title="", posX=172, posY=96, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei8_BOSS"]				= { DataID=15123, Title="", posX=176, posY=100, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei9_BOSS"]				= { DataID=15123, Title="", posX=175, posY=104, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei10_BOSS"]				= { DataID=15123, Title="", posX=170, posY=104, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["WuLaoDaLoss_NPC"]			= { DataID=15131, Title="", posX=117, posY=49, Dir=11, BaseAI=27, AIScript=0, ScriptID=402079 },

	["ZhuoBuFan_NPC"]			= { DataID=15171, Title="", posX=192, posY=195, Dir=0, BaseAI=3, AIScript=0, ScriptID=402078 },--Ү����
	["ZhuoBuFan1_BOSS"]		= { DataID=15171, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan2_BOSS"]		= { DataID=15172, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan3_BOSS"]		= { DataID=15173, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan4_BOSS"]		= { DataID=15174, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan5_BOSS"]		= { DataID=15175, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["huozhenshouwei1_BOSS"]				= { DataID=15168, Title="", posX=186, posY=195, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei2_BOSS"]				= { DataID=15168, Title="", posX=192, posY=190, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei3_BOSS"]				= { DataID=15168, Title="", posX=196, posY=193, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei4_BOSS"]				= { DataID=15168, Title="", posX=195, posY=197, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei5_BOSS"]				= { DataID=15168, Title="", posX=187, posY=199, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["BuPingDaoRen_BOSS"]	= { DataID=9545, Title="����", posX=129, posY=31, Dir=0, BaseAI=27, AIScript=261, ScriptID=402268 },

	["DuanMuYuan_BOSS"]		= { DataID=9547, Title="", posX=125, posY=36, Dir=0, BaseAI=0, AIScript=0, ScriptID=402274 },

	["LiQiuShui_NPC"]				= { DataID=15186, Title="", posX=52, posY=203, Dir=11, BaseAI=3, AIScript=0, ScriptID=402079 },--Ү������
	["LiQiuShui1_BOSS"]		= { DataID=15186, Title="�����󽫾�", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui2_BOSS"]		= { DataID=15187, Title="�����󽫾�", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui3_BOSS"]		= { DataID=15188, Title="�����󽫾�", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui4_BOSS"]		= { DataID=15189, Title="�����󽫾�", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui5_BOSS"]		= { DataID=15190, Title="�����󽫾�", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["yuanshen_BOSS"]				= { DataID=15198, Title="", posX=50, posY=200, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["tiegu_BOSS"]				= { DataID=15183, Title="", posX=54, posY=206, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
}

x402082_g_FightBOSSList =
{
	[1] = x402082_g_BOSSList["HaDaBa1_BOSS"].DataID,
	[2] = x402082_g_BOSSList["HaDaBa2_BOSS"].DataID,
	[3] = x402082_g_BOSSList["HaDaBa3_BOSS"].DataID,
	[4] = x402082_g_BOSSList["HaDaBa4_BOSS"].DataID,
	[5] = x402082_g_BOSSList["HaDaBa5_BOSS"].DataID,
	[6] = x402082_g_BOSSList["SangTuGong1_BOSS"].DataID,
	[7] = x402082_g_BOSSList["SangTuGong2_BOSS"].DataID,
	[8] = x402082_g_BOSSList["SangTuGong3_BOSS"].DataID,
	[9] = x402082_g_BOSSList["SangTuGong4_BOSS"].DataID,
	[10] = x402082_g_BOSSList["SangTuGong5_BOSS"].DataID,	
	[11] = x402082_g_BOSSList["WuLaoDa1_BOSS"].DataID,
	[12] = x402082_g_BOSSList["WuLaoDa2_BOSS"].DataID,
	[13] = x402082_g_BOSSList["WuLaoDa3_BOSS"].DataID,
	[14] = x402082_g_BOSSList["WuLaoDa4_BOSS"].DataID,
	[15] = x402082_g_BOSSList["WuLaoDa5_BOSS"].DataID,
	[16] = x402082_g_BOSSList["ZhuoBuFan1_BOSS"].DataID,
	[17] = x402082_g_BOSSList["ZhuoBuFan2_BOSS"].DataID,
	[18] = x402082_g_BOSSList["ZhuoBuFan3_BOSS"].DataID,
	[19] = x402082_g_BOSSList["ZhuoBuFan4_BOSS"].DataID,
	[20] = x402082_g_BOSSList["ZhuoBuFan5_BOSS"].DataID,
	[21] = x402082_g_BOSSList["LiQiuShui1_BOSS"].DataID,
	[22] = x402082_g_BOSSList["LiQiuShui2_BOSS"].DataID,
	[23] = x402082_g_BOSSList["LiQiuShui3_BOSS"].DataID,
	[24] = x402082_g_BOSSList["LiQiuShui4_BOSS"].DataID,
	[25] = x402082_g_BOSSList["LiQiuShui5_BOSS"].DataID,
	
}

--�Ƿ������սĳ��BOSS�ı���б�....
x402082_g_BattleFlagTbl = 
{
	["HaDaBa"]			= 8,	--�Ƿ������ս�����...
	["SangTuGong"]	= 9,	--�Ƿ������սɣ����....
	["WuLaoDa"]			= 10,	--�Ƿ������ս���ϴ�....
	["ZhuoBuFan"]		= 11,	--�Ƿ������ս׿����....
	["LiQiuShui"]		= 12,	--�Ƿ������ս����ˮ....
}

--������������....�Ƿ������սĳ��BOSS�ı��....
-- 0=������ս 1=������ս 2=�Ѿ���ս����
x402082_g_IDX_BattleFlag_Hadaba			= 8
x402082_g_IDX_BattleFlag_Sangtugong	= 9
x402082_g_IDX_BattleFlag_Wulaoda		= 10
x402082_g_IDX_BattleFlag_ZhuoBuFan		= 11
x402082_g_IDX_BattleFlag_Liqiushui	= 12

x402082_g_IDX_FuBenOpenTime		= 13	--����������ʱ��....
x402082_g_IDX_FuBenLifeStep		= 14	--���������ڵ�step....(��������NPC....�رյ���ʱ��ʾ....)

--������������....ͨ�õ���翷��ʱ��....��Ҫ���ڼ���BOSSս��....
x402082_g_IDX_PMFTimerStep			= 15
x402082_g_IDX_PMFTimerScriptID	= 16

--������������....���ϴ������ļ�ʱ��....���ڴ��������߼�....
x402082_g_IDX_WuLaoDaDieStep				= 17
x402082_g_IDX_WuLaoDaDieScriptID		= 18
x402082_g_IDX_WuLaoDaDiePosX				=	19
x402082_g_IDX_WuLaoDaDiePosY				=	20


--**********************************
--������ں���....
--**********************************
function x402082_OnDefaultEvent( sceneId, selfId, targetId )

	--����Ƿ���Խ��븱��....
	local ret, msg = x402082_CheckCanEnter( sceneId, selfId, targetId )
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

	x402082_MakeCopyScene( sceneId, selfId )

end

--**********************************
--�о��¼�
--**********************************
function x402082_OnEnumerate( sceneId, selfId, targetId )

--	AddNumText( sceneId, x402082_g_ScriptId, "��ս��翷�", 10, 1 )

end

--**********************************
--����Ƿ���Խ���˸���....
--**********************************
function x402082_CheckCanEnter( sceneId, selfId, targetId )

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
		if GetLevel( sceneId, PlayerId ) < 80 then
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

--	end

--	if nHumanNum > 0 then

--		local msg = "    "
--		for i=0, nHumanNum-2 do
--			msg = msg .. Humanlist[i] .. "��"
--		end
--		msg = msg .. Humanlist[nHumanNum-1] .. "�����Ѿ���ս��5����翷��ˡ�"
--		return 0, msg

--	end

	return 1

end

--**********************************
--��������....
--**********************************
function x402082_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "BattleField.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402082_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x402082_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x402082_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402082_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Hadaba, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Sangtugong, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Wulaoda, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_ZhuoBuFan, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Liqiushui, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "BattleField_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "BattleField_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--�����¼�....
--**********************************
function x402082_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1�����������û����ӣ��ʹ����������Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--ͳ�ƴ�����������....
	AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--����������ʱ���¼�....
--**********************************
function x402082_OnCopySceneTimer( sceneId, nowTime )

	x402082_TickFubenLife( sceneId, nowTime )

	x402082_TickPMFTimer( sceneId, nowTime )

	x402082_TickWuLaoDaDieTimer( sceneId, nowTime )

	x402082_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--����ҽ��븱���¼�....
--**********************************
function x402082_OnPlayerEnter( sceneId, selfId )

	--���������¼�....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z )

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
function x402082_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--��ʾ���и��������....
--**********************************
function x402082_TipAllHuman( sceneId, Str )

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
function x402082_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x402082_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 16 )

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
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 15 )
		x402082_TipAllHuman( sceneId, "��������1���رա�" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 14 )
		x402082_TipAllHuman( sceneId, "��������2���رա�" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 13 )
		x402082_TipAllHuman( sceneId, "��������3���رա�" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 12 )
		x402082_TipAllHuman( sceneId, "��������4���رա�" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 11 )
		x402082_TipAllHuman( sceneId, "��������5���رա�" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 10 )
		x402082_TipAllHuman( sceneId, "��������10���رա�" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 9 )
		x402082_TipAllHuman( sceneId, "��������30���رա�" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 8 )
		x402082_TipAllHuman( sceneId, "��������1���Ӻ�رա�" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 7 )
		x402082_TipAllHuman( sceneId, "��������2���Ӻ�رա�" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 6 )
		x402082_TipAllHuman( sceneId, "��������3���Ӻ�رա�" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 5 )
		x402082_TipAllHuman( sceneId, "��������5���Ӻ�رա�" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 4 )
		x402082_TipAllHuman( sceneId, "��������15���Ӻ�رա�" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 3 )
		x402082_TipAllHuman( sceneId, "��������30���Ӻ�رա�" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 2 )
		x402082_TipAllHuman( sceneId, "��������60���Ӻ�رա�" )
		return
	end

	--��ʼ�������ڵ�NPC....
	if lifeStep == 0 then

		local MstId = x402082_CreateBOSS( sceneId, "HaDaBa_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "SangTuGong_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "WuLaoDa_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "ZhuoBuFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "LiQiuShui_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick��翷��ʱ��....
--**********************************
function x402082_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--������翷��ʱ��....
--**********************************
function x402082_OpenPMFTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID, ScriptID )

end

--**********************************
--��ǰ��翷��ʱ���Ƿ񼤻�....
--**********************************
function x402082_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick���ϴ�������ʱ��....
--**********************************
function x402082_TickWuLaoDaDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnHaDaBaDieTimer", sceneId, step, posX, posY )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, step )
	end

end

--**********************************
--�������ϴ�������ʱ��....
--**********************************
function x402082_OpenWuLaoDaDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY, posY )

end

--**********************************
--Tick��������....
--ֻҪ���վ�ڳ������6��������....ÿ�붼�ܻ��һ�����߽����buff....
--**********************************
function x402082_TickJianWuArea( sceneId, nowTime )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then

			local x,z = GetWorldPos( sceneId, nHumanId )
			local buff1 = -1
			local buff2 = 10376

			if x>=62 and x<=66 and z>=214 and z<=218 then
				buff1 = 10370
			elseif x>=53 and x<=57 and z>=217 and z<=221 then
				buff1 = 10374
			elseif x>=43 and x<=47 and z>=214 and z<=218 then
				buff1 = 10375
			elseif x>=38 and x<=42 and z>=203 and z<=207 then
				buff1 = 10371
			elseif x>=42 and x<=46 and z>=193 and z<=197 then
				buff1 = 10373
			elseif x>=52 and x<=56 and z>=188 and z<=192 then
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
function x402082_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x402082_g_BOSSList[name]
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
function x402082_DeleteBOSS( sceneId, name )

	local BOSSData = x402082_g_BOSSList[name]
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
function x402082_FindBOSS( sceneId, name )

	local BOSSData = x402082_g_BOSSList[name]
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
function x402082_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x402082_g_FightBOSSList do
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
function x402082_GetBossBattleFlag( sceneId, bossName )

	local idx = x402082_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--�����Ƿ������սĳ��BOSS�ı��....
--**********************************
function x402082_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x402082_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end
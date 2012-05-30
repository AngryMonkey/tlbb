--��翷帱��....   ____������ By��403413393 �޸�

--�ű���
x890063_g_ScriptId = 890063

x890063_g_CopySceneType = FUBEN_SHAOSHISHAN	--�������ͣ�������ScriptGlobal.lua����

x890063_g_TickTime		= 1				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x890063_g_NoUserTime	= 10			--������û���˺���Լ��������ʱ�䣨��λ���룩
x890063_g_Fuben_X			= 128			--���븱����λ��X
x890063_g_Fuben_Z			= 225			--���븱����λ��Z
x890063_g_FuBenTime		= 3*60*60	--�����ر�ʱ��....

--BOSS��....
x890063_g_BOSSList =
{
	["JiuMoZhi_NPC"]				= { DataID=42196, Title="", posX=130, posY=171, Dir=0, BaseAI=3, AIScript=0, ScriptID=890070 },
	["JiuMoZhi_BOSS"]				= { DataID=42197, Title="", posX=130, posY=171, Dir=0, BaseAI=27, AIScript=0, ScriptID=890064 },

	["ZhuangJuXian_NPC"]		= { DataID=42198, Title="", posX=68, posY=121, Dir=0, BaseAI=3, AIScript=0, ScriptID=890071 },
	["ZhuangJuXian_BOSS"]		= { DataID=42199, Title="", posX=68, posY=121, Dir=0, BaseAI=27, AIScript=0, ScriptID=890065 },
	["JiangShi_BOSS"]			= { DataID=42208, Title="", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },

	["MuRongFu_NPC"]				= { DataID=42200, Title="��������", posX=195, posY=86, Dir=11, BaseAI=3, AIScript=0, ScriptID=890072 },
	["MuRongFuLoss_NPC"]		= { DataID=42201, Title="��������", posX=117, posY=49, Dir=0, BaseAI=3, AIScript=0, ScriptID=890075 },
	["MuRongFu_BOSS"]			= { DataID=42201, Title="��������", posX=195, posY=86, Dir=11, BaseAI=27, AIScript=0, ScriptID=890066 },

	["YaoBoDang_BOSS"]		= { DataID=42202, Title="����", posX=129, posY=108, Dir=0, BaseAI=27, AIScript=0, ScriptID=890067 },
	["SiMaLing_BOSS"]	= { DataID=42203, Title="��ɷ", posX=131, posY=109, Dir=0, BaseAI=27, AIScript=0, ScriptID=890068 },

	["YouDanZhi_BOSS"]		= { DataID=42204, Title="", posX=129, posY=126, Dir=0, BaseAI=0, AIScript=0, ScriptID=890074 },

	["LiFan_NPC"]				= { DataID=42205, Title="", posX=120, posY=115, Dir=27, BaseAI=3, AIScript=0, ScriptID=890073 },

	["DingChunQiu_BOSS"]		= { DataID=42207, Title="����ɽ����", posX=129, posY=127, Dir=27, BaseAI=27, AIScript=0, ScriptID=890069 },
}

x890063_g_FightBOSSList =
{
	[1] = x890063_g_BOSSList["JiuMoZhi_BOSS"].DataID,
	[2] = x890063_g_BOSSList["ZhuangJuXian_BOSS"].DataID,
	[3] = x890063_g_BOSSList["MuRongFu_BOSS"].DataID,
	[4] = x890063_g_BOSSList["YaoBoDang_BOSS"].DataID,
	[5] = x890063_g_BOSSList["SiMaLing_BOSS"].DataID,
	[6] = x890063_g_BOSSList["DingChunQiu_BOSS"].DataID
}

--�Ƿ������սĳ��BOSS�ı���б�....
x890063_g_BattleFlagTbl = 
{
	["JiuMoZhi"]			= 8,	--�Ƿ������ս�����...
	["ZhuangJuXian"]	= 9,	--�Ƿ������սɣ����....
	["MuRongFu"]			= 10,	--�Ƿ������ս���ϴ�....
	["ShuangZi"]		= 11,	--�Ƿ������ս˫��....
	["DingChunQiu"]		= 12,	--�Ƿ������ս����ˮ....
}

--������������....�Ƿ������սĳ��BOSS�ı��....
-- 0=������ս 1=������ս 2=�Ѿ���ս����
x890063_g_IDX_BattleFlag_JiuMoZhi			= 8
x890063_g_IDX_BattleFlag_ZhuangJuXian	= 9
x890063_g_IDX_BattleFlag_MuRongFu		= 10
x890063_g_IDX_BattleFlag_Shuangzi		= 11
x890063_g_IDX_BattleFlag_DingChunQiu	= 12

x890063_g_IDX_FuBenOpenTime		= 13	--����������ʱ��....
x890063_g_IDX_FuBenLifeStep		= 14	--���������ڵ�step....(��������NPC....�رյ���ʱ��ʾ....)

--������������....ͨ�õ���翷��ʱ��....��Ҫ���ڼ���BOSSս��....
x890063_g_IDX_PMFTimerStep			= 15
x890063_g_IDX_PMFTimerScriptID	= 16

--������������....���ϴ������ļ�ʱ��....���ڴ��������߼�....
x890063_g_IDX_MuRongFuDieStep				= 17
x890063_g_IDX_MuRongFuDieScriptID		= 18
x890063_g_IDX_MuRongFuDiePosX				=	19
x890063_g_IDX_MuRongFuDiePosY				=	20


--**********************************
--������ں���....
--**********************************
function x890063_OnDefaultEvent( sceneId, selfId, targetId )

	--����Ƿ���Խ��븱��....
	local ret, msg = x890063_CheckCanEnter( sceneId, selfId, targetId )
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

	x890063_MakeCopyScene( sceneId, selfId )

end

--**********************************
--�о��¼�
--**********************************
function x890063_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x890063_g_ScriptId, "#cFF0000��ս����ɽ", 10, 1 )

end

--**********************************
--����Ƿ���Խ���˸���....
--**********************************
function x890063_CheckCanEnter( sceneId, selfId, targetId )

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
		msg = msg .. Humanlist[nHumanNum-1] .. "����Ϊ��ǳ\�����ǲ�ҪȥΪ�"
		return 0, msg

	end


	--�Ƿ����˽�������3����....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SHUANGXIANGPAO_LASTTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = "    "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "��"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "�����Ѿ���ս��3������ɽ�ˡ�"
		return 0, msg

	end

	return 1

end

--**********************************
--��������....
--**********************************
function x890063_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "cangjingge_80JQTZ.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x890063_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x890063_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x890063_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x890063_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_JiuMoZhi, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_ZhuangJuXian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_MuRongFu, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_DingChunQiu, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "cangjingge_80JQTZ_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangjingge_80JQTZ_monster.ini" )

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
function x890063_OnCopySceneReady( sceneId, destsceneId )

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
	--AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--����������ʱ���¼�....
--**********************************
function x890063_OnCopySceneTimer( sceneId, nowTime )

	x890063_TickFubenLife( sceneId, nowTime )

	x890063_TickPMFTimer( sceneId, nowTime )

	x890063_TickMuRongFuDieTimer( sceneId, nowTime )

	x890063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--����ҽ��븱���¼�....
--**********************************
function x890063_OnPlayerEnter( sceneId, selfId )

	--���������¼�....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z )

	--������ս��һ����翷�....
	local lastTime = GetMissionData( sceneId, selfId, MD_SHUANGXIANGPAO_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_SHUANGXIANGPAO_LASTTIME, lastTime )

end

--**********************************
--������ڸ����������¼�....
--**********************************
function x890063_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--��ʾ���и��������....
--**********************************
function x890063_TipAllHuman( sceneId, Str )

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
function x890063_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x890063_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 16 )

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
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 15 )
		x890063_TipAllHuman( sceneId, "��������1����رա�" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 14 )
		x890063_TipAllHuman( sceneId, "��������2����رա�" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 13 )
		x890063_TipAllHuman( sceneId, "��������3����رա�" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 12 )
		x890063_TipAllHuman( sceneId, "��������4����رա�" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 11 )
		x890063_TipAllHuman( sceneId, "��������5����رա�" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 10 )
		x890063_TipAllHuman( sceneId, "��������10����رա�" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 9 )
		x890063_TipAllHuman( sceneId, "��������30����رա�" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 8 )
		x890063_TipAllHuman( sceneId, "��������1������رա�" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 7 )
		x890063_TipAllHuman( sceneId, "��������2������رա�" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 6 )
		x890063_TipAllHuman( sceneId, "��������3������رա�" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 5 )
		x890063_TipAllHuman( sceneId, "��������5������رա�" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 4 )
		x890063_TipAllHuman( sceneId, "��������15������رա�" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 3 )
		x890063_TipAllHuman( sceneId, "��������30������رա�" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 2 )
		x890063_TipAllHuman( sceneId, "��������60������رա�" )
		return
	end

	--��ʼ�������ڵ�NPC....
	if lifeStep == 0 then

		local MstId = x890063_CreateBOSS( sceneId, "JiuMoZhi_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "ZhuangJuXian_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "MuRongFu_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "LiFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick��翷��ʱ��....
--**********************************
function x890063_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--������翷��ʱ��....
--**********************************
function x890063_OpenPMFTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID, ScriptID )

end

--**********************************
--��ǰ��翷��ʱ���Ƿ񼤻�....
--**********************************
function x890063_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick���ϴ�������ʱ��....
--**********************************
function x890063_TickMuRongFuDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY )

	--�ص�ָ���ű���OnTimer....
	CallScriptFunction( scriptID, "OnJiuMoZhiDieTimer", sceneId, step, posX, posY )

	--����Ѿ���������step��رռ�ʱ��....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, step )
	end

end

--**********************************
--�������ϴ�������ʱ��....
--**********************************
function x890063_OpenMuRongFuDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, posY )

end

--**********************************
--Tick��������....
--ֻҪ���վ�ڳ������6��������....ÿ�붼�ܻ��һ�����߽����buff....
--**********************************
function x890063_TickJianWuArea( sceneId, nowTime )


end

--**********************************
--����ָ��BOSS....
--**********************************
function x890063_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x890063_g_BOSSList[name]
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
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)

	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--ͳ�ƴ���BOSS....
	--AuditPMFCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--ɾ��ָ��BOSS....
--**********************************
function x890063_DeleteBOSS( sceneId, name )

	local BOSSData = x890063_g_BOSSList[name]
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
function x890063_FindBOSS( sceneId, name )

	local BOSSData = x890063_g_BOSSList[name]
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
function x890063_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x890063_g_FightBOSSList do
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
function x890063_GetBossBattleFlag( sceneId, bossName )

	local idx = x890063_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--�����Ƿ������սĳ��BOSS�ı��....
--**********************************
function x890063_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x890063_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end

--��������
--��������פ��
--

--************************************************************************
--MisDescBegin
--�ű���
x805042_g_ScriptId	= 805042
--��������
x805042_g_CopySceneName	= "�������פ��"
--�����
x805042_g_MissionId			= 1120
--��һ�������ID
x805042_g_MissionIdPre	= 0
--Ŀ��NPC
x805042_g_Name					= "�������פ��"
--�Ƿ��Ǿ�Ӣ����
x805042_g_IfMissionElite= 0
--����ȼ�
x805042_g_MissionLevel	= 10000
--�������
x805042_g_MissionKind		= 1
--�����ı�����
x805042_g_MissionName			= "�������פ��"
--��������
x805042_g_MissionInfo			= "  "
--����Ŀ��
x805042_g_MissionTarget		= "  ɱ�����еĹ��Ｔ���������"
--δ��������npc�Ի�
x805042_g_ContinueInfo		= "  "
--�������npc˵���Ļ�
x805042_g_MissionComplete	= "  "


--**********************************�����Ƕ�̬****************************
--��ɫMission����˵��
x805042_g_Param_IsMissionOkFail	= 0						--0�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x805042_g_Param_killmonstercount	= 1					--1�ţ�ɱ������С�ֵ�����
x805042_g_Param_killbosscount	= 2							--2�ţ�ɱ������boss�ֵ�����
x805042_g_Param_sceneid		= 3									--3�ţ���ǰ��������ĳ�����
x805042_g_Param_teamid		= 4									--4�ţ��Ӹ�������ʱ��Ķ����
x805042_g_Param_time			= 5									--5�ţ���ɸ�������ʱ��(��λ����)
																							--6�ţ����帱���¼��ű�ռ��
																							--7�ţ����帱���¼��ű�ռ��
--MisDescEnd
--************************************************************************

x805042_g_CopySceneType			= FUBEN_PROTECTGUILD	--�������ͣ�������ScriptGlobal.lua����
x805042_g_LimitMembers			= 3		--���Խ���������С��������
x805042_g_TickTime					= 5		--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x805042_g_LimitTotalHoldTime= 360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x805042_g_LimitTimeSuccess	= 500	--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x805042_g_CloseTick					= 7		--�����ر�ǰ����ʱ����λ�������� zchw 3-->7
x805042_g_NoUserTime				= 300	--������û���˺���Լ��������ʱ�䣨��λ���룩
x805042_g_Fuben_X						= 99	--���븱����λ��X
x805042_g_Fuben_Z						= 152	--���븱����λ��Z
x805042_g_Back_X						= 99	--Դ����λ��X
x805042_g_Back_Z						= 152	--Դ����λ��Z
x805042_g_Totalkillmonstercount	= 30	--��Ҫɱ��monster����
x805042_g_Totalkillbosscount	= 1	--��Ҫɱ��Boss����

x805042_g_StartTick				=	3	--����ʼʱ��
x805042_g_CurrentStage			=	0	--��ǰ�����Ľ׶�	0--15�뿪ʼ�׶�  1--8��������С�ֽ׶� 2--Boss�׶�
x805042_g_FirstStage			=	183	--��һ�׶Σ�15��������
x805042_g_FirstStage_msg		=	{4,9,15,21,27,33,39,45,51,57,63,69,75,81,87,93,99,105,111,117,123,129,135,141,147,153,159,165,171,175,177,178,179,180,181,182,}	--��һ�׶Σ�ʣ��ʱ����ʾ

--����������������
x805042_g_keySD					= {}
x805042_g_keySD["typ"]			= 0		--���ø�������
x805042_g_keySD["spt"]			= 1		--���ø��������¼��ű���
x805042_g_keySD["tim"]			= 2		--���ö�ʱ�����ô���
x805042_g_keySD["currStage"]	= 3		--���ö�ʱ�����ô���
x805042_g_keySD["scn"]			= 4		--���ø�����ڳ�����, ��ʼ��
x805042_g_keySD["cls"]			= 5		--���ø����رձ�־, 0���ţ�1�ر�
x805042_g_keySD["dwn"]			= 6		--�����뿪����ʱ����
x805042_g_keySD["tem"]			= 7		--��������
x805042_g_keySD["x"]			= 8			--��������ڳ����е�xλ��
x805042_g_keySD["z"]			= 9			--��������ڳ����е�zλ��
x805042_g_keySD["killMonsterNum"]	= 10		--ɱ����������
x805042_g_keySD["genMonsterNum"]	= 11			--���ɹ�������
x805042_g_keySD["playerLevel"]	= 12		--��¼��ǰ�����ļ���

--��ȡ�������͵ȼ�
x805042_g_minLevel			= 85

--�����б�
x805042_g_monster_list = {
	[1]={
			StageId=1,
			MonsterList={
				{mType=9626,	x=74, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=72, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=76, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=74, 	z=92,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=50, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=48, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=52, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=50, 	z=95,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=46, 	z=91,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=47, 	z=93,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=47, 	z=89,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=49, 	z=91,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=45, 	z=72,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=47, 	z=72,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=45, 	z=70,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=45, 	z=74,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=44, 	z=59,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=46, 	z=59,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=57,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=61,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=44, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=42, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=46, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=49,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=64, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=62, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=66, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=64, 	z=57,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=134, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=132, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=136, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=134, 	z=52,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=149, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=147, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=151, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=149, 	z=46,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=148, 	z=56,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=146, 	z=56,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=148, 	z=54,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=148, 	z=58,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=147, 	z=96,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=145, 	z=96,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=147, 	z=94,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=147, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=128, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=126, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=130, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=128, 	z=100,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
			}
		},
	[2]={
			StageId=2,
			MonsterList={
				{mType=9631,	x=99,	z=54,	aiType=25,	aiScript=-1,	scriptId=805045 , deltLevel=1	},
			}
		},
}


--**********************************
--������ں���
--**********************************
function x805042_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1 then
		if x805042_CheckEnter( sceneId, selfId, targetId ) ~= 1  then
			return
		end
	
		if (x805042_OnAccept( sceneId, selfId ) == 1) then
			LuaFnDeleteMonster( sceneId, targetId)
		end
	elseif GetNumText() == 2 then
		
		if GetName( sceneId, targetId ) == "ɽ��" then
			x805042_MsgBox( sceneId, selfId, targetId, "#{bhbpzd_20080522_002}" )
		elseif GetName( sceneId, targetId ) == "ɽ��" then
			x805042_MsgBox( sceneId, selfId, targetId, "#{bhbpzd_20080522_001}" )
		end
		
	end

end



function x805042_CheckEnter( sceneId, selfId, targetId )

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "ɽ���Ѿ���������������޿��̣����뷢���ˣ���һ���˾�������սɽ����̫�Բ������ˣ�" )
		return 0
	end
	
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if GetLevel(sceneId,nPlayerId) < x805042_g_minLevel  then
			x805042_MsgBox_With_Help( sceneId, selfId, targetId, "ɽ���Ѿ���������������޿��̣����뷢���ˣ����ǻ��Ƕ��ﵽ85��������սǿ���ɽ��ɣ�" )
			return 0
		end
	end


	if GetTeamSize( sceneId, selfId ) < x805042_g_LimitMembers then
	  x805042_MsgBox_With_Help( sceneId, selfId, targetId, "ɽ���Ѿ���������������޿��̣����뷢���ˣ�������Ҫ��ս������ҲҪ�������ˣ�����ɽ���ǲ�м�ں����Ƕ��ֵģ�" )
	  return 0
	end


	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "ɽ���Ѿ���������������޿��̣����뷢���ˣ���Ҫ��ս�ң������ǵĶӳ����ɣ�" )
		return 0
	end


	-- ȡ����Ҹ����Ķ��������������Լ���
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "ɽ���Ѿ���������������޿��̣����뷢���ˣ���Ҫ��ս�ң����ǵ����ǵ��˶�����ɣ�" )
		return 0
	end
	
	return 1
	
end

--**********************************
--�о��¼�
--**********************************
function x805042_OnEnumerate( sceneId, selfId, targetId )

	if x805042_CheckEnter( sceneId, selfId, targetId ) ~= 1  then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "ɽ���Ѿ���������������޿��̣����뷢���ˣ���֪����ķ��˰�������ɽ��������ɣ�" )
		AddNumText( sceneId, x805042_g_ScriptId, "��սɽ��" ,10 ,1)
		AddNumText( sceneId, x805042_g_ScriptId, "���ڱ������" ,11 ,2)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--����������
--**********************************
function x805042_CheckAccept( sceneId, selfId )

	return 1
end

--**********************************
--����
--**********************************
function x805042_OnAccept( sceneId, selfId )
	local numMem	= GetNearTeamCount( sceneId, selfId )	
	return x805042_MakeCopyScene( sceneId, selfId, numMem )
end

--**********************************
--����
--**********************************
function x805042_OnAbandon( sceneId, selfId )

end

--**********************************
--��������
--**********************************
function x805042_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

	local member, mylevel, numerator, denominator = 0, 0, 0, 0

	for	i = 0, nearmembercount - 1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		numerator = numerator + GetLevel( sceneId, member ) ^ 4
		denominator = denominator + GetLevel( sceneId, member ) ^ 3
		mems[i] = member
	end

	if denominator <= 0 then
		mylevel = 0
	else
		mylevel = numerator / denominator
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetSceneLoad_Map( sceneId, "protectguild.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x805042_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x805042_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["typ"], x805042_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["spt"], x805042_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["playerLevel"], mylevel)
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] , 0)	
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] , 0)	

	local x,z = GetWorldPos( sceneId, selfId )

	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["x"], x805042_g_Back_X )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["z"], x805042_g_Back_Z )

	LuaFnSetSceneLoad_Monster( sceneId, "protectguild_monster.ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x805042_NotifyTip( sceneId, selfId, "���������ɹ���" )
		return 1
	else
		x805042_NotifyTip( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
		return 0
	end

end

--**********************************
--����
--**********************************
function x805042_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x805042_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--�ύ
--**********************************
function x805042_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x805042_OnKillObject( sceneId, selfId, objdataId, objId )

end



--**********************************
--���������¼�
--**********************************
function x805042_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x805042_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x805042_OnCopySceneReady( sceneId, destsceneId )
	--���ó��и�����������
	LuaFnSetSceneCopySceneCityData(sceneId, destsceneId )
	LuaFnSetIsCityCopyScene( destsceneId, 1)

	--���ø�����ڳ�����
	LuaFnSetCopySceneData_Param( destsceneId, x805042_g_keySD["scn"], sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--�Ҳ��������
	if leaderObjId == -1 then
		return
	end

	--�����޷�ִ���߼���״̬
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	
	--�ͳ��
	LuaFnAuditQuest(sceneId, leaderObjId, x805042_g_MissionName.."-"..x805042_g_CopySceneName)

	local cityName = LuaFnCityGetNameBySceneId( sceneId )
	local strLog = format("CopyScene Start  SceneId=%d, CityName=%s", sceneId, cityName )
	AuditProtectGuild( sceneId, strLog)

	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ���ڿ���ִ���߼���״̬

			NewWorld( sceneId, member, destsceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )
			
			local strLog = format("Player Enter CopyScene  SceneId=%d, CityName=%s, PlayerGuid=%x", sceneId, cityName, LuaFnGetGUID(sceneId, member)  )
			AuditProtectGuild( sceneId, strLog)
			
			--�ͳ��
			LuaFnAuditQuest(sceneId, member, x805042_g_MissionName.."-"..x805042_g_CopySceneName)
		end
	end
	
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x805042_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )

end

--**********************************
--������ڸ����������¼�
--**********************************
function x805042_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )

	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x805042_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	--ȡ���Ѿ�ִ�еĶ�ʱ����
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["tim"] )
	TickCount = TickCount + 1
	--�����µĶ�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tim"], TickCount )
	
	x805042_g_CurrentStage = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] )

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["cls"] )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	if membercount==0 and leaveFlag~=1 then
		LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		return
	end

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--��Ҫ�뿪
	if leaveFlag == 1 then
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"] )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"], leaveTickCount )

		if leaveTickCount >= x805042_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["scn"] )	--ȡ�ø�����ڳ�����

			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end

		elseif leaveTickCount < x805042_g_CloseTick then
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫��%d����뿪����!", (x805042_g_CloseTick-leaveTickCount) * x805042_g_TickTime )

			x805042_TipAllHuman( sceneId,  strText)
		end
	end
	
	
	if x805042_g_CurrentStage == 0 then
		local strText = "";
		
		if TickCount >= x805042_g_StartTick then
			x805042_g_CurrentStage = 1
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] , x805042_g_CurrentStage)
			
			--���ɹ���
			x805042_GenObj( sceneId, 1 )
			
			strText = "ս����ʼ!";
			
			x805042_TipAllHuman( sceneId,  strText)
			x805042_TipAllHuman( sceneId,  "15����֮��ɱ������ɽ��")
			
		else
			strText = format("ս������%d���ʼ!", (x805042_g_StartTick - TickCount) * x805042_g_TickTime);
			x805042_TipAllHuman( sceneId,  strText)
		end
	end
	
	if x805042_g_CurrentStage == 1 then
		
		local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
		
		if killNum == genNum then
			x805042_g_CurrentStage = 2
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] , x805042_g_CurrentStage)
			
			--���ɹ���
			x805042_GenObj( sceneId, 2 )
		
				
			return
		end
		
		if TickCount >= x805042_g_FirstStage then
			--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
			x805042_TipAllHuman( sceneId,  "����ʧ�ܣ���ʱ!")
	
			--���ø����رձ�־
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		end
		
		local msgTick = 0
		for msgTick = 1, getn(x805042_g_FirstStage_msg) do
			if TickCount == x805042_g_FirstStage_msg[msgTick] then
				local tickMsg = format("ɱ������ɽ��ʣ��ʱ��%d��", (x805042_g_FirstStage-TickCount)*x805042_g_TickTime)
				x805042_TipAllHuman( sceneId,  tickMsg)
				break
			end
		end
	end
	
	if x805042_g_CurrentStage == 2 then
		local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
		
		if killNum == genNum then
			--���ø����رձ�־
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		end
	end
	
	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
	--x805042_TipAllHuman(sceneId, killNum.." / "..genNum )
end


function x805042_GenObj( sceneId, stageid )
	if x805042_g_monster_list[stageid] == nil then
		return
	end
	
    local IndexList = x805042_g_monster_list[stageid].MonsterList
    local IndexListSize = getn( IndexList )
    
    local i=1
    local str
    for i=1, IndexListSize do        
		local MonsterId = x805042_CreateNpc( sceneId, IndexList[i].mType, IndexList[i].x, IndexList[i].z, IndexList[i].aiType, IndexList[i].aiScript, IndexList[i].scriptId, IndexList[i].deltLevel )
    end
end


--**********************************
-- ͨ�ô������ﺯ��
--**********************************
function x805042_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script, deltLevel)
	local PlayerLevel = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["playerLevel"])
	local ModifyLevel = 0
	
	--PrintStr("  "..PlayerLevel.." "..x.." "..y.." ")
	
	if PlayerLevel > 80   then
		ModifyLevel = 1
	end
	if PlayerLevel > 90   then
		ModifyLevel = 2
	end
	if PlayerLevel > 100   then         
		ModifyLevel = 3
	end
	if PlayerLevel > 110   then         
		ModifyLevel = 4
	end
	if PlayerLevel > 120   then         
		ModifyLevel = 5
	end
	if PlayerLevel > 130   then         
		ModifyLevel = 6
	end
	if PlayerLevel > 140   then         
		ModifyLevel = 7
	end
	local nNpcId = NpcId + ModifyLevel-1
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel + deltLevel)
	
	-- ����û�����óƺţ��оͼӳƺ�
	--x805042_SetNpcTitle(sceneId, nMonsterId)
	local strNpcName = GetName(sceneId, nMonsterId )
	if (strNpcName == "��ɽ��") or (strNpcName == "ɽ��") then
			SetCharacterTitle(sceneId, nMonsterId, "��ʯͷ���ˡ�")
	end
	
	return nMonsterId
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x805042_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x805042_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

function x805042_MsgBox_With_Help( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText( sceneId, x805042_g_ScriptId, "���ڱ������" ,11 ,2)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--��ʾ���и��������
--**********************************
function x805042_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
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


--��ҽ���һ�� area ʱ����
function x805042_OnEnterArea( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["scn"] )	--ȡ�ø�����ڳ�����
	local x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
	local z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )

	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x805042_OnTimer( sceneId, selfId )

end

--����뿪һ�� area ʱ����
function x805042_OnLeaveArea( sceneId, selfId )
	
end

--ʰȡ��Ʒ
function x805042_OnPlayerPickUpItem( sceneId, selfId, itemId, bagidx )


end

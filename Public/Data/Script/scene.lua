--�����Ľű��ļ�

--�ű���
x888888_g_scriptId_scene = 888888

x888888_g_defaultRelive_SceneID_1=77;
x888888_g_defaultRelive_SceneID_2=2;

-- ==========��ɽ�۽���ص�һЩ��������===========
x888888_g_HS_PK_SceneId = 125   --hongyu

x888888_g_Jinghu_SceneId = 5   --hongyu
x888888_g_jingji_SceneId = 414 --hongyu ������
x888888_g_HanYuBed_SceneId = 194 --����
x888888_g_NianShou_SceneId = 6 --����
x888888_g_XinShou_SceneId = 2 --�ݵ��ͼ��

--���涨�����ÿ���ȼ����͵��ʼ�����
--��ʽΪ{2,0},2Ϊ�ȼ�,0�Ǹõȼ�Ҫ���͵��ʼ���Ŀ���ڿͻ��˵�strdictionary.txt������LevelMail_2_1����2����һ���ʼ�,����ʼ�����ʱ��ͬʱ�޸Ŀͻ��˺͸ýṹ������
x888888_g_MailNum = {	{1,1},{2,1},{3,1},{4,1},{5,1},{6,1},{7,1},{8,1},{9,1},{10,1},{11,1},
						{12,1},{13,1},{14,1},{15,1},{16,1},{17,1},{18,1},{19,1},{20,1},{21,1},
						{22,1},{23,1},{24,1},{25,1},{26,1},{27,1},{28,1},{29,1},{30,1},{31,1},
						{32,1},{33,1},{34,1},{35,1},{36,1},{37,1},{38,1},{39,1},{40,1},{41,1},
						{42,1},{43,1},{44,1},{45,1},{46,1},{47,1},{48,1},{49,1},{50,1},{51,1},
						{52,1},{53,1},{54,1},{55,1},{56,1},{57,1},{58,1},{59,1},{60,1},{61,1},
						{62,1},{63,1},{64,1},{65,1},{66,1},{67,1},{68,1},{69,1},{70,1},{71,1},
						{72,1},{73,1},{74,1},{75,1},{76,1},{77,1},{78,1},{79,1},{80,1},{81,1},
						{82,1},{83,1},{84,1},{85,1},{86,1},{87,1},{88,1},{89,1},{90,1},{91,1},
						{92,1},{93,1},{94,1},{95,1},{96,1},{97,1},{98,1},{99,1},{100,1},{101,0},
						{102,1},{103,1},{104,1},{105,1},{106,1},{107,1},{108,1},{109,1},{110,1},
						{111,1},{112,1},{113,1},{114,1},{115,1},{116,1},{117,1},{118,1},{119,1},{120,1},
									   }

-- ===============================================

---------------------------------------------------------------
---����һ��35���ķ��ؼ���65���书�ؼ����������繫��
x888888_MenPaiBroadMsg = 
{
	[0]	= { mp = "��������", XinFa = 30308002, MiJi = 30308011 },	--����
	[1]	= { mp = "��������", XinFa = 30308003, MiJi = 30308012 },	--����
	[2]	= { mp = "ؤ������", XinFa = 30308004, MiJi = 30308013 },	--ؤ��
	[3]	= { mp = "�䵱����", XinFa = 30308005, MiJi = 30308014 },	--�䵱
	[4]	= { mp = "��������", XinFa = 30308006, MiJi = 30308015 },	--����
	[5]	= { mp = "��������", XinFa = 30308007, MiJi = 30308016 },	--����
	[6]	= { mp = "��������", XinFa = 30308008, MiJi = 30308017 },	--����
	[7]	= { mp = "��ɽ����", XinFa = 30308009, MiJi = 30308018 },	--��ɽ
	[8] = { mp = "��ң����", XinFa = 30308010, MiJi = 30308019 },	--��ң
}



-- ���������ƽ�����������Ĭ�ϼ���ļ�����ֵ���ڳ�����ʼ��ʱ�Թ��Ｖ����е������˱�Ź̶����ܸ�
CopyScene_LevelGap =31

-- �������ʱ������ɵ�����
x888888_g_FullLevel_MissionList	=	{}	-- ����ID,����������,����ȼ�,������ɱ�־����������ڼ�λ,������ٱ�־����������ڼ�λ
x888888_g_FullLevel_MissionList[28] = { MissionId = 403, MissionIndex = 500606, LevelLimit = 28, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_188}" }
x888888_g_FullLevel_MissionList[30] = { MissionId = 409, MissionIndex = 500602, LevelLimit = 30, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_181}" }
x888888_g_FullLevel_MissionList[32] = { MissionId = 412, MissionIndex = 500603, LevelLimit = 32, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_183}" }
x888888_g_FullLevel_MissionList[35] = { MissionId = 415, MissionIndex = 500605, LevelLimit = 35, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_186}" }
x888888_g_FullLevel_MissionList[38] = { MissionId = 418, MissionIndex = 500608, LevelLimit = 38, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_191}" }
x888888_g_FullLevel_MissionList[40] = { MissionId = 428, MissionIndex = 500612, LevelLimit = 40, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_196}" }
x888888_g_FullLevel_MissionList[42] = { MissionId = 433, MissionIndex = 500613, LevelLimit = 42, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_198}" }
x888888_g_FullLevel_MissionList[45] = { MissionId = 437, MissionIndex = 500614, LevelLimit = 45, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_200}" }
x888888_g_FullLevel_MissionList[48] = { MissionId = 476, MissionIndex = 500615, LevelLimit = 48, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_202}" }
x888888_g_FullLevel_MissionList[50] = { MissionId = 480, MissionIndex = 500616, LevelLimit = 50, CompleteIdx = 0, RecordIdx = 1, MsgStr = "#{YD_20080421_204}" }

-- �������ʱ�����Զ���ӵ�����
x888888_g_AutoAccept_MissionList = {}	-- ����ID,����������,ǰ������ID,�������Ͳ���(3),�ű�����ʱMissionIndexΪScriptId
x888888_g_AutoAccept_MissionList[26] = { MissionId = 400, MissionIndex = 1018700, PreMissionId = 0,   pKill = 0, pArea = 0, pItem = 0, EventId = 4 }
x888888_g_AutoAccept_MissionList[28] = { MissionId = 403, MissionIndex = 500606, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }		
x888888_g_AutoAccept_MissionList[30] = { MissionId = 409, MissionIndex = 500602, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[32] = { MissionId = 412, MissionIndex = 500603, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[35] = { MissionId = 415, MissionIndex = 500605, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[38] = { MissionId = 418, MissionIndex = 500608, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[40] = { MissionId = 428, MissionIndex = 500612, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[42] = { MissionId = 433, MissionIndex = 500613, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[45] = { MissionId = 437, MissionIndex = 500614, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[48] = { MissionId = 476, MissionIndex = 500615, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }
x888888_g_AutoAccept_MissionList[50] = { MissionId = 480, MissionIndex = 500616, PreMissionId = 0, pKill = 0, pArea = 0, pItem = 0, EventId = 0 }

function x888888_OnSceneInit( sceneId )
--�����ڳ�ʼ����ɺ����
	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
	local monstercount = GetMonsterCount( sceneId )
	local monsterobjid = -1

	local i
	for i=0, monstercount-1 do
		monsterobjid = GetMonsterObjID( sceneId, i )
		SetLevel( sceneId, monsterobjid, GetLevel( sceneId, monsterobjid ) + LevelGap )
	end
end

function x888888_OnSceneTimer( sceneId, nowTime )
--������ʱ��
--sceneId��ʾ�����ţ�nowTime��ʾ��ǰʱ�䣨�����������ʱ�䣬��λ���룩

	sceneType = LuaFnGetSceneType(sceneId) ;

	if sceneType == 1 then --���������Ǹ���
		copyscenetype = LuaFnGetCopySceneData_Param(sceneId,0) ;--ȡ�ø�����
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���
		if copyscenetype==FUBEN_EXAMPLE then --����
			--���Ӳ��ṩ��ʱʱ��
			print("����ʹ�����Ӹ������ͣ����Ӹ������Ͳ��ṩ��ʱ�¼�")
		elseif copyscenetype==FUBEN_EXAMPLE then --
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7��ľ���︱��
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9��ľ���︱��
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_MURENXIANG then --��׼ľ���︱��
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_SHUILAO then --ˮ�θ���
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_ZHENGLONG then --������ָ���
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_PVP_LEITAI then --��̨����
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		else
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		end
	end
end

function x888888_OnSceneQuit( sceneId )
--�����ڹر�ǰ����

end

function x888888_OnScenePlayerEnter( sceneId, playerId, isReconnect )
	--����ȱʡ�ĸ�����Ϣ

	-- �����ʱ��Ӫ��������ս֮��ģ�������ΪһЩ���ܲ�׽���ƶ��¼����������ȡ�������һЩδ��������Ӫ�ű�����ԭ������
	SetUnitCampID(sceneId, playerId, playerId, -1)

	--�����翷帱����ӵĽ��Ͷ�����buff....
	LuaFnCancelSpecificImpact( sceneId, playerId, 10249 )
	LuaFnCancelSpecificImpact( sceneId, playerId, 19801 )

	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --���������Ǹ���
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���
		CallScriptFunction( copyscenescript, "OnPlayerEnter", sceneId, playerId ) ;

		local copyscenetype = LuaFnGetCopySceneData_Param( sceneId, 0 )		--ȡ�ø�����
		if copyscenetype == FUBEN_MURENXIANG_7
		 or copyscenetype == FUBEN_MURENXIANG_9
		 or copyscenetype == FUBEN_MURENXIANG
		 or copyscenetype == FUBEN_SHUILAO
		 or copyscenetype == FUBEN_ZHENGLONG
		 or copyscenetype == FUBEN_PVP_LEITAI
		 or copyscenetype == FUBEN_BIANGUAN
		 or copyscenetype == FUBEN_SHIJI1
		 or copyscenetype == FUBEN_KAOCHANG
		 or copyscenetype == FUBEN_DATAOSHA
		 or copyscenetype == FUBEN_ZEIBINGRUQIN
		 or copyscenetype == FUBEN_JIAOFEI
		 or copyscenetype == FUBEN_CUJU
		 or copyscenetype == FUBEN_DAZHAN_YZW
		 or copyscenetype == FUBEN_GODFIRE
		 or copyscenetype == FUBEN_PROTECTGUILD
		 or copyscenetype == FUBEN_PIAOMIAOFENG
		 or copyscenetype == FUBEN_XINSHENGSHOUSHAN
		 or copyscenetype == FUBEN_SEEK_TREASURE -- zchw
		 or copyscenetype == FUBEN_TIANLONG1
		 or copyscenetype == FUBEN_SHAOLIN1
		 or copyscenetype == FUBEN_MINGJIAO1
		 or copyscenetype == FUBEN_GAIBANG1
		 or copyscenetype == FUBEN_EMEI1
		 or copyscenetype == FUBEN_XINGXIU1
		 or copyscenetype == FUBEN_XIAOYAO1
		 or copyscenetype == FUBEN_WUDANG1
		 or copyscenetype == FUBEN_TIANSHAN1
		 or copyscenetype == FUBEN_BANGZHAN
		 or copyscenetype == FUBEN_SONGLIAO
		 or copyscenetype == FUBEN_FEIZHAI
		 or copyscenetype == FUBEN_ZHULIN
		then		-- ���ϸ����ж����������ص�����
			return
		end
	else
		--///////////////////////////////////////////////////////
		--�������ʦ�ŵĸ���������ɾ���������ֵġ����֡�
		local missionIdTable = {1061,1091,1066,1081,1101,1071,1096,1086,1076}
		for i, v in missionIdTable do
			if IsHaveMission(sceneId,playerId,v) > 0 then
				DelMission(sceneId, playerId, v)
				break
			end
		end
		--///////////////////////////////////////////////////////

		--���������������
		if IsHaveMission(sceneId,playerId,4021) > 0 then
			CallScriptFunction( 311010, "OnPlayerEnterCaoyunScene", sceneId, playerId )
		end
	end

	--PKֵ>4ʱ���������������ڼ����и���
	if sceneId == SCENE_PRISON and LuaFnGetHumanPKValue( sceneId, playerId ) > 4 then
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%10", -1, "0", SCENE_PRISON, 48, 30 )
		return
	end

	if GetMenPai( sceneId, playerId) ~=9 then
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%10", -1, "0", x888888_g_defaultRelive_SceneID_1, 20, 38 );
	else
		SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", -1, "0", x888888_g_defaultRelive_SceneID_2, 165, 169 );
	end

	-- ��������˻�ɽ�۽��ĳ���������������������Ӫ��  hongyu
	if sceneId == x888888_g_HS_PK_SceneId    then
		CallScriptFunction((001233), "OnScenePlayerEnter",sceneId, playerId)
		-- �������⻪ɽ�۽��ļ�ʱ���ǲ��ǿ��ţ����û�п��ʹ򿪣�
		-- ������ʱ����Id = 0
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 1230, "OnHuashanSceneTimer", 10000)
		end
	end
	
	-- ������뾺����,��һ���뾺�������ˣ��򿪼�ʱ��
	if sceneId == x888888_g_jingji_SceneId    then
		CallScriptFunction((125020), "OnScenePlayerEnter",sceneId, playerId)
		-- �������⻪ɽ�۽��ļ�ʱ���ǲ��ǿ��ţ����û�п��ʹ򿪣�
		-- ������ʱ����Id = 0
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 125020, "OnSceneTimer", 10000)
			--InitSceneData(sceneId, playerId, 125020, "OnInitScene")
		end
	end
	
	-- ��һ�����뾵����������ң��������������ļ�ʱ��
	if sceneId == x888888_g_Jinghu_SceneId   then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 005116, "OnSceneTimer", 10000)
		end
	end

	--��һ�������ݵ㳡������ң������������ּ��еļ�ʱ��
	if sceneId == x888888_g_XinShou_SceneId then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 898989, "OnSceneTimer",20000)
		end
	end

	--��һ�����뺮�񴲳�������ң������������񴲵ļ�ʱ��
	if sceneId == x888888_g_HanYuBed_SceneId then
		if CheckTimer(sceneId, 0) == 0  then
			SetTimer(sceneId, playerId, 808072, "OnSceneTimer",30000)
		end
	end

	-- ��ҽ���Pvp����ǰ�������޵�
	if 0 == isReconnect then
		local nSafeLevel = LuaFnGetSceneSafeLevel(sceneId)
		-- ��ҽ���ǰ�ȫ�����������޵�BUFF
		if nSafeLevel < 10000  then
			if nSafeLevel == 10 then
				LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 5927, 100 )
			else
				LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 54, 100 )
			end
		end
	end

	-- ���´�����˵�����
	CallScriptFunction( 311012, "UpdataDacoityData", sceneId, playerId )
end

--�ж��Ƿ��ǰ������
function x888888_IsGuildVip( Guildpos  )
    if (   (Guildpos == GUILD_POSITION_CHIEFTAIN) 
	    or (Guildpos == GUILD_POSITION_ASS_CHIEFTAIN)
	    or (Guildpos == GUILD_POSITION_HR)
	    or (Guildpos == GUILD_POSITION_INDUSTRY)
	    or (Guildpos == GUILD_POSITION_AGRI)
	    or (Guildpos == GUILD_POSITION_COM) 
	    or (Guildpos == GUILD_POSITION_ELITE_MEMBER) 
	   )then
        return 1;
		end
		return 0;
end


function x888888_OnSceneHumanDie( sceneId, selfId, killerId )
	--���������ű��¼�
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --���������Ǹ���
		copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���
		CallScriptFunction( copyscenescript, "OnHumanDie", sceneId, selfId, killerId )
	end
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		--�ڴ�֮ǰӦ�ü���Ƿ�PVP����
		--���������ʱ����
		CallScriptFunction( 311010, "OnHumanDie", sceneId, selfId, killerId )
		CallScriptFunction( 311012, "OnDacoity", sceneId, selfId, killerId )
	end
	
	-- �������������ڻ�ɽ�۽�������ɱ��hongyu��
	if sceneId == x888888_g_HS_PK_SceneId    then
		CallScriptFunction((001233), "OnSceneHumanDie",sceneId, selfId, killerId)
	end
	
	-- ���������� ������ ��ɱ
	if sceneId == x888888_g_jingji_SceneId    then
		CallScriptFunction((125020), "OnSceneHumanDie",sceneId, selfId, killerId)
	end
	
	--���ս�����
	if IsInGuildWar(sceneId, selfId, killerId) == 1 then
	
		local Guildpos = GetGuildPos(sceneId, selfId)
		if ( x888888_IsGuildVip(Guildpos)==1 ) then
			local selfName = GetName(sceneId, selfId);
			local guildName_self = LuaFnGetGuildName(sceneId, selfId);
			
			local killerName = GetName(sceneId, killerId);
			local guildName_killer = LuaFnGetGuildName(sceneId, killerId);
			
			local sMessage = format("@*;SrvMsg;GLD:#W��������#R%s#W�ڰ�ս��ԡѪ��ս������#G%s#W����#R%s#W��Ϊ���Ӣ������", selfName, guildName_killer ,killerName);	
			BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
			
			sMessage = format("@*;SrvMsg;GLD:#R%s#W�ڰ�ս�д�չ���֣��ɹ���ɱ#G%s#W�������#R%s#W�������˰���������", killerName, guildName_self, selfName);	
			BroadMsgByChatPipe(sceneId, killerId, sMessage, 6);
		end
		
	end

end

--�����������¼�������
function x888888_OnCanLevelup(sceneId, objId)
	local playerLevel = GetLevel(sceneId, objId)
	if playerLevel >= 10 and playerLevel <= 14 then
		LuaFnSendSystemMail(sceneId, GetName(sceneId, objId), "�����Դ�#gfff0f0������棨��Alt+c��#g000000֮�󣬵��#gfff0f0�������·���������ť#g000000����������������ȼ�����Ȼ��Ҳ�������ž��鵽#gfff0f0���ɵ�ʦ����ѧϰ����#g000000��")
	end
end

function x888888_OnSceneHumanLevelUp( sceneId, objId, level )

	if	IsHaveMission(sceneId,objId,718) > 0	 then
			misIndex = GetMissionIndexByID(sceneId,objId,718)
			SetMissionByIndex( sceneId, objId, misIndex, 1, level)
			if level >= 10 then
				SetMissionByIndex( sceneId, objId, misIndex, 0, 1)
			end
	end

--��Ӧ�ȼ������ʼ�
	if level > 1 then
		local looptime = 1
		local mailnum = x888888_g_MailNum[level][2]
		if mailnum > 0 then
			while looptime <= mailnum do
				--PrintStr("#{LevelMail_"..level.."_"..looptime.."}")
				LuaFnSendSystemMail( sceneId, GetName(sceneId,objId), "#{LevelMail_"..level.."_"..looptime.."}" )
				looptime = looptime + 1
			end
		end
	end
	
	--ͽ������45ʱ�򣬳�ʦ���ó�ʦ��־
	if LuaFnHaveMaster( sceneId, objId ) ~= 0  and level == 45 then
			SetMissionFlag(sceneId, objId, MF_ShiTu_ChuShi_Flag, 1)
	end
	
	--ͽ��������ʦ���齱�Ļ���
	if level == 40 or level == 50 then
		--local stbegin = 7285; --10.12
		local stbegin = 7304; --11.01
		local stend		= 7325; --11.22
		local stprize = {[40]=40004432,[50]=40004433}
		local strtip	= {[40]="��ʦ",[50]="�ؼ���ʦ"}
		
		local curDayTime = GetDayTime()
		local MasterGUID = LuaFnGetMasterGUID( sceneId, objId )
		
		if curDayTime >= stbegin and curDayTime <= stend and MasterGUID ~= -1 then
			if LuaFnHaveMaster( sceneId, objId ) ~= 0 then
				local MasterName = LuaFnGetFriendName( sceneId, objId, MasterGUID )
				--����һ����ͨ�ʼ���ʦ��
				LuaFnSendSystemMail( sceneId, MasterName, "���ͽ��"..GetName(sceneId,objId).."�Ѿ��ɹ���������"..tostring(level).."�������������˲����ڡ��±��ᱦ����ڼ䣬�����ȥ�����ǹ�����[110��162]����μ�һ��"..strtip[level].."�齱��" )
				--����һ�⽱��ִ���ʼ���ʦ��
				LuaFnSendScriptMail( sceneId, MasterName, MAIL_SHITUPRIZE, level, stprize[level], 1)
				--����ϵͳ�����ȫ����
				local uname = format("#{_INFOUSR%s}",GetName(sceneId,objId))
				local oname = format("#{_INFOUSR%s}",MasterName)
				local str = format("%s#P�����žŰ�ʮһ�ѣ�����˳������#Y%d��#P�����������˲����ڡ��±��ᱦ����ڼ䣬��Ϊ��ʦ����%s#P���һ�βμ�#Y%s#P�齱�Ļ��ᣡ",uname,level,oname,strtip[level])
				BroadMsgByChatPipe(sceneId, objId, str, 4)
			end
		end
	end

	--2007ʥ��Ԫ���....ϲ���콵�....
	CallScriptFunction( 050022, "OnPlayerLevelUp", sceneId, objId )

	--ʦͽ�ܶ�Ա
	CallScriptFunction( 806020, "OnPlayerLevelUp", sceneId, objId )
		
	-- ���ﵽ�ȼ�Ҫ�������������
	-- [ QUFEI 2008-04-17 14:18 UPDATE BugID 33891 ]
	x888888_OnAutoAcceptMission( sceneId, objId, level )
	
	-- �����������������������������ɱ�־
	x888888_OnSetCompleteMission( sceneId, objId, level )
	
end

--��Ҹ�������
function x888888_OnSceneHumanChangeMenpai( sceneId, objId, Menpai )
	if	IsHaveMission(sceneId,objId,719) > 0	 then
			misIndex = GetMissionIndexByID(sceneId,objId,719)
			if( Menpai >= 0 and Menpai < 9 ) then
			    SetMissionByIndex( sceneId, objId, misIndex, 1, 1)
			    SetMissionByIndex( sceneId, objId, misIndex, 0, 1)
			end
	end
end

function x888888_OnSceneNotify( sceneId, destsceneId )
--sceneId Ϊ����������ڳ���ID, destsceneIdΪ��������ID
--�˺�����Ӧ���ñ�ʾ���������Ѿ���ʼ����ɣ����Դ��������

	destsceneType = LuaFnGetSceneType(destsceneId) ;

	if destsceneType == 1 then --���������Ǹ���

		copyscenetype = LuaFnGetCopySceneData_Param(destsceneId,0) ;--ȡ�ø�����
		copyscenescript = LuaFnGetCopySceneData_Param(destsceneId,1) ; --ȡ�ýű���

		if copyscenetype==FUBEN_EXAMPLE then --����
			--���Ӳ��ṩ���������¼�
			print("����ʹ�����Ӹ������ͣ����Ӹ������Ͳ��ṩ���������¼�")
		elseif copyscenetype==FUBEN_EXAMPLE then --
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7��ľ���︱��
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9��ľ���︱��
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_MURENXIANG then --��׼ľ���︱��
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_SHUILAO then --ˮ�θ���
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_ZHENGLONG then --������ָ���
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_PVP_LEITAI then --��̨����
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		else
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		end
	end
end

-- ��·
function x888888_AskTheWay( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- ��·(����)
function x888888_AskThePos( sceneId, selfId, sceneNum, x, y, tip )
	Msg2Player( sceneId, selfId, "@*;flagPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashPOS;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )
end

-- ȥ����·���
function x888888_DelSignpost( sceneId, selfId, sceneNum, npcName )
	Msg2Player( sceneId, selfId, "@*;flagNPCdel;" .. sceneNum .. ";" .. npcName, MSG2PLAYER_PARA )
	Msg2Player( sceneId, selfId, "@*;flashNPCdel;" .. sceneNum .. ";" .. npcName, MSG2PLAYER_PARA )
end

-- ������Ч��UICommandID = 1234
function x888888_PlaySoundEffect( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1234)
end

--������ܼ��
function x888888_OnAcceptMissionCheck( sceneId, selfId, missionScript )
	if GetMissionCount(sceneId, selfId)>=20 then
		BeginEvent(sceneId)
			strText = "����������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end

	return 1
end

--��ҽ�ɫʱ���¼�
function x888888_OnScenePlayerTimer( sceneId, selfId, nowtime )
	--�������������
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		CallScriptFunction( 311010, "OnPlayerCaoyunTimer", sceneId, selfId )
	else
		SetCharacterTimer( sceneId, selfId, 0 )
	end
end

--��ҽ�ɫ��½��Ϸ�¼�, ���¼�������ҵ���x888888_OnScenePlayerEnter�¼�֮�����
function x888888_OnScenePlayerLogin( sceneId, selfId, nowtime )
	CallScriptFunction( 888890, "OnDefaultEvent", sceneId, selfId )

	-- ���ó�ʼ��Npc��ϵֵ
	CallScriptFunction( 200099, "InitRelation", sceneId, selfId )
	
	--����һ�ڼ䷢�ʼ�:��һ��ȡ���ƻ	--add by xindefeng
	CallScriptFunction( 808090, "OnPlayerLogin", sceneId, selfId )
	-- ��һ��������ʼ�
	CallScriptFunction( 808091, "OnPlayerLogin", sceneId, selfId )
	
	-- ��ʼ���ͻ��˵�½�ڵĽ������
	CallScriptFunction( 870001, "UISystemOnLogin", sceneId, selfId )
	

	-- ʦͽ�ܶ�Ա�������ʼ�
	CallScriptFunction( 806020, "OnPlayerLogin", sceneId, selfId )	
	
	--���߾�����������
	CallScriptFunction( 500619, "CheckUnlineGift", sceneId, selfId )
	
	--�绰�ܱ����ʼ���ʾ���߻�Ҫ����ʱ�ر��ʼ���ʾ by hukai #38665
	--CallScriptFunction( 210245, "SendMail", sceneId, selfId, nowtime )
	-- �������ѧ�ᡰ�����ռ�������
	if QueryHumanAbilityLevel(sceneId, selfId, 50) < 1 then
		SetHumanAbilityLevel(sceneId, selfId, 50, 1);
	end
	-- �������ѧ���ս�вɿ���
	if QueryHumanAbilityLevel(sceneId, selfId, 51) < 1 then
		SetHumanAbilityLevel(sceneId, selfId, 51, 1);
	end	
	
	--��г�⻷
	CallScriptFunction( 808124, "OnPlayerLogin", sceneId, selfId )
	
	--������ʾ�ʼ�
	CallScriptFunction( 332207, "NotifyMailOnLogin", sceneId, selfId )

	x888888_AskDeleteMinorPasswordTime(sceneId, selfId) 
	-- ���˽ڻ����ͨ��
	CallScriptFunction( 808079, "OnPlayerLogin", sceneId, selfId )
	
	-- �������껪
	-- CallScriptFunction( 889055, "OnPlayerLogin", sceneId, selfId )

	--�������߹���
	CallScriptFunction( 380002, "OnDefaultEvent", sceneId, selfId )
	
	--����������Ϣ
	CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
end

--��Ҵ�����ɫ���һ�ε�½��Ϸ�¼�, ���¼�������ҵ���x888888_OnScenePlayerEnter��
--��֮��x888888_OnScenePlayerLogin�¼�֮ǰ����
function x888888_OnScenePlayerFirstLogin( sceneId, selfId, nowtime )
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{DLYJ_081009_01}"..PlayerName..PlayerSex.."#{DLYJ_081009_02}" )
	LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#e00f000С��ʾ��#e000000#r#Y���Ͻǵ��״ﴰ��������ʾ��ǰ�����ڵ����ꡣ#Y���������������ߡ�#Y����Ҽ���ס�����ƶ���������ת��ʾ�ӿڡ�#Y����м�����ǰ��ת�������Ե����ӿ�Զ����#GALT+HOME/END#Y���Ա任�ӽǡ�" )
	
	CallScriptFunction( 808065, "SendMail", sceneId, selfId )

	--������������һ�������⻷
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 8000, 0)

	ItemID ={10100100,10101100,10102100,10103100,10104100,10105100}
	i=random(1,6)
	BeginAddItem(sceneId)

	--�͸����һ������������
	local WorldReferenceID = 10155001
	local WorldReferenceID1 = 10141030
	local WorldReferenceID2 = 10141040
	local WorldReferenceID3 = 30501319
	local DenglongID = 30505162
	local UniverseBagID = 30008059
	AddItem( sceneId, WorldReferenceID, 1 )
	AddItem( sceneId, WorldReferenceID1, 1 )
	AddItem( sceneId, WorldReferenceID2, 1 )
	AddItem( sceneId, WorldReferenceID3, 1 )

	AddItem( sceneId, UniverseBagID, 1 )

	local nowYear = GetTodayYear();
	local nowMonth = GetTodayMonth();
	local nowDate = GetTodayDate();
	
	--PrintNum(nowYear);
	--PrintNum(nowMonth);
	--PrintNum(nowDate);
	
	if (nowYear == 2008) then
		if(nowMonth==0) then
			if(nowDate>=16 and nowDate<=27) then
				AddItem( sceneId, DenglongID, 1 )
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{TQLQ_20071218_01}" )
			end
		end
	end
	
	AddItem( sceneId,ItemID[i],1)

	EndAddItem(sceneId,selfId)
	AddItemListToHuman(sceneId,selfId)
	--������ȡ��������־
	SetMissionFlag(sceneId, selfId, MF_GetQianKunDai, 1)

	AddMission( sceneId,selfId, 718, 210238, 0, 0, 0 )

	SetMissionData( sceneId, selfId, MD_RELATION_QIANHONGYU, 500 )	-- ���ú�Ǯ����ĳ�ʼ��ϵ

	--˫������ʾ�ʼ�....
	CallScriptFunction( 808075, "OnPlayerFirstLogin", sceneId, selfId )
	
end

-- ͳһ��һ�����
function x888888_CheckSubmit( sceneId, selfId, missionId )
	local bHave = IsHaveMission( sceneId, selfId, missionId )
	local bHaveDone = IsMissionHaveDone( sceneId, selfId, missionId )

	-- û�н�
	if bHave <= 0 then
		return 0
	end

	-- �Ѿ���ɹ�
	if bHaveDone >= 1 then
		return 0
	end

	return 1
end

-- �����еĽ�ɫ������ɱ
function x888888_OnScenePlayerOpenRevenge(sceneId, openerGUID, targetGUID)
	LuaFnSendMailToGUID(sceneId, openerGUID, "���Ѿ������˶�Ŀ��ĳ�ɱ")
	LuaFnSendMailToGUID(sceneId, targetGUID, "���߽�����Ī���¶ˣ����������ɱ�㣬�Ѿ���Ч��һСʱ�ڻ���ע�ⰲȫΪ�")
	return 1
end

-- �����еĽ�ɫ�رճ�ɱ
function x888888_OnScenePlayerCloseRevenge(sceneId, openerGUID, targetGUID)
	LuaFnSendMailToGUID(sceneId, openerGUID, "���Ѿ��ر��˶�Ŀ��ĳ�ɱ")
	LuaFnSendMailToGUID(sceneId, targetGUID, "Ҫ��ɱ����˵�ŭ���Ѿ�ƽϢ��")

	return 1
end

function x888888_PlayBackSound( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 124)
end

function x888888_StopBackSound( sceneId, selfId, soundId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, soundId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 125)
end

-- һ���ǿ��Ÿ��߻�ʹ�õ��ýű�Ӱ����ҵ�HP��MP��Vigor��VigorRegenerate��Energy��EnergyRegenerate�������ֵ
-- Hp���ֵ����
function x888888_MaxHpRefix( sceneId, selfId )
  local nValue = 0
  local nAbilityID = 40 --Ӱ��HP���ֵ������ܵ�ID
  local nMulti = 1 --HP���ֵ��Ӱ��ϵ��
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end

-- Mp���ֵ����
function x888888_MaxMpRefix( sceneId, selfId)
  local nValue = 0
  local nAbilityID = 41 --Ӱ��MP���ֵ������ܵ�ID
  local nMulti = 1 --MP���ֵ��Ӱ��ϵ��
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- Vigor���ֵ����
function x888888_MaxVigorRefix( sceneId, selfId)
  local nValue = 0
  local nAbilityID = 42 --Ӱ��Vigor���ֵ������ܵ�ID
  local nMulti = 1 --HP���ֵ��Ӱ��ϵ��
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- VigorRegenerateֵ����
function x888888_VigorRegenerateRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 44 --Ӱ��VigorRegenerateֵ������ܵ�ID
  local nMulti = 1 --HP���ֵ��Ӱ��ϵ��
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- Energy���ֵ����
function x888888_MaxEnergyRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 43 --Ӱ��Energy���ֵ������ܵ�ID
  local nMulti = 1 --Energy���ֵ��Ӱ��ϵ��
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end
-- EnergyRegenerateֵ����
function x888888_EnergyRegenerateRefix( sceneId, selfId)
  local nValue
  local nAbilityID = 45 --Ӱ��EnergyRegenerateֵ������ܵ�ID
  local nMulti = 1 --HP���ֵ��Ӱ��ϵ��
  nValue = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID) * nMulti;
  return nValue
end

function x888888_OnPlayerPickupItemFromDropBox(sceneId, selfId, itemId, bagidx, bGem)

	local playerName = GetName(sceneId, selfId)
	local itemName = GetItemName(sceneId, itemId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)

	-- ��Ĺ װ����������繫��
--	if itemId == 10401002 or
--		 itemId == 10401003 or
--		 itemId == 10401004 or
--		 itemId == 10403002 or
--		 itemId == 10403003 or
--		 itemId == 10403004 or
--		 itemId == 10405001 or
--		 itemId == 10405002 or
--		 itemId == 10405003 or
		 
--		 itemId == 10404002 or
--		 itemId == 10404003 or
--		 itemId == 10404004    then
		
--		CallScriptFunction( 212220, "ItemBulletin", sceneId, selfId, itemId, bagidx, bGem ) ;
		
--	end
	
	-- ����������繫��
	if itemId == 30505136 or
		 itemId == 30505137 or
		 itemId == 30505138 or
		 itemId == 30505139 or
		 itemId == 30505140 or
		 itemId == 30505141 or
		 itemId == 30505142    then
		
		CallScriptFunction( 808058, "PlayerPickUpLongZhu", sceneId, selfId, bagidx ) ;
		
	end
	
	--���̫����Ƭ����....
	if itemId == 30505120 then
		CallScriptFunction( 210242, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end
	
	--��ö�ü����
	if itemId == 30308043 and sceneId == 25 then

		local TeammateCount = GetTeamMemberCount( sceneId, selfId );
		local sNameBroad = playerName;


		local randMessage = random(3);
		if randMessage == 1 then
	   		message = format("#{JinGang_00}#W#{_INFOUSR%s}#P#{JinGang_01}#W#{_INFOUSR%s}#P#{JinGang_02}#{_INFOMSG%s}��", sNameBroad, sNameBroad, transfer );
		elseif randMessage == 2 then
			message = format("#{JinGang_03}#W#{_INFOUSR%s}#P#{JinGang_04}#{_INFOMSG%s}#P#{JinGang_05}", sNameBroad, transfer );
		else
			message = format("#{JinGang_06}#W#{_INFOUSR%s}#P#{JinGang_07}#W#{_INFOUSR%s}#P#{JinGang_08}#{_INFOMSG%s}#P#{JinGang_09}", sNameBroad, sNameBroad, transfer );
		end
		BroadMsgByChatPipe(sceneId, selfId, message, 4);

		return 0;
	end
	--������ּ���
	if itemId == 30308045 and sceneId == 32 then

		local TeammateCount = GetTeamMemberCount( sceneId, selfId );
		local sNameBroad = playerName;

		local randMessage = random(3);
		if randMessage == 1 then
	   		message = format("#{JinGang_10}#W#{_INFOUSR%s}#P#{JinGang_11}#W#{_INFOUSR%s}#P#{JinGang_12}#{_INFOMSG%s}#P#{JinGang_13}", sNameBroad, sNameBroad, transfer );
		elseif randMessage == 2 then
			message = format("#{JinGang_14}#W#{_INFOUSR%s}#P#{JinGang_15}#W#{_INFOUSR%s}#P#{JinGang_16}#{_INFOMSG%s}#P#{JinGang_17}", sNameBroad, sNameBroad, transfer );
		else
			message = format("#{JinGang_18}#W#{_INFOUSR%s}#P#{JinGang_19}#{_INFOMSG%s}#P#{JinGang_20}", sNameBroad, transfer );
		end
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		return 0;
	end

	--����ǧ���
	if itemId == 40004414 then
		local nCurTime = LuaFnGetCurrentTime()
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
		SetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2, nCurTime )
		return 0;
	end

	--07ʥ��Ԫ���....
	--ʥ����ҹ�....����ѩ��ɢ�䱦��ʰȡ����....
	local bSend = 0
	if sceneId == 0 then
		bSend = CallScriptFunction( 050023, "OnPlayerPickUpItemInLuoyang", sceneId, selfId, itemId, bagidx )
	end
	if bSend == 1 then
		return
	end

	--�����ᱦʰȡ����....
	local bSend = 0
	if sceneId == 410 then
		bSend = CallScriptFunction( 891000, "OnPlayerPickUpItemInLuoyang", sceneId, selfId, itemId, bagidx )
	end
	if bSend == 1 then
		return
	end


	--���񴲱���ʰȡ����....
	if sceneId == x888888_g_HanYuBed_SceneId and bGem == 3 then
		CallScriptFunction( 808072, "OnPlayerPickUpItemInHanYuBed", sceneId, selfId, itemId, bagidx )
	end


	--���޵���Ʒ����....
	if sceneId == x888888_g_NianShou_SceneId then
		CallScriptFunction( 050052, "OnPlayerPickUpItemInNianShou", sceneId, selfId, itemId, bagidx )
	end
	
	--ʥ��ɽ���Ұ�����ټ�����....
	--[ QUFEI 2008-04-16 14:38 UPDATE BugID 31936 ]
	if itemId == 40004429 then
		CallScriptFunction( 808066, "OnPlayerPickUpItemInBoar", sceneId, selfId, itemId, bagidx ) ;
	end
	
	
	local str
	if bGem == 1 then
		local a = { "#W#{_INFOUSR%s}#I��������ʱ���һö#W#{_INFOMSG%s}��",
								"#W#{_INFOUSR%s}#I׼�����ϱ���ʱ�ڽ������淢����һö#W#{_INFOMSG%s}��",
								"#W#{_INFOUSR%s}#Iһ�����ڱ����ϣ�������һö#W#{_INFOMSG%s}��"
							}
		local index = random(getn(a))
		str = format(a[index], playerName, transfer)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)

	elseif  bGem == 2 then

		--����һ��35���ķ��ؼ���65���书�ؼ����������繫��
		local bFlag = 0;
		--for i = 0, 8 do
		--	if ( x888888_MenPaiBroadMsg[ i ].XinFa == itemId ) or ( x888888_MenPaiBroadMsg[ i ].MiJi == itemId ) then
		--		bFlag = 1;
		--		break;
		--	end
		--end

		if bFlag > 0 then

			local TeammateCount = GetTeamMemberCount( sceneId, selfId )
			local sTeamLeaderName = playerName;
			for i=0, TeammateCount-1 do
				TeammateID = GetNearTeamMember( sceneId, selfId, i )
				if LuaFnIsTeamLeader( sceneId, selfId ) then
					sTeamLeaderName = GetName(sceneId, selfId);
					break;
				end
			end

			local mp = LuaFnGetCopySceneData_Param(sceneId, 11);
			local mpName = x888888_MenPaiBroadMsg[mp].mp;

			local message;

			local randMessage = random(3);

			if randMessage == 1 then
	   			message = format("#W#{_INFOUSR%s}#P#{DropItem_00}#G%s#P#{DropItem_01}#Y%s#P#{DropItem_02}#{_INFOMSG%s}#P#{DropItem_03}", sTeamLeaderName, mpName, mpName, transfer );
			elseif randMessage == 2 then
				message = format("#{DropItem_04}#G%s#P#{DropItem_05}#W#{_INFOUSR%s}#P#{DropItem_06}#{_INFOMSG%s}#P#{DropItem_07}", mpName, sTeamLeaderName, transfer );
			else
				message = format("#{DropItem_08}#G%s#P#{DropItem_09}#W#{_INFOUSR%s}#P#{DropItem_10}#{_INFOUSR%s}#P#{DropItem_11}#{_INFOMSG%s}#P#{DropItem_12}", mpName, sTeamLeaderName,sTeamLeaderName, transfer );
			end
			BroadMsgByChatPipe(sceneId, selfId, message, 4);
		end

	elseif bGem == 0 then

		local a = { "#W#{_INFOUSR%s}#I�ڿ��������ʱ����#W#{_INFOMSG%s}��",
								"#W#{_INFOUSR%s}#I�ڱ���Ľ������淢����һ���ƾɵ�#W#{_INFOMSG%s}��",
								"#W#{_INFOUSR%s}#I�ѱ��䷭�˹���������һ��#W#{_INFOMSG%s}#I���ڱ���ײ���"
							}
		local index = random(getn(a))
		str = format(a[index], playerName, transfer)
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
		
	elseif bGem == 3 then
		
		--�����鱦�乫��
		local	rnd	= random( 3 )
		local	msg	= nil
		local	fnd	= 0
		local	lst	=
		{
			30402012, 30402014, 30402016, 30402018, 30402020, 
			30402025, 30402026, 30402029, 30402030, 30402033, 
			30402034, 30402035, 30402036, 30402037, 30402038, 
			30402039, 30402040, 30402041, 30402042, 30402043, 
			30402044, 30402045, 30402046, 30402047, 30402048, 
			30402049, 30402050, 30402051, 30402052, 30402053, 
			30402054, 30402055, 30402056, 30402059, 30402060, 
			30402061, 30402062, 30402063, 30402064, 30402065, 
			30402066, 30402067, 30402068, 30402069, 30402070, 
			30402072, 30402073, 30402074, 30402075, 30402076, 
			30402077, 30402078, 30402079, 30402080, 30402081, 
			30402082, 30402083, 30402084, 30402085, 30402086, 
			30402087, 30402088, 30402089, 30402090,	
		}
		for i = 1, getn( lst ) do
			if lst[ i ] == itemId then
				fnd		= 1
				break
			end
		end
		if fnd == 1 then
			if rnd == 1 then
		   	msg	= format( "#W#{_INFOUSR%s}#I�ڿ��������ʱ����#W#{_INFOMSG%s}��",
		   					playerName, transfer )
			elseif rnd == 2 then
				msg	= format( "#W#{_INFOUSR%s}#I�ڱ���Ľ������淢����һ���ƾɵ�#W#{_INFOMSG%s}��",
								playerName, transfer )
			else
				msg	= format( "#W#{_INFOUSR%s}#I�ѱ��䷭�˹���������һ��#W#{_INFOMSG%s}#I���ڱ���ײ���",
								playerName, transfer )
			end
			BroadMsgByChatPipe( sceneId, selfId, msg, 4 )
			return
		end

	end
	
	-- ����΢��2008.6.10�����ӹ���420������˪ӰBOSSͳ��...
	if sceneId == 420 then
		CallScriptFunction( 808040, "OnPlayerPickUpItemFromShangyingBoss", sceneId, selfId, itemId, bagidx )
	end
	
	--�ƽ�֮��
	if itemId == 40004453 then
		CallScriptFunction( 050220, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end
	
	--������
	if itemId == 40004454 then
		CallScriptFunction( 050221, "PickupItem", sceneId, selfId, itemId, bagidx ) ;
	end

end

--����������Խ��м��
function x888888_Check_MissionAvailable(sceneId, playerId, missionId)
	--//////////////////////////////////////////////////////////
	--�����������Լ��
	local renwulianMissionId = 1202
	if missionId == renwulianMissionId then
	if IsHaveMission(sceneId, playerId, renwulianMissionId) > 0 then
		local MissionType = {wenhou=1, suoqu=2, fubenjiaoxun=3, fubenduowu=4, chongwu=5}
		local misIndex = GetMissionIndexByID(sceneId, playerId, renwulianMissionId)
		local missionType = GetMissionParam(sceneId, playerId, misIndex, 1)

		local bAvailable = 1
		if missionType == MissionType.wenhou then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 5)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..wenhou..npcId=" .. tostring(npcId))
				bAvailable = 0
			end
		elseif missionType == MissionType.suoqu then
			local itemId = GetMissionParam(sceneId, playerId, misIndex, 5)
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 6)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) or
				 0 == CheckItemAvailable(sceneId, playerId, itemId)	then
						 MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..suoqu..npcId=" .. tostring(npcId)
					 .. ",itemId=" .. tostring(itemId))
				 bAvailable = 0
			end
		elseif missionType == MissionType.chongwu then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 6)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
				bAvailable = 0
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..chongwu..npcId=" .. tostring(npcId))
			end
		elseif missionType == MissionType.fubenjiaoxun then
			local npcId = GetMissionParam(sceneId, playerId, misIndex, 5)
			if 0 == CheckNpcAvailable(sceneId, playerId, npcId) then
						MissionLog(sceneId, "error: x888888_Check_MissionAvailable..renwulian..fubenjiaoxun..npcId=" .. tostring(npcId))
				bAvailable = 0
			end
		end
		-- �����������ɾ��
		if 0 == bAvailable then
			DelMission(sceneId, playerId, renwulianMissionId)
		end
	end
	end
	--//////////////////////////////////////////////////////////

	--Add other code ...
	local xingxiuMissionId = 1095
	if missionId == xingxiuMissionId then
		if IsHaveMission(sceneId, playerId, xingxiuMissionId) > 0 then
			local bAvailable = 1
			local MissionType = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8,  killMonster=9}
			local misIndex = GetMissionIndexByID(sceneId, playerId, xingxiuMissionId)
			local missionType = GetMissionParam(sceneId, playerId, misIndex, 1)
			if missionType == MissionType.XunWu then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 5)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.XunWu..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.XunWu..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			elseif missionType == MissionType.KaiGuang then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 6)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.KaiGuang..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.KaiGuang..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			elseif missionType == MissionType.ShouJi then
				local demandItemId = GetMissionParam(sceneId, playerId, misIndex, 6)
				if demandItemId <= 0 then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.ShouJi..demandItemId=" .. type(demandItemId))
					bAvailable = 0
				end
				local itemId, itemName, itemDesc = GetItemInfoByItemId(demandItemId)
				if itemName == nil or itemDesc == nil or itemId == nil then
					MissionLog(sceneId, "error: x888888_Check_MissionAvailable..xingxiushimen.ShouJi..itemName=" .. type(itemName)
						.. ",itemDesc=" .. itemDesc .. ",itemId=" .. itemId)
					bAvailable = 0
				end
			end
			if bAvailable == 0 then
				DelMission(sceneId, playerId, xingxiuMissionId)
			end
		end
	end

end

function x888888_OnAcceptCheck( sceneId, objId, level )

	-- �����Ƿ�����
	if IsMissionFull( sceneId, objId ) == 1 then
		return 0
	end

	local missioninfo = x888888_g_AutoAccept_MissionList[level]
	--���ȼ�
	if not missioninfo then
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, objId, missioninfo.MissionId ) > 0 then
		return 0
	end

	--�Ѿ������򲻷�������
	if IsMissionHaveDone(sceneId, objId, missioninfo.MissionId) > 0   then
		return 0
	end

	--���ǰ������
	if missioninfo.PreMissionId > 0 then
		if IsMissionHaveDone(sceneId, objId, missioninfo.PreMissionId) <= 0   then
			return 0
		end
	end
	
	return 1
end

function x888888_OnAutoAcceptMission( sceneId, objId, level )

	-- ��������������
	if x888888_OnAcceptCheck( sceneId, objId, level ) > 0 then
		local missioninfo = x888888_g_AutoAccept_MissionList[level]

		if missioninfo ~= nil then
			local ret = AddMission( sceneId, objId, missioninfo.MissionId, missioninfo.MissionIndex, missioninfo.pKill, missioninfo.pArea, missioninfo.pItem )	-- kill��area��item
			if ret == 1 and missioninfo.EventId ~= 0 then
				SetMissionEvent( sceneId, objId, missioninfo.MissionId, missioninfo.EventId )
			end
		end
	end
end

function x888888_OnCompleteCheck( sceneId, objId, level )

	local missioninfo = x888888_g_FullLevel_MissionList[level]
	--���ȼ�
	if not missioninfo then
		return 0
	end

	if IsHaveMission( sceneId, objId, missioninfo.MissionId ) <= 0 then
		return 0
	end

	-- �Ƿ�ﵽ����ȼ�
	local Playerlvl = LuaFnGetLevel( sceneId, objId )
	if Playerlvl < missioninfo.LevelLimit then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,objId,missioninfo.MissionId)

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, objId, misIndex, missioninfo.CompleteIdx) <= 0 then
		return 1
	end
	
	return 0
	
end

function x888888_OnSetCompleteMission( sceneId, objId, level )

	-- ��������������
	if x888888_OnCompleteCheck( sceneId, objId, level ) > 0 then
		local missioninfo = x888888_g_FullLevel_MissionList[level]
		
		if missioninfo ~= nil then

			local misIndex = GetMissionIndexByID(sceneId,objId,missioninfo.MissionId)
			SetMissionByIndex( sceneId, objId, misIndex, missioninfo.CompleteIdx, 1 )
			SetMissionByIndex( sceneId, objId, misIndex, missioninfo.RecordIdx, 1 )
			
			BeginEvent( sceneId )
				AddText( sceneId, missioninfo.MsgStr )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, objId )
		end
	end

end

-- ������ҵ����ݣ������ڽű����޸�������ݣ�Ȼ����Server�������õ����
function x888888_UpdatePlayerData(sceneId, playerId)
	-- ���°�����������N������״̬
	CallScriptFunction( 332207, "CalcDarkMultiExpRate", sceneId, playerId ) ;
	
end


-- ����ҵİ�������ʱ����õĺ���
function x888888_OnDarkLevelUp(sceneId, playerId, levelaftlevel)
	
	--��ʾ����������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
	
	--�����������
	
end

function x888888_AskDeleteMinorPasswordTime(sceneId, playerId)
	local lefttime = LuaFnGetPasswordDeleteRemainTime(sceneId, playerId)
	if lefttime >= 0 then	
		LuaFnSendSystemMail( sceneId, GetName(sceneId,playerId), "#{SMTX_090309_1}"..tostring(lefttime).."#{SMTX_090309_2}" )
	end
end


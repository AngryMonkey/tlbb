--BOSS�������ؽű�

--�ű���
x050030_g_scriptId = 050030

x050030_g_StartDayTime	= 09097		--���ʼ(�ײ�)ʱ�� 2009-4-8
x050030_g_EndDayTime		= 09131		--�����ʱ�� 2009-5-12


--���̻�������....
x050030_g_MaxFireCount = 18

--�̻���....
x050030_g_FireShowTbl = {

	[18] = { {x=160,y=105,id=4},{x=160,y=114,id=39} }, --zchw
	[17] = { {x=160,y=105,id=8} },
	[16] = { {x=150,y=114,id=17},{x=150,y=97,id=17},{x=169,y=97,id=17},{x=169,y=114,id=17} },
	[15] = { {x=160,y=105,id=15},{x=160,y=114,id=41} }, --zchw
	[14] = { {x=160,y=105,id=3},{x=160,y=105,id=6} },
	[13] = { {x=157,y=108,id=6},{x=162,y=108,id=6},{x=162,y=103,id=6},{x=157,y=103,id=6} },
	[12] = { {x=160,y=105,id=14},{x=160,y=114,id=39} },--zchw
	[11] = { {x=160,y=105,id=16} },
	[10] = { {x=160,y=105,id=7},{x=160,y=105,id=6} },
	[9]  = { {x=160,y=105,id=13},{x=160,y=114,id=41} }, --zchw
	[8]  = { {x=150,y=114,id=20},{x=150,y=97,id=20},{x=169,y=97,id=20},{x=169,y=114,id=20} },
	[7]  = { {x=160,y=105,id=11},{x=160,y=105,id=9} },
	[6]  = { {x=160,y=105,id=8},{x=160,y=105,id=17},{x=160,y=114,id=39} }, --zchw
	[5]  = { {x=160,y=105,id=1},{x=160,y=105,id=5} },
	[4]  = { {x=160,y=105,id=7},{x=160,y=105,id=13},{x=160,y=105,id=6},{x=160,y=105,id=7} },
	[3]  = { {x=150,y=114,id=9},{x=150,y=97,id=9},{x=169,y=97,id=9},{x=169,y=114,id=9},{x=160,y=105,id=15},{x=160,y=114,id=41} }, --zchw
	[2]  = { {x=160,y=105,id=14},{x=160,y=105,id=13} },
	[1]  = { {x=150,y=114,id=20},{x=150,y=97,id=20},{x=169,y=97,id=20},{x=169,y=114,id=20},{x=160,y=105,id=16},{x=160,y=105,id=9} }

}


--BOSS��....
x050030_g_BOSSTbl = {

	--������....
	["SunMeiMei"] 		= { dateId = 3891, createMsg = "��" },

	--Ұ����..���..Զ�����..����ͷĿ..����....
	["YeZhuWang"] 		= { dateId = 3917, createMsg = "#{SpringFestiva2007_BOSS_15}" },
	["EBa"]						= { dateId = 3887, createMsg = "#{SpringFestiva2007_BOSS_6}"  },
	["QiHun"]					= { dateId = 3890, createMsg = "#{SpringFestiva2007_BOSS_4}"  },
	["ZeiBingTouMu"]	= { dateId = 3888, createMsg = "#{SpringFestiva2007_BOSS_5}"  },
	["KuangBaoLong"]	= { dateId = 3918, createMsg = "#{SpringFestiva2007_BOSS_16}" },

	--�඾..������..����....
	["YuDu"]					= { dateId = 3901, createMsg = "#{SpringFestiva2007_BOSS_17}" },
	["HongXiongWang"]	= { dateId = 3902, createMsg = "#{SpringFestiva2007_BOSS_18}" },
	["GeRong"]				= { dateId = 3903, createMsg = "#{SpringFestiva2007_BOSS_19}" },

	--����..Ľ�ݸ�..������....
	["DuanYu"]				= { dateId = 3924, createMsg = "#{SpringFestiva2007_BOSS_22}" },
	["MuRongFu"]			= { dateId = 3922, createMsg = "#{SpringFestiva2007_BOSS_1}"  },
	["WangYuYan"]			= { dateId = 3920, createMsg = "#{SpringFestiva2007_BOSS_23}" },

	--Сӥӥ..С����..����è..С����..С����....
	["YingYing"] 			= { dateId = 3928, createMsg = "��" },
	["ZhuZhu"]				= { dateId = 3926, createMsg = "��" },
	["FeiTianMao"]		= { dateId = 3916, createMsg = "#{SpringFestiva2007_BOSS_13}" },
	["GouGou"]				= { dateId = 3927, createMsg = "��" },
	["HuHu"]					= { dateId = 3929, createMsg = "��" },

	--[������]..ľͰ��..�׵�..�콭��..�����....
	["MuTongBo"] 			= { dateId = 3894, createMsg = "#{SpringFestiva2007_BOSS_21}" },
	["BaiDi"]					= { dateId = 3910, createMsg = "#{SpringFestiva2007_BOSS_10}" },
	["HunJiangLong"]	= { dateId = 3898, createMsg = "#{SpringFestiva2007_BOSS_14}" },
	["QiEWang"]				= { dateId = 3897, createMsg = "#{SpringFestiva2007_BOSS_20}" },

	--[�����]

	--[������]..������....
	["DuanYanQing"]		= { dateId = 3919, createMsg = "#{SpringFestiva2007_BOSS_2}"  },

	--��������....
	["HuDaoShenShou"]	= { dateId = 3893, createMsg = "#{SpringFestiva2007_BOSS_12}" },

	--[������]..�������..����ʮ��..��˿֩����..��˿֩����....
	["ChiXiaoHuoHun"]	= { dateId = 3914, createMsg = "#{SpringFestiva2007_BOSS_11}" },
	["Chun30"]				= { dateId = 3908, createMsg = "#{SpringFestiva2007_BOSS_9}"  },
	["DuSiZhiZhu"]		= { dateId = 3906, createMsg = "#{SpringFestiva2007_BOSS_7}"  },
	["ChanSiZhiZhu"]	= { dateId = 3907, createMsg = "#{SpringFestiva2007_BOSS_8}"  },

}

--BOSS�������ʱ��....(���ڷ�ֹ����ɾ����BOSS)
x050030_g_BOSSMaxLifeTime = 15*60*1000


--��Ŀ����....
x050030_g_ChapterCount = 11

--��Ŀ�ű�ID...
x050030_g_ChapterScriptIdTbl = {

	050031,
	050032,
	050033,
	050034,
	050035,
	050036,
	050037,
	050038,
	050039,
	050040,
	050041,

}


x050030_g_IDXFireCount = 0 --��ǰ�Ѿ�ȼ�ŵ��̻�������....

x050030_g_IsPlaying = 0 --��ǰ�Ƿ����ڲ��Ž�Ŀ....

--**********************************
--�ű���ں���....
--**********************************
function x050030_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--����Ƿ��ǻʱ��....
	if -1 == x050030_CheckActivityTime() then
		return
	end

	StartOneActivity( sceneId, actId, floor(10*1000), iNoticeType )
	SetActivityParam( sceneId, actId, x050030_g_IDXFireCount, x050030_g_MaxFireCount )

end

--**********************************
--��������....
--**********************************
function x050030_OnTimer( sceneId, actId, uTime )

	local CurFireCount = GetActivityParam( sceneId, actId, x050030_g_IDXFireCount )
	if CurFireCount > 0 then

		--�̻���û�Ź��������....
		x050030_PlayFire( sceneId, CurFireCount )
		SetActivityParam( sceneId, actId, x050030_g_IDXFireCount, CurFireCount-1 )

	elseif CurFireCount == 0 then

		--�̻��������򼤻��һ����Ŀ....
		x050030_PlayChapter( sceneId, 1 )
		StopOneActivity( sceneId, actId )

	end

end

--**********************************
--����ĳ����Ŀ....
--**********************************
function x050030_PlayChapter( sceneId, chapterId )

	if chapterId <= x050030_g_ChapterCount then

		--�ײ����ز�ʱ�Ż��ڽ�Ŀ��ʼ��ʱ�򷢹���....
		if -1 ~= x050030_CheckActivityTime() then
			BroadMsgByChatPipe( sceneId, -1, "#{SpringFestiva2007_BOSS_3}", 4 )
		end

		x050030_g_IsPlaying = 1
		CallScriptFunction( x050030_g_ChapterScriptIdTbl[chapterId], "OnStartThisChapter", sceneId )

	end

end

--**********************************
--��ĳ����Ŀ����ʱ�ص����ӿ�....
--**********************************
function x050030_OnChapterEnd( sceneId, chapterId )

	x050030_g_IsPlaying = 0

	--�ײ����ز�ʱ�Զ������¸���Ŀ....�㲥ʱ���Զ������¸���Ŀ....
	if -1 ~= x050030_CheckActivityTime() then
		x050030_PlayChapter( sceneId, chapterId+1 )
	end

end

--**********************************
--����ĳ��BOSS....
--**********************************
function x050030_CreateBossActor( sceneId, strName, posX, posY, notify )

	local bossData = x050030_g_BOSSTbl[strName]
	if not bossData then
		return -1
	end

	local MstId = LuaFnCreateMonster( sceneId, bossData.dateId, posX, posY, 3, 0, -1 )
	SetCharacterDieTime( sceneId, MstId, x050030_g_BOSSMaxLifeTime )
	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--�ײ����ز�ʱ�Ż��ڴ���BOSS��ʱ�򷢹���....
	local notify2 = 1
	if -1 == x050030_CheckActivityTime() then
		notify2 = 0
	end

	if notify and notify == 1 and notify2 == 1 then
		local msg = "#P[����������-������]��#W"..bossData.createMsg
		MonsterTalk(sceneId, -1, "����", msg )
	end

	return MstId

end

--**********************************
--ɾ��ĳ��BOSS....
--**********************************
function x050030_DeleteBossActor( sceneId, strName, objId )

	LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 152, 0)
	SetCharacterDieTime( sceneId, objId, 1000 )

end

--**********************************
--����Ƿ���ĳ��BOSS��Ա....
--**********************************
function x050030_IsSpecificBossActor( sceneId, strName, objId )

	local bossData = x050030_g_BOSSTbl[strName]
	if not bossData then
		return 0
	end

	local dateId = GetMonsterDataID( sceneId, objId )
	if dateId == bossData.dateId then
		return 1
	else
		return 0
	end

end

--**********************************
--��⵱ǰ�Ƿ��ǻʱ��....
--�ײ�����1 �ز�����2 ��������-1
--**********************************
function x050030_CheckActivityTime()

	local curDayTime = GetDayTime()

	if curDayTime == x050030_g_StartDayTime then
		return 1
	end

	if curDayTime > x050030_g_StartDayTime and curDayTime <= x050030_g_EndDayTime then
		return 2
	end

	return -1

end

--**********************************
--��⵱ǰ�Ƿ����ڲ��Ž�Ŀ....
--**********************************
function x050030_IsChapterPlaying( sceneId )

	return x050030_g_IsPlaying

end

--**********************************
--���̻�....
--**********************************
function x050030_PlayFire( sceneId, step )

	--����д��....�����˲�Ҫѧ....
	--CreateSpecialObjByDataIndex(sceneId, objId, 6, posX, posZ, 0)
	--CreateSpecialObjByDataIndex(sceneId, 0(!!), 6, posX, posZ, 0)

	local FireData = x050030_g_FireShowTbl[step]
	if not FireData then
		return
	end

	local FireCount = getn( FireData )
	for i=1, FireCount do
		CreateSpecialObjByDataIndex(sceneId, 0, FireData[i].id, FireData[i].x, FireData[i].y, 0)
	end

end

--2007ʥ��Ԫ���....
--ʥ����ҹ�....

--��ű�....

--�����Ҫ��֤������������ѩ����Ȼ����....��������ȷ��С��ѩ��....
--ActivityNotice.txt���������ڻʱ���ڷ���������Ҳ����ñ��ű��������....


--�ű���
x050023_g_ScriptId	= 050023

--ѩ��NPC�ű�....
x050023_g_SnowManScriptId	= 050027

--ѩ������....
x050023_g_SnowManX = 160
x050023_g_SnowManY = 114

x050023_g_SnowEndTime = 73100
--ѩ����Դ��....
x050023_g_SnowMan = {
--begin modified by zhangguoxin 090207
	--[1]  = { ID = 3870, HourTime = 72348, BallCount = -1   },
	--[2]  = { ID = 3871, HourTime = 72352, BallCount = 100  },
	--[3]  = { ID = 3872, HourTime = 72356, BallCount = 160  },
	--[4]  = { ID = 3873, HourTime = 72360, BallCount = 250  },
	--[5]  = { ID = 3874, HourTime = 72364, BallCount = 350  },
	--[6]  = { ID = 3875, HourTime = 72368, BallCount = 500  },
	--[7]  = { ID = 3876, HourTime = 72372, BallCount = 700  },
	--[8]  = { ID = 3877, HourTime = 72376, BallCount = 900  },
	--[9]  = { ID = 3878, HourTime = 72380, BallCount = 1150 },
	--[10] = { ID = 3879, HourTime = 72384, BallCount = 1400 },
	--[11] = { ID = 3880, HourTime = 72388, BallCount = 1700 },
	--[12] = { ID = 3881, HourTime = 72392, BallCount = 2000 },
	--[13] = { ID = 3882, HourTime = 72400, BallCount = 2500 }
	[1]  = { ID = 3870, HourTime = 835848, BallCount = -1   },
	[2]  = { ID = 3871, HourTime = 835852, BallCount = 100  },
	[3]  = { ID = 3872, HourTime = 835856, BallCount = 160  },
	[4]  = { ID = 3873, HourTime = 835860, BallCount = 250  },
	[5]  = { ID = 3874, HourTime = 835864, BallCount = 350  },
	[6]  = { ID = 3875, HourTime = 835868, BallCount = 500  },
	[7]  = { ID = 3876, HourTime = 835872, BallCount = 700  },
	[8]  = { ID = 3877, HourTime = 835876, BallCount = 900  },
	[9]  = { ID = 3878, HourTime = 835880, BallCount = 1150 },
	[10] = { ID = 3879, HourTime = 835884, BallCount = 1400 },
	[11] = { ID = 3880, HourTime = 835888, BallCount = 1700 },
	[12] = { ID = 3881, HourTime = 835892, BallCount = 2000 },
	[13] = { ID = 3882, HourTime = 835900, BallCount = 2500 } 
--end modified by zhangguoxin 090207
} 
  
--ɢ�䱦�������....
x050023_g_ItemBoxPos = {
  
{162,114},{164,114},{166,114},{168,114},{169,111},
{166,110},{163,115},{160,109},{166,105},{167,107},
{172,110},{171,117},{169,118},{167,118},{166,117},
{163,117},{162,117},{160,119},{161,117},{163,116},
{161,107},{176,107},{179,112},{181,111},{174,102},
{158,111},{156,111},{154,112},{157,113},{154,113},
{152,116},{153,116},{156,117},{157,118},{158,119},
{153,113},{151,109},{153,110},{157,113},{150,109},
{148,110},{146,112},{144,114},{146,115},{147,117},
{149,118},{145,105},{148,99},{137,101},{135,110},

}

--ɢ�䱦����Ʒ�����....(odds�ܺ�Ϊ100000)
x050023_g_ItemBoxDrop = {

	--����....
	{ itemId = 30002003, odds = 3000  },
	{ itemId = 30002004, odds = 3000  },
	{ itemId = 30002005, odds = 3000  },
	{ itemId = 30001003, odds = 3000  },
	{ itemId = 30001004, odds = 3000  },
	{ itemId = 30001005, odds = 3000  },
	{ itemId = 30003004, odds = 2000  },
	{ itemId = 30003005, odds = 2000  },
	{ itemId = 30003006, odds = 2000  },
	{ itemId = 20309010, odds = 4000  },
	{ itemId = 20309011, odds = 4000  },
	{ itemId = 20309012, odds = 4000  },
	{ itemId = 20309013, odds = 4000  },

	--�ͼ�ñ��....
	{ itemId = 10410098, odds = 400   },
	{ itemId = 10410099, odds = 1000  },
	{ itemId = 10410100, odds = 1600  },
	{ itemId = 10410101, odds = 2000  },

	--�߼�����....
	{ itemId = 20309014, odds = 3000  },
	{ itemId = 20309015, odds = 3000  },
	{ itemId = 20309016, odds = 3000  },
	{ itemId = 20309017, odds = 4000  },

	--�߼�ñ��....
	{ itemId = 10410102, odds = 3000  },
	{ itemId = 10410103, odds = 4000  },
	{ itemId = 10410104, odds = 5000  },
	{ itemId = 10410105, odds = 4000  },
	{ itemId = 10410106, odds = 4000  },
	{ itemId = 10410107, odds = 2050  },

	--��ʯ....
	{ itemId = 50101001, odds = 950   },
	{ itemId = 50101002, odds = 950   },
	{ itemId = 50102001, odds = 950   },
	{ itemId = 50102002, odds = 950   },
	{ itemId = 50102003, odds = 950   },
	{ itemId = 50102004, odds = 950   },
	{ itemId = 50103001, odds = 950   },
	{ itemId = 50104002, odds = 950   },
	{ itemId = 50111001, odds = 950   },
	{ itemId = 50111002, odds = 950   },	
	{ itemId = 50112001, odds = 950   },
	{ itemId = 50112002, odds = 950   },
	{ itemId = 50112003, odds = 950   },
	{ itemId = 50112004, odds = 950   },
	{ itemId = 50113001, odds = 950   },
	{ itemId = 50113002, odds = 950   },
	{ itemId = 50113003, odds = 950   },
	{ itemId = 50113004, odds = 950   },
	{ itemId = 50113005, odds = 950   },
	{ itemId = 50113006, odds = 950   },
	{ itemId = 50114001, odds = 950   },

}

x050023_g_IDXSnowManID			= 0	--��ǰѩ�˵ĳ���ID....
x050023_g_IDXSnowManState		= 1	--ѩ�˵�ǰ��״̬....(0��Ч 1~12��ͬ��С��ѩ�� 13����Ʒ��ѩ��)
x050023_g_IDXBallCount			= 2	--ѩ�˱�ѩ���ҵ��Ĵ���....
x050023_g_IDXLastSpeakTime	= 3	--ѩ���ϴκ���ʱ��....(��ڼ�ѩ��ÿ������30min�Ằ��)


--**********************************
--�ű���ں���
--**********************************
function x050023_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	MissionLog(sceneId, "[07SHOUYE]: ActivityStart")

	--�����....
	StartOneActivity( sceneId, actId, 60000, iNoticeType )

	--���û״̬....
	x050023_ResetActivityState( sceneId, actId )

end

--**********************************
--��������
--**********************************
function x050023_OnTimer( sceneId, actId, uTime )

	--��ȡ��ǰѩ��״̬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )

	--������....
	if CurState < 1 or CurState > 13 then
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Error1")
		return
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Error2")
		return
	end

	--����Ƿ����....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		MonsterTalk(sceneId, -1, "����", "#P[ѩ��]#W���װ��������ǣ��ҵ����﷢�����ˣ���������ʥ���ټ���")
		SetCharacterDieTime(sceneId, MstID, 6000 )
		StopOneActivity( sceneId, actId )
		MissionLog(sceneId, "[07SHOUYE]: ActivityExit Normal")
		return
	end

	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()
	
	--24��24����ǰ....ѩ��ÿ�������30�����ڳ����ں�һ�λ�....
	local QTime = mod(CurHourTime,100)
	
	if CurHourTime < 835900 and mod(QTime,4) == 2 then --zchw
		local LastSpeakTime = GetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime )
		if CurHourTime > LastSpeakTime then
			MonsterTalk(sceneId, -1, "����", "#P[ѩ��]#W���ѣ��ѣ��Ѹ���ѩ�ˣ��������Э����������160��114����ѩ�˰�����˵��ҹ����ѩ����Ը��Ŀ���ʵ���أ�")
			SetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime, CurHourTime )
		end
		return
	end

	--24��24����ǰ....ѩ��ÿ�������5�����ڳ����ں�һ�λ�....
	if CurHourTime < 835900 and GetMinute() == 54 then	--zchw
			MonsterTalk(sceneId, -1, "����", "#P[ѩ��]#W�������Ͼ�Ҫ�����ˣ���ҿ��������һͬ��ף�ɣ��ܶ���Ʒ�ڵ�������Ŷ��")
		return
	end
	
	--ѩ�˱��Ĵ���....
	if CurState < 13 then
		--���ʱ�䵽������....
		if CurHourTime >= x050023_g_SnowMan[CurState+1].HourTime then
			x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState+1 )
		end
	end
	
	--end modified by zhangguoxin 090207
end

--**********************************
--��⵱ǰ�Ƿ��ǻʱ��
--**********************************
function x050023_CheckActivityTime( sceneId )
	--2009��12��25��2ʱ �Ժ�Ϊ�ǻʱ��....
	--�ǻʱ�䲻����ˢ��ѩ��....
	--begin modified by zhangguoxin 090207
	--if 2008 == LuaFnGetThisYear() and GetHourTime() < 72408 then
	if 2008 == LuaFnGetThisYear() and GetQuarterTime() < 835908 then
	--end modified by zhangguoxin 090207
		return 1
	end
	return 0
end

--**********************************
--���û״̬
--**********************************
function x050023_ResetActivityState( sceneId, actId )

	MissionLog(sceneId, "[07SHOUYE]: ResetActivity")

	--�������ʱ����ñ����������û״̬....
	--����������ʱҲ����ñ����������û״̬....

	--���û����....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, -1 )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, 0 )
	SetActivityParam( sceneId, actId, x050023_g_IDXBallCount, 0 )
	SetActivityParam( sceneId, actId, x050023_g_IDXLastSpeakTime, 0 )

	--�ǻʱ����ˢ��ѩ��....
	if 0 == x050023_CheckActivityTime( sceneId ) then
		MissionLog(sceneId, "[07SHOUYE]: ResetActivity Failed WrongTime")
		StopOneActivity( sceneId, actId )
		return
	end

	--����ʱ���õ�ǰҪ������ѩ������....
	local CurState = 0
	--begin modified by zhangguoxin 090207
	--local CurHourTime = GetHourTime()
	local CurHourTime = GetQuarterTime()
	--end modified by zhangguoxin 090207
	for i, v in x050023_g_SnowMan do
		if CurHourTime >= v.HourTime then
			CurState = i
		end
	end

	--�ؽ�ѩ��....
	local MstID = -1

	if 0 == CurState then
		--�ݴ���....Server��ʱ����ܻ�û���ʱ��....
		CurState = 1
	end

	--����ѩ��....
	MstID = LuaFnCreateMonster(sceneId, x050023_g_SnowMan[CurState].ID, x050023_g_SnowManX, x050023_g_SnowManY, 3, 0, x050023_g_SnowManScriptId )
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10488, 0)
	AddGlobalCountNews(sceneId, "#{SDSY_081212_01}"); --zchw
	--���û����....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, MstID )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, CurState )

	MissionLog(sceneId, "[07SHOUYE]: ResetActivity Succ CurState="..CurState.." ObjID="..MstID)

end

--**********************************
--��ѩ�˱��
--**********************************
function x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState )

	MissionLog(sceneId, "[07SHOUYE]: x050023_MakeBigSnowMan CurState="..CurState)

	--ɾ�ɵ�....
	LuaFnDeleteMonster(sceneId, MstID)

	--�����µ�....
	local MstID = -1
	MstID = LuaFnCreateMonster(sceneId, x050023_g_SnowMan[CurState].ID, x050023_g_SnowManX, x050023_g_SnowManY, 3, 0, x050023_g_SnowManScriptId )
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10488, 0)

	--�����Ч....
	LuaFnSendSpecificImpactToUnit(sceneId, MstID, MstID, MstID, 10487, 0)

	--ɢ�䱦��....
	x050023_GiveItemBox( sceneId )

	--����....
	MonsterTalk(sceneId, -1, "����", "#P[ѩ��]#W����������ѩ�׷��갡����50�����価����ȥ�ɣ�һ�ỹ�и��õĶ����͸���ң�ף���ʥ�����֣�")

	--���û����....
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManID, MstID )
	SetActivityParam( sceneId, actId, x050023_g_IDXSnowManState, CurState )

end

--**********************************
--ɢ�䱦��
--**********************************
function x050023_GiveItemBox( sceneId )

	local BoxId = -1
	local DropItemId = -1
	local randValue = 0
	local index = 1
	for _, box in x050023_g_ItemBoxPos do
		--zchw 1/60�������޵���������
		local rdm = random(0, 6000);
		if rdm < 100 then
		
			local BoxId = ItemBoxEnterScene( box[1], box[2], 779, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30309683 ) --���޵������裨95����
			SetItemBoxMaxGrowTime( sceneId, BoxId, 1200000 )	--20����������....		
			
		else
		
			--�������һ����Ʒ....
			randValue = random(0, 99999);
			for i, item in x050023_g_ItemBoxDrop do
				if item.odds >= randValue then
					DropItemId = item.itemId;
					index = i
					break
				end
				randValue = randValue - item.odds;
			end
			if DropItemId == -1 then
				break
			end
			BoxId = ItemBoxEnterScene( box[1], box[2], 779, sceneId, QUALITY_MUST_BE_CHANGE, 1, DropItemId )
			SetItemBoxMaxGrowTime( sceneId, BoxId, 1200000 )	--20����������....
	
			--֮ǰû�������ʥ��ñ�ͱ�ʯ�Ż���ڶ�����Ʒ....
			if ( index < 13 ) or ( index >= 18 and index <= 21 )then
				randValue = random(0, 99999);
				for _, item in x050023_g_ItemBoxDrop do
					if item.odds >= randValue then
						DropItemId = item.itemId
						break
					end
					randValue = randValue - item.odds;
				end
				if DropItemId == -1 then
					break
				end
				AddItemToBox( sceneId, BoxId, QUALITY_MUST_BE_CHANGE, 1, DropItemId )
			end
			
		end
	end
end

--**********************************
--��ѩ������¼�
--**********************************
function x050023_CanThrowSnowBall( sceneId, playerId, targetId )

	local actId = 88	--�����÷�....�����˲�Ҫѧ....

	--��Ƿ��Ѿ���Ч....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return 0
	end

	--��ȡ��ǰѩ��״̬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--������....
	if CurState < 1 or CurState > 13 then
		return 0
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return 0
	end

	--����Ƿ���ѩ��....
	if targetId ~= MstID then
		return 0
	end

	return 1

end

--**********************************
--��ѩ������¼�
--**********************************
function x050023_OnHitBySnowBall( sceneId, playerId, targetId )

	local actId = 88	--�����÷�....�����˲�Ҫѧ....

	--��Ƿ��Ѿ���Ч....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return 0
	end

	--��ȡ��ǰѩ��״̬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--������....
	if CurState < 1 or CurState > 13 then
		return 0
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return 0
	end

	--����Ƿ���ѩ��....
	if targetId ~= MstID then
		return 0
	end

	if CurState >= 1 and CurState <= 12 then

		--���Ӽ���....
		BallCount = BallCount + 1
		SetActivityParam( sceneId, actId, x050023_g_IDXBallCount, BallCount )

		--����50,30,10�����ʱ�򺰻�....
		local NeedCount = x050023_g_SnowMan[CurState+1].BallCount - BallCount
		if NeedCount == 50 or NeedCount == 30 or NeedCount == 10 then
			MonsterTalk(sceneId, -1, "����", "#P[ѩ��]#W������"..NeedCount.."��ѩ��ѵ��������ҾͿ��Գ����ˣ����Ŭ����������Ʒ�����������֣�")
		end

		--����ѩ�˱��....
		if BallCount >= x050023_g_SnowMan[CurState+1].BallCount then
			x050023_MakeBigSnowMan( sceneId, actId, MstID, CurState+1 )
		end

	end

	return 1

end

--**********************************
--������´α�󻹲���ٸ�ѩ��....
--**********************************
function x050023_GetNeedBallCount( sceneId )

	local actId = 88	--�����÷�....�����˲�Ҫѧ....

	--��Ƿ��Ѿ���Ч....
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		return -1
	end

	--��ȡ��ǰѩ��״̬....
	local MstID = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManID )
	local CurState = GetActivityParam( sceneId, actId, x050023_g_IDXSnowManState )
	local BallCount = GetActivityParam( sceneId, actId, x050023_g_IDXBallCount )

	--������....
	if CurState < 1 or CurState > 13 then
		return -1
	end
	local CurMstDateID = GetMonsterDataID( sceneId, MstID )
	if CurMstDateID ~= x050023_g_SnowMan[CurState].ID then
		return -1
	end

	if CurState >= 1 and CurState <= 12 then
		local NeedCount = x050023_g_SnowMan[CurState+1].BallCount - BallCount
		return NeedCount
	end

	return -1

end

--**********************************
--���������ʰȡ��Ʒ�Ļص�����....
--**********************************
function x050023_OnPlayerPickUpItemInLuoyang( sceneId, selfId, itemId, bagidx )

	--�ǻʱ���򲻹���....
	if 0 == x050023_CheckActivityTime( sceneId ) then
		return 0
	end

	local IsBoxItem = 0
	local ItemCount = getn(x050023_g_ItemBoxDrop)
	for i = 22, ItemCount do --����ʯ������ zchw
		if x050023_g_ItemBoxDrop[i].itemId == itemId then
			IsBoxItem = 1
			break
		end
	end
	--���޵������裨95���� ���� 30309683 zchw
	if itemId == 30309683 then
		IsBoxItem = 1;
		--��־ͳ��
		local guid = LuaFnObjId2Guid(sceneId, selfId)
		local log = format("itemId=%d", itemId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_SNOW, guid, log)
	end
	
	if IsBoxItem == 0 then
		return 0
	end

	--����....
	local playerName = GetName(sceneId, selfId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local rand = random(3)
	local message
	if rand == 1 then
		message = format("#P�콵��ѩ��ϲ��ӯ�š�#{_INFOUSR%s}#P����������������·���ܱ�#{_INFOMSG%s}#P���У����Ǻ��˵�ͷ����Ҳ����ס����", playerName, transfer )
	elseif rand == 2 then
		message = format("#P���紵��ѩ��Ʈ�������Ͽ��²Ʊ���#{_INFOUSR%s}#P�������ѹ������ֽſ��ٵļ���һ��#{_INFOMSG%s}#P��͵���ת���ȥ��", playerName, transfer )
	else
		message = format("#Pѩ�˺ã�ѩ���ѩ��ɢ��ı������ɽУ�#{_INFOUSR%s}#P�����ż�����#{_INFOMSG%s}#P���������ֱ�ɵ�Ǻǵ�Ц��", playerName, transfer )
	end
	BroadMsgByChatPipe(sceneId, selfId, message, 4)

	return 1

end

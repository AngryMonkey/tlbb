--��������

--MisDescBegin
--�ű���
x229022_g_scriptId = 229022

--ǰ������
--g_MissionIdPre =

--����Ŀ��npc[94,177]
x229022_g_Name	= "������"

--�����
x229022_g_MissionId = 1202

--�������
x229022_g_MissionKind = 1

--����ȼ�
x229022_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x229022_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
--�����Ƿ��Ѿ����
x229022_g_IsMissionOkFail = 0		--�����ĵ�0λ

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x229022_g_MissionName="��������"
x229022_g_MissionInfo=""  --��������
x229022_g_MissionTarget = "%f"
x229022_g_ContinueInfo="�ɵò���"		--δ��������npc�Ի�
x229022_g_MissionComplete="��, ��֪����, ��ɵò���"					--�������npc˵���Ļ�

--���������ַ�����ʽ��������
x229022_g_FormatList = {
								"�ҵ�%n",
								"��%i�͸�%n",
								"��#Y%p#W�͸�%n#r  #GС��ʾ�������Ҫ������Ҳ������ͬ�����������档",
								"��ѵ%n",
								}

--ֻ��Ϊ�ͻ�����ʾMissionTarget����, ���еĶ�̬���ַ�������ע�ᵽ��List����
x229022_g_StrList = {
						 "��",
						 "��",
						 }

--��ʽ�ַ����ж�Ӧ��g_StringList���ַ���������, ��ʾ��4��ʼ,�����λ��SetMissionByIndexEx(...)�Ķ��ٶ���
x229022_g_StrForePart=4

--��̬item�����missionparam�洢����ʼλ��
x229022_g_ItemForePart=6

x229022_g_MissionRound	= 35		--��¼ѭ���������

x229022_g_MissionLimitTime = 1800000

x229022_g_StopWatch_Pause_Flag = 57

x229022_g_NpcIdIndicator={{key=1,npcIdIndex=5},{key=2,npcIdIndex=6},{key=3,npcIdIndex=5},{key=5,npcIdIndex=6}}


--MisDescEnd

x229022_g_SubMissionType = {wenhou=1, suoqu=2, fubenjiaoxun=3, fubenduowu=4, chongwu=5}

x229022_g_GoodBadDescTable = {
									{key=1, str="���ƶ�ֵ��ȡ����������Ʒ"},
									{key=2, str="�洢��ǰ����"},
									{key=3, str="�����ϴ���������"},
								}


x229022_g_RenwulianPet_Index = 0
x229022_g_RenwulianItem_Index = 21
x229022_g_RenwulianItem50_Index = 21
x229022_g_RenwulianItem100_Index = 42
x229022_g_RenwulianNpc_Index = 6
x229022_g_RenwulianFunbenNpc_Index = 11

--�ȼ�	�����������
x229022_g_ExpBonusBaseTable = {
												{ playerLevel=40, baseExp=3872 },
												{ playerLevel=41, baseExp=3960 },
												{ playerLevel=42, baseExp=4048 },
												{ playerLevel=43, baseExp=4136 },
												{ playerLevel=44, baseExp=4224 },
												{ playerLevel=45, baseExp=4312 },
												{ playerLevel=46, baseExp=4400 },
												{ playerLevel=47, baseExp=4488 },
												{ playerLevel=48, baseExp=4576 },
												{ playerLevel=49, baseExp=4664 },
												{ playerLevel=50, baseExp=4752 },
												{ playerLevel=51, baseExp=4840 },
												{ playerLevel=52, baseExp=4928 },
												{ playerLevel=53, baseExp=5016 },
												{ playerLevel=54, baseExp=5104 },
												{ playerLevel=55, baseExp=5192 },
												{ playerLevel=56, baseExp=5280 },
												{ playerLevel=57, baseExp=5368 },
												{ playerLevel=58, baseExp=5456 },
												{ playerLevel=59, baseExp=5544 },
												{ playerLevel=60, baseExp=5632 },
												{ playerLevel=61, baseExp=5720 },
												{ playerLevel=62, baseExp=5808 },
												{ playerLevel=63, baseExp=5896 },
												{ playerLevel=64, baseExp=5984 },
												{ playerLevel=65, baseExp=6072 },
												{ playerLevel=66, baseExp=6160 },
												{ playerLevel=67, baseExp=6248 },
												{ playerLevel=68, baseExp=6336 },
												{ playerLevel=69, baseExp=6424 },
												{ playerLevel=70, baseExp=6512 },
												{ playerLevel=71, baseExp=6600 },
												{ playerLevel=72, baseExp=6688 },
												{ playerLevel=73, baseExp=6776 },
												{ playerLevel=74, baseExp=6864 },
												{ playerLevel=75, baseExp=6952 },
												{ playerLevel=76, baseExp=7040 },
												{ playerLevel=77, baseExp=7128 },
												{ playerLevel=78, baseExp=7216 },
												{ playerLevel=79, baseExp=7304 },
												{ playerLevel=80, baseExp=7392 },
												{ playerLevel=81, baseExp=7480 },
												{ playerLevel=82, baseExp=7568 },
												{ playerLevel=83, baseExp=7656 },
												{ playerLevel=84, baseExp=7744 },
												{ playerLevel=85, baseExp=7832 },
												{ playerLevel=86, baseExp=7920 },
												{ playerLevel=87, baseExp=8008 },
												{ playerLevel=88, baseExp=8096 },
												{ playerLevel=89, baseExp=8184 },
												{ playerLevel=90, baseExp=8272 },
												{ playerLevel=91, baseExp=8360 },
												{ playerLevel=92, baseExp=8448 },
												{ playerLevel=93, baseExp=8536 },
												{ playerLevel=94, baseExp=8624 },
												{ playerLevel=95, baseExp=8712 },
												{ playerLevel=96, baseExp=8800 },
												{ playerLevel=97, baseExp=8888 },
												{ playerLevel=98, baseExp=8976 },
												{ playerLevel=99, baseExp=9064 },
												{ playerLevel=100, baseExp=9152 },
												{ playerLevel=101, baseExp=9328 },
												{ playerLevel=102, baseExp=9152 },
												{ playerLevel=103, baseExp=9416 },
												{ playerLevel=104, baseExp=9504 },
												{ playerLevel=105, baseExp=9592 },
												{ playerLevel=106, baseExp=9680 },
												{ playerLevel=107, baseExp=9768 },
												{ playerLevel=108, baseExp=9856 },
												{ playerLevel=109, baseExp=9944 },
												{ playerLevel=110, baseExp=10032 },
												{ playerLevel=111, baseExp=10120 },
												{ playerLevel=112, baseExp=10208 },
												{ playerLevel=113, baseExp=10296 },
												{ playerLevel=114, baseExp=10384 },
												{ playerLevel=115, baseExp=10472 },
												{ playerLevel=116, baseExp=10560 },
												{ playerLevel=117, baseExp=10648 },
												{ playerLevel=118, baseExp=10736 },
												{ playerLevel=119, baseExp=10824 },
												{ playerLevel=120, baseExp=10912 },
									}


--�����ӳɣ�
x229022_g_RoundRefixTable = {
												{ round=1,	refix=1.000  },
												{ round=2,	refix=1.051  },
												{ round=3,	refix=1.101  },
												{ round=4,	refix=1.152  },
												{ round=5,	refix=1.202  },
												{ round=6,	refix=1.253  },
												{ round=7,	refix=1.303  },
												{ round=8,	refix=1.354  },
												{ round=9,	refix=1.404  },
												{ round=10,	refix=1.455  },
												{ round=11,	refix=1.055  },
												{ round=12,	refix=1.156  },
												{ round=13,	refix=1.256  },
												{ round=14,	refix=1.357  },
												{ round=15,	refix=1.457  },
												{ round=16,	refix=1.558  },
												{ round=17,	refix=1.658  },
												{ round=18,	refix=1.759  },
												{ round=19,	refix=1.859  },
												{ round=20,	refix=1.960  },
												{ round=21,	refix=1.110  },
												{ round=22,	refix=1.261  },
												{ round=23,	refix=1.411  },
												{ round=24,	refix=1.562  },
												{ round=25,	refix=1.712  },
												{ round=26,	refix=1.863  },
												{ round=27,	refix=2.013  },
												{ round=28,	refix=2.164  },
												{ round=29,	refix=2.314  },
												{ round=30,	refix=2.465  },
												{ round=31,	refix=1.165  },
												{ round=32,	refix=1.366  },
												{ round=33,	refix=1.566  },
												{ round=34,	refix=1.767  },
												{ round=35,	refix=1.967  },
												{ round=36,	refix=2.168  },
												{ round=37,	refix=2.368  },
												{ round=38,	refix=2.569  },
												{ round=39,	refix=2.769  },
												{ round=40,	refix=2.970  },
												{ round=41,	refix=1.220  },
												{ round=42,	refix=1.471  },
												{ round=43,	refix=1.721  },
												{ round=44,	refix=1.972  },
												{ round=45,	refix=2.222  },
												{ round=46,	refix=2.473  },
												{ round=47,	refix=2.723  },
												{ round=48,	refix=2.974  },
												{ round=49,	refix=3.224  },
												{ round=50,	refix=3.475  },
												{ round=51,	refix=1.275  },
												{ round=52,	refix=1.576  },
												{ round=53,	refix=1.876  },
												{ round=54,	refix=2.177  },
												{ round=55,	refix=2.477  },
												{ round=56,	refix=2.778  },
												{ round=57,	refix=3.078  },
												{ round=58,	refix=3.379  },
												{ round=59,	refix=3.679  },
												{ round=60,	refix=3.980  },
												{ round=61,	refix=1.330  },
												{ round=62,	refix=1.681  },
												{ round=63,	refix=2.031  },
												{ round=64,	refix=2.382  },
												{ round=65,	refix=2.732  },
												{ round=66,	refix=3.083  },
												{ round=67,	refix=3.433  },
												{ round=68,	refix=3.784  },
												{ round=69,	refix=4.134  },
												{ round=70,	refix=4.485  },
												{ round=71,	refix=1.385  },
												{ round=72,	refix=1.786  },
												{ round=73,	refix=2.186  },
												{ round=74,	refix=2.587  },
												{ round=75,	refix=2.987  },
												{ round=76,	refix=3.388  },
												{ round=77,	refix=3.788  },
												{ round=78,	refix=4.189  },
												{ round=79,	refix=4.589  },
												{ round=80,	refix=4.990  },
												{ round=81,	refix=1.440  },
												{ round=82,	refix=1.891  },
												{ round=83,	refix=2.341  },
												{ round=84,	refix=2.792  },
												{ round=85,	refix=3.242  },
												{ round=86,	refix=3.693  },
												{ round=87,	refix=4.143  },
												{ round=88,	refix=4.594  },
												{ round=89,	refix=5.044  },
												{ round=90,	refix=5.495  },
												{ round=91,	refix=1.495  },
												{ round=92,	refix=1.996  },
												{ round=93,	refix=2.496  },
												{ round=94,	refix=2.997  },
												{ round=95,	refix=3.497  },
												{ round=96,	refix=3.998  },
												{ round=97,	refix=4.498  },
												{ round=98,	refix=4.999  },
												{ round=99,	refix=5.499  },
												{ round=100, refix=6.000 },
										}

x229022_g_HongyunRateTable = {
		{level=10,	value=400},
		{level=20,	value=332},
		{level=30,	value=332},
		{level=40,	value=284},
		{level=50,	value=249},
		{level=60,	value=220},
		{level=70,	value=200},
		{level=80,	value=180},
		{level=90,	value=166},
		{level=100, value=153},
		{level=110,	value=142},
		{level=120,	value=142},
		{level=130,	value=142},
		{level=140,	value=142},
		{level=150,	value=142},		
		}

function x229022_GetMapIndexByStringValue(stringV)
	for i, v in x229022_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("���뽫%sע�ᵽStrList��", stringV)
	PrintStr(strText)
	return 0;
end

--�����Ա�ȡ�������Ϣ
function x229022_GetSexInfo(sex)
	local strSex = "��"
	if sex <= 0 then
		strSex = "��"
	end
	local sexIndex = x229022_GetMapIndexByStringValue(strSex)
	return strSex, sexIndex
end


function x229022_GetOneMissionNpcEx(sceneId, currentNpcId)
	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc
	for i=1, 100 do
		nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(x229022_g_RenwulianNpc_Index)
		if GetName(sceneId, currentNpcId ) ~= strNpcName then
			--PrintStr("nNpcId=" .. nNpcId .. " currentNpcId=" .. currentNpcId )
			break
		end
	end
	return nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc
end

--/////////////////////////////////////////////////////////////////////
function x229022_WenHou_Accept(sceneId, selfId, targetId)

	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = x229022_GetOneMissionNpcEx(sceneId, targetId)

	--������������б�
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 0, 0, 0 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. "����������...")
	-->>end
	
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)
	Msg2Player(  sceneId, selfId,"#Y����������������", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	--�õ�������20�������е����к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --���������Ƿ���ɣ�δ��ɣ�
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.wenhou)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --����ʱ����������ʼ��Ϊ-1
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 0)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, nNpcId)

	--���ˣ�
	local missionInfo = {
			"�ܾò���%s%s(%d,%d)����˼��ɷ�����ʺ�һ������",
			"��%s%s(%d,%d)�����ж����ң�����ܴ����ʺ�һ�������ҽ�������ʢ�顣",
			"����%s%s(%d,%d)�������񣬶��겻��ɷ����������ݣ������ʺ�������",
	}

	local strMissionTarget = format(missionInfo[random(getn(missionInfo))], strNpcScene, strNpcName, nPosX, nPosZ)
	AddText(sceneId, strMissionTarget)

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end
--/////////////////////////////////////////////////////////////////////
function x229022_SuoQu_Accept(sceneId, selfId, targetId)

	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = x229022_GetOneMissionNpcEx(sceneId, targetId)

	local nItemId, strItemName, strItemDesc
	for i=1, 100 do
		nItemId, strItemName, strItemDesc = GetOneMissionItem(x229022_g_RenwulianItem_Index)
		if IsEquipItem(nItemId) > 0 then
			local reqLevel = GeEquipReqLevel(nItemId)
			local playerLevel = GetLevel(sceneId, selfId)
			--������ȡװ��������ҵȼ�+10��װ�������������������λõġ���˵������ֹ��Ҵ�˵���߼�װ�������۶����񡣣�
			if playerLevel >= reqLevel and playerLevel < reqLevel+10 then
				break
			end
			if i == 100 then
				--"ͳͳ�����ʺ�ȥ ����")
				x229022_WenHou_Accept(sceneId, selfId, targetId)
				return
			end	--end if
			nItemId, strItemName, strItemDesc = GetOneMissionItem(x229022_g_RenwulianItem_Index)
		else
			break
		end --end if
	end --end for

	--������������б�
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 1, 0, 1 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. "����������...")
	-->> end
	
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)

	Msg2Player(  sceneId, selfId,"#Y����������������", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	--�õ�������20�������е����к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --���������Ƿ���ɣ�δ��ɣ�
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.suoqu)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --����ʱ����������ʼ��Ϊ-1
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+2, nNpcId)
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, nItemId)
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 1)--formet�ַ�������

	local missionInfo = {
				"��˵%s%s(%d,%d)��Ҫ%s���鷳���͸�����",
				"�⼸��%s%s(%d,%d)��õ�%s������Բ�����������ܰ�����������һ�����кô��ġ�",
				"ȥ�ɣ���%s%s(%d,%d)��ȥ%s�����õ�����ġ�",
				"%s%s(%d,%d)�о������ţ���Ϊȱ��%s��һ��Īչ����ȥ���ɡ�",
				"�ҵĺ���%s%s(%d,%d)�����ռ�%s�����������һ������������ǳ����˵ġ�",
				}

	local strMissionTarget = format(missionInfo[random(getn(missionInfo))],
																									strNpcScene, strNpcName, nPosX, nPosZ, strItemName)
	AddText(sceneId, strMissionTarget)

	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	if HaveItem(sceneId, selfId, demandItemId) > 0 then
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
	end

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end

--/////////////////////////////////////////////////////////////////////
function x229022_Chongwu_Accept(sceneId, selfId, targetId)
	local petId, petName, petDesc, takeLevel
	for i = 1, 100 do
		petId, petName, petDesc = GetOneMissionPet(x229022_g_RenwulianPet_Index)
		
		--if 1==1 then
		--petId, petName, petDesc = 3000, "Ұ����è", "hahaha"
		--break
		--end
		takeLevel = GetPetTakeLevel(petId)
		if takeLevel >= 10 and takeLevel <= GetLevel(sceneId, selfId) then
			break
		elseif i == 10 then
			--ͳͳ�����ʺ�ȥ ����
			x229022_WenHou_Accept(sceneId, selfId, targetId)
			return
		end
	end

	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = x229022_GetOneMissionNpcEx(sceneId, targetId)

	--������������б�
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 0, 0, 0 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. "����������...")
	-->> end
	
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 3)
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)
	Msg2Player(  sceneId, selfId,"#Y����������������", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	--�õ�������20�������е����к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --���������Ƿ���ɣ�δ��ɣ�
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.chongwu)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --����ʱ����������ʼ��Ϊ-1
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+2, nNpcId)
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, petId)

	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 2)--formet�ַ�������

	local missionInfo = {
			"��˵%s%s(%d,%d)��Ҫ%s���鷳���͸�����",
			"�⼸��%s%s(%d,%d)��õ�%s������Բ�����������ܰ�����������һ�����кô��ġ�",
			"ȥ�ɣ���%s%s(%d,%d)��ȥ%s�����õ�����ġ�",
			"%s%s(%d,%d)�о������ţ���Ϊȱ��%s��һ��Īչ����ȥ���ɡ�",
			"�ҵĺ���%s%s(%d,%d)�����ռ�%s�����������һ������������ǳ����˵ġ�",
			}

	local strMissionTarget = format(missionInfo[random(getn(missionInfo))],
																									strNpcScene, strNpcName, nPosX, nPosZ, petName)
	AddText(sceneId, strMissionTarget)

	--���������ϵĵ����Ƿ��Ѿ������������
	for i=0, 6 do
		local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
		if petDataId ~= nil and petDataId >= 0 then
		if GetPetName(petId) == GetPetName(petDataId) then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
			break
		end
	end
	end

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end
--/////////////////////////////////////////////////////////////////////

function x229022_FubenZhanDou_Accept(sceneId, selfId, targetId)

	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	-->80������������ս�����͡������ڹֵĵȼ�����ҵȼ������ϣ����滷������������Ѷȣ���20����ȡ����)
	if round > 80 then
		--ͳͳ�����ʺ�ȥ ����
		x229022_WenHou_Accept(sceneId, selfId, targetId)
		return
	end

	local nNpcId,strNpcName,strNpcScene,nSceneId,nPosX,nPosZ,strNPCDesc,sex=x229022_GetOneMissionNpcEx(sceneId, targetId)
	--������������б�
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 1, 0, 0 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. "����������...")
	-->> end
	
	Msg2Player(  sceneId, selfId,"#Y����������������", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	--�õ�������20�������е����к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --���������Ƿ���ɣ�δ��ɣ�
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.fubenjiaoxun)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --����ʱ����������ʼ��Ϊ-1
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, 0) --Ҫ��ɱ����monster������ ���ڻ�û�и�ֵ
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 1, 0) --�Ѿ�ɱ����monster����

	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, nNpcId)
	--local strSex, sexIndex = x229022_GetSexInfo(sex)
	--SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+2, sexIndex)

	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 3)--formet�ַ�������

	local missionInfo = {
				"��˵%s%s(%d,%d)Ϊ�������������ҽ�ѵ��ѵ����",
				"%s%s(%d,%d)���������������������ұ�Ӧ��֮�٣�ȥ����һ����ɫ��",
				"����˵%s%s(%d,%d)����ַ��˼�Ʊ���ӣ�����ѵ���������������ģ��������ͽ������ˡ�",
		}
	local strMissionTarget = format(missionInfo[random(getn(missionInfo))],
					strNpcScene,strNpcName, nPosX, nPosZ)

	AddText(sceneId, strMissionTarget)

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end

function x229022_ExchangeMissionItemForGoodBadFn( sceneId, selfId,targetId, needPoint )
	--����������Ʒ
	if( needPoint < 0 ) then
		return
	end
	local iDayTime = GetMissionData(sceneId,selfId,MD_RENWULIAN_EXCHANGEITEM)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()		--��ǰʱ��
	--local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
	local CurDaytime = GetDayTime()	--��ǰʱ��(��)
	--begin modified by zhangguoxin 090208
	if iDayTime == CurDaytime then
		BeginEvent(sceneId)
			AddText(sceneId, "һ��ֻ�����ƶ�ֵ�һ�һ�Σ�")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end


	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local itemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)

	local _, strItemName, strItemDesc = GetItemInfoByItemId(itemId)
	local goodbadValue = LuaFnGetHumanGoodBadValue(sceneId, selfId)
	if goodbadValue < needPoint then
		BeginEvent(sceneId)
			AddText(sceneId, "����ƶ�ֵ���������������������")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	else
		BeginAddItem(sceneId)
		AddItem(sceneId,itemId, 1)
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--���������Ѿ����
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end

		LuaFnSetHumanGoodBadValue(sceneId, selfId, goodbadValue-needPoint)
		local str = format("�㻨����#Y%d#W���ƶ�ֵ�����˳�˼ĺ���#B%s��", needPoint, strItemName)
		SetMissionData(sceneId, selfId, MD_RENWULIAN_EXCHANGEITEM, CurDaytime)

		Msg2Player(  sceneId, selfId,str, MSG2PLAYER_PARA )
	end


end

function x229022_ExchangeMissionItemForGoodBad( sceneId, selfId,targetId )

	--����������Ʒ
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local itemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	local _, strItemName, strItemDesc = GetItemInfoByItemId(itemId)

	local nNeedPoint
	if IsEquipItem(itemId) == 1 then --600+4*Lv
		nNeedPoint = 600 + 4 * GeEquipReqLevel(itemId)
	else	--600+4*��Ʒ���εȼ�
		nNeedPoint = 600 + 4 * 1 --��Ʒ���εȼ�Ŀǰû�У���
	end

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229022_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,nNeedPoint)
		UICommand_AddString(sceneId,"ExchangeMissionItemForGoodBadFn");
		local str = format("#Y����Ҫ��ȡ��#B%s#Y����Ҫ�����ƶ�ֵ#W%d#Y��", strItemName, nNeedPoint)
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

function x229022_CurrentRoundStorageFn( sceneId, selfId,targetId, needPoint )
	if needPoint < 0 then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local leaveSecond = GetMissionParam(sceneId, selfId, misIndex, 7)
	local goodbadValue = LuaFnGetHumanGoodBadValue(sceneId, selfId)

	--PrintNum(leaveSecond)
	if leaveSecond < 10*60000 then
		BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ�����20�����ˣ��޷���������")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	elseif goodbadValue < needPoint then
		BeginEvent(sceneId)
			AddText(sceneId, "����ƶ�ֵ���������������������")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	else
		LuaFnSetHumanGoodBadValue(sceneId, selfId, goodbadValue-needPoint)
		local str = format("�㻨����#Y%d#W���ƶ�ֵ�������������ѱ��档", needPoint)
		Msg2Player(  sceneId, selfId,str, MSG2PLAYER_PARA )
		--���������Ѿ��洢�ı�־
		SetMissionByIndex(sceneId,selfId,misIndex,2,1)
		--ֹͣ����ʱ��
		StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
		SetMissionData(sceneId,selfId,x229022_g_StopWatch_Pause_Flag,1)
	end

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

function x229022_CurrentRoundStorage( sceneId, selfId,targetId )
	local  nNeedPoint = 1000
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229022_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,nNeedPoint)
		UICommand_AddString(sceneId,"CurrentRoundStorageFn");
		local str = format("#Y�洢��������Ҫ�����ƶ�ֵ#W%d#Y�㣬��ȷ����", nNeedPoint)
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

function x229022_ContinueStoredMissionFn(sceneId, selfId, targetId,flag)
	if flag < 0 then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�
	--�õ�����
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	local str = format("��������������񣬵�ǰ�Ļ���Ϊ��#Y%d#W����", round)
	Msg2Player(  sceneId, selfId,str, MSG2PLAYER_PARA )
	--��������ʱ��
	StartMissionTimer(sceneId, selfId, x229022_g_MissionId)
	--���������Ѿ��洢�ı�־
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)
	SetMissionData(sceneId,selfId,x229022_g_StopWatch_Pause_Flag,0)
	--��ʱ���������
	local leaveSecond = GetMissionParam(sceneId, selfId, misIndex, 7)
	local elapseSecond = 30*60 - leaveSecond/1000
	SetMissionData(sceneId,selfId,MD_RENWULIAN_ACCPETTIME,LuaFnGetCurrentTime()-elapseSecond)

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

function x229022_ContinueStoredMission(sceneId, selfId, targetId)

	--�õ�����
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229022_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,round)
		UICommand_AddString(sceneId,"ContinueStoredMissionFn");
		UICommand_AddString(sceneId,"#Y���ϴ�����������е��˵�#W" .. tostring(round) .. "#Y������ȷ��������");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

function x229022_AddMissionDirectly(sceneId, selfId,targetId)
  	BeginEvent(sceneId)
  	
  	--hzp 2009-2-13 begin<<
		--local  PlayerName=GetName(sceneId,selfId)
		--local  PlayerSex=GetSex(sceneId,selfId)
		--if PlayerSex == 0 then
		--	PlayerSex = "����"
		--else
		--	PlayerSex = "����"
		--end
		--AddText(sceneId,"  " .. PlayerName .. PlayerSex .. "����������...")
		-->> end
		
    	--testing begin
    	--if 1==1 then
	   	--	x229022_FubenZhanDou_Accept(sceneId, selfId, targetId)
   		--	EndEvent()
			--DispatchEventList(sceneId,selfId,targetId)
			--return
    	--end
    	--testing end
    	
	  	local ret = random(100)

		if ret < 5 then			--1��	��NPC�ʺ�5%��
			x229022_WenHou_Accept(sceneId, selfId, targetId)
		elseif ret < 85 then	--2��	��ȡ��80%��
			ret = random(100)
			if ret < 62 then -- 70 	��ȡ��Ʒ��62%������=1-��Ʒ��
				x229022_SuoQu_Accept(sceneId, selfId, targetId)
			else
				x229022_Chongwu_Accept(sceneId, selfId, targetId)
			end
		else									--4��	ս�������븱������35%��
			x229022_FubenZhanDou_Accept(sceneId, selfId, targetId)
		end

	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x229022_CostMoneyFn(sceneId, selfId, targetId,flag)
	if flag < 0 then
		return
	end
	if x229022_CheckAccept(sceneId,selfId) > 0 then
		--�쿴��Ǯ�Ƿ��㹻
		if GetMoney(sceneId, selfId)+ GetMoneyJZ( sceneId, selfId ) < GetLevel(sceneId, selfId)*1000 then ---dengxx
			BeginEvent(sceneId)
				AddText(sceneId, "���Ǯ�ƺ�������")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
		else
			x229022_AddMissionDirectly(sceneId, selfId,targetId)
		end
	end
end
--/////////////////////////////////////////////////////////////////////
--**********************************
--�¼��б�
--**********************************
function x229022_UpdateEventList( sceneId, selfId,targetId )
	if IsHaveMission(sceneId,selfId,x229022_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if 1 == GetNumText() then
			--���ƶ�ֵ��ȡ����������Ʒ --�����
			x229022_ExchangeMissionItemForGoodBad( sceneId, selfId,targetId )
			return
		elseif 2 == GetNumText() then
			--�洢��ǰ���� --�����
			x229022_CurrentRoundStorage( sceneId, selfId,targetId )
			return
		elseif 3 == GetNumText() then
			x229022_ContinueStoredMission(sceneId, selfId, targetId)
			return
		end

		if missionType == x229022_g_SubMissionType.wenhou then
			if x229022_IsDemandNpc(sceneId, selfId, targetId) == 1 then
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
				if x229022_CheckSubmit( sceneId, selfId ) > 0 then
					--���������������Ϣ
					BeginEvent(sceneId)
						AddText(sceneId, x229022_g_MissionName)
						AddText(sceneId, "�������������ˣ���������������Ҫ���æ�ء�")
					EndEvent( )
				end
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, x229022_g_scriptId)
			end
		elseif	missionType == x229022_g_SubMissionType.suoqu then
			--���������������Ϣ
			local itemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			local _, strItemName, _ = GetItemInfoByItemId(itemId)

			BeginEvent(sceneId)
				AddText(sceneId, x229022_g_MissionName)
				AddText(sceneId, "��Ҫ��#B" .. strItemName .. "#W����Ҵ�������")
			EndEvent( )
			local bDone = x229022_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, bDone,x229022_g_scriptId)
		elseif 	missionType == x229022_g_SubMissionType.chongwu then
			--���������������Ϣ
			local petDataId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			local strItemName = GetPetName(petDataId)

			BeginEvent(sceneId)
				AddText(sceneId, x229022_g_MissionName)
				AddText(sceneId, "��Ҫ������#B" .. strItemName .. "#W����������")
			EndEvent( )
			local bDone = x229022_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, bDone,x229022_g_scriptId)
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun then
			--����Ѿ�����˽�ѵ������
			if x229022_CheckSubmit( sceneId, selfId ) > 0 then
				BeginEvent(sceneId)
					AddText(sceneId, x229022_g_MissionName)
					AddText(sceneId, "��Ȼ���ո�ǿ�����ٲ���Ϊ���ˣ����һ��е�����Ҫ���æ��")
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, x229022_g_scriptId)
			else
				--���������Ƕӳ������ᴴ������
				--local teamLeaderID = GetTeamLeader(sceneId, selfId)
				--local nearmembercount = GetNearTeamCount(sceneId, selfId)
				--if teamLeaderID ~= selfId or nearmembercount < 2 then --��������Լ�����
				--	BeginEvent(sceneId)
				--		AddText(sceneId, "ƾ�㵥ǹƥ��Ҳ�������ң�������Щ���������ɡ�\n")
				--	EndEvent()
				--	DispatchEventList(sceneId, selfId, targetId)
				--else
					local str
					local ret = random(3)
					if ret == 1 then
						str = "��ƾ��Ҳ���ѵ���ң�����Ҷ��֣��Ⱥ��������Ǵ�򣬿�����Ľ�����\n"
					elseif ret ==  2 then
						str = "��ƾ��Ҳ���ѵ���ң�����������������������\n"
				        else
						str = "������£�����֪���ҵ����������ҿ���\n"
					end

					BeginEvent(sceneId)
						AddText(sceneId, str)
					EndEvent()
					DispatchEventList(sceneId, selfId, targetId)
					local nearmembercount = GetNearTeamCount(sceneId, selfId)
					if nearmembercount <= 0 then
						nearmembercount = 1
					end
					SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, nearmembercount) --��ǰ���ø�����Ҫ��ɱ����monster����
					--���ô���������ں���
					CallScriptFunction(229023 , "MakeCopyScene", sceneId, selfId, nearmembercount)
				--end
			end
		end

	--ֻ���������������һ�ν������ǲŽ��������ж�
  elseif GetName(sceneId, targetId) == x229022_g_Name then
 		--PrintStr(GetName(sceneId, targetId))
		--PrintStr(x229022_g_Name)
		if GetName(sceneId, targetId) == x229022_g_Name then
			local costMoney = GetLevel(sceneId, selfId)*1000
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,x229022_g_scriptId);
				UICommand_AddInt(sceneId,targetId);
				UICommand_AddInt(sceneId,costMoney)
				UICommand_AddString(sceneId,"CostMoneyFn");
				UICommand_AddString(sceneId,"Ҫ��ȡ��������Ҫһ�ν���#{_EXCHG" .. tostring(costMoney) .. "}����ȷ����");  --dengxx
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 24)
			return
		end
	else
		if x229022_CheckAccept(sceneId,selfId) > 0 then
			x229022_AddMissionDirectly(sceneId, selfId,targetId)
		end
  end
end

--**********************************
--�¼��������
--**********************************
function x229022_OnDefaultEvent( sceneId, selfId,targetId )
	--PrintStr("OnDefaultEvent...")
	x229022_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�о��¼�
--**********************************
function x229022_OnEnumerate( sceneId, selfId, targetId )
	--local f = openfile("D:/randomtest.txt", 'w')
	--for i=1, 10000 do
	--	write(f, tostring(random(10000)))
	--	write(f, tostring("\r\n"))
	--end
	--closefile(f)


	--��ʱ������������
	--if 1==1 then
	--	return
	--end
	--��������ɹ��������
		if IsMissionHaveDone(sceneId,selfId,x229022_g_MissionId) > 0 then
    	return
	--���������������
		elseif IsHaveMission(sceneId,selfId,x229022_g_MissionId) > 0 then
			local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
			--�������ȡ��Ʒ����ʾ���ƶ�ֵ���Ի�ȡ������Ʒ
			if GetMissionParam(sceneId,selfId,misIndex,1) == x229022_g_SubMissionType.suoqu then
				AddNumText(sceneId, x229022_g_scriptId,x229022_g_GoodBadDescTable[1].str,1,1);
			end

			--local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			--if missionType == x229022_g_SubMissionType.fubenjiaoxun then
			--	AddNumText(sceneId, x229022_g_scriptId,x229022_g_MissionName,2,-1);
			--end
			if GetName(sceneId,targetId) == x229022_g_Name then
				--����Ѿ��洢����������,����ʾ����������
				if GetMissionParam(sceneId,selfId,misIndex, 2) == 1 then
					AddNumText(sceneId, x229022_g_scriptId,x229022_g_GoodBadDescTable[3].str,1,3);
				else
					AddNumText(sceneId, x229022_g_scriptId,x229022_g_GoodBadDescTable[2].str,1,2);
				end
			end
	--���������������
    elseif GetName(sceneId,targetId) == x229022_g_Name then
   		--��ҵȼ�>=60��
			if GetLevel(sceneId, selfId) >= 60 then
				AddNumText(sceneId,x229022_g_scriptId, x229022_g_MissionName, 1, -1);
			end
    end
end

--**********************************
--����������
--**********************************
function x229022_CheckAccept( sceneId, selfId )
	--test begin
	--if 1== 1 then
	--	return 1
	--end
	--test end
	local nLevel = LuaFnGetLevel(sceneId, selfId)

	--��ҵ��ν���������ʱ�����ϴ������������ʱ��֮ʱ���>48Сʱ
	local iDayCount=GetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT)

	--�õ�����
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	if round < 50 then
		if (LuaFnGetCurrentTime()-iDayCount) < 15*60 then
			BeginEvent(sceneId)
				AddText(sceneId, "����������������15���ӣ������԰�����ɡ�")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
			return 0
		end
	elseif round == 100 then
		if (LuaFnGetCurrentTime()-iDayCount) < 48*60*60 then
			BeginEvent(sceneId)
				AddText(sceneId, "����������������48Сʱ�������԰�����ɡ�")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
			return 0
		else
			SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 0)
		end
	elseif round >= 50 then
		--PrintNum(CurDaytime*96 + CurQuarterTime)
		--PrintNum(iDayTime*96 + iQuarterTime)
		--PrintNum( ((CurDaytime*96 + CurQuarterTime) - (iDayTime*96 + iQuarterTime)) )
		if (LuaFnGetCurrentTime()-iDayCount) < 24*60*60 then
			BeginEvent(sceneId)
				AddText(sceneId, "����������������24Сʱ�������԰�����ɡ�")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
			return 0
		end
	end

	--��ҵ�Я���������ҿ�Я����������(��Я���ľ����Ѵ����ޣ���Щ�������Ұ�)
	if GetExp(sceneId, selfId)>= GetFullExp(sceneId, selfId) then
		BeginEvent(sceneId)
			AddText(sceneId, "��Я���ľ����Ѵ����ޣ���Щ�������Ұɡ�")
		EndEvent()
		DispatchEventList(sceneId,selfId,-1)
		return 0
	end
	return 1;
end

--**********************************
--����
--**********************************
function x229022_OnAccept_Necessary( sceneId, selfId, targetId )

	--�õ�����
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	if 0 == round and GetName(sceneId, targetId) == x229022_g_Name then
		--���Ѽ���:ֻ�е�һ�νӣ��������½ӣ�ʱ�䵽�����Զ�ɾ���Ż��շѣ�Ҳ���ǻ���=0ʱ
		--CostMoney(sceneId, selfId, GetLevel(sceneId, selfId)*1000)             
		LuaFnCostMoneyWithPriority(sceneId, selfId, GetLevel(sceneId, selfId)*1000)
	end

	round = round + 1
	if round > 100 then
		round = 1
	end
	--��������1

	SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, round)
	--test code {
	--SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 100)
	--local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	-- }

	--��������ʱ��
	StartMissionTimer(sceneId, selfId, x229022_g_MissionId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 7, 30*60*1000) --�������������ʱ��Ϊ30����

	SetMissionData(sceneId, selfId, MD_RENWULIAN_ACCPETTIME, LuaFnGetCurrentTime())

end

--**********************************
--����
--**********************************
function x229022_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	--ֹͣ����ʱ��
	StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x229022_g_MissionId )

	--����ѭ�������ʱ��
	SetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT,LuaFnGetCurrentTime())
	SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 0)

end

--**********************************
--����
--**********************************
function x229022_OnContinue( sceneId, selfId, targetId )
	BeginEvent(sceneId)

		AddText(sceneId,x229022_g_MissionName)
		local str
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229022_g_SubMissionType.wenhou then
			str = "лл�������Ѷ���������á�"
		elseif missionType == x229022_g_SubMissionType.suoqu
			or missionType == x229022_g_SubMissionType.chongwu then
			str = "��������лл�㣬�һ��е�����Ҫ���æ��"
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun
			or missionType == x229022_g_SubMissionType.fubenduowu then
			str = "��Ȼ���ո�ǿ�����ٲ���Ϊ���ˣ����һ��е�����Ҫ���æ��"
		end

		AddText(sceneId,str)

	EndEvent( )
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId,x229022_g_scriptId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x229022_CheckSubmit( sceneId, selfId )
  if IsHaveMission( sceneId, selfId, x229022_g_MissionId ) <= 0 then
		return 0
	end

	--�ڴ��ж��ύ�����Ƿ���ϣ���������Ӧ����
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

	--�쿴�����Ƿ����
	local bCompletion = GetMissionParam(sceneId, selfId, misIndex, 0)
	--PrintNum(bCompletion)
	if bCompletion > 0 then
		if missionType == x229022_g_SubMissionType.wenhou then
			return 1
		elseif missionType == x229022_g_SubMissionType.chongwu then
			local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			--���������ϵĵ����Ƿ��Ѿ������������
			for i=0, 6 do
				local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
				if petDataId ~= nil and petDataId >= 0 then
					if GetPetName(demandPetId) == GetPetName(petDataId) then
					        return 2
			        	end
			        end
			end
		elseif missionType == x229022_g_SubMissionType.suoqu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			if HaveItem(sceneId, selfId, demandItemId) > 0 then
				if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
					if IsEquipItem(demandItemId) == 1 then
						return 2
					else
						return 1
					end
				else
					BeginEvent(sceneId)
						AddText(sceneId, "������Ʒ���ڲ����û��ѱ�������")
					EndEvent( )
					DispatchMissionTips(sceneId,selfId)
					return 0
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "ȱ��������Ҫ����Ʒ")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return 0
			end
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun then
				return 1
		end
	end
	return 0
end

--////////////////////////////////////////////////////////////////
--Ч�ʿ���C++���Ż�����ʱ��������Ч���ڶ�
--////////////////////////////////////////////////////////////////
--function GetMissinonItemByCurrentHuan(playerLevel, round)
--	if round == 50 then
--		local itemId, itemName
--		local reqItemGrade = playerLevel / 10;
--		for i = 1, 5000 do
--			itemId, itemName = GetOneMissionBonusItem(x229022_g_RenwulianItem_Index)
--			local itemGrade = GetCommonItemGrade(itemId)
--			if itemGrade == reqItemGrade then
--				return itemId, itemName
--			end
--		end
--	elseif round == 100 then
--		local itemId, itemName
--		local reqItemGrade = (playerLevel+10) / 10;
--		for i = 1, 5000 do
--			itemId, itemName = GetOneMissionBonusItem(x229022_g_RenwulianItem_Index)
--			local itemGrade = GetCommonItemGrade(itemId)
--			if itemGrade == reqItemGrade then
--				return itemId, itemName
--			end
--		end
--	else
--		PrintStr("round=" .. round .. "�Ƿ���")
--	end
--end

--**********************************
--����������
--**********************************
function x229022_MissionBonus(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	--�����50����������ҵȼ���ͬ�ȼ�������������������������ԭ��һ��������100%����
	if round == 50 then
		local itemId, itemName = GetRenwulianMissionBonusItemByLevel(x229022_g_RenwulianItem50_Index, playerLevel)
		BeginAddItem(sceneId)
			AddItem(sceneId,itemId, 1)
		if EndAddItem(sceneId,selfId) > 0 then
			AddItemListToHuman(sceneId,selfId)
			local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
			Msg2Player(sceneId, selfId, "������һ��" .. itemName, MSG2PLAYER_PARA )
			local str = "#W#{_INFOUSR" .. LuaFnGetName(sceneId, selfId) .. "}#I������иŬ�������#R������#I����������֮50�������#W#{_INFOMSG" .. szItemTransfer .. "}#I������"
			BroadMsgByChatPipe(sceneId, selfId, str, 4)
		else
			BeginEvent(sceneId)
				AddText(sceneId, "��ı���������")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return 0
		end
	--�������100����������ҵȼ���ͬ�ȼ�+10������������������������ԭ�ϣ�����[װ��]�����飩һ��������100%����
	elseif round == 100 then

		local itemId, itemName, itemDesc, broadcastType = GetOneMissionBonusItem(x229022_g_RenwulianItem100_Index)
		local szItemTransfer = ""
		BeginAddItem(sceneId)
			AddItem(sceneId,itemId, 1)
			AddItem(sceneId, 30008034, 1) --����һ�Ž��ɰ
		if EndAddItem(sceneId,selfId) > 0 then
			AddItemListToHuman(sceneId,selfId)
			
			szItemTransfer_0 = GetItemTransfer(sceneId, selfId, 0)
			szItemTransfer_1 = GetItemTransfer(sceneId, selfId, 1)
			
			Msg2Player(sceneId, selfId, "������һ��" .. itemName, MSG2PLAYER_PARA )
			Msg2Player(sceneId, selfId, "������һ�Ž��ɰ", MSG2PLAYER_PARA )
			
			local targetStr = "#{_INFOMSG".. szItemTransfer_0 .."}"
			targetStr = targetStr .. "��һ��#{_INFOMSG" .. szItemTransfer_1 .. "}"
			local str = "#W#{_INFOUSR"..LuaFnGetName(sceneId, selfId) .. "}#I������иŬ�������#R������#I����������֮100�������#W" .. targetStr .. "#I������"
			BroadMsgByChatPipe(sceneId, selfId, str, 4)
		else
			BeginEvent(sceneId)
				AddText(sceneId, "��ı���������")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return 0
		end
	end

	local expDelta = GetFullExp(sceneId, selfId) - GetExp(sceneId, selfId)
	if expDelta == 0 then
		Msg2Player(  sceneId, selfId, "����Я���ľ��������� ���ܻ�þ����ˡ�", MSG2PLAYER_PARA )
		return 1
	end
	--���齱�� = ��ҵ�ǰ�ȼ���������*�����ӳ�
	--local A, B, C = 5, 1, 20*60
	--local D, E = 0.06, 4
	local playerLevel = GetLevel(sceneId, selfId)
	----��ҵ�ǰ�ȼ��������� =��A+����ҵȼ�-1��*B��*C ��A=5��B=1��C��ÿ��ƽ��ʱ�䣩=20*60�����ܵ�����
	--local BaseBonusValue = (A + (playerLevel-1)*B)*C
	----�����ӳ� =D*����ǰ����-1��+1+FLOOR������ǰ����-1��/10��*����E-1-99*D��/9�� ��D=0.06��E��100���ӳ��ʣ�=4�����ܵ�����
	--local RoundRefix = D*(round-1) + 1 + floor((round-1) / 10)*((E-1-99*D) / 9)
  local BaseBonusValue = 0
  local RoundRefix = 0

  for i, v in x229022_g_ExpBonusBaseTable do
  	if v.playerLevel == GetLevel(sceneId, selfId) then
  		BaseBonusValue = v.baseExp
  		break
  	end
  end

  for i, v in x229022_g_RoundRefixTable do
  	if v.round == round then
  		RoundRefix = v.refix
  		break
  	end
  end

	--������Ҿ���
	local exp = BaseBonusValue * RoundRefix
	if exp > expDelta then
		AddExp(sceneId, selfId, expDelta)
	else
		AddExp(sceneId, selfId, exp)
	end
	--Msg2Player(  sceneId, selfId, "��õ���" .. tostring(exp) .. "��ľ��齱����", MSG2PLAYER_PARA )

	return 1
end

function x229022_GetExpBonus(sceneId, selfId)

	local playerLevel = GetLevel(sceneId, selfId)
  local BaseBonusValue = 0
  local RoundRefix = 1

  for i, v in x229022_g_ExpBonusBaseTable do
  	if v.playerLevel == GetLevel(sceneId, selfId) then
  		BaseBonusValue = v.baseExp
  		break
  	end
  end
  --PrintStr("BaseBonusValue=" .. BaseBonusValue )
  local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
  for i, v in x229022_g_RoundRefixTable do
  	if v.round == round then
  		RoundRefix = v.refix
  		break
  	end
  end
  --PrintStr("RoundRefix=" .. RoundRefix )

	return BaseBonusValue * RoundRefix
end

--*******************************************************
--�ύ����Ĺ�����⺯��
--*******************************************************
function x229022_MissionOnSubmit_Necessary(sceneId, selfId, targetId)
	--�õ�����
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	if round >= 100 then
		--����ѭ�������ʱ��
		SetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT,LuaFnGetCurrentTime())
	end
	--��¼ͳ����Ϣ
	LuaFnAuditMissionChain(sceneId,selfId,round)

	Msg2Player(  sceneId, selfId, "����������������" .. tostring(round) .. "����", MSG2PLAYER_PARA )

	--ɾ��������
	DelMission(sceneId, selfId, x229022_g_MissionId)

	if round < 100 then
		--������������
		if x229022_CheckAccept(sceneId,selfId) > 0 then
			x229022_AddMissionDirectly(sceneId, selfId,targetId)
		end
	end
end

--**********************************
--�ύ
--**********************************
function x229022_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x229022_CheckSubmit( sceneId, selfId ) > 0 then
		local bGoon = 0
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229022_g_SubMissionType.wenhou then
			bGoon = 1
		elseif missionType == x229022_g_SubMissionType.chongwu then
			--����ķ�֧����x229022_OnSubmit��������x229022_OnMissionCheck��
		elseif missionType == x229022_g_SubMissionType.suoqu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			if 1==DelItem(sceneId, selfId, demandItemId, 1) then
				bGoon = 1
			end
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun then
			bGoon = 1
		end
		if bGoon == 1 then
			--����������
			if x229022_MissionBonus(sceneId, selfId) > 0 then
				x229022_MissionOnSubmit_Necessary(sceneId, selfId, targetId)
			end
		end
	end
end

--**********************************
--�������ύʱ�ļ�⺯��
--**********************************
function x229022_My_MissionCheck_Necessary(sceneId, selfId, npcid, scriptId, index1, index2, index3, demandItemId)
	--PrintStr("My_MissionCheck_Necessary...demandItemId=" .. demandItemId)
	local find = CallScriptFunction( 500501, "OnMissionCheck_NecessaryEx", sceneId, selfId, index1, index2, index3, demandItemId )
	local _, strDemandItemName, _ = GetItemInfoByItemId(demandItemId)
	if find < 0 then
		BeginEvent(sceneId)
			local strText = format("����ôû��%s�õ��־ͻ������أ�", strDemandItemName)
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return
	end

	if LuaFnIsItemAvailable(sceneId, selfId, find) > 0 then
		local ret = EraseItem( sceneId, selfId, find )
		if	ret > 0 then
			--����������
			if x229022_MissionBonus(sceneId, selfId) == 1 then
				x229022_MissionOnSubmit_Necessary(sceneId, selfId, npcid)
			end
		else
			BeginEvent(sceneId)
				local strText = format("����ôû��%s�õ��־ͻ������أ�", strDemandItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "������Ʒ���ڲ����û��ѱ�������")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return
	end

end

--************************************************************
--����ӿں����Ǵ���ģ���ʵ��x229022_OnSubmitֻ�����ǲ�����ͬ����
--���Ǹ���ʷ�������⣬�����Ѿ��޷��ı�ӿ��ˡ�
--************************************************************
function x229022_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )
	if x229022_CheckSubmit( sceneId, selfId ) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

		local demandItemId
		if missionType == x229022_g_SubMissionType.suoqu then
			demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			--PrintStr("demandItemId=" .. demandItemId)
			x229022_My_MissionCheck_Necessary(sceneId, selfId, npcid, scriptId, index1, index2, index3, demandItemId)
		elseif missionType == x229022_g_SubMissionType.fubenduowu then
			demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+2)
			x229022_My_MissionCheck_Necessary(sceneId, selfId, npcid, scriptId, index1, index2, index3, demandItemId)
		elseif missionType == x229022_g_SubMissionType.chongwu then
			local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			local petId = LuaFnGetPet_DataID(sceneId, selfId, petindex)
			if petId ~= nil and petId >= 0 then
				if GetPetName(petId) == GetPetName(demandPetId) then
					--����������
					if LuaFnIsPetAvailable(sceneId, selfId, petindex) == 1 then
						if x229022_MissionBonus(sceneId, selfId) > 0 then
							LuaFnDeletePet(sceneId, selfId, petindex)
							x229022_MissionOnSubmit_Necessary(sceneId, selfId, npcid)
						end
					else
						BeginEvent(sceneId)
							AddText(sceneId, "���ύ�����޲����û�������")
						EndEvent()
						DispatchMissionTips(sceneId, selfId)
					end
				else
					BeginEvent(sceneId)
						AddText(sceneId, "���ύ�����޲���ȷ��")
					EndEvent()
					DispatchMissionTips(sceneId, selfId)
				end
			end
		end
	end
end


--**********************************
--ɱ����������
--**********************************
function x229022_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����objId
	--PrintStr("OnKillObject...")
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229022_g_SubMissionType.suoqu then
		local bStored = GetMissionParam(sceneId, selfId, misIndex, 2)
		if bStored <= 0 then --������û�д洢
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 0 then
		local nItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
		local playerLevel = GetLevel(sceneId, selfId)
		local targetLevel = GetLevel(sceneId, objId)
		if abs(playerLevel-targetLevel) < 6 then
				local rate = 50
			for i, v in x229022_g_HongyunRateTable do
				if playerLevel <= v.level then
					rate = (1 / v.value) * 10000
					break
				end
			end --endfor

			if random(1000) < rate then --��ʱ����ν��С����:(
				AddMonsterDropItem(sceneId, objId, selfId, nItemId)
				end --endif4
			end	--endif3
		end	--endif1
		end
	elseif 	missionType == x229022_g_SubMissionType.fubenjiaoxun then
		-- ȡ�������������ӵ�з���Ȩ������
		local num = GetMonsterOwnerCount(sceneId,objId)
		--PrintNum(num)
		for i=0,num-1  do
			-- ȡ��ӵ�з���Ȩ���˵�objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
			--PrintStr("humanObjId=" .. humanObjId)
			-- ��������ǲ������������
			if IsHaveMission(sceneId, humanObjId, x229022_g_MissionId) > 0 then
				-- ���ж��ǲ����Ѿ���������ɱ�־
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229022_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local demandKillCount = GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 0)
					--PrintStr("demandKillCount=" .. demandKillCount)
					if CallScriptFunction(229023 , "IsMonsterOfDemanded", sceneId, humanObjId, objdataId) > 0 then
						local killedCount =	GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 1)
						killedCount = killedCount + 1
						SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 1, killedCount)
						--PrintStr("killedCount=" .. killedCount)
						if killedCount == demandKillCount then
							--PrintStr("Succ...")
							BeginEvent(sceneId)
								SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
								local npcIndex = GetMissionParam(sceneId, humanObjId, misIndex, x229022_g_StrForePart+1)
								local _, npcName = GetNpcInfoByNpcId(sceneId,npcIndex)
								local str = format("��ѵ%s�������Ѿ����", npcName)
								AddText(sceneId, str)
							EndEvent()
							DispatchMissionTips(sceneId, humanObjId)
						end --if
					end --if
				end --if
			end --if
		end --for
	end	--elseif

end

--**********************************
--���������¼�
--**********************************
function x229022_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x229022_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)

	if missionType == x229022_g_SubMissionType.suoqu then

		local _, strDemandItemName, _ = GetItemInfoByItemId(demandItemId)
		local _, strItemName, _ = GetItemInfoByItemId(itemdataId)

		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				strText = format("�ѵõ���%s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			ResetMissionEvent(sceneId, selfId, x229022_g_MissionId, 2)
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
		end
	end

end

--**********************************
--����ʹ��
--**********************************
function x229022_OnUseItem( sceneId, selfId, targetId, eventId )
end


--**********************************
--�Ƿ���Ҫ���npc
--**********************************
function x229022_IsDemandNpc(sceneId, selfId, objId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	local npcId
	if missionType == x229022_g_SubMissionType.wenhou or
		 missionType == x229022_g_SubMissionType.fubenjiaoxun then
		npcId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	elseif missionType == x229022_g_SubMissionType.suoqu or
		 		 missionType == x229022_g_SubMissionType.chongwu	then
 		npcId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+2)
 	else
 		return 0
 	end
	local _, npcName, strNrpcScene, _, _, _, npcSceneId = GetNpcInfoByNpcId(sceneId,npcId)
	--PrintStr(npcName)
	if GetName(sceneId, objId) == npcName
		and npcSceneId == sceneId then
		return 1
	end
	return 0
end

--**********************************
--����Ŀ��
--**********************************
function x229022_OnLockedTarget(sceneId, selfId, objId )
	--PrintStr("...OnLockedTarget")
	if x229022_IsDemandNpc(sceneId, selfId, objId) ==  1 then
		--TAddText(sceneId, "���������ˣ� ���Ѿ��ȴ���þ��ˣ�")
		TAddNumText(sceneId, x229022_g_scriptId,x229022_g_MissionName,2,-1,x229022_g_scriptId);

		--local bDone = x229022_CheckSubmit(sceneId, selfId)
		--DispatchMissionDemandInfo(sceneId, selfId, objId, x229022_g_scriptId, x229022_g_MissionId, bDone)
	end
end

--**********************************
--��ʱ�¼�
--**********************************
function x229022_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		--�õ�������20�������е����к�
	local leaveSecond = GetMissionParam(sceneId, selfId, misIndex, 7)
	--PrintNum(leaveSecond)

	local bStored = GetMissionParam(sceneId, selfId, misIndex, 2)
	if bStored == 1 then
		--ֹͣ����ʱ��
		StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
		return
	end

	local currTime = LuaFnGetCurrentTime()
	local acceptTime = GetMissionData(sceneId,selfId,MD_RENWULIAN_ACCPETTIME)
	if (currTime - acceptTime) > 30*60 then
		leaveSecond = 0
	else
		leaveSecond = (30*60 - (currTime - acceptTime))*1000
	end

	--leaveSecond = leaveSecond - 1000
	SetMissionByIndex(sceneId,selfId,misIndex,7,leaveSecond)
	--PrintNum(leaveSecond)

	if leaveSecond <= 0 then
		--ֹͣ����ʱ��
		StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
		--��������Ѿ�ʧ�ܣ� ����ʾ����ʧ�ܲ�����������б���ɾ��
		local str = "��������ʧ�ܣ��Ѿ�����ɾ����"
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(sceneId, selfId, str, MSG2PLAYER_PARA )
		DelMission( sceneId, selfId, x229022_g_MissionId )

		--����ѭ�������ʱ��
		SetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT,LuaFnGetCurrentTime())
		SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 0)

		return
	end

	if leaveSecond > 10*60000 and leaveSecond < 15*60000 then
		if mod(leaveSecond, 60000) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "��20����������Խ�������洢��#R������#W�Ƕ�ȥ")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return
		end
	end

	if leaveSecond < 60000 then
		BeginEvent(sceneId)
			AddText(sceneId, "����������" .. tostring(leaveSecond/1000) .. "���ʧ��")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end

end

function x229022_OnPetChanged(sceneId, selfId, petDataId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local demandPetDataId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	if petDataId == nil or petDataId < 0 then
		return
	end
	if demandPetDataId == nil or demandPetDataId < 0 then
		return
	end

	if GetPetName(demandPetDataId) == GetPetName(petDataId) then
		local str = format("��õ�������%s", GetPetName(petDataId))
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(  sceneId, selfId, str , MSG2PLAYER_PARA )
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
	end

end


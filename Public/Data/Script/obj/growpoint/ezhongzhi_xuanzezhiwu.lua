--ѡ��ֲ��Ľű�

--�ű���
x713550_g_scriptId = 713550


--**********************************
--������ں���
--**********************************
function x713550_OnDefaultEvent( sceneId, selfId, targetId, zhiwuId )
	local num =0
	--�ж���ֲ�Ƶ�λ��
	local PlantFlag_X
	local PlantFlag_Z
	PlantFlag_X,PlantFlag_Z =  GetWorldPos(sceneId,targetId)	--�õ�npc����
	PlantFlag_X = floor(PlantFlag_X)
	PlantFlag_Z = floor(PlantFlag_Z)

	for i, findid in PLANTNPC_ADDRESS do
		if	((PlantFlag_X ==  findid.X)  and (PlantFlag_Z == findid.Z) and (sceneId == findid.Scene)) then
			num = i
			break
		end
	end
	--���û�ҵ���Ӧλ��
	if num == 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "ˮ����ʧ���밮������Ȼ��")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--������ز�������״̬
	if	PLANTFLAG[num] ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "�����ѱ���ֲ�����һ��������ɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	--�����������
	x713550_g_energy = GetHumanEnergy(sceneId,selfId)
	--����ֲ��ȼ�
	local level_Index
	if zhiwuId >= getn(V_ZHONGZHI_ID) then
		level_Index = zhiwuId-getn(V_ZHONGZHI_NAME)/2
	else
		level_Index = zhiwuId
	end

	x713550_g_ZhiWuLevel = V_ZHONGZHI_NEEDLEVEL[level_Index]

	local EnergyCost = CallScriptFunction( ABILITYLOGIC_ID, "CalcEnergyCostCaiJi", sceneId, selfId, ABILITY_ZHONGZHI, x713550_g_ZhiWuLevel )
	if x713550_g_energy < EnergyCost then
		BeginEvent(sceneId)
			AddText(sceneId, "��ľ�������!")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	--�ж�����Ƿ���N��������ֲ�ˣ������N��������ֲ�ˣ����������֣�����N���������
	--missiondataĬ��ֵ��0���������������������
	local CurrentTime = LuaFnGetCurrentTime()
	local MissionData = GetMissionData(sceneId,selfId,MD_ZHONGZHI_TIME)
	local Zhongzhi_Flag =  GetMissionData(sceneId,selfId,MD_ZHONGZHI_FLAG)
	local WaitTime
	if (Zhongzhi_Flag == 1 and (CurrentTime - MissionData) <= 300) or
		(Zhongzhi_Flag == 2 and (CurrentTime - MissionData) <= 4200) then
		if Zhongzhi_Flag == 1 then
			WaitTime = 300 - (CurrentTime - MissionData)
		else
			WaitTime = 4200 - (CurrentTime - MissionData)
		end
		
		WaitTime = floor(WaitTime/60)
		BeginEvent(sceneId)
			AddText(sceneId, "����������ֲ����Լ"..WaitTime.."���Ӻ�����ٴ���ֲ��")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--ͳ������
	LuaFnAuditAbility(sceneId, selfId, ABILITY_ZHONGZHI, -1, -1)
	--����������
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABILITY_ZHONGZHI, x713550_g_ZhiWuLevel)
	--ɾ����Ӧ����
		CallScriptFunction(ABILITYLOGIC_ID, "EnergyCostZhongZhi", sceneId, selfId, ABILITY_ZHONGZHI, x713550_g_ZhiWuLevel)
	--����������

	ItemBoxTypeId = V_ZHONGZHI_ITEMBOX_ID[zhiwuId]

	ItemBoxId01 = ItemBoxEnterScene(PlantFlag_X+1.5,PlantFlag_Z-1,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	ItemBoxId02 = ItemBoxEnterScene(PlantFlag_X+1.5,PlantFlag_Z+2,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	ItemBoxId03 = ItemBoxEnterScene(PlantFlag_X-0.5,PlantFlag_Z-1,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	ItemBoxId04 = ItemBoxEnterScene(PlantFlag_X-0.5,PlantFlag_Z+2,ItemBoxTypeId,sceneId,QUALITY_MUST_BE_CHANGE,0)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId01,45000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId02,45000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId03,45000)
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId04,45000)
	--�õ�guid
	local guid = GetHumanGUID(sceneId,selfId)

	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId01,guid)
	SetItemBoxOwner(sceneId,ItemBoxId02,guid)
	SetItemBoxOwner(sceneId,ItemBoxId03,guid)
	SetItemBoxOwner(sceneId,ItemBoxId04,guid)

	PLANTFLAG[num] = 8
	BeginEvent(sceneId)
		AddText(sceneId, "���Ѿ���ʼ��ֲ")
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)

	--��missiondata����Ϊ��ǰʱ��
	SetMissionData(sceneId,selfId,MD_ZHONGZHI_TIME,CurrentTime)
	
	if zhiwuId >= getn(V_ZHONGZHI_ID) then
		SetMissionData(sceneId,selfId,MD_ZHONGZHI_FLAG,2)
	else
		SetMissionData(sceneId,selfId,MD_ZHONGZHI_FLAG,1)
	end

 	return OR_OK
end

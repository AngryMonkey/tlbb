--������
--��Ӧ����ܣ��ɿ�	�ɿ��ܵı��7
--��ɽ����
--�ű���710013
--��ɽ����1	0.6		2	0.3		3	0.1		����1%
--��20%���ʵõ�����Ʒ20103021,20103033,20103045,20103057 �е�һ�֣�����1	0.6		2	0.3		3	0.1
--�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x710013_g_MainItemId = 20103118
--���ܵõ��Ĳ�Ʒ
x710013_g_SubItemId = 50112004
--����Ʒ
x710013_g_Byproduct = {20103122,20103126,20103130,20103134}
--��Ҫ����Id
x710013_g_AbilityId = 7
--��Ҫ���ܵȼ�
x710013_g_AbilityLevel = 9


--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function 		x710013_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����һ����Ʒ
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710013_g_MainItemId)	--ÿ�������������ܵõ�һ����Ʒ,����ֱ�ӷ���itembox��һ��
	--���1~100�������,������������Ʒ�͸���Ʒ�Լ���Ҫ��Ʒ����ʯ��
	--����Ʒ1~60���ţ�61~90��1����91~100��2��
	--����Ʒ1~12��1����13~18��2����19~20��3��
	--��Ҫ��Ʒ����ʯ��1��1��
	local ItemCount = random(1,100)
	if ItemCount >= 61 and ItemCount <= 90 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710013_g_MainItemId)
	elseif ItemCount >= 91 and ItemCount <= 100 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710013_g_MainItemId,x710013_g_MainItemId)
	end
	--�����Ҫ��Ʒ
	if ItemCount == 1 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710013_g_SubItemId)
	end
	--���븱��Ʒ
	if ItemCount >= 51 and ItemCount <= 70 then
		local ByproductId = random(1,4)
		if ItemCount >= 51 and ItemCount <= 62 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710013_g_Byproduct[ByproductId])
		elseif ItemCount >= 63 and ItemCount <= 68 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710013_g_Byproduct[ByproductId],x710013_g_Byproduct[ByproductId])
		elseif ItemCount >= 69 and ItemCount <= 70 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,3,x710013_g_Byproduct[ByproductId],x710013_g_Byproduct[ByproductId],x710013_g_Byproduct[ByproductId])
		end
	end
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x710013_OnOpen(sceneId,selfId,targetId)
--��������
-- 0 ��ʾ�򿪳ɹ�
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x710013_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x710013_OnRecycle(sceneId,selfId,targetId)
	-- ����������
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x710013_g_AbilityLevel)
		--����1�����������
		return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710013_OnProcOver( sceneId, selfId, targetId )
	local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x710013_g_AbilityLevel )
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710013_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--�������ܵȼ�
	if AbilityLevel<x710013_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--��龫��
	if GetHumanEnergy(sceneId,selfId)< (floor(x710013_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end

--������ű�������3
--�ű���
--g_ScriptId = 711017

--����������
x711017_g_GpId = 518

--��������Ҫ�ĵȼ�
x711017_g_ItemBoxNeedLevel = 6

function	x711017_OnOpen(sceneId,selfId,targetId)
	--�õ������������GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������SceneID��ItemBoxID
	--�õ�������������ҵ�guid
	PlayerGuid = GetHumanGUID(sceneId,selfId)
	if ItemBoxOwnerGUID~= PlayerGuid then
		BeginEvent(sceneId)
	  		AddText(sceneId,"����ո�����ֵ�ׯ�ڿɲ����ϣ�");
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		return OR_INVALID_TARGET_POS
	end
	--�õ����ܵȼ�
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711017_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711017_OnProcOver(sceneId,selfId,targetId)
	return OR_OK
end

function	 x711017_OnRecycle(sceneId,selfId,targetId)
	local num = 0
	--ȡ�������������
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--��ȡ��
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--�ж���ֲ�Ƶ�λ�����ĸ���ֲ�ƹ�Ͻ�ķ�Χ��
	for i, findid in PLANTNPC_ADDRESS do
		if	(GP_X >= findid.X_MIN)  and (GP_Z >= findid.Z_MIN) and (GP_X <= findid.X_MAX)  and (GP_Z <= findid.Z_MAX) and (sceneId == findid.Scene) then
			num = i	
			break
		end
	end
	
	--����Ҳ�����ȷ��λ���򷵻�
	if num == 0 then
		return
	end
	--�ҵ���ȷ�ı�ţ�����ֲ��-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1
	return 1
end

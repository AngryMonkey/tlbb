-- �Լ�id,����index,�������
function		x713552_OnUse(sceneId,selfId,targetId)	
		--��òر�ͼλ�úͳ������
		StoreMapX = GetStoreMapX(sceneId,selfId,targetId)
		StoreMapZ = GetStoreMapZ(sceneId,selfId,targetId)		
		
		StoreMapSceneID = GetStoreMapSceneID(sceneId,selfId,targetId)
		--������ɫ���ڳ��������Ͼͷ���ʧ��
		if StoreMapSceneID~=sceneId then
			return USEITEM_SKILL_FAIL
		end
		
		--�жϽ�ɫλ�úͲر�ͼλ���Ƿ���һ����Χ��
		HumanX	=	GetHumanWorldX(sceneId,selfId)
		HumanX = StoreMapX - HumanX
		
		if abs(HumanX)>2.0 then
			return USEITEM_SKILL_FAIL
		end
		
		HumanZ	=	GetHumanWorldZ(sceneId,selfId)	
		
		HumanZ = StoreMapZ - HumanZ
		
		if abs(HumanZ)>2.0 then
			return USEITEM_SKILL_FAIL
		end
		--�ڳ�������һ����ر�ͼ���ϵĲر���
		StoreMapIndex = FindStorePointOnScene(sceneId,0,StoreMapX,StoreMapZ)
		
		if StoreMapIndex	== -1 then	
			return USEITEM_CANNT_USE			
		end
		--��òر�ͼ����
		StoreMapType = GetStorePointType(sceneId,StoreMapIndex)
		--ɾ���ر���
		DelStorePointOnScene(sceneId,StoreMapType,StoreMapIndex)
		--����
		TryRecieveItem(sceneId,selfId,10222001,QUALITY_MUST_BE_CHANGE)
		
		
	return USEITEM_SUCCESS
	
end

--������ű����ƶ�����
--�ű���
--g_ScriptId = 711024

--����������
x711024_g_GpId = 525

--��һ��������ı��
x711024_g_GpIdNext = 526

function	 x711024_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711024_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,0)
	--�õ������������GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������SceneID��ItemBoxID
	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end

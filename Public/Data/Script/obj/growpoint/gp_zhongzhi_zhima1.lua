--������ű���֥������
--�ű���
--g_ScriptId = 711018

--����������
x711018_g_GpId = 5193

--��һ��������ı��
x711018_g_GpIdNext = 520

function	 x711018_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711018_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,0)
	--�õ������������GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--������SceneID��ItemBoxID
	--��ItemBox�趨����
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,450000)	--�趨����ʱ��
	return 1
end

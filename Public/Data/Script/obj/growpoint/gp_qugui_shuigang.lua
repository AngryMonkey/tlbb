function 	x713000_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- ��Ʒ����
	ItemBoxID = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount)	--��������
end


function	x713000_OnProcOver(sceneId,selfId,targetId)
			itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
			itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
			CreateMonsterOnScene(sceneId,5,itemBoxX,itemBoxZ,1)
		return OR_OK
end

function x713000_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

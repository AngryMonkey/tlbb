--����

-- scriptId = 715000
function 		x715000_OnCreate(sceneId,growPointType,x,y)
	
	ItemCount = 1	-- ��Ʒ����
	Item0			=	40002066 --��ƷITEM_TYPE ���
	ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount,Item0)	--��������	
	
end

--��������
-- 0 ��ʾ�򿪳ɹ�
--��ǰ
--��CONFIG/ABILITY.TXT�ļ���
function	 x715000_OnOpen(sceneId,selfId,targetId)
	--ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	--AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	if HaveItem (sceneId,selfId,40002066) > 0 then 
		BeginEvent(sceneId)
			strText = "�Ѿ��õ��˶���,��ȥ�������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_MISSION_NOT_FIND
	end
	
	if IsHaveMission(sceneId,selfId,MISSION_546) > 0 then
		return OR_OK
	else
		return OR_MISSION_NOT_FIND
	end
	
end

--����
function	 x715000_OnRecycle(sceneId,selfId,targetId)
 	return 1;
end

--�򿪺�
function	x715000_OnProcOver(sceneId,selfId,targetId)
	return 0
end

function x715000_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

--������ �׻�ʯ
--��ս����
--�ű���710016
----�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x710016_g_MainItemId = 30900052
----�����
--x710016_g_MissionId = 1070

--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function	x710016_OnCreate(sceneId,growPointType,x,y)
	
	--����ItemBoxͬʱ����һ����Ʒ
	local targetId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710016_g_MainItemId)	--ÿ�������������ܵõ�һ����Ʒ,����ֱ�ӷ���itembox��һ��
	
	local rand = random(1,100)
	if rand >= 70 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710016_g_MainItemId)
	end
	
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x710016_OnOpen(sceneId,selfId,targetId)
--	local ret = CallScriptFunction(SHIMEN_MISSION_SCRIPT_ID, "IsCaiJiMission", sceneId,selfId,x710016_g_MissionId,x710016_g_MainItemId)
	if CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) ~= 0 then
		return OR_U_CANNT_DO_THIS_RIGHT_NOW
	else
		return OR_OK
	end
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	x710016_OnRecycle(sceneId,selfId,targetId)
	--����1�����������
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710016_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x710016_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
